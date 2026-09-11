#!/usr/bin/env python3
"""PDK diode pair for input gate antenna protection; no qualified pad ESD claim."""
from common import *
from layout_analog import pc
from schematics import Sheet,symbol

def schematic():
    s=Sheet();s.text('INPUT GATE CLAMPS | dev PCell DP + DN, 3.6 x 3.6 um',-350,-270,.32)
    s.text('Connect to the shuttle pad / ESD network at chip integration.',-350,-210,.27)
    s.device('DP','upper',0,-120,dict(PLUS='IN',MINUS='VDD'),'model=DP w=3.6u l=3.6u m=1 spiceprefix=D')
    s.device('DN','lower',0,80,dict(PLUS='VSS',MINUS='IN'),'model=DN w=3.6u l=3.6u m=1 spiceprefix=D')
    s.link('upper','PLUS','lower','MINUS')
    s.named_port('IN',-250,0,'inout')
    s.wire([(-190,0),(0,0)],'IN')
    s.named_port('VDD',-250,-120,'inout');s.named_port('VSS',-250,140,'inout')
    s.finish();s.save('sram512_input_clamp.sch')
    symbol('sram512_input_clamp',[],[],inouts=('VDD','VSS'))
    # A bidirectional signal terminal expresses the diode load on the input.
    from schematics import custom_symbol
    pts={'IN':(-100,0),'VDD':(0,-120),'VSS':(0,120)}
    custom_symbol('sram512_input_clamp',pts,{n:'inout' for n in pts},(-80,-100,80,100))

def main():
    schematic();work=WORK/'layout/input_clamp';work.mkdir(parents=True,exist_ok=True)
    source=netlist(ROOT/'sram512_input_clamp.sch',work/'schematic',lvs=True)
    text=source.read_text()
    assert re.search(r'(?im)^Dxupper IN VDD DP A=12.96p P=14.4u$',text)
    assert re.search(r'(?im)^Dxlower VSS IN DN A=12.96p P=14.4u$',text)
    l=db.Layout();l.dbu=.001;l.technology_name='TR-1um';c=l.create_cell('sram512_input_clamp');d=pc.Drawing(l,c)
    d.pcell('diode_p',11,38.5,{'x':3.6,'y':3.6})
    d.pcell('diode_n',11,11,{'x':3.6,'y':3.6})
    d.box('WN',0,28.5,33,48.5)
    d.contact(22,38.5,'AN');d.contact(22,11,'AP')
    d.wire('M1',[(11,11),(11,38.5)],1.8)
    d.wire('M1',[(11,27.5),(5.5,27.5)],1.8);d.via(5.5,27.5)
    for name,y,tap in [('VDD',55,38.5),('VSS',0,11)]:
        d.wire('M1',[(22,tap),(22,y)],3.4)
        d.wire('M1',[(0,y),(33,y)],3.4);d.via(27.5,y);d.label('M1',name,0,y)
    d.label('M2','IN',5.5,27.5)
    gds=work/'cell.gds';c.write(str(gds))
    result=verify_layout(gds,c.name,source,work/'checks')
    print(result['drc'],result['lvs'],flush=True);write_json(REPORTS/'input_clamp.json',result)
    if not all(result[k]['passed'] for k in ('drc','lvs')):raise SystemExit(1)

if __name__=='__main__':main()
