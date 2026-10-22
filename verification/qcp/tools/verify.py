#!/usr/bin/env python3
"""Replay the four framework checks; keep local proofs separate from kernel closure."""
import json
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
QCP = ROOT / 'verification/qcp'


def main():
    logs = QCP / 'audit/integration'
    logs.mkdir(parents=True, exist_ok=True)
    checks = []
    steps = [
        ('inventory', QCP / 'tools/inventory.py', ['--check']),
        ('native', QCP / 'tools/check.py', []),
        ('vadd-foundation', QCP / 'experiments/vadd-proof/run.py', []),
        ('nan-bridge', QCP / 'experiments/nan-bridge/run.py', []),
    ]
    for name, script, arguments in steps:
        command = [sys.executable, str(script), *arguments]
        result = subprocess.run(command, cwd=ROOT, capture_output=True, text=True)
        log = logs / (name + '.log')
        log.write_text(result.stdout + result.stderr)
        checks.append({'name': name, 'exit_code': result.returncode,
                       'command': command, 'log': str(log.relative_to(QCP))})
        print(name, 'exit=' + str(result.returncode), flush=True)
    passed = all(check['exit_code'] == 0 for check in checks)
    counts = {}
    if passed:
        catalog = json.loads((QCP / 'catalog.json').read_text())
        native = json.loads((QCP / 'audit/framework-check.json').read_text())
        vadd = json.loads((QCP / 'experiments/vadd-proof/status.json').read_text())
        nan = json.loads((QCP / 'experiments/nan-bridge/status.json').read_text())
        counts = {
            'catalog_pairs': catalog['kernel_count'],
            'vadd_foundation_obligations': vadd['intrinsic_and_block_vcs'] +
                vadd['array_read_vcs'] + vadd['array_strategy_proofs'],
            'nan_bridge_c_vcs': nan['canonical_vcs'],
            'nan_bridge_native_pairs': nan['native']['pairs'],
            'vadd_native_cases': native['native_cases'],
            'vadd_equivalent_calls': native['equivalent_calls'],
        }
    status = {
        'timestamp_utc': datetime.now(timezone.utc).isoformat(),
        'passed': passed, 'checks': checks, 'counts': counts,
        'full_kernel': {'proved': 0, 'total': 40, 'status': '0/40',
                        'scope': 'Original bodies, lowering, actual shim bodies and comparator dependency closure remain unfinished.'},
        'interpretation': 'Passing integration replays inventory, finite native regression and checked local obligations; it does not establish complete kernel correctness.',
    }
    (QCP / 'audit/status.json').write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({'passed': passed, 'counts': counts, 'full_kernel': '0/40'}), flush=True)
    return 0 if passed else 1


if __name__ == '__main__':
    raise SystemExit(main())
