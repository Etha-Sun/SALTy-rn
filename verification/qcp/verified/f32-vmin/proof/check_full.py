#!/usr/bin/env python3
"""Fresh twelve-unit repaired FMin C-shim closure and fully qualified gates.

The frozen handoff describes reviewed inputs, never substitutes for regeneration
or ordinary Coq checking. Component .vo files are not copied into a full run.
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
import threading
import time

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
BASE = ROOT / 'verification/qcp/verified/f32-vadd'
HANDOFF_PATH = HERE / 'frozen-full-handoff.json'
HANDOFF = json.loads(HANDOFF_PATH.read_text())
EXPECTED_BODIES = {'FMin/' + u['stem']: set(u['functions_defined']) for u in HANDOFF['units']}
COMPONENTS = ['formal-primitives-status.json', 'vector-status.json',
              'self-compare-status.json', 'neon-proof-status.json',
              'memory-proof-status.json', 'rvv-proof-status.json',
              'wrapper-proof-status.json', 'models-status.json']


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def artifact_path(path):
    path = Path(path)
    if path.is_absolute():
        parts = path.parts
        for i in range(len(parts) - 3):
            if (parts[i:i+2] == ('verification', 'qcp') and
                    parts[i+2] in {'candidates', 'verified'} and parts[i+3] == 'f32-vmin'):
                suffix = parts[i+4:]
                if '..' in suffix:
                    raise ValueError('Artifact escapes its reviewed case directory')
                return CASE.joinpath(*suffix)
    return path


def tokens(text):
    return re.findall(r'\w+|[^\s\w]', re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S))


def annotation(text, anchor, value, *, before=False, indent='', occurrences=1):
    if (not re.fullmatch(r'(?:/\*@(?:(?!\*/).)*\*/\s*)+', value, re.S) or tokens(value)
            or text.count(anchor) != occurrences):
        raise ValueError('Invalid proof annotation/anchor: ' + anchor)
    result = text.replace(anchor, value + '\n' + indent + anchor if before else anchor + ' ' + value)
    if tokens(result) != tokens(text):
        raise ValueError('Proof annotation changed executable tokens')
    return result


def public_contract(spec, side):
    at = spec.index('void test_' + side + '(')
    found = re.search(r'/\*@.*?\*/', spec[at:], re.S)
    if found is None or not all(re.search(r'\b'+s+r'\b', found.group()) for s in ['Require', 'Ensure']):
        raise ValueError('Missing public kernel contract: ' + side)
    return found.group()


def iter_current_unit_texts():
    """Pure live-input construction shared with the relocation identity audit."""
    public = (CASE / 'spec.c').read_text()
    for unit in HANDOFF['units']:
        kind, stem = unit['generation_kind'], unit['stem']
        row = {'label': 'FMin/' + stem, 'namespace': 'FMin', 'stem': stem, 'cpp_flags': []}
        source = CASE / unit['actual_source']
        if kind == 'direct':
            text = '#include "' + str(source) + '"\n'
        elif kind == 'memory_frontend':
            text = '#include "' + str(CASE / 'shim/program_model.h') + '"\n'
            text += '#include "' + str(source) + '"\n'
        elif kind in {'neon_annotations', 'rvv_annotations'}:
            side = 'neon' if kind == 'neon_annotations' else 'rvv'
            raw = source.read_text()
            if raw.count('\n{') != 1:
                raise ValueError('Ambiguous original kernel body: ' + side)
            body = raw.replace('\n{', '\n' + public_contract(public, side) + '\n{', 1)
            ann = json.loads((HERE / 'c' / (side + '.annotations.json')).read_text())
            if side == 'neon':
                body = annotation(body, '  for (;', ann['invariant'], before=True)
            else:
                body = annotation(body, '  while (n > 0)', ann['initial']+'\n'+ann['invariant'], before=True)
                body = annotation(body, '    vfloat32m8_t va =', ann['cut'], before=True)
            for anchor, binding in ann['where'].items():
                count = body.count(anchor)
                if count not in ({1, 2} if side == 'neon' else {1}):
                    raise ValueError('Unexpected original kernel call count: ' + anchor)
                body = annotation(body, anchor, '/*@ where '+binding+' */', occurrences=count)
            if tokens(body) != tokens(raw):
                raise ValueError('Original/repaired executable kernel changed: ' + side)
            frontend = '#include "' + str(CASE / 'shim' / (side+'_frontend.h')) + '"\n'
            text = frontend + body
            row['original_text'] = frontend + raw
            row['implementation_variant'] = 'original' if side == 'neon' else 'repaired'
        elif kind == 'wrapper_annotations':
            raw, text = public, public
            ann = json.loads((HERE / 'c/wrapper.annotations.json').read_text())
            for patch in ann['compare_outputs'] + ann['equivalent']:
                text = annotation(text, patch['before'], patch['text'], before=True, indent='  ')
            if tokens(raw) != tokens(text):
                raise ValueError('Public caller executable tokens changed')
            for name in ['program_model.h', 'runtime.h']:
                quoted = '"shim/' + name + '"'
                absolute = '"' + str(CASE / 'shim' / name) + '"'
                text, raw = text.replace(quoted, absolute), raw.replace(quoted, absolute)
            marker = 'void test_neon('
            text = text.replace(marker, '/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion) */\n'+marker, 1)
            strategies = ''.join('/*@ include strategies "'+n+'.strategies" */\n'
                                 for n in ['float_array', 'comparator', 'wrapper'])
            text = text.replace(marker, strategies+marker, 1)
            row['original_text'], row['cpp_flags'] = raw, ['-DQCP_FORMAL']
        else:
            raise ValueError('Unknown frozen C generation kind: ' + kind)
        row['text'] = text
        yield row


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--dependency-dir', type=Path, required=True)
    parser.add_argument('--jobs', type=int, choices=range(1, 17), default=16)
    args = parser.parse_args()
    cfg, dep = json.loads(args.config.read_text()), args.dependency_dir.resolve()
    (CASE / '.build').mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='full-', dir=CASE / '.build'))
    coq = run / 'coq'
    coq.mkdir()
    records, units, modules, strategies = [], [], [], []
    report = {'passed': False, 'whole_kernel_verified': False, 'scope': 'full',
              'implementation_variant': 'repaired', 'run_directory': str(run),
              'records': records, 'actual_c_units': units, 'strategies': strategies,
              'parallel_jobs': args.jobs, 'external_libraries_rebuilt': False,
              'description': 'Original NEON, user-authorized repaired RVV, and complete actual C call closure; partial correctness',
              'unit_vc_counting': 'Sum of generated translation-unit VC_Correct fields; not additional kernels'}
    lock = threading.Lock()

    def save():
        (run / 'status.json').write_text(json.dumps(report, indent=2)+'\n')

    def execute(command, label, timeout=300):
        if label.startswith('FMin-'):
            timeout = max(timeout, 1800)
            if label in {'FMin-NeonCalls', 'FMin-NeonMemory', 'FMin-NeonLoop',
                         'FMin-VectorScalarChecked', 'FMin-VectorNeonChecked',
                         'FMin-VectorMinChecked', 'FMin-VectorAddChecked',
                         'FMin-VectorMergeChecked', 'FMin-BorrowChecked', 'FMin-SelfChecked'}:
                timeout = max(timeout, 3600)
        command = list(map(str, command))
        if command[:2] == ['qcp-env', 'coqc'] and '-time' not in command:
            command.insert(2, '-time')
        command = ['prlimit', '--as=17179869184:17179869184', '--', *command]
        work = run / 'jobs' / label
        work.mkdir(parents=True, exist_ok=True)
        output, start = run / (label+'.log'), time.monotonic()
        with output.open('w') as stream:
            try:
                code = subprocess.run(command, cwd=work, stdout=stream, stderr=stream,
                                      timeout=timeout).returncode
            except subprocess.TimeoutExpired:
                code = 124
        with lock:
            records.append({'label': label, 'command': command, 'cwd': str(work),
                            'exit_code': code, 'seconds': time.monotonic()-start,
                            'log_sha256': sha(output)})
            save()
        print(label, code, flush=True)
        if code:
            raise RuntimeError(label+': '+output.read_text()[-4500:])

    try:
        if (HANDOFF['namespace'] != 'FMin' or len(HANDOFF['units']) != 12 or
                HANDOFF['total_actual_c_vcs'] != 1188 or HANDOFF['actual_c_function_count'] != 47):
            raise ValueError('Frozen reviewed unit interface changed')
        coverage = module('fmin_coverage', BASE / 'proof/coverage.py')
        coverage.C_KEYWORDS.add('return')
        parallel = module('fmin_parallel', BASE / 'proof/parallel.py')
        baseline = json.loads((BASE / 'proof/manifest.json').read_text())
        dependency = json.loads((dep.parent / 'status.json').read_text())
        if not dependency.get('passed') or dependency.get('scope') != 'full':
            raise ValueError('A completed fresh VADD dependency replay is required')
        for item in baseline['files']:
            if sha(BASE / item['path']) != item['sha256']:
                raise ValueError('Reviewed generic input changed: '+item['path'])
        for item in baseline['modules']:
            if (BASE/'proof'/item['path']).read_bytes() != (dep/Path(item['path']).relative_to('coq')).read_bytes():
                raise ValueError('Dependency replay differs from reviewed generic source')
        components = {name: json.loads((HERE/name).read_text()) for name in COMPONENTS}
        if any(not d.get('passed') for d in components.values()):
            raise ValueError('All genuine component gates must have passed')
        for name, data in components.items():
            if name != 'models-status.json' and not data.get('vc_correct_passed'):
                raise ValueError('Missing actual typed C component interface: '+name)
        replay = json.loads((HERE/'repaired-replay-status.json').read_text())
        scalar_native = json.loads((HERE/'scalar-native-status.json').read_text())
        if (not replay.get('replay_passed') or replay.get('variant') != 'repaired' or
                replay.get('cases') != 275 or replay.get('counterexamples') != [] or
                not replay.get('patch_exact_application_checked') or not scalar_native.get('passed')):
            raise ValueError('Exact repaired native regression/patch binding is required')
        for data in [replay, scalar_native]:
            for key in ['input_hashes','source_sha256','sources_sha256']:
                for name, digest in data.get(key, {}).items():
                    path = artifact_path(name) if Path(name).is_absolute() else CASE/name
                    if sha(path) != digest:
                        raise ValueError('Native input changed: '+name)
        repair, original = json.loads((HERE/'repair.json').read_text()), json.loads((HERE/'originals.json').read_text())
        if repair.get('implementation_variant') != 'repaired':
            raise ValueError('Current case must be the user-authorized repaired implementation')
        for side, item in original['files'].items():
            if sha(ROOT/item['path']) != item['sha256']:
                raise ValueError('Original upstream identity changed: '+side)
        if (sha(CASE/'impl/testNEON.c') != original['files']['neon']['sha256'] or
                sha(CASE/'impl/testRVV.c') != repair['repaired_rvv_sha256'] or
                sha(HERE/'repair.patch') != repair['patch_sha256'] or
                original['files']['rvv']['sha256'] != repair['original_rvv_sha256']):
            raise ValueError('Original NEON/repaired RVV/patch identity changed')
        patch_dir = run/'patch-audit'
        (patch_dir/'impl').mkdir(parents=True)
        shutil.copyfile(ROOT/original['files']['rvv']['path'], patch_dir/'impl/testRVV.c')
        execute(['patch', '--batch', '--fuzz=0', '-p1', '-d', patch_dir, '-i', HERE/'repair.patch'], 'patch-exact-application')
        if (patch_dir/'impl/testRVV.c').read_bytes() != (CASE/'impl/testRVV.c').read_bytes():
            raise ValueError('Exact patch does not produce current repaired RVV')
        historical = repair['original_counterexample_evidence']
        if sha(CASE/historical['path']) != historical['sha256']:
            raise ValueError('Original counterexample history changed')
        report.update(repair=repair, originals=original, patch_exact_application_checked=True,
                      selected_sources={'neon': original['files']['neon']['sha256'], 'rvv': repair['repaired_rvv_sha256']},
                      components={n: {'run_directory': d['run_directory'], 'evidence_sha256': sha(HERE/n)}
                                  for n, d in components.items()})
        for name, digest in HANDOFF['frozen_source_sha256'].items():
            if sha(CASE/name) != digest:
                raise ValueError('Frozen actual C/contract/model/proof input changed: '+name)
        inputs = [HANDOFF_PATH, Path(__file__), HERE/'repaired-replay-status.json', HERE/'scalar-native-status.json', CASE/historical['path']]
        for data in [replay, scalar_native]:
            for key in ['input_hashes','source_sha256','sources_sha256']:
                for name in data.get(key, {}):
                    inputs.append(artifact_path(name) if Path(name).is_absolute() else CASE/name)
        inputs += [CASE/n for n in HANDOFF['frozen_source_sha256']]
        inputs += [HERE/n for n in COMPONENTS]
        inputs += [HERE/n for n in ['generate_neon.py', 'generate_rvv.py', 'generate_wrapper.py',
                                    'generate_scalar_proof.py', 'generate_vector_proofs.py', 'generate_vectors.py']]
        input_hashes = {str(p.relative_to(CASE)): sha(p) for p in inputs}
        report.update(input_sha256=input_hashes, config_sha256=sha(args.config),
                      dependency_manifest_sha256=sha(BASE/'proof/manifest.json'),
                      dependency_status_sha256=sha(dep.parent/'status.json'),
                      tool_sha256={n: sha(Path(shutil.which(n)).resolve()) for n in ['qcp','qcp-env','coqc','gcc','prlimit','patch']})
        archived_path = HERE/'evidence/full-run/status.json'
        archived = json.loads(archived_path.read_text()) if archived_path.exists() else None
        if archived is not None and not archived.get('passed'):
            raise ValueError('Previous immutable full certificate is incomplete')
        archived_units = {u['label']: u['goal_sha256'] for u in archived['actual_c_units']} if archived else {}
        archived_strategies = {s['label']: s['goal_sha256'] for s in archived.get('strategies', [])} if archived else {}
        for item in baseline['modules']:
            dest = run/item['path'];dest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(BASE/'proof'/item['path'], dest)
            modules.append({'namespace': item['namespace'], 'name': item['name'], 'path': item['path']})
        local = coq/'FMin';local.mkdir()
        for name in HANDOFF['own_coq_topological_order_after_fresh_generic_base']:
            if name.endswith('_goal'):
                continue
            source = HERE/'coq'/(name+'.v')
            clean = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
            if re.search(r'\b(?:Axiom|Parameter|Admitted|admit)\b', clean):
                raise ValueError('Unproved declaration in reviewed handwritten source: '+name)
            shutil.copyfile(source, local/source.name)
            modules.append({'namespace': 'FMin', 'name': source.name, 'path': 'coq/FMin/'+source.name})
        slp = []
        for folder in sorted((BASE/'proof/c').iterdir()):
            slp += ['-slp', str(folder), folder.name]
        slp += ['-slp', str(CASE/'shim'), 'FMin', '-slp', str(HERE/'c'), 'FMin']
        declarations, definitions, calls = {}, {}, []
        table = {u['stem']: u for u in HANDOFF['units']}
        public_cpp = run/'public-expanded.c'
        execute(['gcc','-E','-P','-CC','-nostdinc','-DQCP_FORMAL',CASE/'spec.c','-o',public_cpp], 'public-cpp')
        public_contracts = {n: (s,c) for n,s,c,_ in coverage._functions(public_cpp.read_text(), 'public spec')}
        for row in iter_current_unit_texts():
            old = table[row['stem']]
            folder = run/'units'/row['label'].replace('/', '-');folder.mkdir(parents=True)
            source = folder/(row['stem']+'.c');source.write_text(row['text'])
            expanded = folder/'expanded.c'
            execute(['gcc','-E','-P','-CC','-nostdinc',*row['cpp_flags'],source,'-I',CASE,'-o',expanded], row['label'].replace('/', '-')+'-cpp')
            if sha(expanded) != old['generated_cpp_sha256']:
                raise ValueError('Live CPP differs from exact checked C body/contract input: '+row['label'])
            if 'original_text' in row:
                raw = folder/'original.c';raw.write_text(row['original_text'])
                raw_cpp = folder/'original-expanded.c'
                execute(['gcc','-E','-P','-CC','-nostdinc',*row['cpp_flags'],raw,'-I',CASE,'-o',raw_cpp], row['label'].replace('/', '-')+'-original-cpp')
                if tokens(raw_cpp.read_text()) != tokens(expanded.read_text()):
                    raise ValueError('Same-frontend original/repaired executable tokens changed: '+row['label'])
            source.write_bytes(expanded.read_bytes())
            output = folder/'generated';output.mkdir()
            execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info',
                     '--strategy-application-limit','1024','--input-file='+str(source),
                     '--coq-output-dir='+str(output),'--coq-logic-path=FMin',*slp], row['label'].replace('/', '-')+'-qcp',1800)
            goal = output/(row['stem']+'_goal.v')
            if sha(goal) != old['goal_sha256'] or (row['label'] in archived_units and sha(goal) != archived_units[row['label']]):
                raise ValueError('Fresh actual C goal differs from reviewed typed target: '+row['label'])
            historical_goal = artifact_path(old['goal'])
            if historical_goal.exists() and sha(historical_goal) != old['goal_sha256']:
                raise ValueError('Component goal artifact changed: '+row['label'])
            if not historical_goal.exists() and row['label'] not in archived_units:
                raise ValueError('Missing checked component goal and immutable full archive: '+row['label'])
            fields = re.findall(r'^Axiom proof_of_(\w+) :', goal.read_text(), re.M)
            if fields != old['witnesses'] or len(fields) != old['actual_c_vcs']:
                raise ValueError('Actual C VC interface changed: '+row['label'])
            target = local/goal.name;shutil.copyfile(goal, target)
            modules.append({'namespace': 'FMin', 'name': goal.name, 'path': 'coq/FMin/'+goal.name})
            rows = []
            for name, signature, contract, edges in coverage._functions(source.read_text(), row['label']):
                pair = signature, contract
                if name in declarations and declarations[name] != pair:
                    raise ValueError('Actual C declaration/body signature or contract differs: '+name)
                if name in public_contracts and public_contracts[name] != pair:
                    raise ValueError('Actual C function differs from public spec: '+name)
                declarations[name] = pair
                rows.append({'name': name, 'definition': edges is not None,
                             'signature_sha256': hashlib.sha256(repr(signature).encode()).hexdigest(),
                             'contract_sha256': hashlib.sha256(contract.encode()).hexdigest()})
                if edges is not None:
                    definitions.setdefault(name, []).append(row['label'])
                    calls += [(name, edge) for edge in edges]
            if {r['name'] for r in rows if r['definition']} != EXPECTED_BODIES[row['label']]:
                raise ValueError('Reviewed actual C definition set changed: '+row['label'])
            units.append({'label': row['label'], 'namespace':'FMin', 'stem':row['stem'],
                          'actual_c_path':str(source),'cpp_sha256':sha(source),'fresh_goal_path':str(target),
                          'goal_sha256':sha(goal),'checked_module':old['typed_instance'],
                          'c_vcs':len(fields),'fields':fields,'functions':rows,
                          'same_frontend_cpp_tokens_identical': 'original_text' in row})
        if len(units) != 12 or sum(u['c_vcs'] for u in units) != 1188:
            raise ValueError('Mandatory twelve actual C interfaces are incomplete')
        unbound = sorted({c for _,c in calls} - definitions.keys())
        missing = sorted(declarations.keys() - definitions.keys())
        if unbound or missing or len(definitions) != 47:
            raise ValueError('Actual C declaration/call lacks a checked body: '+repr((unbound,missing)))
        report['call_closure'] = {'definitions':definitions,'calls':sorted(set(calls)),
            'unbound_callees':unbound,'declarations_without_checked_body':missing,
            'unique_c_functions_with_bodies':len(definitions),'actual_body_occurrences':sum(map(len,definitions.values())),
            'exact_contract_and_signature_match':True}
        strategy_tool = Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
        report['strategy_tool_sha256'] = sha(strategy_tool)
        for item in HANDOFF['strategies']:
            path = Path(item['file']);path = artifact_path(path) if path.is_absolute() else CASE/path
            namespace, stem = item['namespace'], path.stem
            label = namespace+'/'+stem
            output = run/('strategy-'+namespace+'-'+stem);output.mkdir()
            execute([strategy_tool,'--arch=64','--endian=little','--no-exec-info',
                     '--input-file='+str(path),'--coq-output-dir='+str(output),
                     '--coq-logic-path='+namespace], 'strategy-'+namespace+'-'+stem)
            goal = output/(stem+'_strategy_goal.v')
            if sha(goal) != item['goal_sha256'] or (label in archived_strategies and sha(goal) != archived_strategies[label]):
                raise ValueError('Fresh strategy goal differs from checked target: '+label)
            target = coq/namespace/goal.name
            if namespace != 'FMin' and (not target.exists() or target.read_bytes() != goal.read_bytes()):
                raise ValueError('Reviewed generic strategy interface changed: '+label)
            shutil.copyfile(goal,target)
            key = str(target.relative_to(run))
            if not any(m['path']==key for m in modules):
                modules.append({'namespace':namespace,'name':goal.name,'path':key})
            types = re.findall(r'^Module Type (\w+)\.',goal.read_text(),re.M)
            fields = re.findall(r'^\s*Axiom (\w+) :',goal.read_text(),re.M)
            if len(types)!=1 or len(fields)!=item['fields'] or len(fields)!=len(set(fields)):
                raise ValueError('Unexpected typed strategy interface: '+label)
            strategies.append({'label':label,'source':str(path),'source_sha256':sha(path),
                               'goal_sha256':sha(goal),'namespace':namespace,'stem':stem,
                               'module_type':types[0],'fields':fields,'checked_module':item['typed_instance']})
        if len(strategies)!=9:
            raise ValueError('All nine strategy source interfaces must be checked')
        if len(modules)!=len(baseline['modules'])+len(HANDOFF['own_coq_topological_order_after_fresh_generic_base']) or list(coq.rglob('*.vo')):
            raise ValueError('Complete fresh source DAG must contain no component .vo files')
        flags = list(cfg['flags'][2:])
        for namespace in dict.fromkeys(m['namespace'] for m in modules):
            folder = coq/namespace.replace('.','/') if namespace else coq/'relations'
            flags += ['-Q',str(folder),namespace]
        parallel.compile_modules(modules,run,flags,execute,args.jobs)
        gate = []
        for i,unit in enumerate(units):
            goal, proof = 'FMin.'+unit['stem']+'_goal', unit['checked_module']
            gate += ['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',
                     f'Module ActualUnit{i} : {goal}.VC_Correct := {proof}.']
            gate += [f'Print Assumptions ActualUnit{i}.proof_of_{name}.' for name in unit['fields']]
        for i,item in enumerate(strategies):
            goal, proof = item['namespace']+'.'+item['stem']+'_strategy_goal', item['checked_module']
            gate += ['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',
                     f'Module ActualStrategy{i} : {goal}.{item["module_type"]} := {proof}.']
            gate += [f'Print Assumptions ActualStrategy{i}.{name}.' for name in item['fields']]
        final = run/'FinalCaseCheck.v';final.write_text('\n'.join(gate)+'\n')
        execute(['qcp-env','coqc','-time',*flags,final],'FinalCaseCheck',1800)
        for name,digest in input_hashes.items():
            if sha(CASE/name)!=digest:
                raise ValueError('Reviewed input changed during complete replay: '+name)
        for item in baseline['files']:
            if sha(BASE/item['path'])!=item['sha256']:
                raise ValueError('Generic reviewed input changed during replay')
        for name,digest in report['tool_sha256'].items():
            if sha(Path(shutil.which(name)).resolve())!=digest:
                raise ValueError('Verification tool changed: '+name)
        if (sha(strategy_tool)!=report['strategy_tool_sha256'] or sha(args.config)!=report['config_sha256'] or
                sha(BASE/'proof/manifest.json')!=report['dependency_manifest_sha256'] or
                sha(dep.parent/'status.json')!=report['dependency_status_sha256']):
            raise ValueError('Verification/dependency configuration changed during replay')
        report.update(passed=True,whole_kernel_verified=True,
                      verification_state='checked_repaired_c_shim_partial_correctness',
                      checked_c_units=len(units),checked_c_vcs=sum(u['c_vcs'] for u in units),
                      checked_strategy_fields=sum(len(s['fields']) for s in strategies),
                      fresh_compiled_local_modules=len(modules)+1,
                      compiled_source_sha256={m['namespace']+'.'+Path(m['name']).stem:sha(run/m['path']) for m in modules},
                      no_component_vo_reused=True,final_gate_sha256=sha(final),
                      final_assumptions_log_sha256=sha(run/'FinalCaseCheck.log'),
                      limits=['Repaired RVV implementation; original NaN counterexamples and exact patch retained',
                              'Fixed RVV VLEN=128/SEW=32/LMUL=8/VLMAX=32, vl=min(AVL,32)',
                              'C-shim partial correctness under explicit memory/type/address contracts; no full termination theorem',
                              'No Arm/RVV hardware or formal ISA/shim/layout refinement claim',
                              'NaN payload/sign and floating exception flags/traps are outside public observation',
                              'Inherited QCP/Coq/Flocq classical/extensionality and C memory/type/address assumptions remain visible'])
    except Exception as error:
        report['error']=str(error);print(error,flush=True)
    finally:
        save();(HERE/'full-status.json').write_text(json.dumps(report,indent=2)+'\n');print('RUN',run,flush=True)
    return 0 if report['passed'] else 1


if __name__=='__main__':
    raise SystemExit(main())
