"""Account for every inventoried body goal; never infer formal acceptance."""
from pathlib import Path
import collections
import hashlib
import json
import sys

C = Path(__file__).resolve().parent
name = sys.argv[1]
assert '/' not in name
logs = C / 'logs'
result_path = logs / (name + '-result.json')
result = json.loads(result_path.read_text())  # Completed attempts only.
inventory_path = C / 'INVENTORY-ROOT01.json'
inventory = json.loads(inventory_path.read_text())
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
assert sha(C / 'proof.patch') == inventory['proof_sha256']
assert sha(C / 'frozen.json') == inventory['frozen_sha256']
command = json.loads((logs / (name + '-command.json')).read_text())
assert command['proof_sha256'] == inventory['proof_sha256']
assert command['frozen_sha256'] == inventory['frozen_sha256']
assert result['inputs_unchanged']
events_path = logs / (name + '-events.jsonl')
events = [json.loads(s) for s in events_path.read_text().splitlines()]
observed = collections.defaultdict(list)
for event in events:
    if 'goal' in event:
        observed[event['goal']].extend(event.get('results', []))
raw_path = logs / (name + '.json')
raw = {r['goal']: r for r in json.loads(raw_path.read_text())} if raw_path.exists() else {}
body = [g for g in inventory['goals'] if not any(r['prover'] == 'cfg' for r in g['results'])]
ids = {g['goal'] for g in body}
assert not (raw.keys() - ids), 'Unexpected raw goal; reconcile inventory before reporting'
rows = []
for goal in body:
    key = goal['goal']
    results = observed.get(key, [])
    if key in raw:
        status = 'raw_passed' if raw[key]['passed'] else 'raw_pending'
    elif any(r['verdict'] == 'valid' for r in results):
        status = 'observed_valid_without_raw'
    elif results:
        status = 'attempted_without_valid_or_raw'
    else:
        status = 'no_completed_prover_result'
    rows.append({k: goal[k] for k in ['goal', 'property', 'function', 'file', 'line']} | {'status': status})
report = {
    'scope': 'Complete accounting of inventory, not a complete proof. A missing raw report is never accepted.',
    'attempt': name,
    'exit_code': result['exit_code'],
    'body_total': len(rows),
    'global_lemmas_separate': inventory['global_lemmas_separate'],
    'cfg_only': inventory['cfg_only'],
    'counts': dict(collections.Counter(r['status'] for r in rows)),
    'raw_present': raw_path.exists(),
    'normal_exit': bool(events and events[-1]['event'] == 'normal_exit'),
    'whole_kernel_accepted': False,
    'sha256': {str(p.relative_to(C)): sha(p) for p in [result_path, inventory_path, events_path, C / 'proof.patch', C / 'frozen.json']},
    'goals': rows,
}
out = C / (name + '-ACCOUNTING.json')
assert not out.exists(), 'Preserve existing report'
out.write_text(json.dumps(report, indent=2) + '\n')
print(name, report['counts'])
