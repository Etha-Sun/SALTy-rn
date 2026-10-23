#!/usr/bin/env python3
"""Freshly check only the candidate's arithmetic/list lemmas, not C bodies."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import time

HERE = Path(__file__).resolve().parent
CASE = HERE.parent

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--dependency-dir', type=Path, required=True)
    args = parser.parse_args()
    cfg = json.loads(args.config.read_text())
    dep = args.dependency_dir.resolve()
    status = json.loads((dep.parent / 'status.json').read_text())
    assert status['passed'] and status['scope'] == 'full', 'A completed fresh dependency replay is required'
    run = Path(tempfile.mkdtemp(prefix='math-', dir=CASE / '.build'))
    coq = run / 'coq'
    coq.mkdir()
    flags = cfg['flags'][2:]
    for folder in sorted(dep.iterdir()):
        if folder.is_dir():
            flags += ['-Q', str(folder), '' if folder.name == 'relations' else folder.name]
    flags += ['-Q', str(coq), 'VLRelu']
    records = []
    report = {'passed': False, 'scope': 'Coq arithmetic/list lemmas only; C VC count zero',
              'whole_kernel_verified': False, 'run_directory': str(run), 'records': records}
    try:
        for name in ['Model.v', 'RvvModel.v', 'RvvResult.v', 'NeonResult.v']:
            source = HERE / 'coq' / name
            text = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
            assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', text), 'Unproved declaration: ' + name
            shutil.copyfile(source, coq / name)
            command = ['qcp-env', 'coqc', *flags, str(coq / name)]
            start = time.monotonic()
            with (run / (name + '.log')).open('w') as output:
                result = subprocess.run(command, cwd=run, stdout=output, stderr=subprocess.STDOUT, timeout=180)
            records.append({'command': command, 'exit_code': result.returncode,
                            'seconds': time.monotonic() - start,
                            'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest()})
            print(name, result.returncode, flush=True)
            if result.returncode:
                raise RuntimeError((run / (name + '.log')).read_text()[-3000:])
        report['passed'] = True
    finally:
        (run / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
        (HERE / 'math-status.json').write_text(json.dumps(report, indent=2) + '\n')
    return 0

if __name__ == '__main__':
    raise SystemExit(main())
