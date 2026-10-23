#!/usr/bin/env python3
"""Check actual public helpers/caller; kernel body closure remains separate."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import time

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
BASE = ROOT / 'verification/qcp/verified/f32-vadd'

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--dependency-dir', type=Path, required=True)
    args = parser.parse_args()
    cfg = json.loads(args.config.read_text())
    dep = args.dependency_dir.resolve()
    ds = json.loads((dep.parent / 'status.json').read_text())
    assert ds['passed'] and ds['scope'] == 'full'
    sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
    spec = (CASE / 'spec.c').read_text()
    module = importlib.util.spec_from_file_location('baseline_prepare', BASE / 'proof/prepare.py')
    prepare = importlib.util.module_from_spec(module)
    module.loader.exec_module(prepare)
    names = ['test_neon', 'test_rvv', 'qcp_vadd_read', 'preserve_float', 'check_observation', 'same_lane', 'compare_outputs', 'equivalent']
    functions = {n: prepare.function(spec, n) for n in names}
    preamble = spec[:min(spec.index(f) for f in functions.values())]
    run = Path(tempfile.mkdtemp(prefix='wrapper-', dir=CASE / '.build'))
    coq = run / 'coq'
    coq.mkdir()
    flags = cfg['flags'][2:]
    for p in sorted(dep.iterdir()):
        if p.is_dir():
            flags += ['-Q', str(p), '' if p.name == 'relations' else p.name]
    flags += ['-Q', str(coq), 'VLRelu']
    units = [
        ('read', 'array_read', ['qcp_vadd_read'], ['qcp_vadd_read'], ['float_array']),
        ('bridge', 'bridge', ['preserve_float', 'check_observation', 'same_lane'], ['preserve_float', 'check_observation', 'same_lane'], []),
        ('comparator', 'comparator', ['qcp_vadd_read', 'same_lane', 'compare_outputs'], ['compare_outputs'], ['comparator']),
        ('wrapper', 'wrapper', ['test_neon', 'test_rvv', 'compare_outputs', 'equivalent'], ['equivalent'], ['comparator', 'wrapper']),
    ]
    records = []
    report = {'passed': False, 'scope': 'Public helper/caller C VCs; conditional on both kernel contracts',
              'whole_kernel_verified': False, 'run_directory': str(run), 'records': records,
              'public_spec_sha256': sha(CASE / 'spec.c'), 'actual_units': []}
    def execute(command, label, timeout=180):
        command = list(map(str, command))
        started = time.monotonic()
        with (run / (label + '.log')).open('w') as out:
            result = subprocess.run(command, cwd=run, stdout=out, stderr=subprocess.STDOUT, timeout=timeout)
        records.append({'label': label, 'command': command, 'exit_code': result.returncode,
                        'seconds': time.monotonic() - started})
        print(label, result.returncode, flush=True)
        if result.returncode:
            raise RuntimeError((run / (label + '.log')).read_text()[-3000:])
    slp = []
    for d in sorted((BASE / 'proof/c').iterdir()):
        slp += ['-slp', str(d), d.name]
    try:
        shutil.copyfile(HERE / 'coq/Model.v', coq / 'Model.v')
        execute(['qcp-env', 'coqc', *flags, coq / 'Model.v'], 'Model')
        for namespace, stem, selected, definitions, strategy in units:
            unitdir = run / stem
            unitdir.mkdir()
            folder = coq / namespace
            folder.mkdir()
            logical = 'VLRelu.' + namespace
            source = unitdir / (stem + '.c')
            pieces = [preamble]
            for name in strategy:
                pieces.append('/*@ include strategies "' + name + '.strategies" */')
            for n in selected:
                text = functions[n]
                if n not in definitions:
                    text = prepare.declaration(text)
                elif n == 'compare_outputs':
                    inv = json.loads((BASE / 'proof/c/VaddComparator/comparator.annotations.json').read_text())['compare_outputs'][0]['text']
                    text = text.replace('while (i < n)', inv + '\n  while (i < n)', 1)
                elif n == 'equivalent':
                    assertion = '''/*@ Assert n == (n * sizeof(float))/4 && (n * sizeof(float))%4 == 0 &&
 0 < n * sizeof(float) && n * sizeof(float) <= 18446744073709551603 &&
 n == n@pre && input == input@pre && left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387900 && input != 0 && left != 0 && right != 0 && params != 0 &&
 FloatArray::full(input,n+3,A) * store(&(params->scalar.slope),float,c) *
 FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n) */'''
                    (HERE / 'c/wrapper.annotations.json').write_text(json.dumps({'equivalent': [{'before': 'test_neon(n * sizeof(float)', 'text': assertion}]}, indent=2) + '\n')
                    text = text.replace('test_neon(n * sizeof(float)', assertion + '\n test_neon(n * sizeof(float)', 1)
                assert prepare.tokens(text) == prepare.tokens(functions[n] if n in definitions else prepare.declaration(functions[n])), 'C tokens changed'
                pieces.append(text)
            source.write_text('\n\n'.join(pieces))
            cpp = unitdir / 'expanded.c'
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', source, '-I', CASE, '-o', cpp], stem + '-cpp')
            source.write_bytes(cpp.read_bytes())
            execute(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc', '--no-exec-info',
                     '--input-file=' + str(source), '--coq-output-dir=' + str(folder),
                     '--coq-logic-path=' + logical, *slp], stem + '-qcp', 240)
            goal = folder / (stem + '_goal.v')
            report['actual_units'].append({'namespace': logical, 'goal': str(goal), 'source': str(source),
                'goal_sha256': sha(goal), 'cpp_sha256': sha(cpp),
                'c_vcs': len(re.findall(r'^Axiom proof_of_', goal.read_text(), re.M))})
            execute(['qcp-env', 'coqc', *flags, goal], stem + '-goal')
        print('Generated all public caller/helper goals:', run, flush=True)
        report['generation_passed'] = True
        # Subsequent proof/gates are deliberately separate from generation.
    finally:
        (run / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
        (HERE / 'wrapper-generation.json').write_text(json.dumps(report, indent=2) + '\n')
    return 0

if __name__ == '__main__':
    raise SystemExit(main())
