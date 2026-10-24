#!/usr/bin/env python3
"""Validate/archive one completed full gate. --preflight never issues a certificate.

No proof is replayed, no object is copied, and no global manifest is edited.
All historical bytes/paths remain intact. New assumption names require review.
"""
import argparse
import gzip
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
EXPECTED = {'qu8-rdsum'}


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


def execution_receipt(case, path):
    data = read(case / path)
    require(data.get('passed'), 'Incomplete support receipt: ' + path)
    check_hashes(case, data['input_sha256'], path)
    primary = locate(case, data['run_directory'])
    for rec in data['records']:
        label = rec.get('label', rec.get('module'))
        log = primary / (label + '.log')
        require(sha(log) == rec['log_sha256'], 'Support log changed: ' + path + '/' + label)
    return data


def identity(case, work, h=None):
    here=case/'proof'
    originals=read(here/'originals.json');repair=read(here/'repair.json')
    require(repair['variant']=='both-sides-repaired-neon-loop-compatible-v2','Unexpected repair variant')
    require(repair['semantic_repair_not_original_proof'],'Original correctness must not be claimed')
    root=next(p for p in case.parents if (p/'.git').exists())
    patch_records=[]
    for side,cap in [('neon','NEON'),('rvv','RVV')]:
        item=repair['sides'][side]; retained=case/'proof/original'/('test'+cap+'.c')
        require(sha(retained)==originals['files'][side]['sha256']==item['original_sha256'],'Original identity '+side)
        require(sha(root/originals['files'][side]['path'])==sha(retained),'Repository original identity '+side)
        require(sha(case/item['patch'])==item['patch_sha256'],'Exact repair patch identity '+side)
        patched=work/('repair-'+side);patched.mkdir()
        targets=re.findall(r'^\+\+\+ b/(\S+)',(case/item['patch']).read_text(),re.M)
        require(len(targets)==1,'Exactly one repair target required')
        relative=Path(targets[0]);require(not relative.is_absolute() and '..' not in relative.parts,'Repair target escapes isolated directory')
        target=patched/relative;target.parent.mkdir(parents=True,exist_ok=True)
        shutil.copyfile(retained,target)
        record=execute(['patch','--batch','--fuzz=0','-p1','-i',str(case/item['patch'])],patched,work/('repair-'+side+'.log'))
        require(sha(target)==sha(case/'impl'/retained.name)==item['actual_sha256'],'Zero-fuzz repair differs '+side)
        patch_records.append(record)
    counter_path=repair['original_counterexamples'];counter=read(case/counter_path)
    require(counter['counterexample_observed'],'Original semantic witnesses missing')
    witness=counter['large_rows_counterexample']
    require(witness['rows']==2147483648 and witness['stride']==0 and witness['both_equal_but_wrong'],'Independent large-row original witness missing')
    check_hashes(case,counter['source_sha256'],'Original counterexample inputs')
    expected={'compile':0,'large-rows-oracle':0}
    require({r['label']:r['exit_code'] for r in counter['records']}==expected,'Original counterexample execution inventory differs')
    primary=locate(case,counter['run_directory'])
    for rec in counter['records']:
        require(sha(primary/(rec['label']+'.log'))==rec['log_sha256'],'Original counterexample log changed')
    native_records=[]
    for path in ['proof/formal-native-status.json','proof/native-asan-status.json']:
        data=execution_receipt(case,path)
        require(data['actual_c_units']==36 and data['cases']==11664 and data['lanes_per_side']==269730 and data['failures']==0,'Native current unit/coverage accounting differs')
        require(data['primitive_oracle_cases']==109824 and data['primitive_oracle_lanes']==1647360,'Independent helper oracle omitted')
        primary=locate(case,data['run_directory'])
        for label in ['negative-one','negative-both']:
            rec=next(r for r in data['records'] if r['label']==label)
            require(rec['exit_code']==rec['expected_exit']==2,'Wrong-result control was not rejected')
        require('negative comparator=1' in (primary/'negative-both.log').read_text(),'Both-wrong equality control missing')
        if path.endswith('native-asan-status.json'):
            require(data['ASan_UBSan'] and data['shared_wrong_result_rejected'] and data['actual_memory_max']==17179869184 and data['actual_memory_swap_max']==0,'Actual sanitizer cgroup missing')
            for label in ['native','negative-one','negative-both']:
                text=(primary/(label+'.log')).read_text()
                require('"actual_memory_max": "17179869184"' in text and '"actual_memory_swap_max": "0"' in text,'Runtime cgroup observation omitted')
        native_records.append({'path':path,'sha256':sha(case/path),'checked_input_files':len(data['input_sha256'])})
    width=execution_receipt(case,'proof/type-width-status.json')
    require(width['actual_C_width_fields']==13 and width['formal_size_t_unsigned_bits']==width['native_size_t_unsigned_bits']==64,'Actual sizeof/unsigned64 projection differs')
    require(width['no_component_objects_reused'] and width['full_unsigned_value_domain']=='0..18446744073709551615','Width proof/value-domain scope differs')
    native_records.append({'path':'proof/type-width-status.json','sha256':sha(here/'type-width-status.json'),'checked_input_files':len(width['input_sha256'])})
    if h:
        check_hashes(case,h['frozen_source_sha256'],'Frozen full sources')
        require(h['native_status']=='proof/formal-native-status.json' and sha(here/'formal-native-status.json')==h['native_status_sha256'],'Frozen native identity differs')
        require('proof/native-asan-status.json' in h['frozen_source_sha256'],'ASan receipt not frozen')
    return {'formal_proof_replayed':False,'patch_fuzz':0,'patches':patch_records,'native':native_records,'original_counterexamples':counter_path,'handoff_available':h is not None}



def interface_source(full):
    ns = full['actual_c_units'][0]['namespace']
    lines = ['From ' + ns + ' Require Import ' + ' '.join(full['mathematical_roots']) + '.']
    for i, u in enumerate(full['actual_c_units']):
        goal, proof = u['namespace'] + '.' + u['stem'] + '_goal', u['checked_module']
        lines += ['Require Import ' + goal + ' ' + proof.rsplit('.', 1)[0] + '.',
                  f'Module ActualUnit{i} : {goal}.VC_Correct := {proof}.']
    for i, u in enumerate(full['strategies']):
        goal, proof = u['namespace'] + '.' + u['stem'] + '_strategy_goal', u['checked_module']
        lines += ['Require Import ' + goal + ' ' + proof.rsplit('.', 1)[0] + '.',
                  f'Module ActualStrategy{i} : {goal}.{u["module_type"]} := {proof}.']
    return '\n'.join(lines) + '\n'


def final_source(full):
    ns = full['actual_c_units'][0]['namespace']
    names = [f'AssumptionsPart{i:02}' for i in range(16)]
    lines = ['From ' + ns + ' Require Import UnitInterfaces ' + ' '.join(names) + '.']
    lines += [f'Module ActualUnit{i} : {ns}.{u["stem"]}_goal.VC_Correct := {ns}.UnitInterfaces.ActualUnit{i}.' for i, u in enumerate(full['actual_c_units'])]
    lines += [f'Module ActualStrategy{i} : {ns}.{u["stem"]}_strategy_goal.{u["module_type"]} := {ns}.UnitInterfaces.ActualStrategy{i}.' for i, u in enumerate(full['strategies'])]
    return '\n'.join(lines) + '\n'


def raw_goal(run, full, u):
    value = Path(u.get('raw_goal_path', u['fresh_goal_path']))
    if value.is_absolute():
        value = value.relative_to(Path(full['run_directory']))
    require('..' not in value.parts, 'Goal path escapes completed run')
    return run / value


def preserve_artifact(source, target):
    if target.suffix != '.gz':
        preserve(source, target)
        return
    target.parent.mkdir(parents=True, exist_ok=True)
    if not target.exists():
        with source.open('rb') as inp, target.open('xb') as output:
            with gzip.GzipFile(fileobj=output, filename='', mode='wb', mtime=0) as zipped:
                shutil.copyfileobj(inp, zipped)
    digest = hashlib.sha256()
    with gzip.open(target, 'rb') as inp:
        for block in iter(lambda: inp.read(1048576), b''):
            digest.update(block)
    require(digest.hexdigest() == sha(source), 'Lossless raw goal archive differs')


def check_c_closure(case, units, texts):
    root = next(p for p in case.parents if (p / '.git').exists())
    source = case / 'proof/coverage.py'
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
    require(full['handoff_sha256'] == sha(case / 'proof/frozen-full-handoff.json'), 'Frozen handoff identity differs')
    counts = (len(h['units']), h['total_actual_c_vcs'], h['actual_c_function_count'],
              sum(len(u['fields']) for u in h['strategies']), len(h['strategies']))
    units, strategies, closure = full['actual_c_units'], full['strategies'], full['call_closure']
    require((len(units), sum(u['c_vcs'] for u in units), closure['unique_c_functions_with_bodies'], sum(len(s['fields']) for s in strategies), len(strategies)) == counts, 'Full accounting differs from reviewed inventory')
    require((full['checked_c_units'], full['checked_c_vcs'], full['checked_strategy_fields']) == (counts[0], counts[1], counts[3]), 'Summary counts differ')
    require(not closure['unbound_callees'] and not closure['declarations_without_checked_body'] and closure['exact_contract_and_signature_match'], 'Actual C closure incomplete')
    require(set(h['whole_kernel_bodies_required']) <= set(closure['definitions']), 'Missing whole kernel/caller body')
    require(full['input_sha256'] == h['frozen_source_sha256'], 'Full inputs differ from H')
    require(full['limits'] == h['limits'], 'Scope limits differ from frozen H')
    require(full['mathematical_roots'] == h['mathematical_roots'] == ['FrontendBridge','LoopCompatibility','ControlLoopFacts','MemoryAliasFacts'], 'Source composition/control/compatibility mathematical roots differ')
    external=full['external_recursive_vo_closure']
    require(external and all(not n.startswith(h['namespace']+'.') for n in external),'External library identity inventory missing')
    require(read(run/'external-dependencies.json')==external,'Archived external closure identity differs')
    for name,item in external.items():
        require(sha(Path(item['path']))==item['sha256'],'External dependency changed: '+name)
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
    for u in strategies:
        key = u['namespace'] + '.' + u['stem'] + '_strategy_goal'
        require(compiled[key] == u['goal_sha256'], 'Fresh strategy source differs from actual generator')
    require(records and all(r['exit_code'] == 0 for r in records), 'Failed full execution record')
    require(len({r['label'] for r in records}) == len(records), 'Duplicate execution labels')
    coq_records = [r for r in records if 'coqc' in r['command']]
    require(all(not set(r['command']) & {'-vos', '-vok', '-quick'} for r in coq_records), 'Ordinary complete Coq compilation required')
    require(len(compiled) == len(coq_records) == full['fresh_compiled_local_modules'], 'Fresh compilation count mismatch')
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
        require(path.stat().st_size < 95000000, 'Compiled source exceeds publication limit; use audited exact projection: ' + name)
        matching = coq_by_source.get(str(Path(full['run_directory']) / path.relative_to(run)), [])
        require(len(matching) == 1, 'Missing/duplicate ordinary compile command: ' + name)
    ns = h['namespace']
    require((run / 'coq' / ns / 'UnitInterfaces.v').read_text() == interface_source(full), 'Whole-unit typed source differs')
    require((run / 'FinalCaseCheck.v').read_text() == final_source(full), 'Final typed gate differs')
    require(sha(run / 'FinalCaseCheck.v') == full['final_gate_sha256'], 'Final typed gate changed')
    require(full['final_assumptions_log_path'] == 'FinalAssumptions.log', 'Unexpected assumption log path')
    parts = full['assumption_parts']
    require(len(parts) == 16 and [p['module'] for p in parts] == [ns + f'.AssumptionsPart{i:02}' for i in range(16)], 'Missing/duplicate parallel assumption module')
    report_groups, logs = [], []
    for i, part in enumerate(parts):
        path = run / part['source_path']
        require(sha(path) == part['source_sha256'] == compiled[part['module']], 'Assumption source differs')
        lines = path.read_text().splitlines()
        require(lines[0] == 'From ' + ns + ' Require Import UnitInterfaces.', 'Assumption imports differ')
        commands = lines[1:]
        require(all(re.fullmatch(r'Print Assumptions [A-Za-z_]\w*(?:\.\w+)+\.', c) for c in commands), 'Unexpected assumption command')
        log_bytes = (run / f'AssumptionsPart{i:02}.log').read_bytes()
        require(hashlib.sha256(log_bytes).hexdigest() == part['log_sha256'], 'Assumption part log changed')
        require(len(commands) == part['reports'] == len(re.findall(rb'^(?:Axioms:|Closed under the global context)', log_bytes, re.M)), 'Assumption report omitted')
        report_groups.append(commands)
        logs.append(log_bytes)
    reports = [group[r] for r in range(max(map(len, report_groups))) for group in report_groups if r < len(group)]
    wanted = [f'Print Assumptions {ns}.UnitInterfaces.ActualUnit{i}.proof_of_{f}.' for i, u in enumerate(units) for f in u['fields']]
    wanted += [f'Print Assumptions {ns}.UnitInterfaces.ActualStrategy{i}.{f}.' for i, u in enumerate(strategies) for f in u['fields']]
    require(reports[:len(wanted)] == wanted, 'Actual C/strategy Print inventory differs')
    math = []
    for name in compiled:
        namespace, stem = name.rsplit('.', 1)
        path = run / 'coq' / namespace.replace('.', '/') / (stem + '.v')
        for lemma in re.findall(r'^Lemma\s+((?:rd_|rs_|s8_|byte_)\w+)\s*:', path.read_text(), re.M):
            if 'strategy' not in lemma:
                math.append('Print Assumptions ' + name + '.' + lemma + '.')
    actual_math = reports[len(wanted):]
    require(len(actual_math) == len(set(actual_math)) and set(actual_math) == set(math), 'Mathematical support Print inventory differs')
    require(len(actual_math) == full['mathematical_support_reports'] and len(reports) == full['assumption_reports'], 'Assumption report totals differ')
    log = run / 'FinalAssumptions.log'
    require(log.read_bytes() == b''.join(logs) and sha(log) == full['final_assumptions_log_sha256'], 'Combined assumption bytes differ')
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
    prints = full['assumption_reports']
    require(len(re.findall(r'^(?:Axioms:|Closed under the global context)', text, re.M)) == prints, 'Final Print output inventory incomplete')
    for name in h['own_modules']:
        if name not in h['generated_modules']:
            require(sha(case / 'proof/coq' / (name + '.v')) == compiled[h['namespace'] + '.' + name], 'Public Coq differs from compiled source: ' + name)
    historical_run = Path(full['run_directory'])
    artifacts = []
    for u in units:
        folder = run / 'units' / u['stem']
        cpp = folder / 'expanded.c'
        goal = raw_goal(run, full, u)
        facade = run / Path(u['fresh_goal_path']).relative_to(historical_run)
        require(sha(cpp) == u['cpp_sha256'] and sha(goal) == u['goal_sha256'], 'Actual CPP/raw goal changed: ' + u['label'])
        require(sha(facade) == u['compiled_goal_sha256'] == compiled[u['namespace'] + '.' + u['stem'] + '_goal'], 'Compiled facade identity differs')
        raw_fields = re.findall(r'^Axiom proof_of_(\w+)\s*:', goal.read_text(), re.M)
        require(raw_fields == u['fields'], 'Original VC_Correct field inventory differs')
        audit_module = importlib.util.spec_from_file_location('case_return_ownership', case / 'proof/audit_return_ownership.py')
        audit_impl = importlib.util.module_from_spec(audit_module); audit_module.loader.exec_module(audit_impl)
        audit_impl.require_clean(goal)
        if u.get('goal_projection_identity'):
            import split_goal
            projected = split_goal.audit(goal, facade.parent, u['namespace'], u['stem'])
            require(split_goal.identity(projected) == u['goal_projection_identity'] == expected_units[u['stem']]['goal_projection_identity'], 'Original raw/projection identity differs')
            for chunk in projected['chunks']:
                require(compiled[chunk['module']] == chunk['sha256'], 'Projected definition chunk not freshly compiled')
        else:
            require(goal.read_bytes() == facade.read_bytes(), 'Unprojected goal changed')
        artifacts += [(cpp, Path('units') / u['label'].replace('/', '-') / 'expanded.c'),
                      (goal, Path('units') / u['label'].replace('/', '-') / 'goal.v.gz')]
    definitions = check_c_closure(case, units, {u['stem']: (run / 'units' / u['stem'] / 'expanded.c').read_text() for u in units})
    require(definitions == closure['definitions'], 'Reconstructed actual body providers differ')
    return {'inherited_assumption_names': sorted(names), 'print_commands': prints, 'actual_C_and_strategy_prints': counts[1] + counts[3], 'mathematical_support_prints': full['mathematical_support_reports']}, artifacts


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
    # Preserve finite native logs and generated control source while the primary
    # run is available; native files do not substitute for a formal proof.
    for item in identities['native']:
        native = read(case / item['path'])
        preserve(case / item['path'], archive / 'native' / Path(item['path']).stem / 'status.json')
        primary = locate(case, native['run_directory'])
        if primary.exists():
            for rec in native.get('records', []):
                log = primary / (rec['label'] + '.log')
                if log.exists():
                    if 'log_sha256' in rec:
                        require(sha(log) == rec['log_sha256'], 'Native log changed: ' + rec['label'])
                    preserve(log, archive / 'native' / Path(item['path']).stem / log.name)
            for source in primary.glob('*.c'):
                preserve(source, archive / 'native' / Path(item['path']).stem / source.name)
    original_counter = read(case / identities['original_counterexamples'])
    original_run = locate(case, original_counter['run_directory'])
    if original_run.exists():
        for rec in original_counter['records']:
            log = original_run / (rec['label'] + '.log')
            if log.exists():
                require(sha(log) == rec['log_sha256'], 'Original counterexample log changed')
                preserve(log, archive / 'original-counterexamples' / log.name)
    for src, dest in artifacts:
        preserve_artifact(src, archive / dest)
    for name in full['compiled_source_sha256']:
        namespace, stem = name.rsplit('.', 1)
        rel = Path('coq') / (namespace.replace('.', '/') if namespace else 'relations') / (stem + '.v')
        preserve(run / rel, archive / rel)
    for name in ['FinalCaseCheck.v', 'FinalCaseCheck.log', 'FinalAssumptions.log', 'dependencies.mk', 'coqdep.log', 'external-dependencies.json', 'external-before.v', 'external-before-locations.v', 'external-after.v', 'external-after-locations.v']:
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
                'generated_source_policy': 'Original logs/CPP and every compiled local .v preserved. Complete original raw goals are lossless gzip with original uncompressed SHA identity; projected chunks/facades checked separately. No .vo archive.'}
    (here / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    status = {'schema': 2, 'kernel': case.name, 'scope': 'full', 'status': 'proved', 'passed': True,
              'whole_kernel_verified': True, 'whole_kernel_proved': True, 'implementation_variant': 'repaired',
              'verification_scope': 'Complete actual C-shim closure and public observation caller; partial correctness under explicit memory and fixed-configuration contracts.',
              'checked_c_units': full['checked_c_units'], 'checked_c_vcs': full['checked_c_vcs'],
              'checked_strategy_fields': full['checked_strategy_fields'], 'ordinary_modules_including_final': full['fresh_compiled_local_modules'], 'assumption_reports': full['assumption_reports'], 'mathematical_support_reports': full['mathematical_support_reports'],
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
