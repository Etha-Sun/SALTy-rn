#!/usr/bin/env python3
"""Prepare an auditable proof-only draft; never freeze it or run WP."""
from pathlib import Path
import argparse
import difflib
import hashlib
import importlib.util
import json
import re
import time

ROOT = Path(__file__).resolve().parents[4]
DEST = Path(__file__).resolve().parent
WAVE = ROOT / 'experiments/integration-wave2'
BASE = WAVE / 'vlrelu-reinterpret/rvv-values-v03'
HARNESS = WAVE / 'vlrelu-memory/harness-values-v04'
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--neon-case', default='experiments/integration-wave2/vlrelu-values/v14-tail-transfer')
args = parser.parse_args()
neon_case = Path(args.neon_case)
if not neon_case.is_absolute():
    neon_case = ROOT / neon_case
neon_case = neon_case.resolve()
assert neon_case.is_relative_to(ROOT)
quota = json.loads((WAVE / 'quota-status.json').read_text())
assert not (WAVE / 'QUOTA-STOP.json').exists()
assert quota['query_ok'] and not quota['closing'] and quota['remaining_percent'] >= 55
assert time.time() - quota['checked_at'] < 1900
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
clean = lambda path: re.sub(r'^#line[^\n]*\n', '', path.read_text(), flags=re.M)
base_dir = BASE / 'attempts/0001/.build/verify01/annotated'
harness_dir = HARNESS / 'attempts/0001/.build/verify01/annotated'
neon_dir = neon_case / 'attempts/0001/.build/verify01/annotated'
if not neon_dir.exists():
    neon_dir = neon_case / 'work'
manifest = json.loads((BASE / 'case/frozen.json').read_text())
neon_manifest = json.loads((neon_case / 'case/frozen.json').read_text())
for name, record in manifest['files'].items():
    assert sha(ROOT / record['path']) == record['sha256'], name
    assert neon_manifest['files'][name]['sha256'] == record['sha256'], name
texts = {path.name: clean(path) for path in base_dir.iterdir()
         if path.suffix in {'.c', '.h', '.driver'}}
base_texts = texts.copy()
texts['neon.c'] = clean(neon_dir / 'neon.c')
assert texts['neon.c'].count('ghost const float proof_slope_entry=params->scalar.slope;') == 1
# Insert only checked readonly invariants/cuts; preserve every NEON point/tail clause.
source = texts['neon.c']
assert 'hv_params_outer' not in source
source, count = re.subn(r'  /\*@ loop invariant ',
    '  /*@ loop invariant hv_params_outer: same_float(params->scalar.slope,proof_slope_entry);\n      loop invariant ', source, count=1)
assert count == 1
for label, extent in [('hv_params4', '(total-batch/4)+(4)'),
                      ('hv_params2', '(total-batch/4)+(2)'),
                      ('hv_params1', '(total-1)+(1)')]:
    old = '    /@ loop invariant 0<=k<=' + extent + ';'
    assert source.count(old) == 1, label
    source = source.replace(old, '    /@ loop invariant ' + label + ': same_float(params->scalar.slope,proof_slope_entry);\n       loop invariant 0<=k<=' + extent + ';', 1)
for label, call, last in [
    ('hv_guard_store4', 'vst1q_f32(output, vacc0123);', 3),
    ('hv_guard_store2', 'vst1_f32(output, vacc_lo);', 1),
    ('hv_guard_store1', 'vst1_lane_f32(output, vacc_lo, 0);', 0)]:
    assert source.count(call) == 1
    source = source.replace('    ' + call,
        '    /*@ assert ' + label + ': \\valid_read(&params->scalar.slope) && \\separated(&params->scalar.slope,output+(0..' + str(last) + ')); */\n    ' + call, 1)
texts['neon.c'] = source
# Deduplicate the identical universal mask lemma and the shared point helper.
header = texts['extensions.h']
peer_header = clean(neon_dir / 'extensions.h')
lemma_names = ['values_unary_congruence', 'values_unary_select', 'values_unary_join',
               'values_unary_mask', 'values_float_sign_transfer',
               'values_mask_sign_transfer', 'values_unary_mask_source', 'values_tail_extent']
added = []
deduplicated = []
for name in lemma_names:
    pattern = r'/\*@ lemma ' + name + r':.*?\*/'
    block = re.search(pattern, peer_header, re.S).group()
    old = re.search(pattern, header, re.S)
    if old:
        assert old.group() == block, name
        deduplicated.append(name)
    else:
        added.append(block)
strategy = re.search(r'/\*@ \\wp::strategy ValuesSMT:.*?\*/', peer_header, re.S).group()
assert '\\wp::strategy ValuesSMT:' not in header
added.insert(0, strategy)
for name in ['proof_values_unary_point', 'proof_values_unary_transfer']:
    blocks = [m.group() for m in re.finditer(r'/\*@ ghost\b.*?\*/', peer_header, re.S)
              if 'void ' + name + '(' in m.group()]
    assert len(blocks) == 1, name
    old = [m.group() for m in re.finditer(r'/\*@ ghost\b.*?\*/', header, re.S)
           if 'void ' + name + '(' in m.group()]
    if old:
        assert len(old) == 1 and old[0] == blocks[0], name
        deduplicated.append(name)
    else:
        added.append(blocks[0])
last_endif = header.rfind('#endif')
assert last_endif >= 0
texts['extensions.h'] = header[:last_endif] + '\n'.join(added) + '\n' + header[last_endif:]
# Keep the complete checked harness (count remains in its checked original position).
# Append only late proof hints from the two independent value workers.
harness = clean(harness_dir / 'harness.c')
def suffix(text):
    marker = '\n/*@ \\wp::'
    offset = text.index(marker, text.index('  return 1;'))
    return text[offset:]
texts['harness.c'] = harness + suffix(base_texts['harness.c']) + suffix(clean(neon_dir / 'harness.c'))
# The baseline includes every successful signed/store/VRVV state and is never replaced.
protected = ['bits.c', 'float_ops.c', 'float_ops.h', 'rvv.c', 'base.h', 'base.c',
             'spec.h', 'shim.h', 'extensions.driver', 'unit.c']
for name in protected:
    assert texts[name] == base_texts[name], name
spec = importlib.util.spec_from_file_location('frozen_token_guard', ROOT / 'verified/qs8-rsum/build.py')
guard = importlib.util.module_from_spec(spec)
spec.loader.exec_module(guard)
checks = []
for name, text in texts.items():
    if name not in manifest['files'] or Path(name).suffix not in {'.c', '.h'}:
        continue
    original = (ROOT / manifest['files'][name]['path']).read_text()
    assert guard.raw_c_tokens(original) == guard.raw_c_tokens(text), name
    checks.append({'file': name, 'ordinary_tokens_unchanged': True})
work = DEST / 'work'
work.mkdir(exist_ok=True)
for name, text in texts.items():
    (work / name).write_text(text)
draft = DEST / 'draft'
draft.mkdir(exist_ok=True)
patch = []
for name, text in texts.items():
    if name not in manifest['files']:
        continue
    original = (ROOT / manifest['files'][name]['path']).read_text()
    for line in difflib.unified_diff(original.splitlines(True), text.splitlines(True),
                                     fromfile='a/' + name, tofile='b/' + name):
        patch.append(line if line.endswith('\n') else line + '\n\\ No newline at end of file\n')
(draft / 'proof.patch').write_text(''.join(patch))
case = DEST / 'case'
case.mkdir(exist_ok=True)
manifest['proof_patches'] = [str((draft / 'proof.patch').relative_to(ROOT))]
manifest['wp_budget'] = 1200
manifest['integration_provenance']['wave2'] = 'UNFROZEN unified draft: checked RVV-v03 signed+memory baseline, selected NEON proof, checked harness-v04 params/counter proof; NEON transfer pending, no result inherited.'
(case / 'frozen.proposed.json').write_text(json.dumps(manifest, indent=2) + '\n')
task = json.loads((BASE / 'task.json').read_text())
task.update(task_id='wave2-vlrelu-merged-values-v01', source_case=str(BASE.relative_to(ROOT)),
    source_frozen_sha256=sha(BASE / 'case/frozen.json'), case=str(case.relative_to(ROOT)),
    frozen_sha256=sha(case / 'frozen.proposed.json'), wp_par=128, wall_seconds=1200,
    agent_wall_seconds=1200, diagnostic_functions=[], diagnostic_properties=[],
    default_mode='full', readiness='draft_unfrozen_NEON_transfer_pending', sourceguard_exit=None,
    focus='Unfrozen integrated draft; full closure required, no function/property subset and no old results inherited.')
task['resources'].update(wp_par=128, wp_budget=1200, wp_timeout=30, wp_memlimit=1024)
(DEST / 'task.proposed.json').write_text(json.dumps(task, indent=2) + '\n')
globals_list = []
for name, text in texts.items():
    globals_list += [{'name': name_, 'file': name} for name_ in re.findall(r'\blemma\s+(\w+)\s*:', text)]
assert len(globals_list) == len({x['name'] for x in globals_list})
helpers = re.findall(r'void (proof_values_\w+)\(', texts['extensions.h'])
assert helpers.count('proof_values_unary_point') == helpers.count('proof_values_unary_transfer') == 1
review = []
for name, text in texts.items():
    if text != base_texts[name]:
        review.extend(difflib.unified_diff(base_texts[name].splitlines(True), text.splitlines(True),
            fromfile='RVV-v03/' + name, tofile='merged-draft/' + name))
(DEST / 'review-from-rvv-v03.patch').write_text(''.join(review))
audit = {'state': 'unfrozen_draft_not_verified', 'WP_started': False,
    'sources': {str(BASE.relative_to(ROOT)): sha(BASE / 'draft/proof.patch'),
                str(neon_case.relative_to(ROOT)): sha(neon_case / 'draft/proof.patch'),
                str(HARNESS.relative_to(ROOT)): sha(HARNESS / 'draft/proof.patch')},
    'neon_source_directory': str(neon_dir.relative_to(ROOT)),
    'pending': ['NEON high-half third transfer private precondition was not yet closed in v14; wait for stable v15 and rebuild before freezing',
                'The integrated candidate has not run sourceguard, LLVM identity, controls, globals or WP; all must run fresh after final freeze'],
    'protected_baseline_files_byte_identical': protected, 'ordinary_token_checks': checks,
    'deduplicated_byte_identical': deduplicated, 'global_count': len(globals_list),
    'globals': globals_list, 'new_value_helpers': helpers,
    'proof_sha256': sha(draft / 'proof.patch'), 'all_original_frozen_hashes_checked': True,
    'configuration': {'wp_par': 128, 'TIP_depth': 16, 'solver_timeout_seconds': 30,
       'solver_memlimit_MiB': 1024, 'task_wall_seconds': 1200, 'frozen_wp_budget': 1200,
       'full_closure': True, 'function_subset': [], 'property_subset': []}}
(DEST / 'merge-audit.json').write_text(json.dumps(audit, indent=2) + '\n')
print(json.dumps({'state': audit['state'], 'global_count': len(globals_list),
                  'changed_from_RVV_v03': [n for n in texts if texts[n] != base_texts[n]],
                  'deduplicated': deduplicated, 'proof_sha256': audit['proof_sha256']}, indent=2))
