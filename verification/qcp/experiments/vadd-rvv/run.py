#!/usr/bin/env python3
"""Replay checked RVV32 load and optional full add / VL-prefix store proofs."""
import argparse
import hashlib
import json
import re
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

HERE = Path(__file__).resolve().parent
SHARED = HERE.parents[1] / 'shared/vadd'
RELATIONS = HERE.parent / 'vadd-relations'
OLD = Path('/zp_vegeta/scratch_sb/ycsun/verus')
CONFIG = OLD / 'research/qcp-shim-vadd/results/coq-flags.json'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def checked_inputs(add=False, store=False):
    names = ['generate.py', 'native_check.py', 'types.h', 'RvvLogic.v',
             'rvv_array_def.h', 'rvv_arrays.strategies', 'rvv_arrays_strategy_goal.v',
             'rvv_arrays_strategy_proof.v', 'rvv_load.c', 'rvv_load_goal.v', 'rvv_load_checked.v']
    if add:
        names += ['rvv_add.c', 'rvv_add_goal.v', 'rvv_add_checked.v']
    if store:
        names += ['generate_store.py', 'native_store_check.py', 'RvvStoreModel.v',
                  'RvvResultBridge.v', 'rvv_store_def.h', 'rvv_store.strategies',
                  'rvv_store_strategy_goal.v', 'rvv_store_strategy_proof.v',
                  'rvv_store.c', 'rvv_store_goal.v', 'rvv_store_checked.v']
    return [HERE / name for name in names]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--add', action='store_true', help='Also require the 101-VC full add module')
    parser.add_argument('--store', action='store_true', help='Also require the 75-VC prefix store module')
    args = parser.parse_args()
    build = HERE / '.build/replay'
    build.mkdir(parents=True, exist_ok=True)
    logs = HERE / 'logs'
    logs.mkdir(exist_ok=True)
    commands = []
    state = {'passed': False, 'load_proved': False, 'load_c_vcs': 100,
             'array_strategies_proved': 0, 'add_requested': args.add, 'add_proved': False,
             'store_requested': args.store, 'store_proved': False, 'full_kernel_proved': False}

    def run(command, name, timeout=240):
        result = subprocess.run(list(map(str, command)), cwd=HERE, capture_output=True,
                                text=True, timeout=timeout)
        log = logs / (name + '.log')
        log.write_text(result.stdout + result.stderr)
        commands.append({'command': list(map(str, command)), 'exit_code': result.returncode,
                         'log': str(log.relative_to(HERE)), 'log_sha256': sha(log)})
        print(name, result.returncode, flush=True)
        if result.returncode:
            raise RuntimeError(name + ' failed')

    def check_goal(path):
        if path.read_bytes() != (HERE / path.name).read_bytes():
            raise RuntimeError('Fresh VC differs from checked goal: ' + path.name)

    config = json.loads(CONFIG.read_text())
    def coqc(name):
        source = HERE / name
        if name not in ['rvv_load_goal.v', 'rvv_add_goal.v', 'rvv_arrays_strategy_goal.v',
                        'rvv_store_goal.v', 'rvv_store_strategy_goal.v']:
            code = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
            if re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', code):
                raise RuntimeError('Unchecked declaration in ' + name)
        run(['qcp-env', 'coqc', *config['flags'][2:], '-Q', SHARED, 'QcpVadd',
             '-Q', HERE, 'QcpRvv32', '-Q', RELATIONS, '', source], source.stem + '-coqc')

    try:
        run([sys.executable, HERE / 'generate.py'], 'generate')
        if args.store:
            run([sys.executable, HERE / 'generate_store.py'], 'generate-store')
        run([OLD / '.local/qcp/QCP-V2.1.4/linux-binary/StrategyCheck', '--arch=64',
             '--endian=little', '--input-file=' + str(HERE / 'rvv_arrays.strategies'),
             '--coq-output-dir=' + str(build), '--coq-logic-path=QcpRvv32', '--no-exec-info'], 'strategy')
        check_goal(build / 'rvv_arrays_strategy_goal.v')
        if args.store:
            run([OLD / '.local/qcp/QCP-V2.1.4/linux-binary/StrategyCheck', '--arch=64',
                 '--endian=little', '--input-file=' + str(HERE / 'rvv_store.strategies'),
                 '--coq-output-dir=' + str(build), '--coq-logic-path=QcpRvv32', '--no-exec-info'], 'store-strategy')
            check_goal(build / 'rvv_store_strategy_goal.v')
        for kind in ['load', *(['add'] if args.add else []), *(['store'] if args.store else [])]:
            run(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc',
                 '--input-file=' + str(HERE / ('rvv_' + kind + '.c')),
                 '--coq-output-dir=' + str(build), '--coq-logic-path=QcpRvv32',
                 '-slp', HERE, 'QcpRvv32', '--no-exec-info'], kind + '-qcp')
            check_goal(build / ('rvv_' + kind + '_goal.v'))
        for name in ['RvvLogic.v', 'rvv_arrays_strategy_goal.v', 'rvv_arrays_strategy_proof.v']:
            coqc(name)
        state['array_strategies_proved'] = 3
        for name in ['rvv_load_goal.v', 'rvv_load_checked.v']:
            coqc(name)
        state['load_proved'] = True
        if args.add:
            for name in ['rvv_add_goal.v', 'rvv_add_checked.v']:
                coqc(name)
            state['add_proved'] = True
            state['add_c_vcs'] = 101
        if args.store:
            for name in ['RvvStoreModel.v', 'rvv_store_strategy_goal.v',
                         'rvv_store_strategy_proof.v', 'rvv_store_goal.v', 'rvv_store_checked.v',
                         'RvvResultBridge.v']:
                coqc(name)
            state['store_proved'] = True
            state['store_c_vcs'] = 75
            state['store_strategies_proved'] = 5
            state['result_bridge_proved'] = True
            state['result_bridge_dependency_sha256'] = sha(RELATIONS / 'VaddSegments.v')
            run([sys.executable, HERE / 'native_store_check.py'], 'native-store')
            state['native_store'] = json.loads((HERE / 'native-store-result.json').read_text())
        run([sys.executable, HERE / 'native_check.py'], 'native')
        state['native'] = json.loads((HERE / 'native-result.json').read_text())
        state['passed'] = True
    except (RuntimeError, subprocess.TimeoutExpired) as exc:
        state['error'] = type(exc).__name__ + ': ' + str(exc)[:200]
    state.update({'timestamp_utc': datetime.now(timezone.utc).isoformat(), 'commands': commands,
                  'source_sha256': {p.name: sha(p) for p in checked_inputs(args.add, args.store)},
                  'scope': 'Actual QCP-representation primitive C bodies; generic lowering, ISA correspondence and complete kernel remain unfinished.',
                  'limits': ['Load requires only VL readable cells and owns all 32 output fields.',
                             'VL is any integer from 0 through 32; no finite-only float restriction.',
                             'Store requires only VL writable cells; full kernel integration remains pending.',
                             'Print Assumptions retains QCP model parameters and standard Coq/Flocq assumptions.']})
    (HERE / 'status.json').write_text(json.dumps(state, indent=2) + '\n')
    print(json.dumps({k: state[k] for k in ['passed', 'load_proved', 'add_proved', 'store_proved']}))
    return 0 if state['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
