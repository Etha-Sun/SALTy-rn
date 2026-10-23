#!/usr/bin/env python3
"""Instrumented finite regression linked to unchanged original kernels and spec.c."""
from pathlib import Path
import argparse
import hashlib
import json
import os
import shutil
import subprocess
import tempfile
import time

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
RUNTIME = CASE / 'shim/runtime'


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def source_audit(overrides=None):
    overrides = overrides or {}
    lock = json.loads((HERE / 'originals.json').read_text())
    expected = {
        'impl/testNEON.c': ('kernels/source/f32-vlrelu.c', '4c8689e540b354176daea7b00a01e854917c738f74ba4a3fcca01f944118e3b6'),
        'impl/testRVV.c': ('kernels/target/f32-vlrelu.c', '682d136f5c7ac833199fcf0e5f9f83f8c169634de72cc55a0effa99676c5516e'),
    }
    if lock['upstream_commit'] != 'be16280c7812a7459c26c3ce82a47339a3d07718':
        raise ValueError('Original source commit changed')
    if {x['copy']: (x['path'], x['sha256']) for x in lock['files']} != expected:
        raise ValueError('Original source identity lock changed')
    results = {}
    for copy, (original, digest) in expected.items():
        source = Path(overrides.get(copy, CASE / copy))
        if sha(source) != digest or sha(ROOT / original) != digest:
            raise ValueError('Original source identity mismatch: ' + copy)
        if source.read_bytes() != (ROOT / original).read_bytes():
            raise ValueError('Original source copy differs: ' + copy)
        results[copy] = digest
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--cc', default='gcc')
    args = parser.parse_args()
    build = CASE / '.build'
    build.mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='native-', dir=build))
    records = []
    status = {
        'passed': False, 'scope': 'Finite native regression only; no kernel proof or hardware execution.',
        'run_directory': str(run), 'records': records,
        'configuration': {'VLEN': 128, 'SEW': 32, 'LMUL': 8, 'VLMAX': 32,
                          'vl_policy': 'min(AVL, 32)', 'rounding': 'RNE', 'gradual_underflow': True},
        'nan_observation': 'Both NaN accepted; all non-NaN values including signed zero checked bitwise.',
        'oracle': 'Independent sign-bit branch; binary64 exact finite product then one binary32 rounding.',
        'sanitizers': ['address', 'undefined'],
        'public_entry': 'spec.c: equivalent(n,input,left,right,params)',
        'formal_correspondence': 'Not established. Runtime arrays are not a proof of the formal scalar-field layout.',
    }

    def execute(command, label, expected=0):
        command = list(map(str, command))
        started = time.monotonic()
        environment = dict(os.environ, ASAN_OPTIONS='detect_leaks=1:halt_on_error=1:abort_on_error=1',
                           UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
        result = subprocess.run(command, cwd=ROOT, env=environment, capture_output=True,
                                text=True, timeout=180)
        output = result.stdout + result.stderr
        log = run / (label + '.log')
        log.write_text(output)
        records.append({'label': label, 'command': command, 'exit_code': result.returncode,
                        'expected_exit_code': expected, 'seconds': time.monotonic() - started,
                        'log': str(log), 'log_sha256': sha(log)})
        if result.returncode != expected:
            raise RuntimeError(label + ' failed: ' + output[-6000:])
        return result.stdout, result.stderr

    try:
        status['original_source_identity'] = source_audit()
        if not (CASE / 'spec.c').is_file():
            raise ValueError('Public spec.c is required; refusing a weaker direct-kernel-only pass')
        files = [CASE / 'spec.c', CASE / 'impl/testNEON.c', CASE / 'impl/testRVV.c',
                 RUNTIME / 'intrinsics.h', RUNTIME / 'harness.c', HERE / 'originals.json',
                 HERE / 'semantics.json', Path(__file__)]
        files += sorted((CASE / 'contracts').rglob('*.h')) if (CASE / 'contracts').exists() else []
        inputs = {str(p.relative_to(CASE)): sha(p) for p in files}
        (run / 'inputs.json').write_text(json.dumps(inputs, indent=2) + '\n')
        # A valid-C comment mutation is enough to violate byte-for-byte identity.
        controls = []
        for name in ('testNEON.c', 'testRVV.c'):
            changed = run / ('mutated-' + name)
            changed.write_bytes((CASE / 'impl' / name).read_bytes() + b'\n/* source identity control */\n')
            try:
                source_audit({'impl/' + name: changed})
            except ValueError as exc:
                controls.append({'source': name, 'rejected': True, 'reason': str(exc)})
            else:
                raise RuntimeError('Source mutation was not rejected')
        status['source_mutation_controls'] = controls
        compiler = shutil.which(args.cc)
        if not compiler:
            raise RuntimeError('Missing compiler: ' + args.cc)
        status['compiler'] = subprocess.check_output([compiler, '--version'], text=True).splitlines()[0]
        sources = [RUNTIME / 'harness.c', CASE / 'spec.c', CASE / 'impl/testNEON.c', CASE / 'impl/testRVV.c']
        flags = ['-std=c11', '-O1', '-g', '-fno-omit-frame-pointer', '-fno-pie', '-no-pie',
                 '-fno-fast-math', '-ffp-contract=off', '-frounding-math',
                 '-fsanitize=address,undefined', '-fno-sanitize-recover=all',
                 '-DQCP_VLRELU_RUNTIME', '-include', RUNTIME / 'intrinsics.h']
        binary = run / 'native'
        execute([compiler, *flags, *sources, '-lm', '-o', binary], 'build')
        stdout, _ = execute([binary], 'check')
        result = json.loads(stdout.strip().splitlines()[-1])
        if not result['passed'] or not result['public_equivalent_checked'] or not result['wrong_result_rejected']:
            raise RuntimeError('Harness did not report required checks')
        status.update(result)
        # The two deliberately wrong sign models agree with each other on +1,
        # slope 0.5, but independent scalar oracle rejects the result.
        mutant = run / 'wrong-model'
        execute([compiler, *flags, '-DVLRELU_WRONG_MODEL', *sources, '-lm', '-o', mutant], 'wrong-model-build')
        _, stderr = execute([mutant, '--model-control'], 'wrong-model-check', expected=1)
        if 'oracle mismatch' not in stderr or 'ERROR: AddressSanitizer' in stderr or 'runtime error:' in stderr:
            raise RuntimeError('Model control did not fail for the intended oracle mismatch')
        status['wrong_model_rejected_by_independent_oracle'] = True
        source_audit()
        if any(sha(CASE / relative) != digest for relative, digest in inputs.items()):
            raise RuntimeError('Native inputs changed during checking')
        status['input_hashes'] = inputs
        status['input_and_params_frame_checked'] = True
        status['output_prefix_suffix_and_inactive_frame_checked'] = True
        status['input_allocation_floats'] = 'exactly n+3; ASan observes its upper allocation boundary'
        status['execution_concurrency'] = 1
        status['passed'] = True
    except Exception as exc:
        status.update(passed=False, failure=str(exc), failure_kind='native_check_failure; not a Coq proof verdict')
        raise
    finally:
        (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
        (HERE / 'native-status.json').write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({k: status[k] for k in ('passed', 'cases', 'active_lanes_per_path', 'primitive_checks', 'run_directory')}))


if __name__ == '__main__':
    main()
