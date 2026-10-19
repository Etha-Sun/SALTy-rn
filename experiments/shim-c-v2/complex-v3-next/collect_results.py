"""Collect evidence; a timeout without a body report never means zero obligations."""
from pathlib import Path
from collections import Counter
import json
import re

ROOT = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parent
NAMES = list(json.loads((ROOT/'experiments/shim-c-v2/complex/locked.json').read_text()))
CLOSURE = json.loads((HERE/'v4-call-closure.json').read_text())


def relative(path):
    return str(path.relative_to(ROOT))


def attempt(case, run):
    summary = case/'logs'/f'{run}-summary.json'
    if not summary.exists():
        return {'case': relative(case), 'run': run, 'status': 'not_finished', 'summary': relative(summary)}
    data = json.loads(summary.read_text())
    raw_path = case/'logs'/f'{run}.json'
    rows = json.loads(raw_path.read_text()) if raw_path.exists() else []
    body = [x for x in rows if x.get('function')]
    lemma = [x for x in rows if x.get('property', '').startswith('lemma_')]
    log = case/'logs'/f'{run}.log'
    text = log.read_text(errors='replace') if log.exists() else ''
    pending_log = re.findall(r'^\[wp\] \[(Timeout|Failure|Unknown)\] (\S+)', text, flags=re.M)
    pending = data.get('pending', [])
    def category(row):
        f = row.get('function', '')
        if f == 'canonical_nan' or 'reinterpret' in f or f == 'vbslq_f32':
            return 'typed_memory_bit_representation'
        if not f:
            return 'global_lemma'
        if f == 'equivalent':
            return 'kernel_relation_loop_validity_or_frame'
        if 'vsse32' in f:
            return 'byte_stride_pointer_offset_and_frame'
        if f == 'round_down_po2':
            return 'bitwise_arithmetic_proof'
        if 'vcreate' in f:
            return 'aggregate_initialization_model'
        return 'shared_helper_body_proof'
    complete_body_report = data.get('exit') == 0 and bool(body)
    groups = {}
    for row in rows:
        key = (row['goal'], row.get('property'), row.get('function'))
        groups.setdefault(key, []).append(row)
    return {
        'case': relative(case), 'run': run, 'summary': relative(summary),
        'log': relative(log), 'raw_report': relative(raw_path) if raw_path.exists() else None,
        'status': 'verified' if data.get('complete') else ('total_budget_exceeded' if data.get('exit') == 124 else 'unproved'),
        'exit': data.get('exit'), 'seconds': data.get('seconds'),
        'total_budget_seconds': json.loads((case/'frozen.json').read_text()).get('wp_budget', 600),
        'total_budget_exceeded': data.get('exit') == 124,
        'implementation_and_spec_unchanged': data.get('unchanged'),
        'source_guard_passed': data.get('source_guard', {}).get('passed'),
        'model_inputs_unchanged': data.get('model_inputs_unchanged'),
        'model_control_accepted': (data.get('model_control') or {}).get('accepted'),
        'actual_command': data.get('actual_command'),
        'raw_records': {'passed': sum(bool(x['passed']) for x in rows), 'total': len(rows)},
        'unique_obligations': {'passed': sum(all(x['passed'] for x in g) for g in groups.values()), 'total': len(groups)},
        'body_report_complete': complete_body_report,
        'per_function_obligations': {f: {'passed': sum(bool(x['passed']) for x in body if x['function']==f), 'total': sum(x['function']==f for x in body)} for f in sorted({x['function'] for x in body})},
        'body_obligations': {'passed': sum(bool(x['passed']) for x in body), 'total': len(body)} if complete_body_report else None,
        'global_lemma_records': {'passed': sum(bool(x['passed']) for x in lemma), 'total': len(lemma)},
        'scheduled_in_main_log': [int(n) for n in re.findall(r'\[wp\] (\d+) goals scheduled', text)],
        'pending_categories': dict(Counter(category(x) for x in pending)),
        'pending_exact': pending,
        'unfinished_log_diagnostics': [{'verdict': v, 'goal': g} for v, g in pending_log],
        'missing_body_ensures': data.get('missing_body_ensures'),
        'missing_global_lemmas': data.get('missing_global_lemmas'),
        'call_closure': data.get('call_closure'),
        'notes': 'Raw may contain duplicate lemma checks. A merged lemma-only JSON after main timeout is not a body report. Solver non-proof is not a C counterexample.'
    }


results = {}
for name in NAMES:
    cases = [(ROOT/'experiments/shim-c-v2/v4-campaign'/name, 'complex01')]
    if name in {'x32-packw-gemm-goi', 'x32-transposec'}:
        cases.append((ROOT/'experiments/shim-c-v2/complex-byte'/name, 'bytes01'))
        cases.append((ROOT/'experiments/shim-c-v2/complex-byte-v2'/name, 'bytes01'))
    if name == 'f32-vcmul':
        cases.append((ROOT/'experiments/shim-c-v2/complex-array'/name, 'array01'))
    attempts = [attempt(*c) for c in cases]
    item = {
        'kernel': name, 'attempts': attempts,
        'full_equivalence_established': any(a['status'] == 'verified' for a in attempts),
        'c_counterexample_found_this_round': False,
        'source_model_gap_audit': CLOSURE[name],
        'proof_work': ({'main_kernel': 'functional reference, cursor/prefix/frame/termination candidate (vcmul retains earlier main-loop annotations; new array tactic closes its helper bodies)', 'remaining': 'actual body/relational obligations not all proved'} if name in {'x32-packw-gemm-goi','x32-transposec','f32-dwconv-minmax','f32-vcmul'} else {'main_kernel': 'new NC/KC cursors and variants; accumulator relation not complete', 'remaining': 'accumulator, frame and final relation proof'} if name=='f32-gemm-minmax' else {'main_kernel': 'shared actual callee/helper contracts and body proofs; final comparison invariants', 'remaining': 'main kernel nested-loop/reduction relation is not yet complete, in addition to model gaps'}),
        'scope': 'Original frozen public preconditions and wrapper layout; no strengthened input domain. Ordinary source audit does not replace full ghost/global-lemma closure check.'
    }
    folder = HERE/'results'/name
    folder.mkdir(parents=True, exist_ok=True)
    (folder/'result.json').write_text(json.dumps(item, indent=2)+'\n')
    results[name] = item
(HERE/'results.json').write_text(json.dumps(results, indent=2)+'\n')
print(json.dumps({n: [a['status'] for a in d['attempts']] for n, d in results.items()}, indent=2))
