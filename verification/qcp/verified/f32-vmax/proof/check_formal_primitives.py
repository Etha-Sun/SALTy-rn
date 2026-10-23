#!/usr/bin/env python3
"""Generate real bit/scalar C units and check their ordinary Coq interfaces."""
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
NAMESPACE = 'FMax'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--dependency-dir', type=Path, required=True)
    parser.add_argument('--generate-only', action='store_true')
    args = parser.parse_args()
    (CASE / '.build').mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='formal-primitives-', dir=CASE / '.build'))
    coq = run / 'coq'
    coq.mkdir()
    flags = json.loads(args.config.read_text())['flags'][2:]
    for folder in sorted(args.dependency_dir.resolve().iterdir()):
        if folder.is_dir():
            flags += ['-Q', str(folder), '' if folder.name == 'relations' else folder.name]
    flags += ['-Q', str(coq), NAMESPACE]
    records = []
    status = {'passed': False, 'generation_passed': False, 'whole_kernel_proved': False,
              'scope': 'Actual bit/scalar helper C bodies only; kernels and public wrapper remain separate',
              'run_directory': str(run), 'records': records}

    def execute(command, label, budget=300):
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
                        'exit_code': code, 'seconds': time.monotonic() - start,
                        'log_sha256': sha(log)})
        (run / 'records.json').write_text(json.dumps(records, indent=2) + '\n')
        print(label, code, flush=True)
        if code:
            raise RuntimeError(log.read_text()[-7000:])

    def compile_module(name):
        source = HERE / 'coq' / (name + '.v')
        if source.exists():
            shutil.copyfile(source, coq / source.name)
        execute(['qcp-env', 'coqc', '-time', *flags, coq / (name + '.v')], name)

    try:
        coverage_path = ROOT / 'verification/qcp/verified/f32-vadd/proof/coverage.py'
        module_spec = importlib.util.spec_from_file_location('fixed_c_coverage', coverage_path)
        coverage = importlib.util.module_from_spec(module_spec)
        module_spec.loader.exec_module(coverage)
        coverage.C_KEYWORDS.add('return')
        declarations, definitions, calls, names_per_unit = {}, {}, {}, {}
        for stem in ['bits', 'scalar_primitives']:
            expanded = run / (stem + '.c')
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', CASE / 'shim' / (stem + '.c'),
                     '-o', expanded], stem + '-cpp')
            for name, signature, contract, callees in coverage._functions(expanded.read_text(), stem):
                old = declarations.get(name)
                if old is not None and old != (signature, contract):
                    raise ValueError('Declaration/body mismatch: ' + name)
                declarations[name] = signature, contract
                if callees is not None:
                    if name in definitions:
                        raise ValueError('Duplicate definition: ' + name)
                    definitions[name], calls[name] = stem, sorted(callees)
            execute(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc',
                     '--no-exec-info', '--input-file=' + str(expanded),
                     '--coq-output-dir=' + str(coq), '--coq-logic-path=' + NAMESPACE,
                     '-slp', str(CASE / 'shim'), NAMESPACE], stem + '-qcp', 600)
            goal = coq / (stem + '_goal.v')
            names = re.findall(r'^Axiom proof_of_(\w+) :', goal.read_text(), re.M)
            assert names and len(names) == len(set(names)), 'Fresh VC field mismatch'
            names_per_unit[stem] = names
        external = {n for cs in calls.values() for n in cs} - definitions.keys()
        assert not external, 'C callees without actual bodies: ' + str(external)
        status['coverage'] = {'definitions': definitions, 'calls': calls,
                              'external_c_callees': sorted(external),
                              'exact_signature_and_contract_match': True}
        status['generated_c_vcs'] = {n: len(v) for n, v in names_per_unit.items()}
        for name in ['Bits', 'Model', 'bits_goal', 'BitsChecked', 'scalar_primitives_goal']:
            compile_module(name)
        bits_gate = 'From FMax Require Import bits_goal BitsChecked.\nModule FinalBits : bits_goal.VC_Correct := BitsChecked.CheckedBits.\n'
        bits_gate += '\n'.join('Print Assumptions FinalBits.proof_of_' + n + '.' for n in names_per_unit['bits']) + '\n'
        (coq / 'BitsGate.v').write_text(bits_gate)
        compile_module('BitsGate')
        status.update(generation_passed=True, bits_gate_passed=True, bits_c_vcs_proved=len(names_per_unit['bits']))
        if not args.generate_only:
            compile_module('ScalarChecked')
            gate = 'From FMax Require Import bits_goal BitsChecked scalar_primitives_goal ScalarChecked.\n'
            gate += 'Module FinalBits : bits_goal.VC_Correct := BitsChecked.CheckedBits.\n'
            gate += 'Module FinalScalar : scalar_primitives_goal.VC_Correct := ScalarChecked.CheckedScalar.\n'
            gate += '\n'.join('Print Assumptions FinalScalar.proof_of_' + n + '.' for n in names_per_unit['scalar_primitives']) + '\n'
            (coq / 'FinalPrimitiveCheck.v').write_text(gate)
            compile_module('FinalPrimitiveCheck')
            status.update(passed=True, checked_c_vcs=sum(map(len, names_per_unit.values())),
                          checked_c_units=2, checked_c_functions=len(definitions), vc_correct_passed=True)
        status['goal_sha256'] = {n: sha(coq / (n + '_goal.v')) for n in names_per_unit}
    except Exception as error:
        status['error'] = str(error)
        print(error, flush=True)
    finally:
        sources = [*sorted((CASE / 'shim').glob('bits.*')), CASE / 'shim/formal_model.h',
                   CASE / 'shim/scalar_primitives.c', HERE / 'coq/Bits.v', HERE / 'coq/Model.v',
                   HERE / 'coq/BitsChecked.v', Path(__file__)]
        status['source_sha256'] = {str(p.relative_to(CASE)): sha(p) for p in sources}
        (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
        (HERE / 'formal-primitives-status.json').write_text(json.dumps(status, indent=2) + '\n')
        print('RUN', run, flush=True)
    return 0 if status['passed'] or args.generate_only and status['generation_passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
