#!/usr/bin/env python3
"""Check only the conditional caller, never promote it to a whole-kernel proof."""
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile

HERE = Path(__file__).resolve().parent
QCP = HERE.parents[1]
WORKSPACE = HERE.parents[5]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    build = HERE / '.build'
    build.mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='checked-', dir=build))
    records = []

    def execute(command, label, cwd=None):
        result = subprocess.run(list(map(str, command)), cwd=cwd, capture_output=True,
                                text=True, timeout=90)
        log = run / (label + '.log')
        log.write_text(result.stdout + result.stderr)
        records.append({'command': list(map(str, command)), 'exit_code': result.returncode,
                        'log': log.name, 'log_sha256': sha(log)})
        if result.returncode:
            raise RuntimeError(log.read_text()[-3000:])

    execute([sys.executable, HERE / 'generate.py'], 'generate')
    qcp = ['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc',
           '--input-file=' + str(HERE / 'wrapper.c'), '--coq-output-dir=' + str(run),
           '--coq-logic-path=VaddWrapper', '-slp', QCP / 'experiments/vadd-comparator',
           'VaddComparator', '-slp', HERE, 'VaddWrapper', '--no-exec-info']
    execute(qcp, 'qcp')
    strategy = WORKSPACE / '.local/qcp/QCP-V2.1.4/linux-binary/StrategyCheck'
    execute([strategy, '--arch=64', '--endian=little', '--input-file=' + str(HERE / 'wrapper.strategies'),
             '--coq-output-dir=' + str(run), '--coq-logic-path=VaddWrapper', '--no-exec-info'], 'strategy')
    for name in ('wrapper_goal.v', 'wrapper_strategy_goal.v'):
        if (run / name).read_bytes() != (HERE / name).read_bytes():
            raise RuntimeError('Generated goal drift: ' + name)
    mutant = run / 'mutant.c'
    text = (HERE / 'wrapper.c').read_text().replace(
        '#include "wrapper_def.h"', '#include "' + str(HERE / 'wrapper_def.h') + '"')
    text = text.replace('return compare_outputs(n, left, right);',
                        'compare_outputs(n, left, right); return 0;')
    mutant.write_text(text)
    command = [('--input-file=' + str(mutant)) if str(arg).startswith('--input-file=') else arg for arg in qcp]
    result = subprocess.run(list(map(str, command)), capture_output=True, text=True, timeout=30)
    log = run / 'mutant.log'
    log.write_text(result.stdout + result.stderr)
    if result.returncode == 0 or '0 == 1' not in result.stderr:
        raise RuntimeError('Bad return was not rejected by the public postcondition')
    records.append({'command': list(map(str, command)), 'exit_code': result.returncode,
                    'expected_rejection': True, 'log': log.name, 'log_sha256': sha(log)})
    groups = [
        ('QcpVadd', QCP / 'shared/vadd', ['VaddBits.v']),
        ('NanBridge', HERE.parent / 'nan-bridge', ['BridgeLogic.v', 'ListBridge.v']),
        ('VaddComparator', HERE.parent / 'vadd-comparator',
         ['ComparatorLogic.v', 'comparator_strategy_goal.v', 'comparator_strategy_proof.v']),
        ('', HERE.parent / 'vadd-relations', ['ResultBridge.v']),
        ('VaddWrapper', HERE, ['WrapperLogic.v', 'wrapper_strategy_goal.v',
                             'wrapper_strategy_proof.v', 'wrapper_goal.v', 'wrapper_checked.v']),
    ]
    config = json.loads((WORKSPACE / 'research/qcp-shim-vadd/results/coq-flags.json').read_text())
    flags = config['flags'][2:]
    sources = []
    for namespace, directory, names in groups:
        target = run / (namespace or 'relations')
        target.mkdir()
        flags += ['-Q', str(target), namespace]
        for name in names:
            path = directory / name
            if not name.endswith('_goal.v') and re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', path.read_text()):
                raise RuntimeError('Unchecked declaration: ' + str(path))
            shutil.copyfile(path, target / name)
            sources.append((path, target / name))
    for source, copied in sources:
        execute(['qcp-env', 'coqc', *flags, copied], source.stem + '-coqc', config['cwd'])
    logs = HERE / 'logs'
    logs.mkdir(exist_ok=True)
    for record in records:
        shutil.copyfile(run / record['log'], logs / record['log'])
        record['log'] = 'logs/' + record['log']
    status = {
        'conditional_caller_passed': True, 'caller_c_vcs': 9, 'new_strategies': 1,
        'negative_control': 'return0 rejected against unchanged public Ensure return1',
        'commands': records, 'source_sha256': {str(p.relative_to(QCP)): sha(p) for p, _ in sources},
        'caller_input_sha256': {p.name: sha(p) for p in [HERE / 'wrapper.c', HERE / 'generate.py', HERE / 'wrapper.strategies']},
        'dependencies': {'test_neon_body': 'pending', 'test_rvv_body': 'pending',
                         'compare_outputs_body': 'separate vadd-comparator replay; not replayed here',
                         'original_to_helper_and_struct_adapter': 'pending'},
        'full_kernel_proof': False,
        'scope': 'Only the caller VCs under explicit callee contracts. Neither kernel body is checked by this runner.',
    }
    (HERE / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({'conditional_caller_passed': True, 'caller_c_vcs': 9, 'full_kernel_proof': False}))


if __name__ == '__main__':
    main()
