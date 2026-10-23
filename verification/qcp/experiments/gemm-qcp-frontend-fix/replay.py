#!/usr/bin/env python3
"""Diagnose the pinned frontend; optional annotation-only full GEMM generation."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import re
import resource
import subprocess
import time

HERE = Path(__file__).resolve().parent
REPRODUCER = HERE.parent / 'gemm-qcp-do-reproducer'


def load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--name', required=True)
    parser.add_argument('--full-gemm', action='store_true')
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9_-]+', args.name):
        parser.error('name must be one directory component')
    out = HERE / '.build' / args.name
    out.mkdir(parents=True, exist_ok=False)
    env = load('environment', HERE.parents[1] / 'tools/environment.py').load_environment()
    (out / 'environment.json').write_text(json.dumps(env, indent=2) + '\n')
    manifest = json.loads((REPRODUCER / 'manifest.json').read_text())
    for name, expected in manifest['inputs'].items():
        assert sha(REPRODUCER / name) == expected, 'Frozen input changed: ' + name
    for name in ['copy.h', 'copy.strategies']:
        assert (HERE / 'input' / name).read_bytes() == (REPRODUCER / 'input' / name).read_bytes()
    results = []
    for source in sorted((HERE / 'regressions').glob('*.c')):
        dest = out / source.stem
        dest.mkdir()
        command = [env['qcp'], '--arch=64', '--endian=little', '--no-exec-info',
                   '--input-file=' + str(source), '--coq-output-dir=' + str(dest),
                   '--coq-logic-path=Diagnostic']
        started = time.monotonic()
        with (dest / 'qcp.log').open('w') as log:
            run = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, timeout=30)
        result = {'source': source.name, 'sha256': sha(source), 'command': command,
                  'exit_code': run.returncode, 'seconds': time.monotonic()-started,
                  'expected_exit': -11 if source.stem == 'for_then_if_k' else 0}
        if source.stem == 'for_if_explicit_cut' and run.returncode == 0:
            goal = dest / 'for_if_explicit_cut_goal.v'
            checked = dest / 'MiniChecked.v'
            proof_text = (HERE / 'MiniChecked.v').read_text()
            assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', proof_text)
            checked.write_text(proof_text)
            names = re.findall(r'^Axiom (proof_of_\w+)', goal.read_text(), re.M)
            assert len(names) == 15
            assumptions = dest / 'Assumptions.v'
            assumptions.write_text('From Diagnostic Require Import MiniChecked.\n' +
                '\n'.join('Print Assumptions VC_Correctness.'+n+'.' for n in names)+'\n')
            for target in [goal, checked, assumptions]:
                with (dest / (target.stem + '.coqc.log')).open('w') as log:
                    subprocess.run([env['coqc'], *env['flags'], '-Q', str(dest), 'Diagnostic', str(target)],
                                   stdout=log, stderr=subprocess.STDOUT, check=True, timeout=180,
                                   cwd=dest, env={**os.environ, 'COQPATH': ''})
            assumption_text = (dest / 'Assumptions.coqc.log').read_text()
            assert not re.search(r'proof_of_|test_(?:safety|entail|return)_wit', assumption_text)
            result['diagnostic_C_VCs_checked'] = len(names)
        results.append(result)
    if args.full_gemm:
        source = HERE / 'neon-original-with-for-exit-cut.c'
        frozen = REPRODUCER / 'input/neon-undef-original-stackcomplete.c'
        identity = load('frozen_replay', REPRODUCER / 'replay.py')
        assert identity.original_tokens(source) == identity.original_tokens(frozen)
        # Enforce the exact one-cut derivation, including unchanged function contract.
        text = frozen.read_text()
        invariant = re.search(r'/\*@ Inv Assert (.*?)\*/', text, re.S).group(1)
        expected = text.replace('    if XNN_UNLIKELY(k != 0) {',
                    '/*@ Assert k<8 && ' + invariant + '*/\n    if XNN_UNLIKELY(k != 0) {')
        expected = expected.replace('#include "shim-undef.h"',
                                    '#include "input/shim.h"')
        assert source.read_text() == expected
        assert (HERE / 'input/shim.h').read_text() == (REPRODUCER / 'input/shim-undef.h').read_text().replace(' GemmNeon.PartialOutput ', ' ')
        dest = out / 'gemm'; dest.mkdir()
        unit, executing = dest / 'neon_full.c', dest / 'executing.c'
        for comments, target in [(True, unit), (False, executing)]:
            subprocess.run(['gcc', '-E', '-P', *(['-CC'] if comments else []), '-nostdinc',
                            str(source), '-o', str(target)], check=True)
        manifest = json.loads((REPRODUCER / 'manifest.json').read_text())
        assert sha(executing) == manifest['executing_CPP_sha256']
        command = [env['qcp'], '--arch=64', '--endian=little', '--no-float-finite-vc',
                   '--no-exec-info', '--no-record-strategies', '--input-file='+str(unit),
                   '--coq-output-dir='+str(dest), '--coq-logic-path=FullDomainNeonRun',
                   '-slp', str(HERE / 'input'), 'GemmNeon', '--strategy-application-limit', '4096']
        with (dest / 'qcp.log').open('w') as log:
            run = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, timeout=900)
        goal = dest / 'neon_full_goal.v'
        results.append({'source': source.name, 'command': command, 'exit_code': run.returncode,
                        'executing_CPP_sha256': sha(executing), 'original_tokens_equal': True,
                        'generated_C_VCs': len(re.findall(r'^Axiom proof_of_', goal.read_text(), re.M)) if goal.exists() else 0,
                        'proved_C_VCs': 0, 'kernel_proved': False, 'ISA_proved': False})
    (out / 'results.json').write_text(json.dumps(results, indent=2)+'\n')
    print(out)
    return int(any(r['exit_code'] != r.get('expected_exit', 0) for r in results))


if __name__ == '__main__':
    raise SystemExit(main())
