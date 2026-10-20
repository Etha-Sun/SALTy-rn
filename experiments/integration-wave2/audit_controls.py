"""Independently reject inconclusive model controls; never admit a kernel."""
import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent
ERRORS = re.compile(
    r'Why3 Error|Invalid_argument|Type mismatch|unbound variable|'
    r'\[kernel:annot-error\]|Frama-C aborted|\[kernel\] User Error')


def inspect(attempt):
    log = attempt / 'logs/verify01-model-control.log'
    report = attempt / 'logs/verify01-model-control.json'
    text = log.read_text(errors='replace') if log.exists() else ''
    rows = json.loads(report.read_text()) if report.exists() else []
    false = [g for g in rows if g.get('function') == 'shim_control_false'
             and g.get('property', '').endswith('_ensures')]
    true = [g for g in rows if g.get('function') == 'shim_control_true'
            and g.get('property', '').endswith('_ensures')]
    errors = sorted(set(ERRORS.findall(text)))
    if errors:
        state = 'inconclusive_export_or_parse_error'
    elif len(false) != 1 or len(true) != 1:
        state = 'inconclusive_missing_reports'
    elif false[0].get('passed'):
        state = 'rejected_false_proved'
    elif not true[0].get('passed'):
        state = 'inconclusive_positive_control'
    elif false[0].get('verdict') not in ['timeout', 'unknown']:
        state = 'inconclusive_negative_control'
    else:
        state = 'controls_accepted'
    return {'attempt': str(attempt.relative_to(ROOT)), 'state': state,
            'encoding_errors': errors,
            'report_sha256': hashlib.sha256(report.read_bytes()).hexdigest()
            if report.exists() else None,
            'scope': 'Control audit only; not a consistency theorem or kernel proof.'}


if __name__ == '__main__':
    records = [inspect(p.parent) for p in sorted(ROOT.rglob('actual-commands.jsonl'))]
    result = {'policy': 'An export failure is not a successful negative control.',
              'attempts': records}
    (ROOT / 'root-control-audit.json').write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps({'attempts': len(records), 'states': {
        state: sum(r['state'] == state for r in records)
        for state in sorted({r['state'] for r in records})}}))
