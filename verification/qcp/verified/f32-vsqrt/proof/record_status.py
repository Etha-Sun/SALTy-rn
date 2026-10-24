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
EXPECTED = {'f32-vsqrt': (9, 262, 15, 28, 11)}



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
    command=['prlimit','--as=17179869184:17179869184','--',*map(str,command)]
    result = subprocess.run(command, cwd=cwd, capture_output=True, text=True, timeout=180)
    log.write_text(result.stdout + result.stderr)
    require(result.returncode == 0, 'Command failed: ' + str(command) + '\n' + log.read_text()[-2000:])
    return {'command': list(map(str, command)), 'exit_code': result.returncode, 'log_sha256': sha(log)}


def identity(case, work, h=None):
    """Check both unchanged original kernels, pinned source identity and current native inputs."""
    here=case/'proof'
    spec=importlib.util.spec_from_file_location('sqrt_implementation_audit',here/'build_full_handoff.py')
    builder=importlib.util.module_from_spec(spec);spec.loader.exec_module(builder)
    commands=[]
    def replay(command,label):
        row=execute(list(map(str,command)),work,work/(label+'.log'));commands.append(row)
    implementations=builder.audit_implementations(work,replay)
    out={'implementation_variant':'original','repair_applied':False,'formal_proof_replayed':False,'implementations':implementations,'original_identity_commands':commands,'native':[]}
    if h is not None:
        require(h['namespace']=='Sqrt'and len(h['units'])==9,'Unreviewed H namespace/unit inventory')
        check_hashes(case,h['frozen_source_sha256'],'Frozen full handoff')
        require(implementations==h['implementations'],'Original implementation identity changed')
    path=here/'native-status.json';native=read(path)
    require(native.get('passed')is True and native.get('common_wrong_negative_control_rejected')is True and native.get('per_process_memory_GiB')==16,'Current native acceptance failed')
    require(native['independent_oracle']=='long double sqrtl then binary32 RNE; input-bit classification handles NaN/negative; ARM quiet payload and RVV canonical checked separately; finite evidence only','Independent native oracle changed')
    for mode in ['undefined','address']:
        require(native[mode+'_finite_counts']=={'cases':49536,'lanes_per_side':3219840},'Native finite coverage changed')
        control=native[mode+'_negative_control'];require(control['exit_code']==1 and control['both_wrong']!=control['oracle'],'Common-wrong oracle negative control missing')
    require(native['system_headers_in_inventory']is False and len(native['input_sha256'])==21,'Native recursive inventory missing')
    check_hashes(case,native['input_sha256'],'Native recursive current inputs')
    require(all(r['exit_code']==r.get('expected_exit_code',0)for r in native['records']),'Unexpected native execution status')
    run=locate(case,native['run_directory'])
    for record in native['records']:
        log=run/(record['label']+'.log')
        if not log.is_file():log=here/'evidence/native'/(record['label']+'.log')
        require(log.is_file()and sha(log)==record['log_sha256'],'Native historical/archive execution log missing or changed')
    if h is not None:
        require(sha(path)==h['native_status_sha256']and native['input_sha256']==h['native_input_sha256'],'Frozen native certificate changed')
        for key,value in h['native_required_values'].items():require(native[key]==value,'Native acceptance changed: '+key)
    out['native'].append({'path':'native-status.json','sha256':sha(path),'checked_input_files':len(native['input_sha256']),'system_headers_hashed':False})
    out['handoff_available']=h is not None
    return out


def gate_builder(case):
    path=case/'proof/gate_sources.py';spec=importlib.util.spec_from_file_location('validated_case_gates',path)
    result=importlib.util.module_from_spec(spec);spec.loader.exec_module(result);return result

def final_source(full,case):
    return gate_builder(case).final_source('Sqrt',full['actual_c_units'],full['strategies'])


def check_c_closure(case, units, texts):
    root = next(p for p in case.parents if (p / '.git').exists())
    source = case / 'proof/c_coverage.py'
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
    boundary=module('sqrt_record_intrinsic_specs',case/'proof/intrinsic_specs.py');boundary.check(case,declarations,definitions,calls)
    return definitions


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def ordinary_coq_records(records, historical_run):
    coq_records = [r for r in records if 'coqc' in r['command']]
    by_source = {}
    for record in coq_records:
        command = record['command']
        require(command[3:5] == ['qcp-env', 'coqc'], 'Expected ordinary qcp-env coqc execution')
        require(not any(arg.startswith(('-vos', '-vok', '-quick', '-vio')) for arg in command), 'Quick/unchecked Coq compilation mode is forbidden')
        target = command[-1]
        require(isinstance(target, str) and target.endswith('.v'), 'Missing ordinary compiler source argument')
        by_source.setdefault(target, []).append(record)
    final_records = by_source.get(str(Path(historical_run) / 'FinalCaseCheck.v'), [])
    require(len(final_records) == 1 and final_records[0]['label'] == 'FinalCaseCheck' and final_records[0]['exit_code'] == 0, 'Missing/duplicate successful ordinary final typed compilation')
    return coq_records, by_source


def validate(case, run, h, full):
    """Validate every archived input, ordinary compilation, typed alias and Print result."""
    require(full.get('passed') and full.get('whole_kernel_verified') and full.get('no_component_vo_reused') and full.get('scope') == 'full', 'Complete fresh full proof required')
    require((run / 'status.json').read_bytes() == (case / 'proof/full-status.json').read_bytes(), 'Primary certificate differs')
    require(full['handoff_sha256'] == sha(case / 'proof/frozen-full-handoff.json'), 'Executed handoff hash differs from current immutable H')
    require(full['parallel_jobs']==32 and full['ordinary_max_live_processes']==16 and full['ordinary_pool_memory_ceiling_GiB']==256,'Unreviewed ordinary execution pool')
    counts = EXPECTED[case.name]
    units, strategies, closure = full['actual_c_units'], full['strategies'], full['call_closure']
    require((len(units), sum(u['c_vcs'] for u in units), closure['unique_c_functions_with_bodies'], sum(len(s['fields']) for s in strategies), len(strategies)) == counts, 'Full accounting differs from reviewed inventory')
    require((full['checked_c_units'], full['checked_c_vcs'], full['checked_strategy_fields']) == (counts[0], counts[1], counts[3]), 'Summary counts differ')
    require(not closure['unbound_callees'] and not closure['declarations_without_checked_body'] and closure['exact_contract_and_signature_match'], 'Ordinary actual C closure incomplete');boundary=module('sqrt_issuer_intrinsic_specs',case/'proof/intrinsic_specs.py');require(closure['intrinsic_spec_declarations']==h['intrinsic_spec_declarations']==boundary.records(case) and closure['intrinsic_spec_declarations_without_c_body']==closure['intrinsic_spec_callees']==sorted(boundary.EXPECTED) and closure['intrinsic_spec_body_credit']is False,'Intrinsic boundary differs')
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
    external_tool = module('sqrt_record_external', case / 'proof/external_dependencies.py')
    external_audit = external_tool.validate_external(case, run, full, require)
    require(records and all(r['exit_code'] == 0 for r in records), 'Failed full execution record')
    require(len({r['label'] for r in records}) == len(records), 'Duplicate execution labels')
    coq_records, coq_by_source = ordinary_coq_records(records, full['run_directory'])
    require(len(compiled) + 1 == len(coq_records) == full['fresh_compiled_local_modules'], 'Fresh compilation count mismatch')
    for record in records:
        memory = record.get('memory_limit_GiB')
        require(memory in {16, 32} and isinstance(record.get('timeout_seconds'), int) and 0 < record['timeout_seconds'] <= 21600, 'Unreviewed execution budget')
        limit = str(memory * 1024 ** 3)
        require(record['command'][:3] == ['prlimit', '--as=' + limit + ':' + limit, '--'], 'Execution resource guard differs')
        require(sha(run / (record['label'] + '.log')) == record['log_sha256'], 'Execution log changed: ' + record['label'])
    for name, digest in compiled.items():
        namespace, stem = name.rsplit('.', 1)
        path = run / 'coq' / (namespace.replace('.', '/') if namespace else 'relations') / (stem + '.v')
        require(sha(path) == digest, 'Compiled source changed: ' + name)
        matching = coq_by_source.get(str(Path(full['run_directory']) / path.relative_to(run)), [])
        require(len(matching) == 1, 'Missing/duplicate ordinary compile command: ' + name)
    dep=read(run/'coqdep-status.json');require(dep==full['coqdep_record']and dep['exit_code']==0,'coqdep execution differs')
    require(dep['stdout_sha256']==sha(run/'dependencies.mk')and dep['stderr_sha256']==sha(run/'coqdep.log'),'coqdep output changed')
    require(dep['command'][:4]==['prlimit','--as=17179869184:17179869184','--','qcp-env']and dep['command'][4]=='coqdep','coqdep resource/tool command differs')
    require(set(v for v in dep['command']if v.endswith('.v'))==set(str(Path(full['run_directory'])/'coq'/(ns.replace('.','/')if ns else 'relations')/(stem+'.v'))for ns,stem in (n.rsplit('.',1)for n in compiled)),'coqdep source inventory differs')
    require((run / 'FinalCaseCheck.v').read_text() == final_source(full,case), 'Final typed/Print gate source differs from full inventory')
    require(sha(run / 'FinalCaseCheck.v') == full['final_gate_sha256'], 'Final gate changed')
    require(full.get('assumptions_audit_mode')=='parallel16_exact_partition','Unexpected assumption audit mode')
    builder=gate_builder(case);expected_constants=[]
    for i,unit in enumerate(units):expected_constants += ['Sqrt.CaseTyped.ActualUnit'+str(i)+'.proof_of_'+field for field in unit['fields']]
    for i,unit in enumerate(strategies):expected_constants += ['Sqrt.CaseTyped.ActualStrategy'+str(i)+'.'+field for field in unit['fields']]
    require(len(expected_constants)==len(set(expected_constants))==counts[1]+counts[3],'Print field inventory duplicates')
    parts=full['assumption_audit_parts'];require(len(parts)==16 and [v['index']for v in parts]==list(range(16)),'Missing audit partitions')
    expected_sources=builder.sources('Sqrt',units,strategies)
    for name,text in expected_sources.items():require((run/'coq/Sqrt'/(name+'.v')).read_text()==text,'Generated audit/typed source differs: '+name)
    raw_reports=[]
    for part in parts:
        i=part['index'];name='CaseAssumptions'+str(i);require(part['namespace']=='Sqrt'and part['module']==name and part['constants']==expected_constants[i::16],'Audit leaf constants differ')
        require(part['report_count']==len(expected_constants[i::16]),'Audit report count differs')
        require(part['source_sha256']==sha(run/'coq/Sqrt'/(name+'.v')),'Audit source changed')
        require(part['log_label']=='Sqrt-'+name,'Audit compiler record binding differs')
        p=run/(part['log_label']+'.log');require(sha(p)==part['log_sha256'],'Audit leaf log changed')
        t=p.read_text();require(t.count('Axioms:')+t.count('Closed under the global context')==part['report_count'],'Missing/duplicate leaf Print result')
        raw_reports.append(p.read_bytes())
    require(full['final_assumptions_log']=='AssumptionsReport.log','Unreviewed final report path')
    log = run / 'AssumptionsReport.log'
    require(log.read_bytes()==b''.join(raw_reports),'Aggregate assumption report differs from actual compiler logs')
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
    for filename in ['external-before.v', 'external-before-locations.v', 'external-after.v', 'external-after-locations.v', 'external-dependencies.json']:
        artifacts.append((run / filename, Path('external') / filename))
    return {'inherited_assumption_names': sorted(names), 'print_commands': prints, 'library_origin_audit': external_audit}, artifacts


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
    for name in ['FinalCaseCheck.v', 'FinalCaseCheck.log', 'AssumptionsReport.log', 'dependencies.mk', 'coqdep.log', 'coqdep-status.json']:
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
    native=read(here/'native-status.json');native_run=locate(case,native['run_directory'])
    for source in sorted(native_run.iterdir()):
        if source.is_file()and(source.suffix in {'.log','.c','.make'}or source.name=='status.json'):
            preserve(source,here/'evidence/native'/source.name)
    files = []
    for p in sorted(case.rglob('*')):
        rel = p.relative_to(case)
        if (not p.is_file() or any(v in {'.build', '__pycache__'} for v in rel.parts)
                or p in {here / 'status.json', here / 'manifest.json'}
                or p.suffix in {'.vo', '.vos', '.vok', '.glob', '.pyc', '.aux'}):
            continue
        files.append({'path': str(rel), 'sha256': sha(p)})
    manifest = {'schema': 2, 'kernel': case.name, 'variant': 'original', 'whole_kernel_proved': True,
                'files': files, 'originals': read(here / 'originals.json'), 'repair_applied': False, 'intrinsic_ledger_sha256':sha(here/'intrinsic-ledger.json'), 'intrinsic_spec_boundary':h['intrinsic_spec_declarations'],
                'full_evidence': 'proof/evidence/full-run/status.json', 'full_evidence_sha256': sha(here / 'full-status.json'),
                'generated_source_policy': 'Byte-preserved original logs, CPP, goals and every compiled local .v; no .vo archive. Fresh replay regenerates goals and recompiles local source.'}
    (here / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    status = {'schema': 2, 'kernel': case.name, 'scope': 'full', 'status': 'proved', 'passed': True,
              'whole_kernel_verified': True, 'whole_kernel_proved': True, 'implementation_variant': 'original',
              'verification_scope': 'Actual ordinary C kernel/helper/caller closure under exact source-reviewed intrinsic specifications; partial correctness, ISA-model correspondence and final human specification review remain explicit.',
              'checked_c_units': full['checked_c_units'], 'checked_c_vcs': full['checked_c_vcs'],
              'checked_strategy_fields': full['checked_strategy_fields'], 'ordinary_modules_including_final': full['fresh_compiled_local_modules'],
              'unique_c_functions_with_bodies': full['call_closure']['unique_c_functions_with_bodies'],
              'unit_vc_counting': 'Translation-unit VC_Correct fields; not unique semantic obligations or additional kernels.',
              'full_evidence': 'full-status.json', 'full_evidence_sha256': sha(here / 'full-status.json'),
              'immutable_full_archive': 'evidence/full-run/status.json', 'manifest_sha256': sha(here / 'manifest.json'),
              'native_evidence': identities['native'], 'originals_evidence_sha256': sha(here / 'originals.json'), 'intrinsic_ledger_sha256':sha(here/'intrinsic-ledger.json'), 'intrinsic_spec_boundary':h['intrinsic_spec_declarations'],
              'assumption_audit_sha256': sha(audit_path), 'inherited_assumption_names': audit['inherited_assumption_names'],
              'human_intrinsic_spec_review':'pending; separate human review remains explicit','formal_isa_refinement_established':False,'limits': full['limits'], 'remaining': [], 'verified_manifest_changed': False, 'formal_proof_replayed_by_writer': False}
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
            report['assumptions'] = audit
            report['verified_counts'] = {k: full[k] for k in ['checked_c_units', 'checked_c_vcs', 'checked_strategy_fields', 'fresh_compiled_local_modules']}
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
