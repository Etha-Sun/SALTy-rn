#!/usr/bin/env python3
"""Compare inventory with the actual full raw report; never admit a kernel."""
from collections import Counter
from pathlib import Path
import hashlib
import json

HERE = Path(__file__).resolve().parent
ATTEMPT = HERE.parent / 'attempts/0001'
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
inventory = json.loads((HERE / 'goal-ids.json').read_text())
provenance = json.loads((HERE / 'provenance.json').read_text())
assert sha(ATTEMPT / 'proof.patch') == inventory['proof_sha256']
assert sha(ATTEMPT / '.build/verify01/guard.json') == inventory['source_guard_sha256']
assert sha(ATTEMPT / 'frozen.json') == provenance['frozen_sha256']
raw_path = ATTEMPT / 'logs/verify01.json'
if not raw_path.exists():
    raise SystemExit('Actual full raw report is not complete yet; inventory is not a proof.')
rows = json.loads(raw_path.read_text())
main = [r for r in rows if '_lemma_' not in r['goal']]
expected = set(inventory['goal_ids'])
counts = Counter(r['goal'] for r in main)
report = {'scope': 'Coverage comparison only, no kernel admission',
    'proof_sha256': inventory['proof_sha256'], 'full_raw_sha256': sha(raw_path),
    'expected_main_count': len(expected), 'actual_main_rows': len(main),
    'actual_unique_main_ids': len(counts),
    'missing': sorted(expected - counts.keys()),
    'unexpected': sorted(counts.keys() - expected),
    'duplicates': {k: n for k, n in counts.items() if n != 1},
    'unproved_main_ids': [r['goal'] for r in main if not r.get('passed')],
    'global_rows_embedded_in_main_raw': len(rows) - len(main),
    'all_global_bodies_controls_closure_source_and_LLVM_still_require_root_review': True,
    'admitted': False}
report['exact_main_id_coverage'] = not any(report[k] for k in ['missing', 'unexpected', 'duplicates'])
report['all_enumerated_main_rows_valid'] = report['exact_main_id_coverage'] and not report['unproved_main_ids']
(HERE / 'full-raw-comparison.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report, indent=2))
