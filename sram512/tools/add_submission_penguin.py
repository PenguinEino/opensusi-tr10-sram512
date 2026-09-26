#!/usr/bin/env python3
"""Place a small isolated M2 penguin beside the submitted SRAM name art."""
import hashlib
import json
import shutil
import zipfile
from pathlib import Path

import klayout.db as db

from submission_figures import pin_figure
from submission_previews import export_previews


ROOT = Path(__file__).resolve().parents[2]
GDS = ROOT / 'submission/sram512.gds'
MANIFEST = ROOT / 'reviews/submission_manifest.json'
BACKUP = ROOT / 'build/silicon_art/submission_before_penguin.gds'
PIXELS = (
    '00111100',
    '01111110',
    '11111111',
    '11011011',
    '11111111',
    '11000011',
    '11000011',
    '11000011',
    '11100111',
    '01111110',
    '00111100',
    '01100110',
)


def main():
    layout = db.Layout()
    layout.read(str(GDS))
    assert layout.dbu == 0.001
    top = layout.cell('sram512')
    art = layout.cell('sram512_silicon_art')
    assert top is not None and art is not None
    layer = layout.layer(20, 0)
    pitch = 3_000
    x0, y0 = 1_652_000, 282_000
    penguin = db.Region()
    for row, bits in enumerate(PIXELS):
        assert len(bits) == 8
        for col, bit in enumerate(bits):
            if bit == '1':
                x, y = x0 + col * pitch, y0 + (len(PIXELS) - row - 1) * pitch
                penguin.insert(db.Box(x, y, x + pitch, y + pitch))
    penguin.merge()
    assert penguin.bbox() == db.Box(1_652_000, 282_000, 1_676_000, 318_000)

    existing = db.Region(top.begin_shapes_rec(layer))
    existing.merge()
    existing.size(3_000)
    assert (existing & penguin).is_empty(), 'Penguin touches existing M2'
    BACKUP.parent.mkdir(parents=True, exist_ok=True)
    if not BACKUP.exists():
        shutil.copy2(GDS, BACKUP)
    art.shapes(layer).insert(penguin)
    options = db.SaveLayoutOptions()
    options.gds2_write_timestamps = False
    layout.write(str(GDS), options)

    manifest = json.loads(MANIFEST.read_text())
    sha = lambda path: hashlib.sha256(Path(path).read_bytes()).hexdigest()
    digest = sha(GDS)
    manifest['files']['sram512.gds'] = {'bytes': GDS.stat().st_size, 'sha256': digest}
    previews = export_previews(GDS, GDS.parent)
    pins = pin_figure(GDS, GDS.parent)
    manifest['previews']['layout'] = previews['layout']
    manifest['figures']['pins'] = pins
    for name in ('sram512_layout.png', 'sram512_pins.png'):
        path = GDS.parent / name
        manifest['files'][name] = {'bytes': path.stat().st_size, 'sha256': sha(path)}
        target = ROOT / 'build/sram512/submission' / name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(path, target)
    manifest['silicon_art']['penguin'] = {
        'layer': [20, 0], 'bbox_um': [1652.0, 282.0, 1676.0, 318.0],
        'pixel_um': 3, 'minimum_existing_m2_clearance_um': 3,
    }
    manifest['silicon_art']['submitted_gds_sha256'] = digest
    archive = ROOT / 'build/sram512/submission' / f'sram512_submission_{digest[:12]}.zip'
    with zipfile.ZipFile(archive, 'w', zipfile.ZIP_DEFLATED) as bundle:
        for name in sorted(manifest['files']):
            bundle.write(GDS.parent / name, 'submission/' + name)
    manifest['archive'] = {'path': str(archive.relative_to(ROOT)),
                           'sha256': sha(archive), 'bytes': archive.stat().st_size}
    MANIFEST.write_text(json.dumps(manifest, indent=2, ensure_ascii=False) + '\n')
    print(f'{GDS}: {digest}')


if __name__ == '__main__':
    main()
