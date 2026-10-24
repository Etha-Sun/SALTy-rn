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
p.add_argument('--source-dir', default='proof/coq/IGemmRvvAuto')
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
flags += ['-Q', str(O / 'support'), 'IGemmSupport',
          '-Q', str(O / 'proofs'), 'IGemmRvvAuto']
(O / 'support').mkdir()
(O / 'proofs').mkdir()
files = [T / 'proof/coq/IGemmSupport/IGemmFacts.v']
files += sorted((T / a.source_dir).glob('*.v'))
inputs = {str(f.relative_to(T)): sha(f) for f in files}
for f in files:
    dest = O / ('support' if f.name == 'IGemmFacts.v' else 'proofs') / f.name
    shutil.copy2(f, dest)
(O / 'inputs.json').write_text(json.dumps(inputs, indent=2) + '\n')
(O / 'flags.json').write_text(json.dumps(flags, indent=2) + '\n')
(O / 'base.json').write_text(json.dumps({
    'run': a.base_run, 'result_sha256': sha(B / 'result.json'),
    'manifest_sha256': sha(B / 'manifest.json'), 'configured_jobs': 32,
    'runner_sha256': sha(Path(__file__)), 'source_dir': a.source_dir,
    'scope': 'incremental field diagnosis; complete fresh admission still required'
}, indent=2) + '\n')

def check(f):
    start = time.monotonic()
    dest = O / ('support' if f.name == 'IGemmFacts.v' else 'proofs') / f.name
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
with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs) as pool:
    futures = [pool.submit(check, f) for f in files[1:]]
    for future in concurrent.futures.as_completed(futures):
        records.append(future.result())
        passed = sum(r['exit'] == 0 for r in records[1:])
        failed = sum(r['exit'] != 0 for r in records[1:])
        progress = {'passed_fields': passed, 'failed_fields': failed,
                    'total_fields': len(files)-1, 'seconds': time.monotonic()-start}
        (O / 'progress.json').write_text(json.dumps(progress, indent=2) + '\n')
        (O / 'records.json').write_text(json.dumps(records, indent=2) + '\n')
unchanged = all(sha(T/f) == h for f, h in inputs.items())
result = dict(progress, inputs_unchanged=unchanged, configured_jobs=32,
              passed=failed == 0 and unchanged, whole_kernel_proved=False)
(O / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
print(result, flush=True)
raise SystemExit(not result['passed'])
