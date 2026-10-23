#!/usr/bin/env python3
"""Validate/archive one completed full gate. --preflight never issues a certificate.

No proof is replayed, no object is copied, and no global manifest is edited.
All historical bytes/paths remain intact. New assumption names require review.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile

sys.dont_write_bytecode = True
ALLOWED = {
    'CNotation.LE_arrow_field_congr', 'CNotation.RE_addr_of_congr',
    'CNotation.eval_addr_expr', 'CNotation.eval_addr_expr_congr',
    'CNotation.sizeof_alias_type', 'CNotation.sizeof_enum_type',
    'CNotation.sizeof_struct_type', 'CNotation.sizeof_union_type',
    'ClassicalDedekindReals.sig_forall_dec', 'ClassicalDedekindReals.sig_not_dec',
    'Classical_Prop.classic', 'FunctionalExtensionality.functional_extensionality_dep',
    'PropExtensionality.propositional_extensionality',
    'SeparationLogic.Snaive_C_Rules64.eval_addr',
}
EXPECTED = {'s8-vclamp': (12, 2060, 41, 16, 6),
            'qs8-f32-vcvt': (26, 1337, 49, 30, 10)}


def require(ok, message):
    if not ok:
        raise ValueError(message)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def read(path):
    return json.loads(Path(path).read_text())


def locate(case, path):
    path = Path(path)
    if path.exists():
        return path
    parts = path.parts
    for i in range(len(parts) - 3):
        if (parts[i:i+2] == ('verification', 'qcp')
                and parts[i+2] in {'candidates', 'verified'} and parts[i+3] == case.name):
            return case.joinpath(*parts[i+4:])
    return path


def preserve(source, target):
    target.parent.mkdir(parents=True, exist_ok=True)
    if target.exists():
        require(target.read_bytes() == source.read_bytes(), 'Immutable archive changed: ' + str(target))
    else:
        shutil.copyfile(source, target)


def check_hashes(case, hashes, label):
    require(isinstance(hashes, dict) and bool(hashes), 'Missing input inventory: ' + label)
    root = next(p for p in case.parents if (p / '.git').exists()).resolve()
    for name, digest in hashes.items():
        require(isinstance(digest, str) and re.fullmatch('[0-9a-f]{64}', digest), 'Invalid SHA: ' + name)
        require(not Path(name).is_absolute() and (case / name).resolve().is_relative_to(root), 'Inventory escapes repository: ' + name)
        require(sha(case / name) == digest, label + ' input changed: ' + name)


def execute(command, cwd, log):
    result = subprocess.run(command, cwd=cwd, capture_output=True, text=True, timeout=180)
    log.write_text(result.stdout + result.stderr)
    require(result.returncode == 0, 'Command failed: ' + str(command) + '\n' + log.read_text()[-2000:])
    return {'command': list(map(str, command)), 'exit_code': result.returncode, 'log_sha256': sha(log)}


def identity(case, work, h=None):
    """Check current originals/patch/counterexample/native identities without writing metadata."""
    here = case / 'proof'
    root = next(p for p in case.parents if (p / '.git').exists())
    originals, repair = read(here / 'originals.json'), read(here / 'repair.json')
    out = {'patch_fuzz': 0, 'formal_proof_replayed': False, 'native': []}
    for side, cap in [('neon', 'NEON'), ('rvv', 'RVV')]:
        if 'files' in originals:
            item = originals['files'][side]
            original, digest = root / item['path'], item['sha256']
        else:
            original = root / originals['original_' + side + '_path']
            digest = originals['original_' + side + '_sha256']
        require(sha(original) == digest, 'Repository original changed: ' + side)
        copy = here / 'original' / ('test' + cap + '.c')
        if copy.exists():
            require(copy.read_bytes() == original.read_bytes(), 'Retained original differs: ' + side)
        actual = case / 'impl' / ('test' + cap + '.c')
        repaired_digest = repair.get('repaired_' + side + '_sha256')
        if repaired_digest:
            require(repair['original_' + side + '_sha256'] == digest, 'Repair original mismatch')
            require(sha(actual) == repaired_digest, 'Repaired source changed: ' + side)
            patch = case / repair.get('patch', 'proof/repair.patch')
            require(sha(patch) == repair['patch_sha256'], 'Repair patch changed')
            folder = work / ('patch-' + side)
            target = folder / 'impl' / actual.name
            target.parent.mkdir(parents=True)
            shutil.copyfile(original, target)
            out['patch_replay'] = execute(['patch', '--batch', '--fuzz=0', '-p1', '-d', str(folder), '-i', str(patch)], work, work / ('patch-' + side + '.log'))
            require(target.read_bytes() == actual.read_bytes(), 'Exact patch replay differs')
            require(repair.get('counterexample'), 'Missing retained counterexample')
        else:
            require(actual.read_bytes() == original.read_bytes(), 'Unchanged implementation differs: ' + side)
    if case.name == 's8-vclamp':
        ce = repair['original_counterexample_evidence']
        require(sha(case / ce['path']) == ce['sha256'], 'Counterexample certificate changed')
        previous = read(case / ce['path'])
        require(previous['passed'] and previous['checks']['disagreements'] == 6420, 'Counterexample replay missing')
        require(repair['counterexample'] == {'n': 1, 'input': [0], 'scalar_min': 1, 'scalar_max': 0, 'neon_output': [1], 'original_rvv_output': [0]}, 'Counterexample altered')
    else:
        ce = repair['counterexample']
        require(ce['zero_point'] == -2147483648 and not ce['ubsan_run_pending'], 'Counterexample incomplete')
        require(hashlib.sha256(ce['ubsan_output'].encode()).hexdigest() == ce['ubsan_log_sha256'], 'Retained UBSan evidence changed')
    if h is None:
        out['handoff_available'] = False
        for filename in ['repaired-native-status.json', 'native-status.json', 'formal-native-status.json', 'rvv-native-status.json']:
            p = here / filename
            if p.exists():
                d = read(p)
                require(d.get('passed') is True, 'Native failed: ' + filename)
                hashes = d.get('input_sha256', d.get('current_sources_sha256'))
                if hashes:
                    check_hashes(case, hashes, filename)
                out['native'].append({'path': filename, 'sha256': sha(p), 'recursive_inventory_available': bool(hashes)})
        return out
    require(h['namespace'] in {'S8Clamp', 'Qs8Cvt'}, 'Unreviewed namespace')
    require(len(h['units']) == EXPECTED[case.name][0], 'H unit count')
    check_hashes(case, h['frozen_source_sha256'], 'Frozen full handoff')
    for side, item in h['implementations'].items():
        require(sha(root / item['original']) == item['original_sha256'], 'H original identity: ' + side)
        require(sha(case / item['actual']) == item['actual_sha256'], 'H actual identity: ' + side)
        for name, digest in item.get('counterexample_sha256', {}).items():
            require(sha(case / name) == digest, 'H counterexample identity: ' + name)
    native_items = [{'path': h['native_status'], 'sha256': h['native_status_sha256'],
                     'required_values': h['native_required_values'], 'input_sha256': h['native_input_sha256']},
                    *h.get('auxiliary_native_statuses', [])]
    for item in native_items:
        p = case / item['path']
        d = read(p)
        require(sha(p) == item['sha256'] and d.get('passed') is True, 'Native certificate changed: ' + item['path'])
        for key, value in item.get('required_values', {}).items():
            require(d[key] == value, 'Native acceptance condition changed: ' + key)
        inventories = [x for x in [d.get('input_sha256'), d.get('current_sources_sha256'), item.get('input_sha256')] if isinstance(x, dict) and x]
        require(inventories, 'Native certificate needs explicit current input inventory in H: ' + item['path'])
        for inventory in inventories:
            check_hashes(case, inventory, item['path'])
        for record in d.get('records', []):
            require(record['exit_code'] == 0, 'Failed native record')
        out['native'].append({'path': item['path'], 'sha256': sha(p), 'checked_input_files': len(set().union(*[set(x) for x in inventories]))})
    out['handoff_available'] = True
    return out


def final_source(full):
    lines = []
    for i, unit in enumerate(full['actual_c_units']):
        goal = unit['namespace'] + '.' + unit['stem'] + '_goal'
        proof = unit['checked_module']
        lines += ['Require Import ' + goal + ' ' + proof.rsplit('.', 1)[0] + '.',
                  f'Module ActualUnit{i} : {goal}.VC_Correct := {proof}.']
        lines += [f'Print Assumptions ActualUnit{i}.proof_of_{field}.' for field in unit['fields']]
    for i, unit in enumerate(full['strategies']):
        goal = unit['namespace'] + '.' + unit['stem'] + '_strategy_goal'
        proof = unit['checked_module']
        lines += ['Require Import ' + goal + ' ' + proof.rsplit('.', 1)[0] + '.',
                  f'Module ActualStrategy{i} : {goal}.{unit["module_type"]} := {proof}.']
        lines += [f'Print Assumptions ActualStrategy{i}.{field}.' for field in unit['fields']]
    return '\n'.join(lines) + '\n'


def check_c_closure(case, units, texts):
    root = next(p for p in case.parents if (p / '.git').exists())
    source = root / 'verification/qcp/verified/f32-vadd/proof/coverage.py'
    spec = importlib.util.spec_from_file_location('case_identity_coverage', source)
    coverage = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(coverage)
    coverage.C_KEYWORDS.add('return')
    declarations, definitions, calls, body_tokens = {}, {}, set(), {}
    for u in units:
        text = texts[u['stem']]
        actual = []
        for name, signature, contract, edges in coverage._functions(text, u['label']):
            pair = signature, contract
            require(name not in declarations or declarations[name] == pair, 'Conflicting C signature/contract: ' + name)
            declarations[name] = pair
            actual.append({'name': name, 'definition': edges is not None,
                           'signature_sha256': hashlib.sha256(repr(signature).encode()).hexdigest(),
                           'contract_sha256': hashlib.sha256(contract.encode()).hexdigest()})
            if edges is not None:
                definitions.setdefault(name, []).append(u['label'])
                calls.update(edges)
        require(actual == u['functions'], 'CPP declarations differ from recorded bindings: ' + u['label'])
        masked = coverage._mask_comments(text)
        end = 0
        for match in coverage.FUNCTION.finditer(masked):
            if match.start() < end:
                continue
            start = match.end()
            while start < len(masked) and masked[start].isspace():
                start += 1
            if masked[start] != '{':
                continue
            depth, end = 1, start + 1
            while depth and end < len(masked):
                depth += (masked[end] == '{') - (masked[end] == '}')
                end += 1
            tokens = re.findall(r'\w+|[^\s\w]', masked[start:end])
            name = match.group(1)
            require(name not in body_tokens or body_tokens[name] == tokens, 'Different actual C bodies share a declaration: ' + name)
            body_tokens[name] = tokens
    require(not set(declarations) - set(definitions) and not calls - set(definitions), 'Fresh actual C call closure has a hole')
    return definitions


def validate(case, run, h, full):
    """Validate every archived input, ordinary compilation, typed alias and Print result."""
    require(full.get('passed') and full.get('whole_kernel_verified') and full.get('no_component_vo_reused') and full.get('scope') == 'full', 'Complete fresh full proof required')
    require((run / 'status.json').read_bytes() == (case / 'proof/full-status.json').read_bytes(), 'Primary certificate differs')
    counts = EXPECTED[case.name]
    units, strategies, closure = full['actual_c_units'], full['strategies'], full['call_closure']
    require((len(units), sum(u['c_vcs'] for u in units), closure['unique_c_functions_with_bodies'], sum(len(s['fields']) for s in strategies), len(strategies)) == counts, 'Full accounting differs from reviewed inventory')
    require((full['checked_c_units'], full['checked_c_vcs'], full['checked_strategy_fields']) == (counts[0], counts[1], counts[3]), 'Summary counts differ')
    require(not closure['unbound_callees'] and not closure['declarations_without_checked_body'] and closure['exact_contract_and_signature_match'], 'Actual C closure incomplete')
    require(set(h['whole_kernel_bodies_required']) <= set(closure['definitions']), 'Missing whole kernel/caller body')
    require(full['input_sha256'] == h['frozen_source_sha256'], 'Full inputs differ from H')
    require(full['limits'] == h['limits'], 'Scope limits differ from frozen H')
    expected_units = {u['stem']: u for u in h['units']}
    require(len(expected_units) == len(units) and len({u['label'] for u in units}) == len(units), 'Duplicate/missing unit')
    for u in units:
        wanted = expected_units[u['stem']]
        for k in ['fields', 'cpp_sha256', 'goal_sha256']:
            require(u[k] == wanted[k], 'H/unit mismatch: ' + u['stem'] + ' ' + k)
        require(u['checked_module'] == wanted['typed_instance'] and u['c_vcs'] == len(u['fields']), 'Unit interface mismatch')
        bodies = [f['name'] for f in u['functions'] if f['definition']]
        require(sorted(bodies) == sorted(wanted['functions_defined']), 'Body inventory mismatch')
    expected_strategies = {(u['namespace'], Path(u['file']).stem): u for u in h['strategies']}
    require(len(expected_strategies) == len(strategies), 'Strategy inventory duplicates')
    for u in strategies:
        wanted = expected_strategies[(u['namespace'], u['stem'])]
        require(u['fields'] == wanted['fields'] and u['goal_sha256'] == wanted['goal_sha256'] and u['checked_module'] == wanted['typed_instance'], 'Strategy interface mismatch')
    records, compiled = full['records'], full['compiled_source_sha256']
    require(records and all(r['exit_code'] == 0 for r in records), 'Failed full execution record')
    require(len({r['label'] for r in records}) == len(records), 'Duplicate execution labels')
    coq_records = [r for r in records if 'coqc' in r['command']]
    require(len(compiled) + 1 == len(coq_records) == full['fresh_compiled_local_modules'], 'Fresh compilation count mismatch')
    # Each ordinary compiler invocation has exactly one final .v argument.
    # Index once rather than repeatedly constructing paths for every flag of
    # every compilation while validating every source.
    coq_by_source = {}
    for record in coq_records:
        target = record['command'][-1]
        require(isinstance(target, str) and target.endswith('.v'), 'Missing ordinary compiler source argument')
        coq_by_source.setdefault(target, []).append(record)
    for record in records:
        require(sha(run / (record['label'] + '.log')) == record['log_sha256'], 'Execution log changed: ' + record['label'])
    for name, digest in compiled.items():
        namespace, stem = name.rsplit('.', 1)
        path = run / 'coq' / (namespace.replace('.', '/') if namespace else 'relations') / (stem + '.v')
        require(sha(path) == digest, 'Compiled source changed: ' + name)
        matching = coq_by_source.get(str(Path(full['run_directory']) / path.relative_to(run)), [])
        require(len(matching) == 1, 'Missing/duplicate ordinary compile command: ' + name)
    require((run / 'FinalCaseCheck.v').read_text() == final_source(full), 'Final typed/Print gate source differs from full inventory')
    require(sha(run / 'FinalCaseCheck.v') == full['final_gate_sha256'], 'Final gate changed')
    log = run / 'FinalCaseCheck.log'
    require(sha(log) == full['final_assumptions_log_sha256'], 'Final execution log changed')
    text = log.read_text()
    raw_names = set(re.findall(r'^([A-Za-z_]\w*(?:\.\w+)*)\s*:', text, re.M)) - {'Axioms'}
    # Coq may shorten imported declarations in Print Assumptions. Accept only
    # unique basenames of the same reviewed inherited whitelist, never silently
    # discard an unqualified declaration or add another allowed assumption.
    basenames = {}
    for canonical in ALLOWED:
        basenames.setdefault(canonical.rsplit('.', 1)[-1], set()).add(canonical)
    names, unresolved = set(), set()
    for printed in raw_names:
        if printed in ALLOWED:
            names.add(printed)
        elif printed in {'Snaive_C_Rules64.eval_addr',
                         'SimpleC.SL.SeparationLogic.Snaive_C_Rules64.eval_addr'}:
            # Locate confirms these spellings denote the same inherited constant.
            names.add('SeparationLogic.Snaive_C_Rules64.eval_addr')
        elif '.' not in printed and len(basenames.get(printed, set())) == 1:
            names.update(basenames[printed])
        else:
            unresolved.add(printed)
    require(not unresolved, 'Unreviewed assumptions; ask root to review: ' + repr(sorted(unresolved)))
    prints = counts[1] + counts[3]
    require(len(re.findall(r'^(?:Axioms:|Closed under the global context)', text, re.M)) == prints, 'Final Print output inventory incomplete')
    root = next(p for p in case.parents if (p / '.git').exists())
    base = root / 'verification/qcp/verified/f32-vadd'
    require(sha(base / 'proof/manifest.json') == full['dependency_manifest_sha256'], 'BASE manifest changed')
    baseline = read(base / 'proof/manifest.json')
    for item in baseline['files']:
        require(sha(base / item['path']) == item['sha256'], 'BASE input changed: ' + item['path'])
    for item in baseline['modules']:
        require((base / 'proof' / item['path']).read_bytes() == (run / item['path']).read_bytes(), 'BASE compiled source differs: ' + item['path'])
    for name in h['own_modules']:
        if not name.endswith('_goal'):
            require(sha(case / 'proof/coq' / (name + '.v')) == compiled[h['namespace'] + '.' + name], 'Public Coq differs from compiled source: ' + name)
    historical_run = Path(full['run_directory'])
    artifacts = []
    for u in units:
        folder = run / 'units' / u['stem']
        cpp = folder / 'expanded.c'
        goal = run / Path(u['fresh_goal_path']).relative_to(historical_run)
        require(sha(cpp) == u['cpp_sha256'] and sha(goal) == u['goal_sha256'], 'Actual CPP/goal artifact changed: ' + u['label'])
        artifacts += [(cpp, Path('units') / u['label'].replace('/', '-') / 'expanded.c'),
                      (goal, Path('units') / u['label'].replace('/', '-') / 'goal.v')]
    definitions = check_c_closure(case, units, {u['stem']: (run / 'units' / u['stem'] / 'expanded.c').read_text() for u in units})
    require(definitions == closure['definitions'], 'Reconstructed actual body providers differ')
    return {'inherited_assumption_names': sorted(names), 'print_commands': prints}, artifacts


def issue(case, run, h, full, audit, artifacts, identities):
    check_hashes(case, full['input_sha256'], 'Immediately before certificate issue')
    here, archive = case / 'proof', case / 'proof/evidence/full-run'
    preserve(here / 'full-status.json', archive / 'status.json')
    preserve(here / 'frozen-full-handoff.json', archive / 'frozen-full-handoff.json')
    for relative in full['input_sha256']:
        if relative.endswith('-status.json'):
            safe = Path(relative) if '..' not in Path(relative).parts else Path('__repo__') / (case / relative).resolve().relative_to(next(p for p in case.parents if (p / '.git').exists()))
            preserve(case / relative, archive / 'component-status' / safe)
    for record in full['records']:
        preserve(run / (record['label'] + '.log'), archive / 'logs' / (record['label'] + '.log'))
    for src, dest in artifacts:
        preserve(src, archive / dest)
    for name in full['compiled_source_sha256']:
        namespace, stem = name.rsplit('.', 1)
        rel = Path('coq') / (namespace.replace('.', '/') if namespace else 'relations') / (stem + '.v')
        preserve(run / rel, archive / rel)
    for name in ['FinalCaseCheck.v', 'FinalCaseCheck.log', 'dependencies.mk', 'coqdep.log']:
        if (run / name).exists():
            preserve(run / name, archive / name)
    audit.update(passed=True, kind='complete_final_print_assumptions_inventory', full_status_sha256=sha(here / 'full-status.json'), new_project_axioms_observed=False)
    audit_path = here / 'assumption-audit.json'
    encoded = json.dumps(audit, indent=2) + '\n'
    if audit_path.exists():
        require(audit_path.read_text() == encoded, 'Existing assumption inventory differs')
    else:
        audit_path.write_text(encoded)
    for name in ['status.json', 'manifest.json']:
        p = here / name
        if p.exists():
            old = read(p)
            require(not old.get('whole_kernel_verified', old.get('whole_kernel_proved', False)), 'Already issued certificate: refuse overwrite')
            preserve(p, here / 'evidence/candidate-history' / (p.stem + '-' + sha(p) + '.json'))
    files = []
    for p in sorted(case.rglob('*')):
        rel = p.relative_to(case)
        if (not p.is_file() or any(v in {'.build', '__pycache__'} for v in rel.parts)
                or p in {here / 'status.json', here / 'manifest.json'}
                or p.suffix in {'.vo', '.vos', '.vok', '.glob', '.pyc', '.aux'}):
            continue
        files.append({'path': str(rel), 'sha256': sha(p)})
    manifest = {'schema': 2, 'kernel': case.name, 'variant': 'repaired', 'whole_kernel_proved': True,
                'files': files, 'originals': read(here / 'originals.json'), 'repair': read(here / 'repair.json'),
                'full_evidence': 'proof/evidence/full-run/status.json', 'full_evidence_sha256': sha(here / 'full-status.json'),
                'generated_source_policy': 'Byte-preserved original logs, CPP, goals and every compiled local .v; no .vo archive. Fresh replay regenerates goals and recompiles local source.'}
    (here / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    status = {'schema': 2, 'kernel': case.name, 'scope': 'full', 'status': 'proved', 'passed': True,
              'whole_kernel_verified': True, 'whole_kernel_proved': True, 'implementation_variant': 'repaired',
              'verification_scope': 'Complete actual C-shim closure and public observation caller; partial correctness under explicit memory and fixed-configuration contracts.',
              'checked_c_units': full['checked_c_units'], 'checked_c_vcs': full['checked_c_vcs'],
              'checked_strategy_fields': full['checked_strategy_fields'], 'ordinary_modules_including_final': full['fresh_compiled_local_modules'],
              'unique_c_functions_with_bodies': full['call_closure']['unique_c_functions_with_bodies'],
              'unit_vc_counting': 'Translation-unit VC_Correct fields; not unique semantic obligations or additional kernels.',
              'full_evidence': 'full-status.json', 'full_evidence_sha256': sha(here / 'full-status.json'),
              'immutable_full_archive': 'evidence/full-run/status.json', 'manifest_sha256': sha(here / 'manifest.json'),
              'native_evidence': identities['native'], 'repair_evidence_sha256': sha(here / 'repair.json'),
              'assumption_audit_sha256': sha(audit_path), 'inherited_assumption_names': audit['inherited_assumption_names'],
              'limits': full['limits'], 'remaining': [], 'verified_manifest_changed': False, 'formal_proof_replayed_by_writer': False}
    (here / 'status.json').write_text(json.dumps(status, indent=2) + '\n')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof-run', type=Path)
    parser.add_argument('--preflight', action='store_true', help='Only current original/patch/native checks; no certificate or archive writes')
    parser.add_argument('--dry-run', action='store_true', help='Validate complete proof and identities without issuing any public metadata')
    args = parser.parse_args()
    case = Path(__file__).resolve().parent.parent
    require(case.name in EXPECTED, 'Unknown case')
    (case / '.build').mkdir(exist_ok=True)
    work = Path(tempfile.mkdtemp(prefix='record-preflight-', dir=case / '.build'))
    report = {'passed': False, 'formal_proof_replayed': False, 'certificate_issued': False, 'directory': str(work)}
    try:
        hp = case / 'proof/frozen-full-handoff.json'
        h = read(hp) if hp.exists() else None
        identities = identity(case, work, h)
        report['identity'] = identities
        if not args.preflight:
            require(h is not None, 'Missing frozen full handoff')
            full = read(case / 'proof/full-status.json')
            run = args.proof_run.resolve() if args.proof_run else locate(case, full['run_directory'])
            audit, artifacts = validate(case, run, h, full)
            if not args.dry_run:
                issue(case, run, h, full, audit, artifacts, identities)
                report['certificate_issued'] = True
        report['passed'] = True
    except Exception as error:
        report['error'] = str(error)
    (work / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report, indent=2))
    return 0 if report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
