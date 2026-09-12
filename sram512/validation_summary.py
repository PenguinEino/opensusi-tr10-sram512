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
    ('signalfix_decode_coverage', 'Extracted MOS: every row and column, both data', True),
    ('signalfix_startup_5n', 'Supply ramp with physical signal and power networks', True),
    ('signalfix_startup_1n', 'Finer-step supply ramp, all MOS voltages and vias', True),
    ('signalfix_startup_comparison', 'Startup time-step comparison on the current GDS', True),
    ('signalfix_mesh4_prefix', 'All physical gate taps and voltages in first complete access', True),
    ('signalfix_mesh8_prefix', 'Finer spatial RC model of first complete access', True),
    ('signalfix_signal_resolution', 'Spatial RC resolution: both circuits PASS and peaks agree', True),
    ('signalfix_power_paths_ramp', 'Power ramp followed by 16 accesses, signal and supply R/C', True),
    ('signalfix_pg_rc3_lowhot', 'Combined supply and RC x3, 4.5 V / 85 C, all four corners, 16 accesses', True),
    ('signalfix_operational_hot', '20 us supply ramp, 1 ms retention and asynchronous interruptions', True),
] + [
    ('analog_pd102_' + n, 'Schematic MOS sensitivity: ' + n, False)
    for n in ('nominal', 'low_cold', 'low_hot', 'high_cold', 'high_hot',
              'wire_3x', 'wire_1p_hot', 'vth_slow_n_fast_p', 'vth_fast_n_slow_p')
]

REQUIRED_OPERATIONS = {
    'signalfix_decode_coverage':136,
    'signalfix_power_paths_ramp':16,
    'signalfix_pg_rc3_lowhot':16,
    'signalfix_operational_hot':28,
    'signalfix_mesh4_prefix':1,
    'signalfix_mesh8_prefix':1,
    **{'analog_pd102_'+n:16 for n in ('nominal','low_cold','low_hot','high_cold','high_hot',
        'wire_3x','wire_1p_hot','vth_slow_n_fast_p','vth_fast_n_slow_p')},
}

REQUIRE_SIGNAL_MESH = {'signalfix_power_paths_ramp', 'signalfix_pg_rc3_lowhot',
                      'signalfix_mesh4_prefix','signalfix_mesh8_prefix'}
KNOWN_SIGNAL_DIAGNOSTICS = ('pd102_signal_mesh4_prefix', 'pd102_signal_mesh8_prefix')


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
            complete = name not in REQUIRED_OPERATIONS or r.get('operations') == REQUIRED_OPERATIONS[name]
            detailed = name not in REQUIRE_SIGNAL_MESH or (
                r.get('signal_mesh') is True and r.get('physical_gate_paths') is True
                and r.get('signal_sections',0)>=4)
            row.update(state='PASS' if r.get('passed') and matches and complete and detailed else 'FAIL',
                       report_sha256=sha(path), source_matches=matches,
                       required_operations=REQUIRED_OPERATIONS.get(name), scope_complete=complete,
                       required_signal_model_present=detailed,
                       checks=r.get('checks'), failure_count=r.get('failure_count', 0))
        rows.append(row)
    blocking = []
    for name in KNOWN_SIGNAL_DIAGNOSTICS:
        path = REPORTS/(name+'.json')
        if not path.exists():continue
        report = json.loads(path.read_text())
        if source_gds(report)==digest and not report.get('passed',False):
            blocking.append(dict(test=name,report_sha256=sha(path),
                                 failure_count=report.get('failure_count'),
                                 reason='Reproduced signal margin / terminal voltage failure on this GDS.'))
    result = dict(all_required_reports_pass=all(r['state'] == 'PASS' for r in rows) and not blocking,
        created_utc=datetime.now(timezone.utc).isoformat(), source_gds_sha256=digest,
        source_mask_sha256=sha(HERE / 'layout/sram512_mask.gds'), source_snapshot=source_files(),
        pdk=provenance('dev'), tests=rows, blocking_signal_diagnostics=blocking,
        scope='Evidence index for this source snapshot, not a replacement for fresh verification. RC coefficients and global Vth shifts are uncalibrated sensitivity tests; pad/frame integration and statistical yield qualification are outside this core verification.')
    write_json(REPORTS / 'validation_summary.json', result)
    print('\n'.join(f'{r["state"]:7} {r["test"]}' for r in rows))
    for r in blocking:print('FAIL    '+r['test']+' (release blocker)')
    print('All required reports pass:', result['all_required_reports_pass'])
    return result


if __name__ == '__main__':
    main()
