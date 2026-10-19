"""Reject impossible postconditions proved in a saved WP context.

This is a diagnostic control, not a proof that the context is consistent.
Run the ordinary campaign checker first to create its annotated build.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('case', type=Path)
parser.add_argument('--run', required=True)
parser.add_argument('--audit-name', required=True)
parser.add_argument('--prover-bin', type=Path, required=True)
args = parser.parse_args()
case = args.case.resolve()
summary = json.loads((case / 'logs' / (args.run + '-summary.json')).read_text())
unit = Path(summary['source_guard']['annotated']) / 'unit.c'
if not unit.exists():
    raise SystemExit('Replay the case first: annotated unit is missing')
out = case / 'logs' / args.audit_name
out.mkdir()  # Refuse to overwrite historical evidence.
source = out / 'control.c'
source.write_text('#include ' + json.dumps(str(unit)) + '\n'
                  '/*@ assigns \\nothing; ensures \\false; */\n'
                  'void shim_audit_false(void) {}\n'
                  '/*@ assigns \\nothing; ensures \\true; */\n'
                  'void shim_audit_true(void) {}\n')
original = summary.get('actual_command', summary['command'])
# Retain the actual memory/float model and drivers, not kernel inlining.
keys = {'-machdep', '-wp-model', '-wp-driver', '-warn-special-float',
        '-wp-prover', '-wp-timeout', '-wp-memlimit', '-wp-par', '-wp-cache'}
command = [original[0], '-wp', '-wp-fct', 'shim_audit_false,shim_audit_true']
for i, token in enumerate(original[:-1]):
    if token in keys:
        command.extend([token, original[i + 1]])
raw_path = out / 'raw.json'
command.extend(['-wp-report-json', str(raw_path), str(source)])
env = dict(os.environ)
env['PATH'] = str(args.prover_bin.resolve()) + os.pathsep + env['PATH']
run = subprocess.run(command, env=env, capture_output=True, text=True, timeout=180)
(out / 'run.log').write_text(run.stdout + run.stderr)
raw = json.loads(raw_path.read_text()) if raw_path.exists() else []
false = [g for g in raw if g.get('function') == 'shim_audit_false' and g['property'].endswith('_ensures')]
true = [g for g in raw if g.get('function') == 'shim_audit_true' and g['property'].endswith('_ensures')]
rejected = any(g['passed'] for g in false)
record = {'command': command, 'exit': run.returncode,
          'impossible_postcondition_proved': rejected,
          'control_reports_present': len(false) == len(true) == 1,
          'trivial_positive_control_proved': bool(true and true[0]['passed']),
          'diagnostic_only': True,
          'scope': 'A rejected context is unusable; a non-rejection is not a consistency theorem.',
          'checker_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
          'context_summary_sha256': hashlib.sha256((case / 'logs' / (args.run + '-summary.json')).read_bytes()).hexdigest()}
(out / 'summary.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps(record, indent=2))
raise SystemExit(1 if rejected or not record['control_reports_present'] or not record['trivial_positive_control_proved'] else 0)
