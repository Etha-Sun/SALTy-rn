#!/usr/bin/env python3
"""Check the pure bridge from two shared-model results to observed equivalence."""
import hashlib
import json
import re
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
QCP = HERE.parents[1]
WORKSPACE = HERE.parents[5]


def main():
    config = json.loads((WORKSPACE / 'research/qcp-shim-vadd/results/coq-flags.json').read_text())
    paths = ['-Q', str(QCP / 'experiments/nan-bridge'), 'NanBridge',
             '-Q', str(QCP / 'shared/vadd'), 'QcpVadd']
    sources = [QCP / 'experiments/nan-bridge/BridgeLogic.v',
               QCP / 'shared/vadd/VaddBits.v', HERE / 'ResultBridge.v']
    records = []
    for source in sources:
        if re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', source.read_text()):
            raise RuntimeError('unchecked source declaration: ' + str(source))
        command = ['qcp-env', 'coqc', *config['flags'][2:], *paths, str(source)]
        result = subprocess.run(command, cwd=config['cwd'], capture_output=True, text=True, timeout=60)
        log = HERE / (source.stem + '.log')
        log.write_text(result.stdout + result.stderr)
        records.append({'source': str(source.relative_to(QCP)),
                        'sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
                        'command': command, 'exit_code': result.returncode, 'log': log.name})
        if result.returncode:
            raise RuntimeError(result.stdout + result.stderr)
    status = {'passed': True, 'pure_lemmas': 3, 'c_vcs': 0,
              'records': records, 'scope': 'If both kernel results equal vadd_values, their lists satisfy Forall2 same_value, including NaNs. Kernel contracts are still to be proved.',
              'full_kernel_proof': False}
    (HERE / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({'passed': True, 'pure_lemmas': 3, 'full_kernel_proof': False}))


if __name__ == '__main__':
    main()
