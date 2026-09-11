#!/usr/bin/env python3
"""Two rotated physical half-arrays implementing one logical 16x32 SRAM."""
import argparse
from layout_analog import pc
from routing import *
from verify_digital import parse,digital_parts
from placement import improve
from physical_top import named_macro,verify_and_repair

def trans(x,y,mirror=False):return db.Trans(db.Trans.M0 if mirror else db.Trans.R0,round(x*1000),round(y*1000))

def lvs_reference():
    text=(WORK/'schematic/sram512.spice').read_text()
    return re.sub(r'(?im)^X(\S+)(\s+\S+\s+\S+\s+\S+\s+\S+\s+(?:NMOS|PMOS)\b)',r'M\1\2',text)

def build(height=600,poly_rows=False,row_clamps=False):
    extra=round((height-600)/5.5)*5.5
    driver_y=110+round(extra/11)*5.5
    dy=82.5+round(extra/33)*5.5
    work=WORK/(('layout/top' if height==600 else f'layout/top_h{height}')+('_poly' if poly_rows else '')+('_rowclamps' if row_clamps else ''));work.mkdir(parents=True,exist_ok=True)
    # Reuse identical verified AND2 leaves already present inside the bank.
    l=db.Layout();l.read(str(WORK/'layout/bank/bank.gds'));l.technology_name='TR-1um'
    src=db.Layout();src.read(str(WORK/'library/access/library.gds'))
    parts=digital_parts(parse((WORK/'schematic/sram512.spice').read_text()))
    lib={}
    for kind in sorted({p['kind'].upper() for p in parts}):
        c=l.cell(kind)
        if c is None:c=l.create_cell(kind);c.copy_tree(src.cell(kind))
        lib[kind]=c
    source=db.Layout();source.read(str(WORK/'layout/input_clamp/cell.gds'))
    clamp=l.create_cell('sram512_input_clamp');clamp.copy_tree(source.cell(clamp.name))
    lib[clamp.name.upper()]=clamp
    if row_clamps:
        parts += [dict(name='input_'+n.lower(),kind=clamp.name,
                       nets={'IN':n.lower(),'VDD':'vdd','VSS':'vss'}) for n in ('CLK','RESET','SDI','WE')]
    s=db.Layout();s.read(str(WORK/'layout/sense/shared.gds'))
    shared=l.create_cell('sram512_shared');shared.copy_tree(s.cell('sram512_shared'))
    bank=l.cell('sram512_bank');top=l.create_cell('sram512');d=pc.Drawing(l,top)
    router=Router(l,top,(0,0,1793,math.floor((height-3.4)/5.5)*5.5),step=5500);placements=[];placed=set();anchors=defaultdict(list)
    byname={p['name']:p for p in parts}
    for b in range(2):
        tr=db.Trans(db.Trans.R90,round((627+660*b)*1000),round((220+extra)*1000))
        top.insert(db.CellInstArray(bank.cell_index(),tr))
        mapping={n:n for n in ('y','yb','preb','vdd','vss')}
        mapping.update({f'wl{r}':f'wl{r}' if b==0 else f'wl_r{r}' for r in range(16)})
        mapping.update({f'cl{i}':f'xcol_decode__cl{i}' for i in range(4)})
        mapping.update({f'ch{i}':f'xcol_decode__ch{i+4*b}' for i in range(4)})
        router.add_extracted(bank,WORK/'layout/bank/checks/sram512_bank.lvsdb',tr,mapping,f'bank{b}')
        for pin,(layer,point) in physical_labels(bank,l).items():
            if pin in mapping:
                pt=tr*db.Point(point.x,point.y);anchors[mapping[pin]].append((pt.x/1000,pt.y/1000))
        placements.append(dict(instance=f'bank{b}',kind=bank.name,x=627+660*b,y=220+extra,rotation=90))
        placed.update(f'xcol_decode__xselect{c}' for c in range(b*16,(b+1)*16))
    def place(p,x,y,mirror=False):
        c=lib[p['kind'].upper()];tr=trans(x,y,mirror)
        top.insert(db.CellInstArray(c.cell_index(),tr));placed.add(p['name'])
        checks=WORK/'layout/input_clamp/checks/sram512_input_clamp.lvsdb' if c==clamp else WORK/f'library/access/{c.name}/{c.name}.lvsdb'
        router.add_extracted(c,checks,tr,p['nets'],p['name'])
        placements.append(dict(instance=p['name'],kind=c.name,x=x,y=y,mirror=mirror))
        for n in set(p['nets'].values()):anchors[n].append((x+(c.dbbox().width()-12.6)/2,y+(-27.5 if mirror else 27.5)))
    def width(p):return 33 if p['kind']==clamp.name else lib[p['kind'].upper()].dbbox().width()-12.6
    for b in range(2):
        for row in range(16):
            p=byname[f'xrow__xdriver{row}' if b==0 else f'xrow__xdriver_right{row}']
            place(p,16.5+682*b+(15-row)*27.5,driver_y)
    tr=trans(1177,110);top.insert(db.CellInstArray(shared.cell_index(),tr))
    router.add_extracted(shared,WORK/'layout/sense/checks/sram512_shared.lvsdb',tr,
        {n:n for n in physical_labels(shared,l)},'sense')
    placements.append(dict(instance='sense',kind=shared.name,x=1177,y=110,mirror=False))
    for i,n in enumerate(() if row_clamps else ('CLK','RESET','SDI','WE')):
        x=1149.5+49.5*i;y=220;tr=trans(x,y)
        top.insert(db.CellInstArray(clamp.cell_index(),tr))
        router.add_extracted(clamp,WORK/'layout/input_clamp/checks/sram512_input_clamp.lvsdb',tr,
                             {'in':n,'vdd':'VDD','vss':'VSS'},'input_'+n.lower())
        placements.append(dict(instance='input_'+n.lower(),kind=clamp.name,x=x,y=y,mirror=False))
    frame=[p for p in parts if '__xframe__' in p['name']]
    colpre=[p for p in parts if p['name'].startswith('xcol_decode__') and p['name'] not in placed]
    x=16.5
    phase_parts=[p for p in parts if '__xphase__' in p['name']]
    for i,p in enumerate(phase_parts):
        place(p,x,11);x+=width(p)
        if i<20:x+=5.5
    # Physical supply straps bridge the intentional placement gaps.
    for name,y in [('vss',11),('vdd',66)]:
        poly=db.DPath([db.DPoint(16.5,y),db.DPoint(x,y)],1.8,.9,.9).to_itype(.001).polygon()
        top.shapes(l.layer(*M1)).insert(poly);router.add_geometry([db.Region(poly),db.Region()],name)
    assert x<=1750,x
    x=456.5
    for p in [p for p in parts if p['name'].startswith('xrow__') and p['name'] not in placed]:
        place(p,x,driver_y);x+=width(p)
    assert abs(x-698.5)<.01
    remain=[p for p in parts if p['name'] not in placed]
    rows=[[] for _ in range(7)];used=[0.]*7;caps=[303]+[429]*6
    for p in sorted(remain,key=width,reverse=True):
        candidates=[j for j in range(7) if used[j]+width(p)<=caps[j]]
        assert candidates,(p,used)
        j=max(candidates,key=lambda j:used[j]);rows[j].append(p);used[j]+=width(p)
    rows=improve(rows,remain,width,anchors,x0=[1479]+[1353]*6,dy=dy,capacity=caps)
    for j,ps in enumerate(rows):
        x=1479 if j==0 else 1353;y=11+dy*j
        for p in ps:place(p,x,y);x+=width(p)
    assert placed==set(byname),set(byname)-placed
    buses=[]
    if poly_rows:
        location={p['instance']:p for p in placements}
        kinds={p['kind'] for p in parts}
        access={k:{pin:pt.x/1000 for pin,(_,pt) in physical_labels(lib[k.upper()],l).items()} for k in kinds}
        busdefs=[(f'xctrl__xphase__{n}',85.25+j*5.5,1,j,1320,[]) for j,n in enumerate(('c4b','c0','c1','c3'))]
        busdefs +=[(f'xrow__r0_{j}',178.75+j*5.5,-1,j,1122,[(473,671)]) for j in range(4)]
        for name,cy,direction,j,xlimit,avoid in busdefs:
            wanted=[]
            for p in parts:
                for pin,n in p['nets'].items():
                    if n!=name:continue
                    dx=access[p['kind']][pin]
                    wanted.append(location[p['name']]['x']+dx-11)
            candidates=[x for i in range(32) if (x:=i*44+j*11)>=11 and x<=xlimit and not any(a<=x<=b for a,b in avoid)]
            xs=sorted(set(min(candidates,key=lambda x:abs(x-target)) for target in wanted))
            assert len(xs)>1,(name,xs)
            d.wire('GC',[(xs[0]-5.5,cy),(xs[-1]+5.5,cy)],1)
            metal=db.Region()
            for x in xs:
                d.contact(x,cy,'GC')
                points=[(x,cy),(x+5.5,cy),(x+5.5,cy+direction*2.75)]
                d.wire('M1',points,1.8)
                metal.insert(db.DBox(x-1.3,cy-1.3,x+1.3,cy+1.3).to_itype(.001))
                metal.insert(db.DPath([db.DPoint(*pt) for pt in points],1.8,.9,.9).to_itype(.001).polygon())
            # Physical GC and contacts connect every landing pad in this one
            # terminal. The electrical bridge is independently checked by LVS.
            router.add_geometry([metal,db.Region()],name,'polybus.'+name)
            buses.append(dict(net=name,width_um=1,y_um=cy,x_start_um=xs[0]-5.5,x_end_um=xs[-1]+5.5,
                              tap_x_um=xs,length_um=xs[-1]-xs[0]+11))
    write_json(work/'poly_buses.json',buses)
    for i,name in enumerate(['VSS','VDD','CLK','RESET','SDI','WE','SDO']):
        x=1793;y=22+i*77
        reg=db.Region(db.Box(round((x-1.7)*1000),round((y-1.7)*1000),round((x+1.7)*1000),round((y+1.7)*1000)))
        top.shapes(l.layer(*M2)).insert(reg);d.label('M2',name,x,y)
        router.add_geometry([db.Region(),reg],name,'PORT.'+name)
    write_json(work/'placement.json',placements);top.write(str(work/'placed.gds'))
    return l,top,router,work

def main():
    p=argparse.ArgumentParser();p.add_argument('--place-only',action='store_true');p.add_argument('--iterations',type=int,default=100);p.add_argument('--height',type=int,default=600);p.add_argument('--poly-rows',action='store_true');p.add_argument('--row-clamps',action='store_true');a=p.parse_args()
    l,top,r,work=build(a.height,a.poly_rows,a.row_clamps)
    if a.place_only:return
    success=r.route(work/'routing',a.iterations)
    top=named_macro(l,top,work)
    result=verify_and_repair(l,top,work);result.update(bbox_um=str(top.dbbox()),router_passed=success)
    report=('layout' if a.height==600 else f'layout_h{a.height}')+('_poly' if a.poly_rows else '')+('_rowclamps' if a.row_clamps else '')+'.json'
    write_json(REPORTS/report,result);print(result['drc'],result['lvs'],flush=True)
    if not success or not all(result[k]['passed'] for k in ('drc','lvs')):raise SystemExit(1)

if __name__=='__main__':main()
