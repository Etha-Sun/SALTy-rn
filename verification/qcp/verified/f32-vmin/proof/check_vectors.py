#!/usr/bin/env python3
"""Check fixed vector bodies and the same-object readonly comparison adapter."""
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


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--dependency-dir', type=Path, required=True)
    parser.add_argument('--scalar-dir', type=Path, required=True)
    parser.add_argument('--generate-only', action='store_true')
    args = parser.parse_args()
    scalar = args.scalar_dir.resolve()
    scalar_record = json.loads((scalar.parent / 'status.json').read_text())
    assert scalar_record['passed'] and scalar_record['checked_c_vcs'] == 124
    for relative in ['shim/bits.c', 'shim/bits.h', 'shim/formal_model.h',
                     'shim/scalar_primitives.c', 'proof/coq/Bits.v', 'proof/coq/Model.v']:
        assert sha(CASE / relative) == scalar_record['source_sha256'][relative], 'Scalar input drift: ' + relative
    for name in ['Bits.v', 'BitsChecked.v', 'Model.v', 'ScalarChecked.v']:
        assert (HERE / 'coq' / name).read_bytes() == (scalar / name).read_bytes(), 'Checked scalar source mismatch'
    run = Path(tempfile.mkdtemp(prefix='vector-proof-', dir=CASE / '.build'))
    coq = run / 'coq'
    coq.mkdir()
    flags = json.loads(args.config.read_text())['flags'][2:]
    for folder in sorted(args.dependency_dir.resolve().iterdir()):
        if folder.is_dir():
            flags += ['-Q', str(folder), '' if folder.name == 'relations' else folder.name]
    flags += ['-Q', str(scalar), 'FMin', '-Q', str(coq), 'FMin']
    records = []
    status = {'passed': False, 'generation_passed': False, 'whole_kernel_proved': False,
              'scope': 'Fixed vector C bodies and readonly alias comparison only; no complete kernel proof',
              'run_directory': str(run), 'scalar_dependency_directory': str(scalar), 'records': records}

    def execute(command, label, budget=1200):
        command = ['prlimit', '--as=17179869184:17179869184', '--', *map(str, command)]
        work = run / 'jobs' / label
        work.mkdir(parents=True)
        log = run / (label + '.log')
        start = time.monotonic()
        with log.open('w') as output:
            try:
                code = subprocess.run(command, cwd=work, stdout=output,
                                      stderr=subprocess.STDOUT, timeout=budget).returncode
            except subprocess.TimeoutExpired:
                code = 124
        records.append({'command': command, 'cwd': str(work), 'label': label,
                        'exit_code': code, 'seconds': time.monotonic() - start, 'log_sha256': sha(log)})
        (run / 'records.json').write_text(json.dumps(records, indent=2) + '\n')
        print(label, code, flush=True)
        if code:
            raise RuntimeError(log.read_text()[-6000:])

    def compile_module(name):
        source = HERE / 'coq' / (name + '.v')
        if source.exists():
            shutil.copyfile(source, coq / source.name)
        execute(['qcp-env', 'coqc', '-time', *flags, coq / (name + '.v')], name)

    try:
        coverage_path = ROOT / 'verification/qcp/verified/f32-vadd/proof/coverage.py'
        spec = importlib.util.spec_from_file_location('fixed_coverage', coverage_path)
        coverage = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(coverage)
        coverage.C_KEYWORDS.add('return')
        declarations, definitions, calls = {}, {}, {}
        for stem in ['bits', 'scalar_primitives', 'vector_primitives', 'borrow_compare']:
            expanded = run / (stem + '.c')
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', CASE / 'shim' / (stem + '.c'), '-o', expanded], stem + '-cpp', 60)
            for name, signature, contract, callees in coverage._functions(expanded.read_text(), stem):
                if name in declarations and declarations[name] != (signature, contract):
                    raise ValueError('C declaration/body mismatch: ' + name)
                declarations[name] = signature, contract
                if callees is not None:
                    if name in definitions:
                        raise ValueError('Duplicate C definition: ' + name)
                    definitions[name], calls[name] = stem, sorted(callees)
        unbound = {c for cs in calls.values() for c in cs} - definitions.keys()
        assert not unbound, 'Missing C bodies: ' + str(unbound)
        status['coverage'] = {'definitions': definitions, 'calls': calls,
                              'unbound_callees': sorted(unbound), 'exact_signature_and_contract_match': True}
        for name in ['Types', 'VectorModel']:
            compile_module(name)
        vcs = {}
        for stem in ['vector_primitives', 'borrow_compare']:
            execute(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc',
                     '--no-exec-info', '--strategy-application-limit', '1024',
                     '--input-file=' + str(run / (stem + '.c')),
                     '--coq-output-dir=' + str(coq), '--coq-logic-path=FMin',
                     '-slp', str(CASE / 'shim'), 'FMin'], stem + '-qcp')
            vcs[stem] = re.findall(r'^Axiom proof_of_(\w+) :', (coq / (stem + '_goal.v')).read_text(), re.M)
            assert vcs[stem] and len(vcs[stem]) == len(set(vcs[stem]))
        for name in ['vector_primitives_goal', 'borrow_compare_goal']:
            compile_module(name)
        status.update(generation_passed=True, generated_c_vcs={k: len(v) for k, v in vcs.items()})
        if not args.generate_only:
            for name in ['VectorFastFrame', 'VectorScalarChecked', 'VectorNeonChecked',
                         'VectorMinChecked', 'VectorAddChecked', 'VectorMergeChecked',
                         'VectorChecked', 'BorrowChecked']:
                compile_module(name)
            gate = '''From FMin Require Import bits_goal BitsChecked scalar_primitives_goal ScalarChecked vector_primitives_goal VectorChecked borrow_compare_goal BorrowChecked.
Module FinalBits : bits_goal.VC_Correct := BitsChecked.CheckedBits.
Module FinalScalar : scalar_primitives_goal.VC_Correct := ScalarChecked.CheckedScalar.
Module FinalVector : vector_primitives_goal.VC_Correct := VectorChecked.CheckedVector.
Module FinalBorrow : borrow_compare_goal.VC_Correct := BorrowChecked.CheckedBorrow.
'''
            gate += '\n'.join('Print Assumptions FinalVector.proof_of_' + n + '.' for n in vcs['vector_primitives']) + '\n'
            gate += '\n'.join('Print Assumptions FinalBorrow.proof_of_' + n + '.' for n in vcs['borrow_compare']) + '\n'
            (coq / 'FinalVectorCheck.v').write_text(gate)
            compile_module('FinalVectorCheck')
            status.update(passed=True, checked_new_c_units=2, checked_new_c_vcs=sum(map(len, vcs.values())),
                          reused_checked_scalar_and_bit_c_vcs=124, vc_correct_passed=True)
        status['fresh_goal_sha256'] = {s: sha(coq / (s + '_goal.v')) for s in vcs}
    except Exception as error:
        status['error'] = str(error)
        print(error, flush=True)
    finally:
        paths = [CASE / 'shim' / n for n in ['formal_types.h', 'formal_model.h', 'formal_scalar.h',
                 'formal_vector_model.h', 'vector_primitives.c', 'vector_primitives.h',
                 'borrow_compare.c', 'borrow_compare.h']]
        paths += [HERE / 'coq/Types.v', HERE / 'coq/VectorModel.v', Path(__file__)]
        status['sources_sha256'] = {str(p.relative_to(CASE)): sha(p) for p in paths}
        (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
        (HERE / 'vector-status.json').write_text(json.dumps(status, indent=2) + '\n')
        print('RUN', run, flush=True)
    return 0 if status['passed'] or args.generate_only and status['generation_passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
