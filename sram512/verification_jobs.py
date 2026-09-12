#!/usr/bin/env python3
"""Run the four remaining checks independently of the desktop process.

Only explicit `start` launches work. Completed evidence is never overwritten
by a restart; interrupted directories are preserved. VM restart still stops
ngspice and requires a fresh transient analysis.
"""
import argparse
from datetime import datetime, timezone
from common import *

FOLDER = WORK / 'layout/final16x32_pd10p2'
JOBS = WORK / 'jobs'
POWER = ['--physical-gate-paths', '--power-sheet', '0.1', '--power-mesh-grid', '0.25',
         '--voltage-envelope', '--startup-ramp-ns', '1000', '--period', '5000',
         '--max-step-ns', '20', '--solver', 'klu', '--pivrel', '0.1', '--stream']
CASES = {
    'pd102_decode_coverage': ['postlayout.py', '--decode-coverage', '--solver', 'klu', '--stream'],
    'pd102_operational_hot': ['operational_tests.py', '--solver', 'klu', '--pivrel', '0.1', '--stream'],
    'pd102_power_paths_ramp': ['postlayout.py', '--rc-scale', '1'] + POWER,
    'pd102_pg_rc3_lowhot_corner': ['postlayout.py', '--rc-scale', '3', '--vdd', '4.5',
                                '--temperature', '85', '--addresses', '0'] + POWER,
}


def now():
    return datetime.now(timezone.utc).isoformat()


def state_path(name):
    return JOBS / (name + '.json')


def save(name, state):
    temp = state_path(name).with_suffix('.tmp')
    write_json(temp, state)
    temp.replace(state_path(name))


def running(state):
    if state.get('boot_id') != Path('/proc/sys/kernel/random/boot_id').read_text().strip():
        return False
    if state.get('state') != 'RUNNING':
        return False
    try:
        cmd = Path(f'/proc/{state["pid"]}/cmdline').read_bytes().split(b'\0')
    except FileNotFoundError:
        return False
    return str(Path(__file__).resolve()).encode() in cmd and b'run' in cmd and state['name'].encode() in cmd


def status(name):
    path = state_path(name)
    if not path.exists():
        return dict(name=name, state='NOT_STARTED')
    state = json.loads(path.read_text())
    if state['state'] == 'RUNNING' and not running(state):
        state['state'] = 'INTERRUPTED'
    return state


def execute(name):
    spec = CASES[name]
    command = [sys.executable, str(HERE / spec[0]), str(FOLDER), '--name', name] + spec[1:]
    state = dict(name=name, state='RUNNING', pid=os.getpid(), started_utc=now(),
                 boot_id=Path('/proc/sys/kernel/random/boot_id').read_text().strip(),
                 command=command, source_gds_sha256=sha(FOLDER / 'sram512.gds'))
    save(name, state)
    code = subprocess.call(command, cwd=ROOT, env=ENV)
    report = REPORTS / (name + '.json')
    passed = code == 0 and report.exists() and json.loads(report.read_text()).get('passed') is True
    state.update(state='PASS' if passed else 'FAIL', exit_code=code, finished_utc=now())
    if report.exists():
        state['report_sha256'] = sha(report)
    save(name, state)
    return code if code else (0 if passed else 1)


def start(name):
    if running(status(name)):
        print(name, 'already running')
        return
    work = WORK / 'analog' / name
    report = work / 'result.json'
    if report.exists() and json.loads(report.read_text()).get('passed'):
        raise RuntimeError(f'{name} already has passing evidence; inspect it instead of overwriting.')
    if work.exists():
        suffix = datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%S%fZ')
        work.rename(work.with_name(name + '_interrupted_' + suffix))
    with (JOBS / (name + '.log')).open('w') as log:
        process = subprocess.Popen([sys.executable, str(Path(__file__).resolve()), 'run', name],
            cwd=ROOT, env=ENV, stdin=subprocess.DEVNULL, stdout=log, stderr=subprocess.STDOUT,
            start_new_session=True)
    print(name, 'started', process.pid)


if __name__ == '__main__':
    p = argparse.ArgumentParser()
    p.add_argument('action', choices=['start', 'run', 'status'])
    p.add_argument('names', nargs='*', choices=list(CASES))
    args = p.parse_args()
    JOBS.mkdir(parents=True, exist_ok=True)
    names = args.names or list(CASES)
    if args.action == 'run':
        assert len(names) == 1
        raise SystemExit(execute(names[0]))
    for name in names:
        if args.action == 'start':
            start(name)
        else:
            s = status(name)
            print(name, s['state'], s.get('pid'), s.get('finished_utc', ''))
