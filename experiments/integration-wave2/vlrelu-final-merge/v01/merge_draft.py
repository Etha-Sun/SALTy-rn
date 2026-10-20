#!/usr/bin/env python3
"""Prepare the explicitly selected unfrozen proof merge; never launch WP."""
from pathlib import Path
import difflib
import hashlib
import importlib.util
import json
import re
import time

ROOT = Path(__file__).resolve().parents[4]
DEST = Path(__file__).resolve().parent
WAVE = ROOT / 'experiments/integration-wave2'
BASE = WAVE / 'vlrelu-reinterpret/merged-values-v02/attempts/0001'
READ = WAVE / 'vlrelu-final-reads/v04-helper-order-callers/attempts/0001'
PREFIX = WAVE / 'vlrelu-mainprefix/v02-filter-depth8/attempts/0001'
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
clean = lambda p: re.sub(r'^#line[^\n]*\n', '', p.read_text(), flags=re.M)
quota = json.loads((WAVE / 'quota-status.json').read_text())
assert not (WAVE / 'QUOTA-STOP.json').exists()
assert quota['query_ok'] and not quota['closing'] and quota['remaining_percent'] >= 55
assert time.time() - quota['checked_at'] < 1900
assert sha(BASE / 'proof.patch') == 'd5b18b2b5506dde3de8df80b7b4543ae18334723ed600d2437e04d2f392a13d9'
assert sha(READ / 'proof.patch') == 'c4e76461be50af130c04c656e4f825da5304d75d3b8dd2b2cb365705555e2b4a'
assert sha(PREFIX / 'proof.patch') == 'b0125e5f94da899ceb20f8439bbb1e38eae609ffdf10959231df4e4b474947ed'
manifest = json.loads((BASE / 'frozen.json').read_text())
source_evidence = []
for attempt in [BASE, READ, PREFIX]:
    guard_path = attempt / '.build/verify01/guard.json'
    guard = json.loads(guard_path.read_text())
    assert guard['passed'] is True
    assert guard['frozen_sha256'] == sha(attempt / 'frozen.json')
    assert guard['proof'] == {str((attempt / 'proof.patch').relative_to(ROOT)): sha(attempt / 'proof.patch')}
    frozen = json.loads((attempt / 'frozen.json').read_text())
    assert frozen['files'] == manifest['files']
    generated = attempt / '.build/verify01/annotated'
    files = {p.name: sha(p) for p in generated.iterdir() if p.suffix in {'.c', '.h', '.driver'}}
    assert all(guard['generated'][name] == digest for name, digest in files.items())
    source_evidence.append({'attempt': str(attempt.relative_to(ROOT)),
        'proof_sha256': sha(attempt / 'proof.patch'), 'guard_sha256': sha(guard_path),
        'frozen_sha256': sha(attempt / 'frozen.json'), 'annotated_sha256': files})
base_dir = BASE / '.build/verify01/annotated'
read_dir = READ / '.build/verify01/annotated'
prefix_dir = PREFIX / '.build/verify01/annotated'
texts = {p.name: clean(p) for p in read_dir.iterdir() if p.suffix in {'.c', '.h', '.driver'}}
original = {name: clean(base_dir / name) for name in texts}
assert [name for name in texts if texts[name] != original[name]] == ['harness.c']
needle = 'loop invariant \\forall integer j; 0<=j<total-batch/4 ==> same_value(o_base[j],unary_value(i_base[j],proof_slope_entry));'
assert texts['neon.c'].count(needle) == 1
texts['neon.c'] = texts['neon.c'].replace(needle, needle.replace('loop invariant ', 'loop invariant mp4_main_prefix: '))
assert texts['neon.c'] == clean(prefix_dir / 'neon.c')
prefix_hint = re.search(r'/\*@ \\wp::strategy MP4Filter:.*?\*/', clean(prefix_dir / 'harness.c'), re.S).group()
assert 'MP4Filter' not in texts['harness.c']
texts['harness.c'] += '\n' + prefix_hint + '\n'
assert texts['harness.c'].count('void proof_final_read(') == 1
spec = importlib.util.spec_from_file_location('frozen_token_guard', ROOT / 'verified/qs8-rsum/build.py')
tokens = importlib.util.module_from_spec(spec)
spec.loader.exec_module(tokens)
ordinary_checks = []
for name, record in manifest['files'].items():
    path = ROOT / record['path']
    assert sha(path) == record['sha256'], name
    if name in texts and path.suffix in {'.c', '.h'}:
        assert tokens.raw_c_tokens(path.read_text()) == tokens.raw_c_tokens(texts[name]), name
        ordinary_checks.append(name)
for name in ['spec.h', 'shim.h', 'extensions.driver']:
    assert texts[name].encode() == (ROOT / manifest['files'][name]['path']).read_bytes(), name
(DEST / 'work').mkdir(exist_ok=True)
(DEST / 'draft').mkdir(exist_ok=True)
patch = []
review = []
for name, text in texts.items():
    (DEST / 'work' / name).write_text(text)
    if name in manifest['files']:
        plain = (ROOT / manifest['files'][name]['path']).read_text()
        for line in difflib.unified_diff(plain.splitlines(True), text.splitlines(True), fromfile='a/' + name, tofile='b/' + name):
            patch.append(line if line.endswith('\n') else line + '\n\\ No newline at end of file\n')
    if text != original[name]:
        review.extend(difflib.unified_diff(original[name].splitlines(True), text.splitlines(True), fromfile='merged-values-v02/' + name, tofile='final-merge-draft/' + name))
(DEST / 'draft/proof.patch').write_text(''.join(patch))
(DEST / 'review-from-merged-values-v02.patch').write_text(''.join(review))
permissions = WAVE / 'vlrelu-final-reads/v04-helper-new-deps-env/raw.json'
rows = json.loads(permissions.read_text())
assert len(rows) == 13 and all(row['passed'] for row in rows)
permission_provenance = permissions.with_name('provenance.json')
assert json.loads(permission_provenance.read_text())['proof_sha256'] == sha(READ / 'proof.patch')
prefix_raw = PREFIX / 'logs/verify01.json'
prefix_rows = [row for row in json.loads(prefix_raw.read_text()) if row.get('function') == 'equivalent']
assert len(prefix_rows) == 2 and all(row['passed'] for row in prefix_rows)
prefix_root_check = PREFIX.parent.parent / 'root-checked-focus.json'
assert prefix_root_check.exists()
globals_list = [{'name': n, 'file': name} for name, text in texts.items() for n in re.findall(r'\blemma\s+(\w+)\s*:', text)]
assert len(globals_list) == len({x['name'] for x in globals_list}) == 21
audit = {'state': 'unfrozen_unverified_merge_draft', 'WP_started': False,
    'source_attempts': source_evidence, 'metadata_normalization': 'Remove only complete #line directives; raw source SHAs retained above.',
    'proof_sha256': sha(DEST / 'draft/proof.patch'), 'work_sha256': {n: sha(DEST / 'work' / n) for n in texts},
    'ordinary_C_token_checks': ordinary_checks, 'public_spec_shim_driver_byte_identical_to_frozen': True,
    'changed_from_base': [n for n in texts if texts[n] != original[n]],
    'preserved_other_sources_after_metadata_normalization': [n for n in texts if texts[n] == original[n]],
    'globals': globals_list, 'global_count': 21, 'new_read_helper_count': 1,
    'new_read_dependencies': {'raw': str(permissions.relative_to(ROOT)), 'sha256': sha(permissions),
        'provenance': str(permission_provenance.relative_to(ROOT)), 'provenance_sha256': sha(permission_provenance),
        'passed': 13, 'total': 13, 'all_dependencies_discharged': False,
        'remaining': 'Exact caller-frame/assigns/termination/RTE recheck is in progress separately; no result inherited from the old broad195 timeout.'},
    'prefix_evidence': {'raw': str(prefix_raw.relative_to(ROOT)), 'raw_sha256': sha(prefix_raw),
        'passed': 2, 'total': 2, 'root_check': str(prefix_root_check.relative_to(ROOT)),
        'root_check_sha256': sha(prefix_root_check)},
    'pending_original_asserts': ['equivalent_assert_11', 'equivalent_assert_12', 'equivalent_assert_21', 'equivalent_assert_22'],
    'pending_merge': 'Wait for the four frame/value goal proof delta, then freeze and run the whole new candidate.',
    'old_main_global_results_not_inherited': True}
(DEST / 'merge-audit.json').write_text(json.dumps(audit, indent=2) + '\n')
(DEST / 'run-proposed.json').write_text(json.dumps({'state': 'proposed_only_not_runnable_task',
    'proof_sha256': audit['proof_sha256'], 'model': 'unchanged qualified native-v6 Bytes',
    'auto_depth': 16, 'WP_msg_key': 'shell', 'wp_par': 128, 'timeout_seconds_per_solver': 30,
    'memlimit_MiB_per_solver': 1024, 'administrative_seconds': 3600,
    'function_subset': [], 'property_subset': [], 'full_closure_and_all_controls_required': True}, indent=2) + '\n')
print(json.dumps({'state': audit['state'], 'proof_sha256': audit['proof_sha256'],
    'changed_from_base': audit['changed_from_base'], 'global_count': 21}, indent=2))
