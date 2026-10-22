#!/usr/bin/env python3
"""Replay in a fresh copy, leaving the reviewed historical logs untouched."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import time

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
QCP = ROOT / 'verification/qcp'

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--name', required=True)
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9_-]+', args.name):
        parser.error('name must contain only letters, digits, hyphens or underscores')
    out = ROOT / '.build/environment-replay' / args.name
    out.mkdir(parents=True, exist_ok=False)
    tree = out / 'tree'
    tree.mkdir()
    for name in ('kernels', 'verification/qcp'):
        shutil.copytree(ROOT / name, tree / name,
            ignore=shutil.ignore_patterns('.build', '__pycache__', '*.vo', '*.vos',
                                          '*.vok', '*.glob', '.*.aux'))
    git_dir = subprocess.check_output(
        ['git', 'rev-parse', '--absolute-git-dir'], cwd=ROOT, text=True).strip()
    (tree / '.git').write_text('gitdir: ' + git_dir + '\n')
    copied = tree / 'verification/qcp'
    # The source checkout keeps history. Copied old verdicts must not look fresh.
    for folder in ('audit/integration', 'experiments/vadd-proof/kernel-attempt'):
        shutil.rmtree(copied / folder, ignore_errors=True)
    for folder in ('experiments/vadd-proof', 'experiments/nan-bridge'):
        for path in (copied / folder).glob('*.log'):
            path.unlink()
    for name in ('audit/status.json', 'audit/framework-check.json',
                 'experiments/vadd-proof/status.json', 'experiments/vadd-proof/coqc-result.json',
                 'experiments/nan-bridge/status.json'):
        (copied / name).unlink(missing_ok=True)
    manifest = {str(path.relative_to(tree)): sha(path)
                for folder in ('kernels', 'verification/qcp')
                for path in sorted((tree / folder).rglob('*'))
                if path.is_file() and path.suffix in ('.py', '.c', '.h', '.v', '.strategies', '.json')}
    (out / 'input-sha256.json').write_text(json.dumps(manifest, indent=2) + '\n')
    records = []
    environment = {**os.environ, 'PYTHONDONTWRITEBYTECODE': '1'}
    for label, command, budget in (
        ('environment', [sys.executable, 'verification/qcp/tools/environment.py', '--check'], 120),
        ('integration', [sys.executable, 'verification/qcp/tools/verify.py'], 900)):
        start = time.monotonic()
        with (out / (label + '.log')).open('w') as log:
            try:
                code = subprocess.run(command, cwd=tree, env=environment,
                    stdout=log, stderr=subprocess.STDOUT, timeout=budget).returncode
            except subprocess.TimeoutExpired:
                code = 124
        records.append({'name': label, 'command': command, 'exit_code': code,
                        'seconds': round(time.monotonic() - start, 3), 'log': label + '.log'})
        result = {'commands': records, 'isolated_snapshot': True,
                  'historical_logs_preserved': True, 'full_kernel_proved': 0,
                  'full_kernel_total': 40, 'source_input_hashes': 'input-sha256.json'}
        (out / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
        print(label, 'exit=' + str(code), flush=True)
        if code:
            return code
    print(out, flush=True)
    return 0

if __name__ == '__main__':
    raise SystemExit(main())
