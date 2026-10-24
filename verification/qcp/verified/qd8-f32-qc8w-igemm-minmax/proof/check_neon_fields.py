#!/usr/bin/env python3
"""Exploratory independent fields against an identified, checked dependency run.

This is incremental diagnosis, not fresh full admission. Failures do not prevent
other independent obligations from being checked. Final admission recompiles the
complete source closure and instantiates the full freshly generated interface.
"""
from pathlib import Path
import argparse, concurrent.futures, hashlib, json, shutil, subprocess, time

T = Path(__file__).resolve().parents[1]
p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--run', required=True)
p.add_argument('--base-run', required=True)
p.add_argument('--goal-run', help='Reuse an exact-source checked NEON goal for incremental diagnosis only')
p.add_argument('--source-dir', default='proof/coq/IGemmNeonAuto')
p.add_argument('--jobs', type=int, default=32)
p.add_argument('--budget-runner', type=Path, required=True)
a = p.parse_args()
assert a.jobs == 32
sha = lambda f: hashlib.sha256(f.read_bytes()).hexdigest()
B = T / '.build' / a.base_run / 'compile'
status = json.loads((B / 'result.json').read_text())
assert status['passed'] and status['inputs_unchanged']
manifest = json.loads((B / 'manifest.json').read_text())
for m in manifest['modules']:
    assert sha(T / m['path']) == sha(B / m['path']) == m['sha256'], m['path']
    assert (B / m['path']).with_suffix('.vo').is_file()
O = T / '.build' / a.run / 'fields'
O.mkdir(parents=True, exist_ok=False)
flags = json.loads((B / 'flags.json').read_text())
goal_base = None
if a.goal_run:
    goal_base = T / '.build' / a.goal_run / 'fields'
    prior = json.loads((goal_base / 'result.json').read_text())
    assert prior['inputs_unchanged']
    prior_base = json.loads((goal_base / 'base.json').read_text())
    assert prior_base['manifest_sha256'] == sha(B / 'manifest.json')
    goal_record = next(r for r in json.loads((goal_base / 'records.json').read_text())
                       if r['source'] == 'proof/coq/IGemmNeon/neon_goal.v')
    assert goal_record['exit'] == 0
    assert sha(goal_base / 'goal/neon_goal.v') == sha(T / goal_record['source']) == goal_record['sha256']
    assert (goal_base / 'goal/neon_goal.vo').is_file()
flags += ['-Q', str(O / 'support'), 'IGemmSupport',
          '-Q', str(O / 'proofs'), 'IGemmNeonAuto',
          '-Q', str((goal_base or O) / 'goal'), 'IGemmNeon']
(O / 'goal').mkdir()
(O / 'support').mkdir()
(O / 'proofs').mkdir()
files = [T / 'proof/coq/IGemmSupport/IGemmFacts.v', T / 'proof/coq/IGemmNeon/neon_goal.v']
files += sorted((T / a.source_dir).glob('*.v'))
inputs = {str(f.relative_to(T)): sha(f) for f in files}
for f in files:
    dest = O / ('support' if f.name == 'IGemmFacts.v' else 'goal' if f.name == 'neon_goal.v' else 'proofs') / f.name
    shutil.copy2(f, dest)
(O / 'inputs.json').write_text(json.dumps(inputs, indent=2) + '\n')
(O / 'flags.json').write_text(json.dumps(flags, indent=2) + '\n')
(O / 'base.json').write_text(json.dumps({
    'run': a.base_run, 'result_sha256': sha(B / 'result.json'),
    'manifest_sha256': sha(B / 'manifest.json'), 'configured_jobs': 32,
    'runner_sha256': sha(Path(__file__)), 'source_dir': a.source_dir,
    'goal_reuse': {'run': a.goal_run, 'goal_sha256': sha(goal_base / 'goal/neon_goal.v'),
                  'vo_sha256': sha(goal_base / 'goal/neon_goal.vo')} if goal_base else None,
    'scope': 'incremental field diagnosis; complete fresh admission still required'
}, indent=2) + '\n')

def check(f):
    start = time.monotonic()
    dest = O / ('support' if f.name == 'IGemmFacts.v' else 'goal' if f.name == 'neon_goal.v' else 'proofs') / f.name
    command = ['python3', str(a.budget_runner), '--out', str(dest.with_suffix('.budget')),
               '--timeout', '7230', '--reserve-gib', '16', '--memory-gib', '16', '--',
               '/usr/bin/prlimit', '--as=17179869184', '--cpu=7200', '--',
               '/tmp/qcp-coq820-install/bin/coqc', *flags, str(dest)]
    with dest.with_suffix('.log').open('w') as out:
        rc = subprocess.run(command, stdout=out, stderr=subprocess.STDOUT, cwd=O).returncode
    return {'source': str(f.relative_to(T)), 'exit': rc,
            'seconds': round(time.monotonic()-start, 3), 'sha256': sha(dest)}

start = time.monotonic()
records = [check(files[0])]
assert records[0]['exit'] == 0, 'support failed; inspect its log'
records.append(dict(goal_record, reused_exact_goal_from=a.goal_run) if goal_base else check(files[1]))
assert records[1]['exit'] == 0, 'fresh full NEON goal compilation failed'
with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs) as pool:
    futures = [pool.submit(check, f) for f in files[2:]]
    for future in concurrent.futures.as_completed(futures):
        records.append(future.result())
        passed = sum(r['exit'] == 0 for r in records[2:])
        failed = sum(r['exit'] != 0 for r in records[2:])
        progress = {'passed_fields': passed, 'failed_fields': failed,
                    'total_fields': len(files)-2, 'seconds': time.monotonic()-start}
        (O / 'progress.json').write_text(json.dumps(progress, indent=2) + '\n')
        (O / 'records.json').write_text(json.dumps(records, indent=2) + '\n')
unchanged = all(sha(T/f) == h for f, h in inputs.items())
result = dict(progress, inputs_unchanged=unchanged, configured_jobs=32,
              passed=failed == 0 and unchanged, whole_kernel_proved=False)
(O / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
print(result, flush=True)
raise SystemExit(not result['passed'])
