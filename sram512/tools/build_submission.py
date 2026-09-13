#!/usr/bin/env python3
"""Build the minimal, portable root submission folder from verified design sources."""
import argparse
from datetime import datetime, timezone
import shutil
import zipfile
from common import *
from validation_summary import main as summarize, source_files
from pdk_profiles import locked, tree_digest


def dependencies():
    pending = [SCHEMATICS/'sram512_macro.sch', SCHEMATICS/'sram512_tb.sch']
    files = {SCHEMATICS/'sram512_macro.sym'}
    while pending:
        p = pending.pop()
        if p in files:
            continue
        files.add(p)
        for symbol in re.findall(r'^C \{([^}]+)\}', p.read_text(), re.M):
            if symbol.startswith('devices/'):
                continue
            candidates=[p.parent/symbol, SCHEMATICS/symbol, LIB/symbol,
                        LIB/'TR-1umLIB'/symbol, LIB/'TR-1um_5_stdcell'/symbol]
            q=next((q for q in candidates if q.is_file()),None)
            if q is None and any((Path(base)/'devices'/symbol).is_file() for base in
                    ('/usr/local/share/xschem/xschem_library','/usr/share/xschem/xschem_library')):
                continue
            assert q is not None, (p, symbol)
            pending.append(q)
            child = q.with_suffix('.sch')
            if child.is_file():
                pending.append(child)
    return files


def build():
    summary = summarize()
    assert summary['all_required_reports_pass'], 'Current required checks must all pass.'
    preservation=json.loads((ROOT/'reviews/repository_organization.json').read_text())
    assert preservation['passed'] and preservation['source_gds_sha256']==summary['source_gds_sha256']
    for entry in preservation['source_files']:
        assert sha(ROOT/entry['current'])==entry['sha256'], (
            'Verified electrical sources changed; fresh verification evidence is required.',entry['current'])
    lock=locked()['profiles']['dev']
    assert subprocess.check_output(['git','-C',PDK,'rev-parse','HEAD'],text=True).strip()==lock['revision']
    assert tree_digest(PDK)==lock['tree_sha256'], 'PDK files changed.'
    output = ROOT/'submission'
    output.mkdir(exist_ok=True)
    payload = {}
    origins = {}
    def add(name, path):
        payload[name] = path.read_bytes()
        origins[name] = str(path.relative_to(ROOT))
    for path in sorted(dependencies()):
        if path.is_relative_to(SCHEMATICS):
            name = ('simulation/' if path.name == 'sram512_tb.sch' else 'schematics/')+path.name
        else:
            name = 'pdk/xschem/'+path.relative_to(LIB).as_posix()
        add(name, path)
    for p in (PDK/'libs.tech/spice/models').iterdir():
        if p.is_file():
            add('pdk/models/'+p.name, p)
    for name in ('sram512.gds', 'sram512_mask.gds', 'ports.json', 'overview.png'):
        add('layout/'+name, HERE/'layout'/name)
    for name in ('SPEC.md', 'SUBMISSION.md', 'APPEAL.md', 'VERIFICATION.md'):
        add(name, HERE/name)
    # SPEC's development commands belong to the full repository, not the minimal export.
    spec=payload['SPEC.md'].decode()
    spec=spec.replace('sram512/schematics/sram512_tb.sch','simulation/sram512_tb.sch')
    spec=spec.replace('sram512/schematics/','schematics/')
    spec=spec.replace('reports/validation_summary.json','verification/validation_summary.json')
    spec=spec.replace('diagrams/sram512.svg','schematics/overview.svg')
    spec=spec.replace('diagrams/','schematics/')
    spec=re.sub(r'```bash\npython3 sram512/tools/.*?```',
                '同梱版の実行方法はREADME.mdを参照。`python3 run.py simulate`でTBを実行する。',spec,flags=re.S)
    payload['SPEC.md']=spec.encode()
    add('README.md', HERE/'SUBMISSION_README.md')
    add('run.py', TOOLS/'submission_runner.py')
    add('schematics/overview.svg', HERE/'diagrams/sram512.svg')
    for name in ('sram512_controller.svg','sram512_frame.svg','sram512_phase.svg'):
        add('schematics/'+name,HERE/'diagrams'/name)
    add('simulation/operations.png', REPORTS/'decoderfix_power_paths_ramp_operations.png')
    payload['.gitignore'] = b'/results/\n/__pycache__/\n'
    add('verification/validation_summary.json', REPORTS/'validation_summary.json')
    # Only current required evidence is submitted; research failures remain in the work repository.
    for row in summary['tests']:
        add('verification/'+Path(row['report']).name, ROOT/row['report'])
    add('verification/repository_organization.json', ROOT/'reviews/repository_organization.json')
    manifest = dict(format_version=1, created_utc=datetime.now(timezone.utc).isoformat(),
                    source_commit=subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip(),
                    status='CORE_VERIFIED_WITH_DOCUMENTED_MODEL_LIMITS',
                    pdk_revision=subprocess.check_output(['git','-C',PDK,'rev-parse','HEAD'],text=True).strip(),
                    source_gds_sha256=summary['source_gds_sha256'],
                    source_mask_sha256=summary['source_mask_sha256'],
                    evidence_index='verification/validation_summary.json',
                    evidence_paths_note='Paths inside original reports are historical repository paths; report bytes are preserved.',
                    sources=origins,
                    files={name:dict(bytes=len(data),sha256=hashlib.sha256(data).hexdigest())
                           for name,data in sorted(payload.items())})
    payload['MANIFEST.json']=(json.dumps(manifest,indent=2,ensure_ascii=False)+'\n').encode()
    # Refuse to silently overwrite a manually edited export. Source files are authoritative.
    old_manifest=output/'MANIFEST.json'
    if old_manifest.exists():
        old=json.loads(old_manifest.read_text())
        for name,info in old['files'].items():
            path=output/name
            if path.exists() and sha(path)!=info['sha256']:
                raise RuntimeError(f'Export edited outside source: {path}; preserve/merge that edit before rebuilding.')
        stale={name for name in set(old['files'])-set(payload) if (output/name).exists()}
        if stale:
            raise RuntimeError('Stale export entries need explicit archival: '+', '.join(sorted(stale)))
    for name,data in payload.items():
        path=output/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(data)
    folder=WORK/'submission';folder.mkdir(parents=True,exist_ok=True)
    archive=folder/f'sram512_submission_{summary["source_gds_sha256"][:12]}.zip'
    temp=archive.with_suffix('.tmp')
    with zipfile.ZipFile(temp,'w',zipfile.ZIP_DEFLATED) as z:
        for name,data in sorted(payload.items()):
            z.writestr('submission/'+name,data)
    with zipfile.ZipFile(temp) as z:
        assert z.testzip() is None
        for name,info in manifest['files'].items():
            assert hashlib.sha256(z.read('submission/'+name)).hexdigest()==info['sha256'],name
    temp.replace(archive)
    print(f'Created {output}: {len(payload)} files, {sum(map(len,payload.values())):,} bytes')
    print('ZIP:', archive)
    return output


if __name__ == '__main__':
    build()
