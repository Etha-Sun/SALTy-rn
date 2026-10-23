#!/usr/bin/env python3
"""Finish an interrupted local primitive build after explicit certificate rechecks.

This only accepts source-identical artifacts from a named interrupted run. It
regenerates C/VC inputs and checks every retained local certificate with coqchk;
external dependency certificates are loaded, not recursively rechecked.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
from artifact_paths import artifact_path
import re
import shutil
import subprocess
import time

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
BASE = ROOT / 'verification/qcp/verified/f32-vadd'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--dependency-dir', type=Path, required=True)
    parser.add_argument('--run-dir', type=Path, required=True)
    args = parser.parse_args()
    run = artifact_path(args.run_dir).resolve()
    if run.parent != CASE / '.build' or (run / 'status.json').exists():
        raise ValueError('Expected an unfinished local run; completed records must remain unchanged')
    coq = run / 'coq'
    audit = run / 'resume-input-audit'
    audit.mkdir()
    generated = audit / 'goals'
    generated.mkdir()
    records = []
    report = {'passed': False, 'whole_kernel_verified': False,
              'run_directory': str(run), 'scope': 'Primitive C-body call closure only; resumed interrupted local build',
              'records': records, 'external_dependencies_recursively_rechecked': False}
    cfg = json.loads(args.config.read_text())
    dep = args.dependency_dir.resolve()
    flags = cfg['flags'][2:]
    for folder in sorted(dep.iterdir()):
        if folder.is_dir():
            flags += ['-Q', str(folder), '' if folder.name == 'relations' else folder.name]
    flags += ['-Q', str(coq), 'VLRelu']
    checker_flags = [f for f in flags if f != '-q']
    modules = ['Model', 'Bits', 'RvvModel', 'RvvFastFrame', 'bits_goal',
               'neon_primitives_goal', 'rvv_primitives_goal', 'BitsChecked',
               'NeonPrimitives', 'RvvPrimitiveScalar', 'RvvPrimitiveMul',
               'RvvPrimitiveReinterpret', 'RvvPrimitiveMask', 'RvvPrimitiveMerge']
    units = {'bits': ('BitsChecked', 'CheckedBits', 19),
             'neon_primitives': ('NeonPrimitives', 'CheckedNeonPrimitives', 61),
             'rvv_primitives': ('RvvPrimitives', 'CheckedRvvPrimitives', 347)}
    inputs = [CASE / 'shim' / n for n in ['bits.c', 'bits.h', 'types.h',
              'neon_primitives.c', 'neon_primitives.h', 'rvv_types.h',
              'rvv_primitives.c', 'rvv_frontend.h']]
    inputs += [HERE / 'coq' / (n + '.v') for n in modules if not n.endswith('_goal')]
    inputs += [HERE / 'coq/RvvPrimitives.v', Path(__file__), HERE / 'check_primitive_closure.py']
    source_hashes = {str(p.relative_to(ROOT)): sha(p) for p in inputs}

    def execute(command, label, timeout=300):
        command = ['prlimit', '--as=17179869184:17179869184', '--', *map(str, command)]
        work = audit / label
        work.mkdir()
        log = run / (label + '.log')
        start = time.monotonic()
        with log.open('w') as out:
            try:
                code = subprocess.run(command, cwd=work, stdout=out, stderr=out,
                                      timeout=timeout).returncode
            except subprocess.TimeoutExpired:
                code = 124
        record = {'label': label, 'command': command, 'cwd': str(work),
                  'exit_code': code, 'seconds': time.monotonic() - start,
                  'log_sha256': sha(log)}
        records.append(record)
        (run / 'resume-records.json').write_text(json.dumps(report, indent=2) + '\n')
        print(label, code, flush=True)
        if code:
            raise RuntimeError(label + ': ' + log.read_text()[-4000:])

    try:
        retained = {}
        for name in modules:
            source = coq / (name + '.v')
            artifact = coq / (name + '.vo')
            if not source.is_file() or not artifact.is_file():
                raise ValueError('Missing interrupted-run artifact: ' + name)
            if not name.endswith('_goal') and source.read_bytes() != (HERE / 'coq' / source.name).read_bytes():
                raise ValueError('Retained source differs from live reviewed source: ' + name)
            retained[name] = {'source_sha256': sha(source), 'artifact_sha256': sha(artifact)}
        report['retained_local_artifacts'] = retained
        spec = importlib.util.spec_from_file_location('coverage', BASE / 'proof/coverage.py')
        coverage = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(coverage)
        coverage.C_KEYWORDS.add('return')
        declarations, definitions, calls = {}, {}, {}
        names = {}
        for stem, (_, _, expected_vcs) in units.items():
            expanded = audit / (stem + '.c')
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', CASE / 'shim' / (stem + '.c'),
                     '-o', expanded], 'resume-cpp-' + stem)
            if expanded.read_bytes() != (run / expanded.name).read_bytes():
                raise ValueError('Actual C input changed since interrupted run: ' + stem)
            for name, signature, contract, callees in coverage._functions(expanded.read_text(), stem):
                item = signature, contract
                if name in declarations and declarations[name] != item:
                    raise ValueError('C signature/contract mismatch: ' + name)
                declarations[name] = item
                if callees is not None:
                    if name in definitions:
                        raise ValueError('Duplicate C definition: ' + name)
                    definitions[name] = stem
                    calls[name] = sorted(callees)
            execute(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc',
                     '--no-exec-info', '--input-file=' + str(expanded),
                     '--coq-output-dir=' + str(generated), '--coq-logic-path=VLRelu',
                     '-slp', str(CASE / 'shim'), 'VLRelu'], 'resume-qcp-' + stem)
            goal = generated / (stem + '_goal.v')
            if goal.read_bytes() != (coq / goal.name).read_bytes():
                raise ValueError('Fresh VC target differs from retained target: ' + stem)
            names[stem] = re.findall(r'^Axiom proof_of_(\w+) :', goal.read_text(), re.M)
            if len(names[stem]) != expected_vcs or len(set(names[stem])) != expected_vcs:
                raise ValueError('Unexpected fresh interface field set: ' + stem)
        if len(definitions) != 20:
            raise ValueError('Expected exactly twenty primitive/helper C bodies')
        external = set(c for cs in calls.values() for c in cs) - definitions.keys()
        if external or set(declarations) - definitions.keys():
            raise ValueError('C call/declaration closure incomplete')
        header_records = {}
        for header in ['neon_primitives.h', 'rvv_frontend.h']:
            expanded = audit / (header + '.c')
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', CASE / 'shim' / header,
                     '-o', expanded], 'resume-header-' + header)
            if expanded.read_bytes() != (run / expanded.name).read_bytes():
                raise ValueError('Public consumer header changed since audited build: ' + header)
            matched = []
            for name, signature, contract, _ in coverage._functions(expanded.read_text(), header):
                if name in declarations:
                    if declarations[name] != (signature, contract):
                        raise ValueError('Consumer declaration/body mismatch: ' + name)
                    matched.append(name)
            header_records[header] = sorted(matched)
        report['coverage'] = {'definitions': definitions, 'calls': calls,
                              'external_c_callees': [], 'public_header_matches': header_records,
                              'exact_signature_and_contract_match': True}
        # -norec itself names a checked root. Repeating it as a positional root
        # would request recursive checking of external dependencies as well.
        for name in modules:
            execute(['coqchk', '-silent', *checker_flags, '-norec', 'VLRelu.' + name],
                    'resume-coqchk-' + name, 600)
        shutil.copyfile(HERE / 'coq/RvvPrimitives.v', coq / 'RvvPrimitives.v')
        execute(['qcp-env', 'coqc', '-time', *flags, coq / 'RvvPrimitives.v'], 'RvvPrimitives')
        gate = ''
        for stem, (proof, instance, _) in units.items():
            gate += f'From VLRelu Require Import {stem}_goal {proof}.\n'
            gate += f'Module Check_{stem} : {stem}_goal.VC_Correct := {proof}.{instance}.\n'
            gate += '\n'.join(f'Print Assumptions Check_{stem}.proof_of_{n}.' for n in names[stem]) + '\n'
        (coq / 'FinalPrimitiveCheck.v').write_text(gate)
        execute(['qcp-env', 'coqc', '-time', *flags, coq / 'FinalPrimitiveCheck.v'],
                'FinalPrimitiveCheck', 1200)
        for p in inputs:
            if sha(p) != source_hashes[str(p.relative_to(ROOT))]:
                raise ValueError('Input changed during resumed check: ' + str(p))
        report.update(passed=True, checked_c_units=3, checked_c_vcs=427,
                      vcs_per_unit={s: len(n) for s, n in names.items()},
                      vc_correct_passed=True, fresh_local_coq_modules=16,
                      resumed_after_user_interruption=True,
                      completed_before_interruption_modules_rechecked_with_coqchk=14,
                      ordinary_coqc_modules_compiled_after_resume=2,
                      compile_provenance='Fourteen modules were freshly built in this named run before interruption; all retained local certificates rechecked individually. Two remaining modules freshly compiled after resume. Lost parent-process exit metadata is not reconstructed.',
                      sources_sha256=source_hashes,
                      fresh_goal_sha256={s: sha(generated / (s + '_goal.v')) for s in units},
                      compiled_artifacts_sha256={p.name: sha(p) for p in coq.glob('*.vo')},
                      dependency_artifacts_sha256={str(p.relative_to(dep)): sha(p) for p in dep.rglob('*.vo')},
                      tool_sha256={n: sha(Path(shutil.which(n)).resolve()) for n in ['qcp', 'coqc', 'coqchk', 'qcp-env', 'gcc', 'prlimit']},
                      inherited_assumptions_log='FinalPrimitiveCheck.log',
                      boundary='No complete kernel, ISA refinement or termination theorem')
    except Exception as error:
        report['error'] = str(error)
        print(error, flush=True)
    finally:
        (run / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
        (HERE / 'primitive-closure-status.json').write_text(json.dumps(report, indent=2) + '\n')
    return 0 if report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
