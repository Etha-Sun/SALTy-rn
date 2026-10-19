#!/usr/bin/env python3
"""Root-only serial execution of a prepared immutable dependency replay plan."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import signal
import subprocess
import time

HERE = Path(__file__).resolve().parent
def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def mismatches(files):
    return [p for p, sha in files.items() if not Path(p).is_file() or digest(p) != sha]
def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('run_name')
    parser.add_argument('--only', help='One prepared job identifier; otherwise all serially')
    args = parser.parse_args()
    if not re.fullmatch(r'[a-zA-Z0-9_-]+', args.run_name):
        parser.error('run_name must be a simple new name')
    plan = json.loads((HERE / 'PLAN.json').read_text())
    seal = json.loads((HERE / 'SEAL.json').read_text())
    assert not mismatches(seal), 'Prepared plan/runner changed'
    jobs = [j for j in plan['jobs'] if not args.only or j['id'] == args.only]
    assert jobs, 'Unknown job'
    output = HERE / args.run_name
    output.mkdir(exist_ok=False)
    summary = []
    for job in jobs:
        dest = output / job['id']; dest.mkdir()
        inputs = json.loads(Path(job['inputs_manifest']).read_text())
        before = mismatches(inputs)
        record = {'id': job['id'], 'original_command': job['original_command'],
                  'actual_command': job['actual_command'], 'before_mismatches': before,
                  'inputs_manifest_sha256': digest(job['inputs_manifest']),
                  'accepted': False, 'started_unix': time.time()}
        (dest / 'request.json').write_text(json.dumps(record, indent=2) + '\n')
        if before:
            record['status'] = 'input_changed_not_run'
        else:
            env = os.environ.copy(); env['DEPENDENCY_REPLAY_DIR'] = str(dest)
            started = time.monotonic()
            with (dest / 'run.log').open('wb') as log:
                proc = subprocess.Popen(job['actual_command'], cwd=plan['repository'],
                                        env=env, stdout=log, stderr=subprocess.STDOUT,
                                        start_new_session=True)
                try:
                    code = proc.wait(timeout=job['wall_seconds'])
                    timed_out = False
                except subprocess.TimeoutExpired:
                    os.killpg(proc.pid, signal.SIGKILL)
                    proc.wait(); code = 124; timed_out = True
            text = (dest / 'run.log').read_text(errors='replace')
            verdicts = re.findall(r'Prover result is:\s*([^\n]+)', text)
            goals = sorted(set(re.findall(r"(?:[Gg]oal) ([A-Za-z0-9_]+)'vc", text)))
            after = mismatches(inputs)
            calls = list(dest.glob('call-*'))
            complete_calls = all((c / 'result.json').is_file() for c in calls)
            calls_stable = complete_calls and all(json.loads((c / 'result.json').read_text())['input_unchanged'] for c in calls)
            record.update(exit=code, timed_out=timed_out, seconds=time.monotonic()-started,
                          verdicts=verdicts, goals=goals, after_mismatches=after,
                          prover_calls=len(calls), complete_prover_records=complete_calls,
                          prover_input_unchanged=calls_stable,
                          log_sha256=digest(dest / 'run.log'))
            record['accepted'] = (code == 0 and not after and len(verdicts) == job['expected_valid_leaves']
                                  and all(v.startswith('Valid ') for v in verdicts)
                                  and goals == job['expected_goals'] and calls_stable
                                  and len(calls) == len(verdicts))
        (dest / 'result.json').write_text(json.dumps(record, indent=2) + '\n')
        summary.append(record)
        (output / 'RESULTS.json').write_text(json.dumps(summary, indent=2) + '\n')
        print(job['id'], record['accepted'], flush=True)
    return 0 if all(r['accepted'] for r in summary) else 1
if __name__ == '__main__':
    raise SystemExit(main())
