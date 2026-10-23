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
    run = Path(tempfile.mkdtemp(prefix='chunk-math-', dir=CASE / '.build'))
    coq = run / 'coq'
    coq.mkdir()
    flags = cfg['flags'][2:]
    for folder in sorted(dep.iterdir()):
        if folder.is_dir():
            flags += ['-Q', str(folder), '' if folder.name == 'relations' else folder.name]
    flags += ['-Q', str(coq), 'VCMul']
    records = []
    report = {'passed': False, 'scope': 'Coq arithmetic/list lemmas only; C VC count zero',
              'whole_kernel_verified': False, 'run_directory': str(run), 'records': records}
    try:
        for name in ['Model.v','ComplexModel.v','RvvMemoryModel.v','RvvStoreModel.v','NeonFacts.v','RvvFacts.v']:
            source = HERE / 'coq' / name
            text = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
            assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', text), 'Unproved declaration: ' + name
            shutil.copyfile(source, coq / name)
            command = ['prlimit','--as=17179869184:17179869184','--','qcp-env', 'coqc', '-time', *flags, str(coq / name)]
            start = time.monotonic()
            with (run / (name + '.log')).open('w') as output:
                result = subprocess.run(command, cwd=run, stdout=output, stderr=subprocess.STDOUT, timeout=180)
            records.append({'command': command, 'exit_code': result.returncode,
                            'seconds': time.monotonic() - start,
                            'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest()})
            print(name, result.returncode, flush=True)
            if result.returncode:
                raise RuntimeError((run / (name + '.log')).read_text()[-3000:])
        math_names=[]
        for module_name in ['NeonFacts','RvvFacts']:
            math_names += [(module_name,n)for n in re.findall(r'^Lemma (\w+)',(HERE/'coq'/(module_name+'.v')).read_text(),re.M)]
        assumptions='From VCMul Require Import NeonFacts RvvFacts.\n'+'\n'.join('Print Assumptions '+m+'.'+n+'.'for m,n in math_names)+'\n'
        (coq/'ChunkAssumptions.v').write_text(assumptions)
        command=['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc',*flags,str(coq/'ChunkAssumptions.v')]
        with(run/'ChunkAssumptions.log').open('w')as output:
            result=subprocess.run(command,cwd=run,stdout=output,stderr=subprocess.STDOUT,timeout=300)
        records.append({'command':command,'exit_code':result.returncode,'checked_lemma_count':len(math_names),'log_sha256':hashlib.sha256((run/'ChunkAssumptions.log').read_bytes()).hexdigest()})
        if result.returncode:raise RuntimeError((run/'ChunkAssumptions.log').read_text()[-3000:])
        report.update(checked_lemma_count=len(math_names),config_sha256=hashlib.sha256(args.config.read_bytes()).hexdigest(),dependency_directory=str(dep),dependency_status_sha256=hashlib.sha256((dep.parent/'status.json').read_bytes()).hexdigest(),passed=True)
    finally:
        (run / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
        (HERE / 'chunk-math-status.json').write_text(json.dumps(report, indent=2) + '\n')
    return 0

if __name__ == '__main__':
    raise SystemExit(main())
