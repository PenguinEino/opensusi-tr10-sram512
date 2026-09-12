#!/usr/bin/env python3
"""Index the current candidate's evidence; missing/failed tests stay visible.

This does not run verification or certify fabrication. Run the documented
checks first. The summary records report hashes and the source snapshot.
"""
from datetime import datetime, timezone
from common import *

REQUIRED = [
    ('saved_layout_recheck', 'Current schematic / drawing DRC / strict LVS / full mask DRC', True),
    ('pcell_preservation', 'Original PCell geometry preservation', True),
    ('digital', 'All 512 addresses, March C-, all reset phases', False),
    ('pd102_decode_coverage', 'Extracted MOS: every row and column, both data', True),
    ('pd102_rc3_low_hot_5us', 'Extracted signal RC x3, 4.5 V, 85 C, 16 accesses', True),
    ('pd102_timestep_5_default_20_accurate', 'Write-transition numerical convergence', True),
    ('pd102_startup_5n', 'Supply ramp with physical signal and power networks', True),
    ('pd102_startup_1n', 'Finer-step supply ramp, all MOS voltages and vias', True),
    ('pd102_power_paths_ramp', 'Power ramp followed by 16 accesses, signal and supply R/C', True),
    ('pd102_pg_rc3_lowhot_corner', 'Combined supply network and RC x3 at 4.5 V / 85 C', True),
    ('pd102_operational_hot', '20 us supply ramp, 1 ms retention and asynchronous interruptions', True),
] + [
    ('analog_pd102_' + n, 'Schematic MOS sensitivity: ' + n, False)
    for n in ('nominal', 'low_cold', 'low_hot', 'high_cold', 'high_hot',
              'wire_3x', 'wire_1p_hot', 'vth_slow_n_fast_p', 'vth_fast_n_slow_p')
]


def source_files():
    todo = [ROOT / 'sram512_macro.sch', ROOT / 'sram512_tb.sch']
    seen, files = set(), {ROOT / 'sram512_macro.sym'}
    while todo:
        p = todo.pop()
        if p in seen:
            continue
        seen.add(p)
        files.add(p)
        for symbol in re.findall(r'^C \{([^}]+)\}', p.read_text(), re.M):
            q = ROOT / symbol
            if q.is_file():
                files.add(q)
                if q.with_suffix('.sch').is_file():
                    todo.append(q.with_suffix('.sch'))
    files.update(ROOT / n for n in ('rtl/sram_serial_controller.v', 'rtl/sram512_digital_gates.v',
        'tb/tb_sram512.sv', 'klayout/sram_pcell/build.py', 'pdk/profiles.lock.json'))
    return {str(p.relative_to(ROOT)):sha(p) for p in sorted(files)}


def source_gds(result):
    for key in ('gds_sha256', 'source_gds_sha256', 'drawing_sha256'):
        if key in result:
            return result[key]
    for key in ('physical_extraction', 'source'):
        if isinstance(result.get(key), dict):
            answer = source_gds(result[key])
            if answer:
                return answer


def main():
    digest = sha(HERE / 'layout/sram512.gds')
    rows = []
    for name, purpose, physical in REQUIRED:
        path = REPORTS / (name + '.json')
        row = dict(test=name, purpose=purpose, report=str(path.relative_to(ROOT)), state='PENDING')
        if path.is_file():
            r = json.loads(path.read_text())
            matches = not physical or source_gds(r) == digest
            row.update(state='PASS' if r.get('passed') and matches else 'FAIL',
                       report_sha256=sha(path), source_matches=matches,
                       checks=r.get('checks'), failure_count=r.get('failure_count', 0))
        rows.append(row)
    result = dict(all_required_reports_pass=all(r['state'] == 'PASS' for r in rows),
        created_utc=datetime.now(timezone.utc).isoformat(), source_gds_sha256=digest,
        source_mask_sha256=sha(HERE / 'layout/sram512_mask.gds'), source_snapshot=source_files(),
        pdk=provenance('dev'), tests=rows,
        scope='Evidence index for this source snapshot, not a replacement for fresh verification. RC coefficients and global Vth shifts are uncalibrated sensitivity tests; pad/frame integration and statistical yield qualification are outside this core verification.')
    write_json(REPORTS / 'validation_summary.json', result)
    print('\n'.join(f'{r["state"]:7} {r["test"]}' for r in rows))
    print('All required reports pass:', result['all_required_reports_pass'])
    return result


if __name__ == '__main__':
    main()
