"""Audit archived campaign records and current bytes; this does not replay SMT."""
from pathlib import Path
import hashlib
import json

root = Path(__file__).resolve().parents[3]
read = lambda path: json.loads(path.read_text())
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
manifest = read(root / 'verified/manifest.json')
records = []
for entry in manifest['programs']:
    if 'model' not in entry:  # The four historical cases have their own checkers.
        continue
    path = root / 'verified' / entry['proof_evidence']
    result = read(path)
    raw = read(path.with_name('canonical01.json'))
    frozen_path = root / 'verified' / entry['source_freeze']
    frozen = read(frozen_path)
    ir = read(path.parent / 'llvm-byte-audit.json')
    assert result['complete'] and result['exit'] == 0 and result['unchanged']
    assert raw and all(goal['passed'] and goal['verdict'] == 'valid' for goal in raw)
    assert len(raw) == result['raw_obligations']['passed'] == result['raw_obligations']['total']
    assert not result['pending'] and not result['missing_body_ensures'] and not result['missing_global_lemmas']
    assert set(result['expected_functions']) == set(result['functions'])
    assert sha(frozen_path) == result['source_guard']['frozen_sha256']
    assert all(sha(root / item['path']) == item['sha256'] for item in frozen['files'].values())
    assert all(sha(root / name) == digest for name, digest in result['checker_inputs'].items())
    assert all(sha(root / 'verified' / name) == digest for name, digest in entry['source_and_evidence_sha256'].items())
    assert ir['exact_byte_equality']
    records.append({'name': entry['name'], 'valid_obligations': len(raw)})
assert records, 'No campaign results were audited'
print(json.dumps({'passed': True, 'records': records, 'SMT_replayed': False}, indent=2))
