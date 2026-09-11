#!/usr/bin/env python3
"""Physical 16x16 half-array, with sixteen column switches and final ANDs."""
from layout_analog import *
from routing import *

AX=0; AY=147; CY=104.5; GY=66
def trans(x,y,mirror=False):
    return db.Trans(db.Trans.M0 if mirror else db.Trans.R0,round(x*1000),round(y*1000))

def macros():
    for name in ('array16','columns16'):
        w=WORK/f'layout/bank/{name}';w.mkdir(parents=True,exist_ok=True)
        l=db.Layout();l.dbu=.001;l.technology_name='TR-1um'
        if name=='array16':
            core=pc.bitcell(l,family='six_single');c=pc.array(l,core,16,16,gap=22)
            source=pc.reference(c.name,16,16)
        else:
            c=column_bank(l,16,gap=22,ground_below_logic=True,ground_depth=99)
            source=reference(c.name,16)
        gds=w/'macro.gds';ref=w/'reference.spice';c.write(str(gds));ref.write_text(source)
        rr=verify_layout(gds,c.name,ref,w/'checks');print(name,rr['drc'],rr['lvs'],flush=True)
        assert all(rr[k]['passed'] for k in ('drc','lvs')),rr

def build():
    w=WORK/'layout/bank';w.mkdir(parents=True,exist_ok=True)
    l=db.Layout();l.read(str(WORK/'library/access/library.gds'));l.technology_name='TR-1um'
    def imp(name,cell):
        s=db.Layout();s.read(str(w/name/'macro.gds'));c=l.create_cell(cell);c.copy_tree(s.cell(cell));return c
    arr=imp('array16','pcell_16x16');col=imp('columns16','sram512_columns_16');gate=l.cell('AND2_X1')
    top=l.create_cell('sram512_bank');d=pc.Drawing(l,top);r=Router(l,top,(-33,-33,396,621.5))
    for c,y,path in [(arr,AY,'array16'),(col,CY,'columns16')]:
        tr=trans(0,y);top.insert(db.CellInstArray(c.cell_index(),tr))
        mapping={n:n for n in physical_labels(c,l)}
        r.add_extracted(c,w/path/f'checks/{c.name}.lvsdb',tr,mapping,c.name)
    def wire(name,layer,points,width=None):
        k=0 if layer=='M1' else 1;width=width or (1.8 if k==0 else 3.4)
        poly=db.DPath([db.DPoint(*p) for p in points],width,width/2,width/2).to_itype(.001).polygon()
        top.shapes(l.layer(*(M1 if k==0 else M2))).insert(poly)
        regs=[db.Region(),db.Region()];regs[k].insert(poly);r.add_geometry(regs,name)
        return regs
    def via(name,x,y):
        d.via(x,y);pad=db.Region(db.Box(round((x-1.7)*1000),round((y-1.7)*1000),round((x+1.7)*1000),round((y+1.7)*1000)))
        r.add_geometry([pad,pad],name)
    for c in range(16):
        x=c*22;tr=trans(x,GY,True);top.insert(db.CellInstArray(gate.cell_index(),tr))
        r.add_extracted(gate,WORK/'library/access/AND2_X1/AND2_X1.lvsdb',tr,
            dict(A=f'CL{c%4}',B=f'CH{c//4}',Y=f'COL{c}',VDD='VDD',GND='VSS'),f'Xselect{c}')
        # COL crosses the standard-cell ground rail in M2, then uses M1 in
        # the open channel, leaving horizontal M2 tracks for predecoding.
        name=f'col{c}';wire(name,'M1',[(x+16.5,55),(x+16.5,61.5)])
        via(name,x+16.5,61.5);wire(name,'M2',[(x+16.5,61.5),(x+16.5,77)])
        via(name,x+16.5,77);wire(name,'M1',[(x+16.5,77),(x+16.5,CY-11),(x+11,CY-11)])
        via(name,x+11,CY-11);r.pins[r.netid(name)]=[]
        for name,dx in [('bl',-.4),('blb',18.4)]:
            wire(f'{name}{c}','M1',[(x+dx,CY+40),(x+dx,AY+5.7)])
            r.pins[r.netid(f'{name}{c}')]=[]
    for side,bx in [(-1,0),(1,352)]:
        for name,off,y0 in [('vdd',14.4,CY+31.5),('vss',19.8,5.5)]:
            wire(name,'M1',[(bx+side*off,y0),(bx+side*off,AY+464.9)],3.4)
    # Expose actual wordline wires at a legal coarse-grid access point.
    for row in range(16):
        y=AY+(row*29.6+2.7 if row%2==0 else (row+1)*29.6-2.7)
        gy=round(y/5.5)*5.5;direction=gy-y
        long_leg=(row%2==1 and direction>=0) or (row%2==0 and direction<0)
        x=-33 if long_leg else -27.5;name=f'wl{row}'
        extra=wire(name,'M2',[(-9.6,y),(x,y),(x,gy)])
        label,regs=r.pins[r.netid(name)][0];r.pins[r.netid(name)][0]=(label,[regs[k]+extra[k] for k in range(2)])
        d.label('M2',name.upper(),x,gy)
    # Decode buses have independent external terminals on the right edge.
    for i,name in enumerate([f'CL{i}' for i in range(4)]+[f'CH{i}' for i in range(4)]):
        x=385;y=-22+i*16.5
        pad=db.Region(db.Box(round((x-1.7)*1000),round((y-1.7)*1000),round((x+1.7)*1000),round((y+1.7)*1000)))
        top.shapes(l.layer(*M2)).insert(pad);d.label('M2',name,x,y)
        r.add_geometry([db.Region(),pad],name,'PORT.'+name)
    for name,y,x,gy in [('preb',CY+11.5,379.5,115.5),('y',CY+5.5,385,110),('yb',CY,390.5,104.5),('vdd',CY+31.5,379.5,137.5)]:
        extra=wire(name,'M2',[(366.4,y),(x,y),(x,gy)])
        terms=r.pins[r.netid(name)]
        for j,(label,regs) in enumerate(terms):
            if label.startswith(col.name+'.'):terms[j]=(label,[regs[k]+extra[k] for k in range(2)])
        d.label('M2',name.upper(),x,gy)
    d.label('M1','VSS',-19.8,5.5)
    top.write(str(w/'placed.gds'))
    return l,top,r,w

def ref(top):
    arr=(WORK/'layout/bank/array16/reference.spice').read_text()
    col=(WORK/'layout/bank/columns16/reference.spice').read_text()
    gate=(WORK/'library/interfaces/AND2_X1/reference.spice').read_text()
    defs=parse(arr+'\n'+col+'\n'+gate)
    ports=[f'WL{i}' for i in range(16)]+[f'CL{i}' for i in range(4)]+[f'CH{i}' for i in range(4)]+['Y','YB','PREB','VDD','VSS']
    lines=['* Physical half-array reference',f'.subckt {top} '+' '.join(ports)]
    for name,kind in [('array','pcell_16x16'),('columns','sram512_columns_16')]:
        lines.append('X'+name+' '+' '.join(defs[kind]['pins'])+' '+kind)
    for c in range(16):
        m=dict(a=f'CL{c%4}',b=f'CH{c//4}',y=f'COL{c}',vdd='VDD',gnd='VSS')
        lines.append(f'Xselect{c} '+' '.join(m[n] for n in defs['and2_x1']['pins'])+' AND2_X1')
    return '\n'.join(lines+[f'.ends {top}',arr,col,gate])

if __name__=='__main__':
    import argparse
    ap=argparse.ArgumentParser();ap.add_argument('--macros',action='store_true');ap.add_argument('--place-only',action='store_true');a=ap.parse_args()
    if a.macros:macros()
    l,c,r,w=build()
    if not a.place_only:
        success=r.route(w/'routing',100);pc.fill_metal_notches(l,c);gds=w/'bank.gds';c.write(str(gds))
        source=w/'reference.spice';source.write_text(ref(c.name))
        result=verify_layout(gds,c.name,source,w/'checks');print(result['drc'],result['lvs'],flush=True)
        write_json(REPORTS/'layout_bank.json',result)
        if not success or not all(result[k]['passed'] for k in ('drc','lvs')):raise SystemExit(1)
