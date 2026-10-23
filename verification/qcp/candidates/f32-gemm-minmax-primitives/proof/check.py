#!/usr/bin/env python3
"""Fresh C-body closure for six NEON GEMM intrinsics and exact scalar helpers."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import re
import shutil
import subprocess
import time

CASE = Path(__file__).resolve().parents[1]
QCP = CASE.parents[1]
REPO = QCP.parents[1]

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def write_json(path, data):
    path.write_text(json.dumps(data, indent=2) + '\n')

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--name', required=True)
    parser.add_argument('--native', action='store_true')
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9][A-Za-z0-9_-]*', args.name):
        parser.error('name must be a new single path component')
    manifest = json.loads((CASE / 'proof/manifest.json').read_text())
    sources = {REPO / rel: digest for rel, digest in manifest['sources_sha256'].items()}
    for source, digest in sources.items():
        if sha(source) != digest:
            raise RuntimeError('source identity changed: ' + str(source))
    original = (QCP/'experiments/gemm-qcp-do-reproducer/input/shim-undef.h').read_text()
    neon = (CASE/'src/neon.c').read_text()
    def contract(text, name):
        found = re.search(r'(?:float32x[24]_t|float) '+name+r'\([^\n]*\)\n/\*@.*?\*/', text, re.S)
        if not found:
            raise RuntimeError('missing reviewed contract: '+name)
        return found.group(0)
    for name in manifest['vector_intrinsics']:
        if contract(original,name) != contract(neon,name):
            raise RuntimeError('PR7 vector contract differs: '+name)
    for name in ['qcp_neon_min','qcp_neon_max']:
        if contract((CASE/'src/neon.h').read_text(),name) != contract((CASE/'src/minmax.c').read_text(),name):
            raise RuntimeError('scalar declaration/body contract differs: '+name)
    spec = importlib.util.spec_from_file_location('minmax_environment', QCP / 'tools/environment.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    environment = module.load_environment()
    out = CASE / '.build' / args.name
    out.mkdir(parents=True, exist_ok=False)
    write_json(out / 'environment.json', environment)
    records = []
    started = time.monotonic()
    status = {'passed': False, 'scope': 'six NEON GEMM intrinsic C bodies and exact scalar min/max helpers',
              'whole_gemm_kernel_proved': False, 'vector_intrinsics_proved': [],
              'FMA_body_proved': False, 'ISA_proved': False,
              'project_objects_reused': False, 'external_libraries_reused': True}

    def run(label, command, expected=0):
        command = list(map(str, command))
        begin = time.monotonic()
        with (out / (label + '.log')).open('w') as log:
            result = subprocess.run(command, cwd=out, stdout=log, stderr=subprocess.STDOUT,
                                    env={**os.environ, 'COQPATH': ''}, timeout=3600)
        records.append({'label': label, 'command': command, 'exit': result.returncode,
                        'expected_exit': expected, 'seconds': time.monotonic()-begin,
                        'log_sha256': sha(out / (label + '.log'))})
        write_json(out / 'commands.json', records)
        print(label, result.returncode, flush=True)
        if result.returncode != expected:
            raise RuntimeError(label + ' unexpected exit ' + str(result.returncode))

    try:
        flags = list(environment['flags'])
        for namespace in ['GemmSpec', 'GemmNeon', 'VLRelu', 'Minmax']:
            (out / namespace).mkdir()
            flags += ['-Q', str(out / namespace), namespace]
        for namespace, name, rel in manifest['modules']:
            if rel is not None:
                shutil.copyfile(REPO / rel, out / namespace / (name + '.v'))
        source_files = [('VLRelu', 'VLRelu', QCP / 'verified/f32-vlrelu/shim/bits.c'),
                        ('Minmax', 'Minmax', CASE / 'src/minmax.c'),
                        ('Vector', 'Minmax', CASE / 'src/neon.c')]
        goals = {}
        for unit, namespace, source in source_files:
            run('QCP-' + unit, [environment['qcp'], '--arch=64', '--endian=little',
                '--no-float-finite-vc', '--no-exec-info', '--no-record-strategies',
                '--input-file=' + str(source), '--coq-output-dir=' + str(out / namespace),
                '--coq-logic-path=' + namespace, '-slp', str(CASE/'src'), 'Minmax'])
            goal = out / namespace / (source.stem + '_goal.v')
            goals[unit] = re.findall(r'^Axiom proof_of_(\w+)\s*:', goal.read_text(), re.M)
        run('StrategyCheck', [environment['strategy'], '--arch=64', '--endian=little',
            '--input-file='+str(CASE/'src/neon_copy.strategies'),
            '--coq-output-dir='+str(out/'Minmax'), '--coq-logic-path=Minmax'])
        if {unit:len(names) for unit,names in goals.items()} != {'Minmax':39,'VLRelu':19,'Vector':23}:
            raise RuntimeError('unexpected C VC count')
        for unit, namespace, name in [('Minmax', 'Minmax', 'Checked'), ('VLRelu', 'VLRelu', 'BitsChecked'), ('Vector', 'Minmax', 'VectorChecked')]:
            proof = (out / namespace / (name + '.v')).read_text()
            names = re.findall(r'^Lemma proof_of_(\w+)\s*:', proof, re.M)
            if len(names) != len(set(names)) or set(names) != set(goals[unit]):
                raise RuntimeError('fresh VC/proof field mismatch: ' + namespace)
        for namespace, name, _ in manifest['modules']:
            run(namespace + '.' + name, [environment['coqc'], *flags, out / namespace / (name + '.v')])
        gate = ('From Minmax Require Import minmax_goal Checked neon_goal VectorChecked.\n'
                'From VLRelu Require Import bits_goal BitsChecked.\n'
                'Module ScalarCheck : minmax_goal.VC_Correct := Minmax.Checked.Checked.\n'
                'Module VectorCheck : neon_goal.VC_Correct := VectorChecked.Checked.\n'
                'Module RepresentationCheck : bits_goal.VC_Correct := BitsChecked.CheckedBits.\n')
        for namespace, checked in [('Minmax','ScalarCheck'), ('VLRelu','RepresentationCheck'), ('Vector','VectorCheck')]:
            gate += ''.join('Print Assumptions ' + checked + '.proof_of_' + n + '.\n' for n in goals[namespace])
        gate += 'Print Assumptions VectorCheck.neon_copy_strategy1_correctness.\nPrint Assumptions VectorCheck.neon_copy_strategy2_correctness.\n'
        (out / 'Minmax/Gate.v').write_text(gate)
        run('Gate', [environment['coqc'], *flags, out / 'Minmax/Gate.v'])
        reports = len(re.findall(r'^Axioms:|^Closed under the global context', (out / 'Gate.log').read_text(), re.M))
        if reports != 83:
            raise RuntimeError('missing per-VC assumption report')
        if args.native:
            compiler = environment['dependencies']['gcc']
            common = [compiler, '-O2', '-std=c11', '-Wall', '-Wextra',
                      '-fsanitize=address,undefined', '-fno-sanitize-recover=all', '-fno-omit-frame-pointer']
            helper = QCP / 'verified/f32-vlrelu/shim/bits.c'
            run('native-build', [*common, CASE/'src/minmax.c', CASE/'src/neon.c', helper, CASE/'native.c', '-o', out/'native'])
            run('native-run', [out/'native'])
            status['native_result'] = json.loads((out / 'native-run.log').read_text())
            for label, old, new in [('wrong-zero', 'return -((-a)+(-b));', 'return a+b;'),
                                    ('wrong-nan', '2143289344U', '2139095041U')]:
                bad = (CASE/'src/minmax.c').read_text().replace(old,new)
                bad = bad.replace('../../../verified/f32-vlrelu/shim/bits.h',
                                  str(QCP/'verified/f32-vlrelu/shim/bits.h'))
                bad_source = out / (label + '.c')
                bad_source.write_text(bad)
                run(label+'-build', [*common, bad_source, CASE/'src/neon.c', helper, CASE/'native.c', '-o', out/label])
                run(label+'-rejected', [out/label], expected=1)
                diagnostic = (out/(label+'-rejected.log')).read_text()
                if not diagnostic.startswith('mismatch op=') or re.search(r'AddressSanitizer|UndefinedBehaviorSanitizer|runtime error:', diagnostic):
                    raise RuntimeError('negative control failed for an unintended reason: ' + label)
            status['native_negative_controls_rejected'] = ['wrong signed-zero tie', 'wrong canonical NaN bits']
            status['native_is_formal_proof'] = False
            status['native_ASAN_OPTIONS'] = os.environ.get('ASAN_OPTIONS', '')
        if not all(sha(source) == digest for source,digest in sources.items()):
            raise RuntimeError('source changed during replay')
        status.update(passed=True, scalar_C_VCs=39, reused_representation_C_VCs=19,
                      vector_C_VCs=23, strategies=2, total_C_VCs=81, all_VC_and_strategy_assumptions_reports=reports,
                      contracts_match_PR7=True, vector_intrinsics_proved=manifest['vector_intrinsics'],
                      fresh_project_modules=len(manifest['modules'])+1,
                      source_inputs_unchanged=True)
    except (OSError, RuntimeError, subprocess.SubprocessError, ValueError) as exc:
        status['error'] = str(exc)
    status.update(seconds=time.monotonic()-started, records=records,
                  source_sha256=manifest['sources_sha256'])
    write_json(out/'result.json', status)
    print(out, 'passed', status['passed'], flush=True)
    return 0 if status['passed'] else 1

if __name__ == '__main__':
    raise SystemExit(main())
