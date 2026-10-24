#!/usr/bin/env python3
"""Replay the complete packaged proof into a new run; preserve sealed evidence.

Requires the installed QCP/Coq/Flocq environment recorded by this package and a
shared finite-budget runner. A successful result is a fresh local Coq replay,
not a rebuild of the external environment or a formal intrinsic/ISA refinement.
"""
from pathlib import Path
import argparse
import concurrent.futures
import datetime
import hashlib
import json
import re
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--run', required=True)
parser.add_argument('--jobs', type=int, default=32)
parser.add_argument('--budget-runner', type=Path, required=True)
parser.add_argument('--reuse-neon-run', help='explicitly adopt an unchanged completed generation; default regenerates all five units')
args = parser.parse_args()
assert args.jobs == 32 and re.fullmatch(r'[A-Za-z0-9_-]+', args.run)
runner = args.budget_runner.resolve(strict=True)
assert (ROOT / 'proof/final-reports.json').is_file(), 'Complete proof assembly is required before replay'
out = ROOT / '.build' / args.run
out.mkdir(parents=True, exist_ok=False)
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
manifest = ROOT / 'proof/manifest.json'
sealed = json.loads(manifest.read_text()) if manifest.exists() else None
if sealed:
    for item in sealed['files']:
        assert sha(ROOT / item['path']) == item['sha256'], item['path']
    manifest_hash = sha(manifest)

generation_run = args.run + '-generation'
compile_run = args.run + '-compile'
native_run = args.run + '-native'
auxiliary_run = args.run + '-auxiliary'
records = []
started = time.monotonic()


def task(label, command, memory=None, seconds=7200):
    actual = command
    if memory is not None:
        actual = [sys.executable, str(runner), '--out', str(out / (label + '-budget')),
                  '--timeout', str(seconds), '--reserve-gib', str(memory),
                  '--memory-gib', str(memory), '--', *command]
    t = time.monotonic()
    with (out / (label + '.log')).open('w') as log:
        result = subprocess.run(actual, cwd=ROOT, stdout=log, stderr=subprocess.STDOUT)
    return {'stage': label, 'exit': result.returncode, 'seconds': time.monotonic() - t,
            'command': actual, 'log': label + '.log'}


def python(script, *options):
    return [sys.executable, str(ROOT / 'proof' / script), *options]


generation = python('admission_generate.py', '--run', generation_run, '--jobs', '32',
                    '--budget-runner', str(runner))
if args.reuse_neon_run:
    generation += ['--reuse-neon-run', args.reuse_neon_run]
work = [
    ('generation', generation, None, 21660),
    ('compile', python('compile.py', '--run', compile_run, '--jobs', '32',
                       '--budget-runner', str(runner)), None, 7200),
    ('native', python('native.py', '--run', native_run, '--jobs', '32'), 16, 1800),
    ('negative', python('negative.py', '--run', auxiliary_run, '--jobs', '32'), 16, 1800),
    ('environment', python('environment.py', '--run', auxiliary_run), 16, 1800),
    ('dependency-audit', python('dependency_audit.py', '--run', auxiliary_run), 16, 1800),
]
with concurrent.futures.ThreadPoolExecutor(max_workers=32) as pool:
    futures = [pool.submit(task, *row) for row in work]
    for future in concurrent.futures.as_completed(futures):
        row = future.result()
        records.append(row)
        (out / 'progress.json').write_text(json.dumps(records, indent=2) + '\n')
        print(row['stage'], 'exit=' + str(row['exit']), flush=True)

passed = all(r['exit'] == 0 for r in records)
if passed:
    row = task('binding-audit', python('audit.py', '--compile-run', compile_run,
                                    '--generation-run', generation_run), 16, 1800)
    records.append(row)
    passed = row['exit'] == 0
if passed:
    native = json.loads((ROOT / '.build' / native_run / 'result.json').read_text())
    aux = ROOT / '.build' / auxiliary_run
    negative = json.loads((aux / 'negative/result.json').read_text())
    environment = json.loads((aux / 'environment/result.json').read_text())
    dependencies = json.loads((aux / 'dependency-audit/result.json').read_text())
    audit = json.loads((ROOT / '.build' / compile_run / 'audit.json').read_text())
    passed = (native['passed'] and native['inputs_unchanged']
              and native['results']['original']['same'] is False
              and native['results']['repaired']['passed']
              and negative['passed'] and negative['live_inputs_unchanged']
              and dependencies['passed'] and audit['passed']
              and dependencies['sources'] == audit['fresh_local_modules'])
    for hashes in [native['sources'], negative['input_sha256']]:
        passed = passed and all(sha(ROOT / path) == digest for path, digest in hashes.items())
    passed = passed and all(sha(Path(x['path'])) == x['sha256']
                            for x in environment['external_files'] + environment['binaries'])
if sealed:
    passed = passed and sha(manifest) == manifest_hash
    passed = passed and all(sha(ROOT / x['path']) == x['sha256'] for x in sealed['files'])
result = {'passed': passed, 'utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
          'configured_jobs': 32, 'seconds': time.monotonic() - started,
          'compile_run': compile_run, 'generation_run': generation_run,
          'native_run': native_run, 'auxiliary_run': auxiliary_run,
          'sealed_evidence_overwritten': False, 'records': records,
          'boundary': 'source-reviewed intrinsic-spec modular partial correctness; external toolchain inventory, no ISA/ABI or termination theorem'}
(out / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
print({k: v for k, v in result.items() if k != 'records'})
raise SystemExit(not passed)
