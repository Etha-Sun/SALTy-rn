#!/usr/bin/env python3
"""Replay the original RVV control flow in QCP and compile its separate proof modules."""
import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
OLD = Path('/zp_vegeta/scratch_sb/ycsun/verus')
CONFIG = OLD / 'research/qcp-shim-vadd/results/coq-flags.json'
SHARED = HERE.parents[1] / 'shared/vadd'
RELATIONS = HERE.parent / 'vadd-relations'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    build, logs = HERE / '.build/loop-replay', HERE / 'loop-logs'
    build.mkdir(parents=True, exist_ok=True)
    logs.mkdir(exist_ok=True)
    state = {'passed': False, 'rvv_body_proved': False, 'generated_vcs': 42,
             'kernel_vcs': 37, 'helper_vcs': 5, 'loop_strategies_proved': 0,
             'chunk_vcs': 9, 'chunk_proved': False, 'checked_vcs': 0, 'cross_isa_equivalence_proved': False, 'commands': []}
    covered = set()

    def run(command, name, timeout=60):
        log = logs / (name + '.log')
        with log.open('w') as out:
            try:
                result = subprocess.run(list(map(str, command)), cwd=HERE, stdout=out,
                                        stderr=subprocess.STDOUT, timeout=timeout)
                code = result.returncode
            except subprocess.TimeoutExpired:
                code = 'timeout'
        state['commands'].append({'command': list(map(str, command)), 'exit_code': code,
                                  'log': str(log.relative_to(HERE)), 'log_sha256': sha(log)})
        print(name, code, flush=True)
        if code:
            raise RuntimeError(name + ' failed: ' + str(code))

    def coqc(name):
        source = HERE / name
        if not name.endswith('_goal.v'):
            code = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
            if re.search(r'\b(?:Admitted|admit|Abort|Axiom|Parameter)\b', code):
                raise RuntimeError('Unchecked declaration: ' + name)
        flags = json.loads(CONFIG.read_text())['flags'][2:]
        run(['qcp-env', 'coqc', *flags, '-Q', SHARED, 'QcpVadd', '-Q', HERE, 'QcpRvv32',
             '-Q', RELATIONS, '', source], source.stem)
        if name in ['rvv_loop_pure_checked.v', 'rvv_loop_calls_checked.v', 'rvv_loop_memory_checked.v']:
            covered.update(re.findall(r'Lemma proof_of_(\w+)\s*:', source.read_text()))
            state['checked_vcs'] = len(covered)

    try:
        primitive = json.loads((HERE / 'status.json').read_text())
        if not all(primitive.get(key) for key in ['passed', 'load_proved', 'add_proved', 'store_proved']):
            raise RuntimeError('First replay the primitive package with run.py --add --store')
        for name, digest in primitive['source_sha256'].items():
            if sha(HERE / name) != digest:
                raise RuntimeError('Primitive input changed: ' + name)
        state['primitive_status_sha256'] = sha(HERE / 'status.json')
        run([sys.executable, HERE / 'generate_contracts.py'], 'contracts')
        run([sys.executable, HERE / 'generate_loop.py'], 'generate')
        run(['gcc', '-E', '-P', '-CC', '-nostdinc', HERE / 'rvv_loop.c', '-o',
             build / 'rvv_loop_unit.c'], 'preprocess')
        run(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc',
             '--input-file=' + str(build / 'rvv_loop_unit.c'), '--coq-output-dir=' + str(build),
             '--coq-logic-path=QcpRvv32', '-slp', HERE, 'QcpRvv32', '--no-exec-info'], 'qcp', 40)
        run([OLD / '.local/qcp/QCP-V2.1.4/linux-binary/StrategyCheck', '--arch=64',
             '--endian=little', '--input-file=' + str(HERE / 'rvv_loop.strategies'),
             '--coq-output-dir=' + str(build), '--coq-logic-path=QcpRvv32', '--no-exec-info'], 'strategy')
        run(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc',
             '--input-file=' + str(HERE / 'rvv_chunk.c'), '--coq-output-dir=' + str(build),
             '--coq-logic-path=QcpRvv32', '-slp', HERE, 'QcpRvv32', '--no-exec-info'], 'chunk-qcp', 20)
        for name in ['rvv_loop_unit_goal.v', 'rvv_loop_strategy_goal.v', 'rvv_chunk_goal.v']:
            if (build / name).read_bytes() != (HERE / name).read_bytes():
                raise RuntimeError('Fresh goal differs: ' + name)
        for name in ['RvvLayout.v', 'FastFrame.v', 'RvvLoopMemory.v', 'RvvLoopResult.v', 'RvvLoopModel.v', 'rvv_loop_strategy_goal.v',
                     'rvv_loop_strategy_proof.v', 'rvv_loop_unit_goal.v',
                     'rvv_loop_pure_checked.v', 'rvv_loop_memory_checked.v',
                     'rvv_loop_calls_checked.v', 'rvv_loop_checked.v']:
            coqc(name)
            if name == 'rvv_loop_strategy_proof.v':
                state['loop_strategies_proved'] = 2
        state['rvv_body_proved'] = True
        for name in ['rvv_chunk_goal.v', 'rvv_chunk_checked.v']:
            coqc(name)
        state.update(passed=True, chunk_proved=True)
    except (RuntimeError, OSError) as exc:
        state['error'] = str(exc)
    names = ['generate_contracts.py', 'generate_loop.py', 'run_loop.py', 'primitive_contracts.h',
             'rvv_loop.c', 'rvv_loop_def.h', 'rvv_loop.strategies', 'rvv_loop_strategy_goal.v',
             'rvv_loop_strategy_proof.v', 'rvv_loop_unit_goal.v', 'RvvLayout.v', 'RvvLoopModel.v',
             'RvvLoopMemory.v', 'RvvLoopResult.v', 'RvvResultBridge.v',
             'rvv_loop_pure_checked.v', 'rvv_loop_memory_checked.v', 'rvv_loop_calls_checked.v',
             'rvv_loop_checked.v', 'FastFrame.v', 'rvv_chunk.c', 'rvv_chunk_goal.v', 'rvv_chunk_checked.v']
    state['source_sha256'] = {name: sha(HERE / name) for name in names if (HERE / name).exists()}
    state['source_identity'] = json.loads((HERE / 'loop-source.json').read_text())
    state['scope'] = 'Partial correctness of the QCP C representation of the original RVV kernel control flow; primitive contracts are bound to the checked body package. Generic lowering, termination and ISA correspondence are separate boundaries.'
    (HERE / 'loop-status.json').write_text(json.dumps(state, indent=2) + '\n')
    print(json.dumps({k: state[k] for k in ['passed', 'checked_vcs', 'rvv_body_proved']}))
    return 0 if state['passed'] else 1

if __name__ == '__main__':
    raise SystemExit(main())
