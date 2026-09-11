#!/usr/bin/env python3
"""Use the unmodified dev MDP exporter and full IP62 mask DRC."""
import argparse,shutil
from common import *

def freeze(folder):
    folder=Path(folder).resolve()
    result=json.loads((folder/'checks/result.json').read_text())
    assert all(result[k]['passed'] for k in ('drc','lvs'))
    assert sha(folder/'sram512.gds')==result['gds_sha256']
    dest=WORK/'extracted_sources'/result['gds_sha256']
    if not dest.exists():
        dest.mkdir(parents=True)
        for name in ('sram512.gds','reference.spice','placement.json'):
            if (folder/name).exists():shutil.copy2(folder/name,dest/name)
        shutil.copytree(folder/'checks',dest/'checks')
    assert sha(dest/'sram512.gds')==result['gds_sha256']
    return dest

def verify(folder):
    folder=freeze(folder);work=folder/'manufacturing';work.mkdir(exist_ok=True)
    source=folder/'sram512.gds';top='sram512_macro'
    l=db.Layout();l.read(str(source));c=l.cell(top)
    # No recognition/waiver regions may silently suppress source checks.
    for dtype in (0,1,2):
        assert db.Region(c.begin_shapes_rec(l.layer(63,dtype))).is_empty(),(63,dtype)
    mask=work/'sram512_mask.gds'
    run([klayout_binary(),'-b','-r',PDK/'libs.tech/klayout/tech/drc/run_mdp.drc',
         '-rd',f'input={source}','-rd',f'cellname={top}','-rd',f'output={mask}'],work,'mdp.log')
    report=work/'sram512_mask.drcdb';report.unlink(missing_ok=True)
    code,log=run([klayout_binary(),'-b','-r',PDK/'libs.tech/klayout/tech/drc/run_IP62.drc',
                 '-rd',f'input={mask}','-rd',f'top_cell={top}','-rd',f'report={report}'],
                work,'mask_drc.log',check=False)
    assert code==0 and report.exists(),log[-1500:]
    r=rdb.ReportDatabase();r.load(str(report))
    result=dict(passed=r.num_items()==0,items=r.num_items(),
                categories={c.name():c.num_items() for c in r.each_category() if c.num_items()},
                drawing_sha256=sha(source),mask_sha256=sha(mask),pdk=provenance('dev'),
                source=str(folder),waiver_regions=0,
                scope='Official MDP and complete IP62 mask DRC of the core; package/pad integration is separate.')
    write_json(work/'result.json',result);write_json(REPORTS/'manufacturing_mask.json',result)
    print(folder,flush=True);print(result['passed'],result['items'],result['categories'],flush=True)
    return result

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('folder',type=Path);a=p.parse_args()
    result=verify(a.folder);raise SystemExit(0 if result['passed'] else 1)
