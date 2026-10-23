#!/usr/bin/env python3
"""Regenerate three real C units and check their complete primitive call closure.

This is a primitive capability gate, not a complete VLReLU kernel proof.
The VADD dependency directory must come from a separately recorded fresh replay.
"""
import argparse
from concurrent.futures import ThreadPoolExecutor
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
UNITS = {
    'bits': ('BitsChecked', 'CheckedBits', {
        'qcp_float_bits_at', 'qcp_float_bits',
        'qcp_float_from_bits_at', 'qcp_float_from_bits'}),
    'neon_primitives': ('NeonPrimitives', 'CheckedNeonPrimitives', {
        'qcp_signed32_lane', 'qcp_bitselect', 'vdupq_n_f32', 'vmovq_n_s32',
        'vmulq_f32', 'vreinterpretq_s32_f32', 'vcltq_s32', 'vbslq_f32'}),
    'rvv_primitives': ('RvvPrimitives', 'CheckedRvvPrimitives', {
        'qcp_rvv_signed_bits', 'qcp_rvv_mask_lane', 'qcp_rvv_merge_lane',
        'qcp_rvv_mulf_lane', '__riscv_vfmul_vf_f32m8',
        '__riscv_vreinterpret_v_f32m8_i32m8', '__riscv_vmslt_vx_i32m8_b4',
        '__riscv_vmerge_vvm_f32m8'}),
}


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--dependency-dir', type=Path, required=True)
    parser.add_argument('--jobs', type=int, choices=[1, 2, 3, 4], default=2)
    args = parser.parse_args()
    prlimit = shutil.which('prlimit')
    if not prlimit:
        raise RuntimeError('Linux prlimit is required for per-process memory limits')
    config = json.loads(args.config.read_text())
    dep = args.dependency_dir.resolve()
    run = Path(tempfile.mkdtemp(prefix='primitive-closure-', dir=CASE / '.build'))
    coq = run / 'coq'
    coq.mkdir()
    flags = config['flags'][2:]
    for folder in sorted(dep.iterdir()):
        if folder.is_dir():
            flags += ['-Q', str(folder), '' if folder.name == 'relations' else folder.name]
    flags += ['-Q', str(coq), 'VLRelu']
    records = []
    status = {'passed': False, 'whole_kernel_verified': False,
              'scope': 'three actual C units; new primitive and bit-helper call closure only',
              'run_directory': str(run), 'records': records,
              'dependency_directory': str(dep), 'jobs': args.jobs}
    paths = [CASE / 'shim' / n for n in (
        'bits.c', 'bits.h', 'types.h', 'neon_primitives.c', 'neon_primitives.h',
        'rvv_types.h', 'rvv_primitives.c', 'rvv_frontend.h')]
    modules = ['Model', 'Bits', 'RvvModel', 'RvvFastFrame', 'BitsChecked',
               'NeonPrimitives', 'RvvPrimitiveScalar', 'RvvPrimitiveMul',
               'RvvPrimitiveReinterpret', 'RvvPrimitiveMask',
               'RvvPrimitiveMerge', 'RvvPrimitives']
    paths += [HERE / 'coq' / (n + '.v') for n in modules]
    paths += [Path(__file__), BASE / 'proof/coverage.py']
    source_hashes = {str(p.relative_to(ROOT)): sha(p) for p in paths}

    def execute(command, label, timeout=1200):
        command = [prlimit, '--as=17179869184:17179869184', '--', *map(str, command)]
        start = time.monotonic()
        log = run / (label + '.log')
        work = run / 'jobs' / label
        work.mkdir(parents=True)
        with log.open('w') as output:
            try:
                code = subprocess.run(command, cwd=work, stdout=output,
                                      stderr=subprocess.STDOUT, timeout=timeout).returncode
            except subprocess.TimeoutExpired:
                code = 124
        record = {'command': command, 'label': label, 'exit_code': code,
                  'seconds': time.monotonic() - start, 'log_sha256': sha(log),
                  'cwd': str(work)}
        records.append(record)
        print(label, code, flush=True)
        if code:
            raise RuntimeError(label + ': ' + log.read_text()[-4000:])
        return record

    def compile_module(name):
        return execute(['qcp-env', 'coqc', '-time', *flags, coq / (name + '.v')], name)

    try:
        spec = importlib.util.spec_from_file_location('vadd_coverage', BASE / 'proof/coverage.py')
        coverage = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(coverage)
        # This fixed parser is reused verbatim; return followed by a cast is a
        # C statement, and cannot be a function call.
        coverage.C_KEYWORDS.add('return')
        declarations, definitions, callers, vcs = {}, {}, [], {}
        for stem, (_, _, expected) in UNITS.items():
            expanded = run / (stem + '.c')
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc',
                     CASE / 'shim' / (stem + '.c'), '-o', expanded], stem + '-cpp')
            bodies = set()
            for name, signature, contract, calls in coverage._functions(expanded.read_text(), stem):
                current = signature, contract
                if name in declarations and declarations[name] != current:
                    raise ValueError('C signature/contract mismatch: ' + name)
                declarations[name] = current
                if calls is not None:
                    if name in definitions:
                        raise ValueError('Duplicate C body: ' + name)
                    definitions[name] = stem
                    bodies.add(name)
                    callers.append((name, calls))
            if bodies != expected:
                raise ValueError(stem + ': C body set mismatch: ' + repr(bodies ^ expected))
            command = ['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc',
                       '--no-exec-info', '--input-file=' + str(expanded),
                       '--coq-output-dir=' + str(coq), '--coq-logic-path=VLRelu',
                       '-slp', str(CASE / 'shim'), 'VLRelu']
            execute(command, stem + '-qcp', 300)
            goal = coq / (stem + '_goal.v')
            names = re.findall(r'^Axiom proof_of_(\w+) :', goal.read_text(), re.M)
            if not names or len(names) != len(set(names)):
                raise ValueError('Missing/duplicate fresh VC fields: ' + stem)
            vcs[stem] = names
        external = {callee for _, calls in callers for callee in calls} - definitions.keys()
        if external:
            raise ValueError('C callees without checked body: ' + repr(external))
        public_headers = {}
        for header, wanted in [('neon_primitives.h', UNITS['neon_primitives'][2] -
                               {'qcp_signed32_lane', 'qcp_bitselect'}),
                               ('rvv_frontend.h', {n for n in UNITS['rvv_primitives'][2]
                                                  if n.startswith('__riscv_')})]:
            expanded = run / (header + '.c')
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', CASE / 'shim' / header,
                     '-o', expanded], header + '-cpp')
            found, outside = set(), set()
            for name, signature, contract, _ in coverage._functions(expanded.read_text(), header):
                if name in wanted:
                    if declarations[name] != (signature, contract):
                        raise ValueError('Public header/body signature or contract mismatch: ' + name)
                    found.add(name)
                else:
                    outside.add(name)
            if found != wanted:
                raise ValueError('Missing public primitive declarations: ' + repr(wanted - found))
            public_headers[header] = {'matched': sorted(found),
                                      'outside_this_primitive_gate': sorted(outside),
                                      'cpp_sha256': sha(expanded)}
        status['coverage'] = {'definitions': definitions,
                              'calls': {n: sorted(c) for n, c in callers},
                              'external_c_callees': sorted(external),
                              'public_header_contracts': public_headers,
                              'exact_signature_and_contract_match': True}
        for name in modules:
            path = HERE / 'coq' / (name + '.v')
            if re.search(r'\b(Axiom|Admitted|admit)\b', path.read_text()):
                raise ValueError('Unproved declaration in handwritten module: ' + name)
            shutil.copyfile(path, coq / path.name)
        # All modules are freshly compiled in this single logical namespace.
        for name in ['Model', 'Bits', 'RvvModel', 'RvvFastFrame',
                     'bits_goal', 'neon_primitives_goal', 'rvv_primitives_goal']:
            compile_module(name)
        groups = ['BitsChecked', 'NeonPrimitives', 'RvvPrimitiveScalar',
                  'RvvPrimitiveMul', 'RvvPrimitiveReinterpret',
                  'RvvPrimitiveMask', 'RvvPrimitiveMerge']
        # Inspect every independent result, including failures.
        failures = []
        with ThreadPoolExecutor(max_workers=args.jobs) as pool:
            futures = [(n, pool.submit(compile_module, n)) for n in groups]
            for name, future in futures:
                try:
                    future.result()
                except Exception as error:
                    failures.append(str(error))
        if failures:
            raise RuntimeError('\n'.join(failures))
        compile_module('RvvPrimitives')
        gate = ''
        for stem, (proof, instance, _) in UNITS.items():
            gate += f'From VLRelu Require Import {stem}_goal {proof}.\n'
            gate += f'Module Check_{stem} : {stem}_goal.VC_Correct := {proof}.{instance}.\n'
            gate += '\n'.join(f'Print Assumptions Check_{stem}.proof_of_{n}.' for n in vcs[stem]) + '\n'
        (coq / 'FinalPrimitiveCheck.v').write_text(gate)
        compile_module('FinalPrimitiveCheck')
        for path in paths:
            if sha(path) != source_hashes[str(path.relative_to(ROOT))]:
                raise ValueError('Source changed during run: ' + str(path))
        status.update(passed=True, checked_c_units=len(UNITS),
                      checked_c_vcs=sum(map(len, vcs.values())),
                      vcs_per_unit={s: len(n) for s, n in vcs.items()},
                      vc_correct_passed=True, sources_sha256=source_hashes,
                      fresh_local_coq_modules=len(modules) + len(UNITS) + 1,
                      fresh_goal_sha256={s: sha(coq / (s + '_goal.v')) for s in UNITS},
                      compiled_artifacts_sha256={p.name: sha(p) for p in coq.glob('*.vo')},
                      dependency_artifacts_sha256={str(p.relative_to(dep)): sha(p)
                                                   for p in sorted(dep.rglob('*.vo'))},
                      config_sha256=sha(args.config),
                      tool_sha256={n: sha(Path(shutil.which(n)).resolve())
                                   for n in ['qcp', 'qcp-env', 'coqc', 'gcc', 'prlimit']},
                      inherited_assumptions_log='FinalPrimitiveCheck.log',
                      boundary='QCP C-shim partial correctness; no complete kernel, ISA refinement or termination theorem')
    except Exception as error:
        status['error'] = str(error)
        print(error, flush=True)
    finally:
        (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
        (HERE / 'primitive-closure-status.json').write_text(json.dumps(status, indent=2) + '\n')
        print('RUN', run, flush=True)
    return 0 if status['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
