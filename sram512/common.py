"""Reproducible tools for the 512-bit design; never patch a PDK deck."""
from pathlib import Path
import hashlib, json, os, re, subprocess, sys
import klayout.db as db
import klayout.rdb as rdb

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent
WORK = ROOT / 'build/sram512'
REPORTS = HERE / 'reports'
sys.path.insert(0, str(ROOT / 'scripts'))
from pdk_profiles import pdk_path, environment, provenance, klayout_binary
PDK = pdk_path('dev')
ENV = environment('dev')
LIB = PDK / 'libs.tech/xschem'

def write_json(path, data):
    path = Path(path); path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + '\n')

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def run(cmd, work, log, check=True):
    work = Path(work); work.mkdir(parents=True, exist_ok=True)
    with (work / log).open('w') as f:
        p = subprocess.run(list(map(str, cmd)), cwd=work, env=ENV, stdout=f, stderr=subprocess.STDOUT)
    text = (work / log).read_text()
    if check and p.returncode:
        raise RuntimeError(f'{work/log}: exit {p.returncode}\n{text[-2000:]}')
    return p.returncode, text

def netlist(schematic, work, subckt=True, erc=True):
    schematic = Path(schematic).resolve(); work = Path(work).resolve()
    work.mkdir(parents=True, exist_ok=True)
    paths = [schematic.parent, ROOT, Path('/usr/local/share/xschem/xschem_library'),
             Path('/usr/local/share/xschem/xschem_library/devices'), LIB,
             LIB/'TR-1umLIB', LIB/'TR-1um_5_stdcell']
    rc = work/'xschemrc'
    rc.write_text('set XSCHEM_LIBRARY_PATH {'+':'.join(map(str, paths))+'}\n'
        +f'set LIB {{{PDK}/libs.tech/spice/models}}\nset lvs_netlist 0\n'
        +f'set top_is_subckt {int(subckt)}\nset spiceprefix 1\n')
    command='set result [xschem netlist]; puts [xschem get infowindow_text]; exit $result'
    _, log = run(['xschem','-r','-x','--rcfile',rc,'-s','--command',command,
                  '-o',work,schematic],work,'netlist.log')
    if erc and re.search(r'(?im)error:|warning:|symbol not found|SKIPPING', log):
        raise RuntimeError(f'ERC failed: {work}/netlist.log\n{log[-2000:]}')
    result=work/(schematic.stem+'.spice')
    if 'IS MISSING' in result.read_text():
        raise RuntimeError(f'Unresolved symbol in {result}')
    return result

def verify_layout(gds, top, ref, work):
    """Run original dev entry points, including the default strict port mode."""
    work=Path(work).resolve(); work.mkdir(parents=True, exist_ok=True)
    gds=Path(gds).resolve(); ref=Path(ref).resolve()
    result={'top':top,'gds_sha256':sha(gds),'reference_sha256':sha(ref),
            'pdk':provenance('dev')}
    for kind in ('drc','lvs'):
        report=work/(top+'.'+kind+'db'); report.unlink(missing_ok=True)
        cmd=[klayout_binary(),'-b','-r',PDK/f'libs.tech/klayout/tech/{kind}/run.{kind}',
             '-rd',f'input={gds}','-rd',f'top_cell={top}','-rd',f'report={report}']
        if kind=='lvs':
            cmd+=['-rd',f'circuit={ref}','-rd',f'extracted={work}/{top}.extracted']
        code, log=run(cmd,work,kind+'.log',check=False)
        if code or not report.exists():
            result[kind]={'passed':False,'exit_code':code,'error':log[-1500:]};continue
        if kind=='drc':
            r=rdb.ReportDatabase();r.load(str(report))
            result[kind]={'passed':r.num_items()==0,'items':r.num_items(),
                'categories':{c.name():c.num_items() for c in r.each_category() if c.num_items()}}
        else:
            r=db.LayoutVsSchematic();r.read(str(report))
            pairs=list(r.xref().each_circuit_pair());errors=[e.message for e in r.each_error()]
            result[kind]={'passed':bool(pairs) and all(p.status()==db.NetlistCrossReference.Match for p in pairs)
                and not errors and 'Congratulations! Netlists match.' in log,
                'circuit_pairs':[str(p.status()) for p in pairs],'errors':errors}
    write_json(work/'result.json',result)
    return result
