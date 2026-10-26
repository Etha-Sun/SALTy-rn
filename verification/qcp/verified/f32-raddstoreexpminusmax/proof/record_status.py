#!/usr/bin/env python3
"""Audit and archive a completed fresh full run; never alter the global count.

--preflight checks current repair/native identities only. --dry-run validates a
real completed proof without issuing a certificate. Neither replays a proof.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

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
NS = 'ExpMinusMax'
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
read = lambda p: json.loads(Path(p).read_text())


def require(value, message):
    if not value:
        raise ValueError(message)


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def preserve(source, target):
    target.parent.mkdir(parents=True, exist_ok=True)
    if target.exists():
        require(source.read_bytes() == target.read_bytes(), 'Immutable archive differs: ' + str(target))
    else:
        shutil.copyfile(source, target)


def check_hashes(case, values):
    root = next(p for p in case.parents if (p / '.git').exists()).resolve()
    require(values, 'Empty source identity inventory')
    for name, digest in values.items():
        require(not Path(name).is_absolute() and (case / name).resolve().is_relative_to(root),
                'Source identity escapes repository')
        require(sha(case / name) == digest, 'Source identity changed: ' + name)


def identity(case, work, handoff=None):
    builder = module('issuer_preparation', case / 'proof/build_full_handoff.py')
    records = []
    def execute(command, label):
        command = ['prlimit', '--as=17179869184:17179869184', '--', *map(str, command)]
        log = work / (label + '.log')
        with log.open('w') as output:
            result = subprocess.run(command, cwd=work, stdout=output, stderr=output, timeout=180)
        require(result.returncode == 0, 'Identity replay command failed: ' + label)
        records.append(dict(label=label, command=command, exit_code=result.returncode, log_sha256=sha(log)))
    implementations = builder.audit_implementations(work, execute)
    inventory = read(case / 'proof/component-unit-inventory.json')
    native = builder.audit_native(inventory)
    # Check actual finite executions and retained logs, not merely their booleans.
    for receipt in native:
        data = read(case / receipt['path'])
        origin = Path(data['run_directory'])
        archived = case / 'proof/evidence/native' / Path(receipt['path']).stem
        for record in data['records']:
            log = origin / (record['label'] + '.log')
            if not log.exists():
                log = archived / log.name
            require(log.is_file() and sha(log) == record['log_sha256'],
                    'Native log missing or changed: ' + receipt['path'] + '/' + record['label'])
    builder.audit_counterexamples()
    if handoff:
        check_hashes(case, handoff['frozen_source_sha256'])
        require(implementations == handoff['implementations'] and native == handoff['native_statuses'],
                'Implementation/native binding differs from H')
    return dict(formal_proof_replayed=False, implementations=implementations,
                native=native, patch_records=records, counterexample_receipt='proof/original-counterexamples.json')


def assumption_names(text):
    raw = set(re.findall(r'^([A-Za-z_]\w*(?:\.\w+)*)\s*:', text, re.M)) - {'Axioms'}
    short = {}
    for name in ALLOWED:
        short.setdefault(name.rsplit('.', 1)[-1], set()).add(name)
    result, unknown = set(), set()
    for name in raw:
        if name in ALLOWED:
            result.add(name)
        elif name in {'Snaive_C_Rules64.eval_addr', 'SimpleC.SL.SeparationLogic.Snaive_C_Rules64.eval_addr'}:
            result.add('SeparationLogic.Snaive_C_Rules64.eval_addr')
        elif '.' not in name and len(short.get(name, set())) == 1:
            result.update(short[name])
        else:
            unknown.add(name)
    require(not unknown, 'Unreviewed inherited assumptions: ' + repr(sorted(unknown)))
    return sorted(result)


def validate(case, run, handoff, full):
    require(full.get('passed') is True and full.get('whole_kernel_verified') is True and
            full.get('no_component_vo_reused') is True and full.get('scope') == 'full',
            'Complete fresh ordinary full proof required')
    require((run / 'status.json').read_bytes() == (case / 'proof/full-status.json').read_bytes(),
            'Original run and public full receipt differ')
    require(full['handoff_sha256'] == sha(case / 'proof/frozen-full-handoff.json') and
            full['input_sha256'] == handoff['frozen_source_sha256'] and full['limits'] == handoff['limits'],
            'Frozen proof inputs or scope differ')
    check_hashes(case, full['input_sha256'])
    require(full['parallel_jobs'] == 32 and 1 <= full['initial_live_admission_slots'] <= 32 and
            full['ordinary_per_process_memory_GiB'] == 16 and full['heavy_per_process_memory_GiB'] == 32,
            'Unreviewed resource policy')
    profile=module('issuer_execution_profile',case/'proof/full_inputs.py')
    expected_flags=profile.approved_coq_flags(handoff,Path(full['run_directory']))
    require(full['config_sha256']==handoff['coq_config_sha256'],'Full execution config differs from approved frozen profile')
    units, strategies = full['actual_c_units'], full['strategies']
    require(len(units) == full['checked_c_units'] == len(handoff['units']) == 4 and
            len(strategies) == len(handoff['strategies']) == 0 and
            sum(u['c_vcs'] for u in units) == full['checked_c_vcs'] == handoff['total_actual_c_vcs'] and
            sum(len(s['fields']) for s in strategies) == full['checked_strategy_fields'] == 0,
            'Whole-case actual target accounting differs')
    artifacts = []
    expanded_paths = {}
    for actual, expected in zip(units, handoff['units']):
        require(actual['namespace'] == NS and actual['stem'] == expected['stem'] and
                all(actual[k] == expected[k] for k in ['fields', 'goal_sha256', 'cpp_sha256', 'definition_representation']) and
                actual['checked_module'] == expected['typed_instance'] and
                actual['c_vcs'] == len(actual['fields']), 'Actual unit/H mismatch')
        stem = actual['stem']
        goal = run / 'units' / stem / 'generated' / (stem + '_goal.v')
        cpp = run / 'units' / stem / 'expanded.c'
        require(sha(goal) == actual['goal_sha256'] and sha(cpp) == actual['cpp_sha256'],
                'Fresh actual goal/CPP artifact changed')
        require((run / 'coq' / NS / goal.name).read_bytes() == goal.read_bytes(), 'Typed goal is not generated goal')
        require(re.findall(r'^Axiom proof_of_(\w+)\s*:', goal.read_text(), re.M) == actual['fields'],
                'Actual goal field list changed')
        representation=actual['definition_representation']
        raw=run/'units'/stem/'generated'/(stem+'_def.v')
        archived_raw=run/'units'/stem/(stem+'_def.emitted.v.txt')
        description=run/'units'/stem/'definition-representation.json'
        require(sha(raw)==sha(archived_raw)==representation['emitted_sha256']and read(description)==representation,
                'Raw emitted definition/source mapping drift')
        require(sha(case/representation['compiled_definition_source'])==representation['compiled_definition_sha256']and
                sha(case/representation['representation_model_source'])==representation['representation_model_source_sha256']and
                sha(run/'coq'/NS/(stem+'_def.v'))==representation['compiled_definition_sha256']and
                sha(run/'coq'/NS/'VectorRecords.v')==representation['representation_model_source_sha256'],
                'Faithful compiled definition/model source drift')
        artifacts.extend([(archived_raw,Path('units')/stem/archived_raw.name),
                          (description,Path('units')/stem/description.name)])
        expanded_paths[stem] = cpp
        artifacts.extend([(cpp, Path('units') / stem / 'expanded.c'),
                          (goal, Path('units') / stem / 'goal.v')])
        records = [r for r in full['records'] if r['label'] == stem + '-qcp']
        require(len(records) == 1 and '--arch=64' in records[0]['command'] and
                '--endian=little' in records[0]['command'] and
                '--input-file=' + str(Path(full['run_directory']) / 'units' / stem / (stem + '.c')) in records[0]['command'],
                'Actual fresh QCP generation record missing')
        require((run / 'units' / stem / (stem + '.c')).read_bytes() == cpp.read_bytes(),
                'Recorded QCP input differs from CPP')
    for actual, expected in zip(strategies, handoff['strategies']):
        require(actual['namespace'] == NS and actual['stem'] + '_strategy_goal' == expected['stem'] and
                actual['fields'] == expected['field_names'] and actual['module_type'] == expected['module_type'] and
                actual['goal_sha256'] == expected['goal_sha256'] and actual['checked_module'] == expected['typed_instance'],
                'Actual strategy/H mismatch')
        goal = run / ('strategy-' + expected['stem']) / (expected['stem'] + '.v')
        require(sha(goal) == actual['goal_sha256'] and
                (run / 'coq' / NS / goal.name).read_bytes() == goal.read_bytes(), 'Regenerated strategy target changed')
        artifacts.append((goal, Path('strategies') / goal.name))
    coverage = module('issuer_actual_C_coverage', case / 'proof/full_call_coverage.py')
    closure = coverage.audit_sources(expanded_paths, read(case / 'proof/component-unit-inventory.json'),
                                    read(case / 'proof/semantics.json'), case)
    require(closure == full['call_closure'] == handoff['call_closure'] and
            closure['unique_ordinary_C_bodies'] == 6 and closure['target_inventory_complete'],
            'Actual ordinary body/call/contract/intrinsic closure differs')
    records = full['records']
    require(records and len({r['label'] for r in records}) == len(records) and
            all(r['exit_code'] == 0 for r in records), 'Missing/duplicate/failed execution record')
    by_source = {}
    for record in records:
        memory = record['memory_limit_GiB']
        require(memory in {16, 32} and 0 < record['timeout_seconds'] <= 21600 and
                record['command'][:3] == ['prlimit', '--as=' + str(memory * 1024**3) + ':' + str(memory * 1024**3), '--'],
                'Execution resource guard differs')
        log = run / (record['label'] + '.log')
        require(sha(log) == record['log_sha256'], 'Execution log changed: ' + record['label'])
        if 'coqc' in record['command']:
            require(record['command'][3:5] == ['qcp-env', 'coqc'] and record['command'][-1].endswith('.v') and
                    not any(a.startswith(('-vos', '-vok', '-quick', '-vio')) for a in record['command']),
                    'Ordinary Coq compilation required')
            expected_memory=32 if record['label']in handoff['heavy_coq_labels'] else 16
            expected_timeout=14400 if expected_memory==32 else 7200
            require(memory==expected_memory and record['timeout_seconds']==expected_timeout,
                    'Ordinary/heavy compilation admission differs from H')
            require(record['command'][3:]==['qcp-env','coqc','-time',*expected_flags,record['command'][-1]],
                    'Ordinary Coq flags or unique fresh namespace differ from frozen profile')
            by_source.setdefault(record['command'][-1], []).append(record)
    compiled = full['compiled_source_sha256']
    require(len(compiled) + 1 == len(by_source) == full['fresh_compiled_local_modules'] and
            all(len(v) == 1 for v in by_source.values()), 'Ordinary module compilation inventory differs')
    for name, digest in compiled.items():
        require(name.count('.')==1 and name.split('.')[0]in{NS},'Unexpected project namespace')
        source = Path('coq') / name.split('.')[0] / (name.split('.')[1] + '.v')
        require(sha(run / source) == digest and str(Path(full['run_directory']) / source) in by_source,
                'Fresh compiled source/ordinary execution identity differs')
    require(str(Path(full['run_directory']) / 'FinalCaseCheck.v') in by_source and
            sha(run / 'FinalCaseCheck.v') == full['final_gate_sha256'] and
            by_source[str(Path(full['run_directory']) / 'FinalCaseCheck.v')][0]['label']=='FinalCaseCheck', 'Final ordinary typed checker missing')
    generated = {u['stem'] + '_goal' for u in units} | {s['stem'] + '_strategy_goal' for s in strategies}
    for name in handoff['own_modules']:
        if name not in generated:
            require(sha(case / 'proof/coq' / (name + '.v')) == compiled[NS + '.' + name],
                    'Compiled proof differs from public source')
    for support in handoff['support_modules']:
        logical=support['namespace']+'.'+Path(support['name']).stem
        require(sha(case/support['source'])==support['source_sha256']==compiled[logical],
                'Shared mathematical source/ordinary replay differs')
    gate = module('issuer_gate_sources', case / 'proof/gate_sources.py')
    expected_gates = gate.sources(NS, units, strategies)
    require(set(compiled) == {NS + '.' + n for n in handoff['own_modules']} |
            {NS + '.' + n for n in expected_gates}|
            {m['namespace']+'.'+Path(m['name']).stem for m in handoff['support_modules']}, 'Missing or unexpected fresh modules')
    for name, text in expected_gates.items():
        require((run / 'coq' / NS / (name + '.v')).read_text() == text, 'Typed/audit source differs')
    require((run / 'FinalCaseCheck.v').read_text() == gate.final_source(NS, units, strategies),
            'Final source differs from exact full target inventory')
    constants = gate.identifiers(NS, units, strategies)
    require(len(constants) == len(set(constants)) == full['checked_c_vcs'] + len(gate.SUPPORT) ==
            full['final_assumptions_report_count'], 'Print inventory differs')
    reports = []
    for i in range(gate.PARTS):
        part = full['assumption_audit_parts'][i]
        require(part == dict(index=i, module=gate.PREFIX + str(i), constants=constants[i::gate.PARTS],
                             report_count=len(constants[i::gate.PARTS])), 'Assumption partition differs')
        log = run / (NS + '-' + part['module'] + '.log')
        text = log.read_text()
        require(len(re.findall(r'^(?:Axioms:|Closed under the global context)', text, re.M)) == part['report_count'],
                'Missing/duplicate actual Print result')
        reports.append(log.read_bytes())
    aggregate = run / gate.REPORT
    require(aggregate.read_bytes() == b''.join(reports) and sha(aggregate) == full['final_assumptions_log_sha256'],
            'Final aggregated Print log differs')
    inherited = assumption_names(aggregate.read_text())
    dep = read(run / 'coqdep-status.json')
    require(dep == full['coqdep_record'] and dep['exit_code'] == 0 and
            dep['stdout_sha256'] == sha(run / 'dependencies.mk') and dep['stderr_sha256'] == sha(run / 'coqdep.log'),
            'Dependency extraction evidence changed')
    mappings=[];position=0
    while position<len(expected_flags):
        if expected_flags[position]in{'-Q','-R'}:mappings+=expected_flags[position:position+3];position+=3
        else:position+=1
    dep_prefix=['prlimit','--as=17179869184:17179869184','--','qcp-env','coqdep',*mappings]
    require(dep['command'][:len(dep_prefix)]==dep_prefix and
            all(v.endswith('.v')for v in dep['command'][len(dep_prefix):])and
            len(dep['command'][len(dep_prefix):])==len(compiled), 'Dependency flags/source count differ from frozen ordinary profile')
    require(set(v for v in dep['command'] if v.endswith('.v')) ==
            {str(Path(full['run_directory']) / 'coq' / n.split('.')[0] / (n.split('.')[1] + '.v')) for n in compiled},
            'coqdep source inventory differs')
    external = module('issuer_external_closure', case / 'proof/external_dependencies.py')
    external_audit = external.validate_external(case, run, full, require)
    for filename in ['external-before.v', 'external-before-locations.v', 'external-after.v',
                     'external-after-locations.v', 'external-dependencies.json']:
        artifacts.append((run / filename, Path(filename)))
    return dict(inherited_assumption_names=inherited, print_commands=len(constants),
                new_project_axioms_observed=False, library_origin_audit=external_audit), artifacts


def native_log_source(case,receipt,data,record):
    original=Path(data['run_directory'])/(record['label']+'.log')
    archived=case/'proof/evidence/native'/Path(receipt['path']).stem/(record['label']+'.log')
    source=original if original.is_file() else archived
    require(source.is_file()and sha(source)==record['log_sha256'],'Native log missing or changed during issue')
    return source


def issue(case, run, handoff, full, audit, artifacts, identities):
    here, archive = case / 'proof', case / 'proof/evidence/full-run'
    check_hashes(case, full['input_sha256'])
    preserve(here / 'full-status.json', archive / 'status.json')
    preserve(here / 'frozen-full-handoff.json', archive / 'frozen-full-handoff.json')
    for record in full['records']:
        preserve(run / (record['label'] + '.log'), archive / 'logs' / (record['label'] + '.log'))
    for source, target in artifacts:
        preserve(source, archive / target)
    for name in full['compiled_source_sha256']:
        relative = Path('coq') / name.split('.')[0] / (name.split('.')[1] + '.v')
        preserve(run / relative, archive / relative)
    for name in ['FinalCaseCheck.v', 'FinalCaseCheck.log', 'AssumptionsReport.log',
                 'dependencies.mk', 'coqdep.log', 'coqdep-status.json']:
        preserve(run / name, archive / name)
    root = next(p for p in case.parents if (p / '.git').exists()).resolve()
    for name in full['input_sha256']:
        if name.endswith('-status.json'):
            target = Path(name) if '..' not in Path(name).parts else Path('__repo__') / (case / name).resolve().relative_to(root)
            preserve(case / name, archive / 'component-status' / target)
    for receipt in handoff['native_statuses']:
        data = read(case / receipt['path'])
        for record in data['records']:
            preserve(native_log_source(case,receipt,data,record),
                     here / 'evidence/native' / Path(receipt['path']).stem / (record['label'] + '.log'))
        preserve(case / receipt['path'], here / 'evidence/native' / Path(receipt['path']).stem / 'status.json')
    # Public counterexample artifacts are already pinned by frozen H.
    audit_path = here / 'assumption-audit.json'
    text = json.dumps(dict(audit, passed=True, full_status_sha256=sha(here / 'full-status.json')), indent=2) + '\n'
    require(not audit_path.exists() or audit_path.read_text() == text, 'Existing assumption audit differs')
    audit_path.write_text(text)
    for name in ['status.json', 'manifest.json']:
        path = here / name
        if path.exists():
            require(not read(path).get('whole_kernel_verified', read(path).get('whole_kernel_proved', False)),
                    'Refuse to overwrite an issued certificate')
            preserve(path, here / 'evidence/candidate-history' / (path.stem + '-' + sha(path) + '.json'))
    files = []
    for path in sorted(case.rglob('*')):
        relative = path.relative_to(case)
        if not path.is_file() or any(n in {'.build', '__pycache__'} for n in relative.parts) or \
                path in {here / 'manifest.json', here / 'status.json'} or \
                path.suffix in {'.vo', '.vos', '.vok', '.glob', '.aux', '.pyc'}:
            continue
        files.append(dict(path=str(relative), sha256=sha(path)))
    manifest = dict(schema=2, kernel=case.name, variant='repaired', whole_kernel_proved=True,
                    files=files, originals=read(here / 'originals.json'), repair_applied=True,
                    full_evidence='proof/evidence/full-run/status.json',
                    full_evidence_sha256=sha(here / 'full-status.json'),
                    intrinsic_spec_boundary=full['call_closure']['source_reviewed_intrinsic_terminals'],
                    generated_source_policy='Actual regenerated goals, CPP, complete ordinary source closure and logs; no archived object credit')
    (here / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    status = dict(schema=2, kernel=case.name, passed=True, scope='full', status='proved',
                  whole_kernel_verified=True, whole_kernel_proved=True, implementation_variant='repaired',
                  checked_c_units=4, checked_c_vcs=full['checked_c_vcs'], checked_strategy_fields=0,
                  ordinary_modules_including_final=full['fresh_compiled_local_modules'],
                  unique_c_functions_with_bodies=6, full_evidence='full-status.json',
                  full_evidence_sha256=sha(here / 'full-status.json'),
                  immutable_full_archive='evidence/full-run/status.json', manifest_sha256=sha(here / 'manifest.json'),
                  assumption_audit_sha256=sha(audit_path), inherited_assumption_names=audit['inherited_assumption_names'],
                  human_intrinsic_spec_review='pending', formal_isa_refinement_established=False,
                  intrinsic_spec_boundary=full['call_closure']['source_reviewed_intrinsic_terminals'],
                  limits=handoff['limits'], remaining=[], verified_manifest_changed=False,
                  formal_proof_replayed_by_writer=False, native_evidence=identities['native'])
    (here / 'status.json').write_text(json.dumps(status, indent=2) + '\n')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof-run', type=Path)
    parser.add_argument('--preflight', action='store_true')
    parser.add_argument('--dry-run', action='store_true')
    args = parser.parse_args()
    case = Path(__file__).resolve().parent.parent
    require(case.name == 'f32-raddstoreexpminusmax', 'Unknown case')
    work = Path(tempfile.mkdtemp(prefix='record-preflight-', dir=case / '.build'))
    report = dict(passed=False, formal_proof_replayed=False, certificate_issued=False, directory=str(work))
    try:
        path = case / 'proof/frozen-full-handoff.json'
        handoff = read(path) if path.exists() else None
        report['identity'] = identity(case, work, handoff)
        if not args.preflight:
            require(handoff is not None, 'Missing complete frozen handoff')
            full = read(case / 'proof/full-status.json')
            run = args.proof_run.resolve() if args.proof_run else Path(full['run_directory'])
            audit, artifacts = validate(case, run, handoff, full)
            report['assumptions'] = audit
            if not args.dry_run:
                issue(case, run, handoff, full, audit, artifacts, report['identity'])
                report['certificate_issued'] = True
        report['passed'] = True
    except Exception as error:
        report['error'] = repr(error)
    (work / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report, indent=2))
    return 0 if report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
