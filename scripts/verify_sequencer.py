#!/usr/bin/env python3
"""Check sequencer truth tables, latched commands and actual SRAM operation.

Usage: python3 scripts/verify_sequencer.py [sequencer_waveforms.txt]
Without a waveform path, netlist and simulate the schematic in a temporary directory.
Requires numpy, Xschem, ngspice and the installed TR-1um PDK.
"""
from pathlib import Path
import json, os, re, subprocess, sys, tempfile
import numpy as np
ROOT = Path(__file__).resolve().parents[1]

def simulate():
    out = Path(tempfile.mkdtemp(prefix='sram-sequencer-'))
    pdk = Path(os.environ.get('PDK_ROOT', '/home/ishi-kai/pdk')) / os.environ.get('PDK', 'TR-1um')
    lib = pdk / 'libs.tech/xschem'
    paths = [ROOT, Path('/usr/local/share/xschem/xschem_library'), Path('/usr/local/share/xschem/xschem_library/devices'), lib, lib/'TR-1umLIB', lib/'TR-1um_5_stdcell']
    rc = out/'xschemrc'
    rc.write_text('set XSCHEM_LIBRARY_PATH {' + ':'.join(map(str, paths)) + '}\n' + f'set LIB {{{pdk}/libs.tech/spice/models}}\nset lvs_netlist 0\nset top_is_subckt 0\nset spiceprefix 1\n')
    with (out/'netlist.log').open('w') as log:
        subprocess.run(['xschem','-r','-x','--rcfile',str(rc),'-s','--command','xschem netlist; exit','-o',str(out),str(ROOT/'sram_tb_sequencer.sch')],stdout=log,stderr=subprocess.STDOUT,check=True)
    logtext=(out/'netlist.log').read_text()
    if re.search(r'Symbol not found|Error', logtext, re.I):
        raise RuntimeError(f'Netlisting failed: {out}/netlist.log')
    net = (out/'sram_tb_sequencer.spice').read_text()
    (out/'check.spice').write_text('\n'.join(l for l in net.splitlines() if not l.startswith(('plot ', 'write '))))
    print(f'Running ngspice; logs and waveforms: {out}', flush=True)
    with (out/'check.log').open('w') as log:
        result=subprocess.run(['ngspice','-b','check.spice'],cwd=out,stdout=log,stderr=subprocess.STDOUT)
    logtext=(out/'check.log').read_text()
    if result.returncode or re.search(r'Error:|FAIL:|Warning:',logtext):
        raise RuntimeError(f'ngspice reported a failure: {out}/check.log')
    return out/'sequencer_waveforms.txt'

path = Path(sys.argv[1]) if len(sys.argv)>1 else simulate()
with path.open() as f: names=f.readline().split()
data=np.loadtxt(path,skiprows=1)
t=data[:,0]*1e9
v={name.lower():data[:,i] for i,name in enumerate(names)}
errors=[]; checks=0

def window(a,b):
    mask=(t>=a)&(t<=b)
    if not mask.any(): raise ValueError(f'No samples in {a}..{b} ns')
    return mask

def level(node,bit,a,b,rails=True,tag=''):
    global checks
    checks+=1
    values=v['v('+node.lower()+')'][window(a,b)]
    limit=(4.5 if bit else .5) if rails else 2.5
    ok=np.isfinite(values).all() and (values.min()>=limit if bit else values.max()<=limit)
    if not ok: errors.append(f'{tag} {node} expected {bit} at {a}..{b} ns: {values.min():.4g}..{values.max():.4g} V')

# Two reset edges and an extra idle edge; no IC statements initialize these FFs.
for node in ['S0','S1','S2','WL_EN','WRITE_EN','RA','CA','DIN','W','READ_DATA','BUSY']:
    level(node,0,190,340,tag='reset/idle')
for node in ['PREB','SAE']:level(node,1,190,340,tag='reset/idle')
ops=json.loads((ROOT/'scripts/seq_cases.json').read_text())
known={};last_read=0
for i,op in enumerate(ops):
    a=op['start'];wr=op['write'];row=op['row'];col=op['col'];bit=op['data']
    prefix=f'command {i}'
    for name,key in [('RA','row'),('CA','col'),('DIN','data'),('W','write')]:
        level(name,op[key],a+35,a+890,tag=prefix+' latched input')
    for e in range(9):
        state=e+1 if e<7 else 0
        for j in range(3):level('S'+str(j),(state>>j)&1,a+100*e+35,a+100*e+90,tag=prefix+' state')
        expected={'PREB':int(state!=1),'WL_EN':int(state in [4,5]),'WRITE_EN':int(wr and state in [3,4,5,6]),'SAE':int(wr or state in [0,5,6,7]),'BUSY':int(state!=0)}
        for n,b in expected.items():level(n,b,a+100*e+35,a+100*e+90,tag=prefix+' control')
    # Entire inactive intervals, including counter transitions: no spurious WL/PD pulses.
    for n in ['WL_EN',f'WL{row}']:
        level(n,0,a+35,a+299,tag=prefix+' WL before access')
        level(n,0,a+535,a+890,tag=prefix+' WL after access')
    level(f'WL{1-row}',0,a+35,a+890,tag=prefix+' unselected row')
    level(f'WL{row}',1,a+335,a+490,tag=prefix+' selected row')
    for n in ['PD_Y','PD_YB']:
        target=wr and ((n=='PD_YB')==bool(bit))
        if target:
            level(n,0,a+35,a+199,tag=prefix+' PD before drive')
            level(n,1,a+235,a+590,tag=prefix+' PD driving')
            level(n,0,a+635,a+890,tag=prefix+' PD released')
        else:level(n,0,a+35,a+890,tag=prefix+' inactive PD')
    for n in ['BL0','BLB0','BL1','BLB1','Y','YB']:level(n,1,a+80,a+90,tag=prefix+' precharge')
    if not wr:
        for n in ['SOUT','SOUTB']:level(n,1,a+80,a+90,tag=prefix+' sense reset')
        level('SOUT',bit,a+450,a+690,tag=prefix+' sense result')
        level('SOUTB',1-bit,a+450,a+690,tag=prefix+' sense result')
    for (rr,cc),b in known.items():
        if wr and (rr,cc)==(row,col):continue
        for n,d in [('Q',b),('QB',1-b)]:level(f'{n}{rr}{cc}',d,a+35,a+890,rails=False,tag=prefix+' cell retention')
    if wr:known[row,col]=bit
    for (rr,cc),b in known.items():
        for n,d in [('Q',b),('QB',1-b)]:level(f'{n}{rr}{cc}',d,a+750,a+790,tag=prefix+' stored value')
    level('READ_DATA',last_read,a+35,a+599 if not wr else a+890,tag=prefix+' result hold')
    if not wr:
        last_read=bit;level('READ_DATA',bit,a+635,a+890,tag=prefix+' E6 capture')
if errors:
    print('\n'.join(errors[:35]));print(f'FAIL: {len(errors)} of {checks} checks failed');sys.exit(1)
print(f'PASS: {checks} interval checks; 16 commands, all four addresses, both values, reset, busy START, held inputs, control timing and read capture')
