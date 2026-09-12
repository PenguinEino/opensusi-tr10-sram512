#!/usr/bin/env python3
"""Recheck the saved GDS against the current Xschem source and original PDK."""
import shutil
from common import *
from geometry_audit import audit
from manufacturing import verify as mask_verify


def main():
    source=HERE/'layout';work=WORK/'layout/rechecked16x32'
    work.mkdir(parents=True,exist_ok=True)
    for name in ('sram512.gds','placement.json','ports.json','array_geometry.json','coordinate_frames.json'):
        shutil.copy2(source/name,work/name)
    generated=netlist(ROOT/'sram512_macro.sch',work/'schematic',lvs=True)
    text=generated.read_text()
    text=re.sub(r'(?im)^X(\S+)(\s+\S+\s+\S+\s+\S+\s+\S+\s+(?:NMOS|PMOS)\b)',r'M\1\2',text)
    reference=work/'reference.spice';reference.write_text(text)
    result=verify_layout(work/'sram512.gds','sram512_macro',reference,work/'checks')
    assert all(result[k]['passed'] for k in ('drc','lvs')),result
    result['geometry']=audit(work,require_origin=True)
    result['manufacturing']=mask_verify(work)
    result['passed']=result['manufacturing']['passed']
    result['scope']='Saved layout independently checked against the current editable Xschem hierarchy and unmodified dev decks.'
    write_json(REPORTS/'saved_layout_recheck.json',result)
    print(result['passed'],result['gds_sha256'],flush=True)
    return result


if __name__=='__main__':
    raise SystemExit(0 if main()['passed'] else 1)
