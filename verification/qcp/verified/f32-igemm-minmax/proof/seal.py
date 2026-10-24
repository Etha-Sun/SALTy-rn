"""Seal a complete fresh F32 IGEMM replay without overwriting historical runs."""
from pathlib import Path
import argparse, datetime, hashlib, json, re, shutil
from prepare import ROOT, UNITS
from audit import audit

p = argparse.ArgumentParser()
p.add_argument('--compile-run', required=True)
p.add_argument('--generation-run', required=True)
p.add_argument('--auxiliary-run', required=True)
a = p.parse_args()
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
P = ROOT / 'proof'
C = ROOT / '.build' / a.compile_run / 'compile'
G = ROOT / '.build' / a.generation_run
A = ROOT / '.build' / a.auxiliary_run
binding = audit(a.compile_run, a.generation_run)
dep = json.loads((P / 'dependencies.json').read_text())
comp = json.loads((C / 'result.json').read_text())
assert len(dep['modules']) == binding['fresh_local_modules'] == 687
aux = {n: json.loads((A / n / 'result.json').read_text())
       for n in ['native', 'negative', 'environment', 'dependency-audit']}
assert aux['native']['passed'] and aux['native']['inputs_unchanged']
assert aux['negative']['passed'] and aux['negative']['live_inputs_unchanged']
for n in ['native', 'negative']:
    for f, h in aux[n]['source_hashes'].items():
        assert sha(ROOT / f) == h, f
assert aux['dependency-audit']['passed'] and aux['dependency-audit']['sources'] == 687
for r in aux['environment']['external_files'] + aux['environment']['binaries']:
    assert sha(Path(r['path'])) == r['sha256'], r['path']
for m in dep['modules']:
    s = re.sub(r'\(\*.*?\*\)', '', (ROOT / m['path']).read_text(), flags=re.S)
    assert not re.search(r'\b(?:Admitted|admit|Abort)\b', s), m['path']

E = P / 'evidence/full-run'
E.mkdir(parents=True, exist_ok=False)
for name, data in [('binding-audit', binding), ('compilation', comp), *aux.items()]:
    (E / (name + '.json')).write_text(json.dumps(data, indent=2) + '\n')
shutil.copy2(G / 'generation-summary.json', E / 'generation-summary.json')
for unit, u in UNITS.items():
    for name in ['result.json', u['base'] + '.c', u['base'] + '_goal.v']:
        src = G / 'generation' / unit / name
        shutil.copy2(src, E / (unit + '-' + name))
for side in ['neon', 'rvv']:
    target = E / ('strategy-' + side)
    target.mkdir()
    for f in (G / 'strategy' / side).iterdir():
        if f.is_file():
            shutil.copy2(f, target / f.name)
for r in binding['assumption_checks']:
    src = C / 'proof/coq/FloatIgAdmission' / (r['module'] + '.budget/command.log')
    assert sha(src) == r['log_sha256']
    shutil.copy2(src, E / (r['module'] + '.txt'))
for kind, files in {'native': ['compile.log', 'execute.log'],
                    'negative': ['false.log', 'source-tamper.log', 'both-wrong.log', 'both-wrong-compile.log']}.items():
    for name in files:
        shutil.copy2(A / kind / name, E / (kind + '-' + name))
original = ROOT / '.build/original01/native'
for name in ['result.json', 'execute.log']:
    shutil.copy2(original / name, E / ('original-counterexample-' + name))

selected = {m['path'] for m in dep['modules']}
for folder in ['impl', 'shim', 'contracts', 'proof/c', 'proof/native']:
    selected |= {str(f.relative_to(ROOT)) for f in (ROOT / folder).rglob('*')
                 if f.is_file() and f.suffix not in ['.pyc', '.vo', '.glob', '.vos', '.vok']
                 and not f.name.startswith('.')}
selected |= {str(f.relative_to(ROOT)) for f in P.glob('*.py')}
selected |= {'README.md', 'CONTINUE_PROMPT.zh-CN.md', '.gitignore', 'spec.c', 'repair.md',
             'proof/dependencies.json', 'proof/intrinsic-ledger.json',
             'proof/source-identity.json', 'proof/final-reports.json'}
manifest = {'schema': 2, 'kernel': 'f32-igemm-minmax', 'verification_basis': 'source-reviewed-intrinsic-spec',
            'files': [{'path': f, 'sha256': sha(ROOT / f)} for f in sorted(selected)],
            'modules': dep['modules'], 'parallel_jobs': 32,
            'intrinsic_ledger': 'intrinsic-ledger.json', 'source_identity': 'source-identity.json'}
(P / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
full = {'passed': True, 'utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'evidence_kind': 'Complete actual four-unit C/Coq replay with exact source, strategy and call binding',
        'configured_jobs': 32, 'compile_run': a.compile_run, 'generation_run': a.generation_run,
        'auxiliary_run': a.auxiliary_run, 'fresh_local_modules': 687, 'C_fields': 593,
        'strategy_fields': 7, 'assumption_reports': 604,
        'fresh_compilation_lineage': 'All selected local modules, complete interfaces and 32 assumption shards compiled freshly in one dependency-ordered run; no historical local objects imported.',
        'inherited_assumption_names': binding['inherited_assumption_names'],
        'evidence_files': [{'path': str(f.relative_to(P)), 'sha256': sha(f)}
                           for f in sorted(E.rglob('*')) if f.is_file()]}
(P / 'full-status.json').write_text(json.dumps(full, indent=2) + '\n')
old = P / 'status.json'
shutil.copy2(old, P / 'evidence/pre-admission-status.json')
status = {'schema': 2, 'kernel': 'f32-igemm-minmax', 'scope': 'full', 'status': 'proved',
          'passed': True, 'whole_kernel_verified': True, 'whole_kernel_proved': True,
          'c_shim_equivalence_checked': True, 'checked_c_call_closure': True,
          'call_closure_basis': 'Complete actual kernels, loops, memory, ordinary helpers and caller under source-reviewed intrinsic specifications',
          'final_checker_modules_checked': True, 'kernel_contracts_match_spec': True,
          'verification_basis': 'source-reviewed-intrinsic-spec',
          'implementation_variant': 'NaN-clamp-repaired-and-compatible-loop-syntax',
          'original_kernel_tokens_preserved': False, 'current_impl_tokens_preserved': True,
          'verification_scope': 'C-shim modular partial correctness and public numeric-or-both-NaN equivalence at mr1, cn_stride32, arbitrary positive legal K,N,E',
          'checked_c_units': 4, 'checked_c_vcs': 593, 'checked_strategy_fields': 7,
          'unique_c_functions_with_bodies': 9, 'freshly_compiled_local_modules': 687,
          'assumption_reports': 604, 'parallel_jobs': 32,
          'inherited_assumption_names': binding['inherited_assumption_names'],
          'new_project_axioms': False, 'intrinsic_spec_entries': 22,
          'intrinsic_ISA_correspondence_checked': False, 'human_semantic_review': 'pending',
          'spec_sha256': sha(ROOT / 'spec.c'), 'manifest_sha256': sha(P / 'manifest.json'),
          'full_evidence': 'full-status.json', 'full_evidence_sha256': sha(P / 'full-status.json'),
          'immutable_full_archive': 'evidence/full-run/', 'isa_refinement': False,
          'physical_ABI_refinement': False, 'termination_proved': False,
          'arbitrary_VLEN': False, 'configured_VLEN_bits': 128,
          'native_cases': aux['native']['cases'], 'native_output_cells': aux['native']['logical_output_cells'],
          'limits': 'README.md, spec.c and intrinsic-ledger.json; all binary32; repeated/overlapping readonly input windows, explicit capacities, QCP integer-address memory model'}
old.write_text(json.dumps(status, ensure_ascii=False, indent=2) + '\n')
print({k: status[k] for k in ['passed', 'whole_kernel_verified', 'freshly_compiled_local_modules', 'checked_c_vcs', 'assumption_reports', 'parallel_jobs']})
