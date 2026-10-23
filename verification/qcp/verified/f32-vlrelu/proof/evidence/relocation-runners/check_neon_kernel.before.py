#!/usr/bin/env python3
"""Check freshly generated, annotation-only original NEON kernel obligations."""
import argparse
from concurrent.futures import ThreadPoolExecutor
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


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', required=True, type=Path)
    parser.add_argument('--dependency-dir', required=True, type=Path)
    parser.add_argument('--run-dir', type=Path)
    parser.add_argument('--phase', choices=['init', 'vcs', 'aggregate'], default='init')
    parser.add_argument('--jobs', type=int, choices=[1, 2], default=2)
    parser.add_argument('--only', nargs='*')
    args = parser.parse_args()
    generation = json.loads((HERE / 'neon-kernel-generation.json').read_text())
    assert generation['generation_passed']
    assert generation['original_source_sha256'] == sha(CASE / 'impl/testNEON.c')
    assert generation['public_spec_sha256'] == sha(CASE / 'spec.c')
    generated = Path(generation['run_directory'])
    run = args.run_dir.resolve() if args.run_dir else Path(tempfile.mkdtemp(prefix='neon-kernel-proof-', dir=CASE / '.build'))
    coq = run / 'coq'
    coq.mkdir(exist_ok=True)
    cfg = json.loads(args.config.read_text())
    flags = cfg['flags'][2:]
    for p in sorted(args.dependency_dir.resolve().iterdir()):
        if p.is_dir():
            flags += ['-Q', str(p), '' if p.name == 'relations' else p.name]
    flags += ['-Q', str(coq), 'VLRelu']
    records = []
    report = {'passed': False, 'scope': 'original NEON kernel C obligations only; other C units separate',
              'whole_kernel_verified': False, 'generation_directory': str(generated),
              'run_directory': str(run), 'records': records, 'phase': args.phase}

    def execute(cmd, label, timeout=240):
        cwd = run / 'jobs' / label
        cwd.mkdir(parents=True, exist_ok=True)
        command = ['prlimit', '--as=17179869184:17179869184', '--', *map(str, cmd)]
        start = time.monotonic()
        log = run / (label + '.log')
        if log.exists():
            shutil.copyfile(log, run / (label + '.previous-' + str(time.time_ns()) + '.log'))
        with log.open('w') as out:
            try:
                code = subprocess.run(command, cwd=cwd, stdout=out, stderr=out, timeout=timeout).returncode
            except subprocess.TimeoutExpired:
                code = 124
        records.append({'label': label, 'command': command, 'exit_code': code,
                        'seconds': time.monotonic() - start, 'cwd': str(cwd),
                        'source_sha256': sha(Path(cmd[-1])) if str(cmd[-1]).endswith('.v') else None})
        print(label, code, flush=True)
        return code == 0

    def compile(name, timeout=240):
        return execute(['qcp-env', 'coqc', '-time', *flags, coq / (name + '.v')], name, timeout)

    try:
        if args.phase == 'init':
            for name in ['Model', 'Bits', 'RvvModel', 'RvvResult', 'RvvFastFrame', 'NeonResult', 'NeonSelect']:
                shutil.copyfile(HERE / 'coq' / (name + '.v'), coq / (name + '.v'))
                if not compile(name):
                    raise RuntimeError(name + ' failed')
            strategy = Path(shutil.which('qcp')).resolve().parent / 'StrategyCheck'
            if not execute([strategy, '--arch=64', '--endian=little', '--no-exec-info',
                            '--input-file=' + str(HERE / 'c/neon_vlrelu.strategies'),
                            '--coq-output-dir=' + str(coq), '--coq-logic-path=VLRelu'], 'strategy'):
                raise RuntimeError('Strategy generation failed')
            shutil.copyfile(generated / 'neon_unit_goal.v', coq / 'neon_unit_goal.v')
            if not compile('neon_vlrelu_strategy_goal'):
                raise RuntimeError('Strategy goal failed')
            shutil.copyfile(HERE / 'coq/neon_vlrelu_strategy_proof.v', coq / 'neon_vlrelu_strategy_proof.v')
            if not compile('neon_vlrelu_strategy_proof') or not compile('neon_unit_goal'):
                raise RuntimeError('Fresh strategy/kernel goal failed')
            shutil.copyfile(HERE / 'coq/NeonCalls.v', coq / 'NeonCalls.v')
            if not compile('NeonCalls'):
                raise RuntimeError('Shared NEON automation setup failed')
            report['initialized'] = True
        elif args.phase == 'vcs':
            goal = (coq / 'neon_unit_goal.v').read_text()
            assert sha(coq / 'neon_unit_goal.v') == sha(generated / 'neon_unit_goal.v')
            names = re.findall(r'^Axiom proof_of_(\w+) :', goal, re.M)
            assert names and len(names) == len(set(names))
            selected = args.only if args.only else names
            assert set(selected) <= set(names)
            shared = (HERE / 'coq/NeonCalls.v').read_text()
            for name in selected:
                aux = ', ' + name + '_aux' if name + '_aux' in goal and not name.endswith('_pure') else ''
                specific = HERE / 'coq' / ('neon_' + name + '.v')
                source = specific.read_text() if specific.exists() else shared + f'\nLemma proof_of_{name} : {name}.\nProof. unfold {name}{aux}; neon_solve. Qed.\n'
                (coq / ('neon_' + name + '.v')).write_text(source)
            def check(name):
                return name, compile('neon_' + name, 300 if '_entail_' in name or '_return_' in name else 240)
            with ThreadPoolExecutor(max_workers=args.jobs) as pool:
                results = list(pool.map(check, selected))
            report.update(generated_c_vcs=len(names), checked_c_vcs=sum(ok for _, ok in results),
                          passed_vcs=[n for n, ok in results if ok], open_vcs=[n for n, ok in results if not ok])
            report['passed'] = not report['open_vcs']
        else:
            goal = (coq / 'neon_unit_goal.v').read_text()
            names = re.findall(r'^Axiom proof_of_(\w+) :', goal, re.M)
            checked = set()
            for path in run.glob('vcs-status*.json'):
                old = json.loads(path.read_text())
                for record in old.get('records', []):
                    name = record['label'].removeprefix('neon_')
                    source = coq / (record['label'] + '.v')
                    if (record['exit_code'] == 0 and name in names and source.exists()
                            and source.with_suffix('.vo').exists()
                            and record['source_sha256'] == sha(source)):
                        checked.add(name)
            report['diagnostic_fields_with_current_exit_records'] = sorted(checked)
            # The consolidated module rechecks every proof body below. A
            # completed private diagnostic batch is not an admission shortcut.
            shared = (HERE / 'coq/NeonCalls.v').read_text()
            initial = (HERE / 'coq/neon_test_neon_entail_wit_1.v').read_text()
            choices = initial[initial.index('Ltac choose_initial_case'):initial.index('Lemma proof_of_')]
            source = shared + '\n' + choices + '\n'
            source += 'Module CheckedNeonVcs.\n'
            for name in sorted(names, key=lambda n: ('_partial_' not in n, '_safety_' not in n, n)):
                specific = HERE / 'coq' / ('neon_' + name + '.v')
                if specific.exists():
                    leaf = specific.read_text()
                    proof = re.search(r'Lemma proof_of_' + re.escape(name) + r'\b.*?Qed\.', leaf, re.S)
                    if not proof:
                        raise RuntimeError('Missing complete current proof text: ' + name)
                    source += proof.group() + '\n'
                else:
                    aux = ', ' + name + '_aux' if name + '_aux' in goal and not name.endswith('_pure') else ''
                    source += f'Lemma proof_of_{name} : {name}.\nProof. unfold {name}{aux}; neon_solve. Qed.\n'
            source += 'End CheckedNeonVcs.\n'
            (HERE / 'coq/NeonVcs.v').write_text(source)
            source = '''From VLRelu Require Import neon_unit_goal neon_vlrelu_strategy_proof NeonVcs.
Module CheckedOriginalNeon : VLRelu.neon_unit_goal.VC_Correct.
Include neon_bridge_strategy_proof.CheckedNeonBridge.
Include neon_tail_strategy_proof.CheckedNeonTail.
Include float_array_strategy_proof.CheckedFloatArray.
Include CheckedNeonVlreluStrategy.
Include CheckedNeonVcs.
End CheckedOriginalNeon.
'''
            source += '\n'.join('Print Assumptions CheckedOriginalNeon.proof_of_' + n + '.' for n in names) + '\n'
            (HERE / 'coq/NeonChecked.v').write_text(source)
            for name in ['NeonVcs', 'NeonChecked']:
                shutil.copyfile(HERE / 'coq' / (name + '.v'), coq / (name + '.v'))
                if not compile(name, 1800):
                    raise RuntimeError(name + ' aggregate failed')
            report.update(passed=True, vc_correct_passed=True, checked_c_vcs=len(names),
                          checked_module='VLRelu.NeonChecked.CheckedOriginalNeon',
                          generated_goal_sha256=sha(coq / 'neon_unit_goal.v'),
                          original_source_sha256=sha(CASE / 'impl/testNEON.c'),
                          public_spec_sha256=sha(CASE / 'spec.c'))
            (HERE / 'neon-proof-status.json').write_text(json.dumps(report, indent=2) + '\n')
    except Exception as error:
        report['error'] = str(error)
    finally:
        status_path = run / (args.phase + '-status.json')
        if status_path.exists():
            shutil.copyfile(status_path, run / (args.phase + '-status.previous-' + str(time.time_ns()) + '.json'))
        status_path.write_text(json.dumps(report, indent=2) + '\n')
        print('RUN', run, flush=True)
    return 0 if report.get('passed') or args.phase == 'init' and report.get('initialized') else 1


if __name__ == '__main__':
    raise SystemExit(main())
