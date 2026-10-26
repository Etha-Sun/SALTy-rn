#!/usr/bin/env python3
"""Audit current actual C inputs; freeze only complete, byte-pinned components.

Preparation is source identity evidence. Only check_full.py can issue a complete
ordinary Coq run; this script never transfers component object-file credit.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import shlex
import subprocess
import tempfile

CASE = Path(__file__).resolve().parent.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
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


def required_modules(units, strategies, extra_roots):
    inputs = module('dependency_target_inputs', CASE / 'proof/full_inputs.py')
    generated = {u['stem'] + '_goal' for u in units} | {s['stem'] for s in strategies}
    generated_paths = {u['stem'] + '_goal': inputs.goal_source(u) for u in units}
    generated_paths.update({s['stem']: inputs.goal_source(s, strategy=True) for s in strategies})
    roots = {u['provider_root'] for u in units} | {s['provider_root'] for s in strategies}
    pending = list(roots | generated | set(extra_roots))
    needed = set()
    while pending:
        name = pending.pop()
        if name in needed:
            continue
        require(re.fullmatch(r'\w+', name), 'Unexpected module path: ' + name)
        source = generated_paths.get(name, CASE / 'proof/coq' / (name + '.v'))
        require(source.is_file(), 'Missing complete source dependency: ' + name)
        needed.add(name)
        text = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
        if name not in generated:
            require(not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b', text),
                    'Unchecked project declaration: ' + name)
        for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)', text):
            prefix, body = m.groups()
            for word in body.split():
                qualified = prefix + '.' + word if prefix else word
                if qualified.startswith(NS + '.'):
                    dep = qualified[len(NS) + 1:]
                    require('.' not in dep, 'Unexpected local subnamespace: ' + qualified)
                    pending.append(dep)
    return sorted(needed)


def audit_native(inventory):
    result=[]
    labels={'dependencies':0,'compiler-version':0,'undefined-compile':0,'undefined-run':0,
            'undefined-common-wrong':2,'address-compile':0,'address-run':0,'address-common-wrong':2}
    cap=['prlimit','--as=17179869184:17179869184','--']
    def current_path(text):
        path=Path(text)
        if path.is_relative_to(CASE):return path.resolve()
        positions=[i for i,name in enumerate(path.parts)if name==CASE.name]
        require(len(positions)==1,'Native historical source has no unique case marker')
        return CASE.joinpath(*path.parts[positions[0]+1:]).resolve()
    for name in ['proof/native-status.json','proof/public-native-status.json']:
        status=read(CASE/name);public='public-'in name
        require(status['passed']is True and status['per_process_memory_GiB']==16 and
                status['configured_jobs']==32 and status['max_live_processes']==1 and
                status['common_wrong_negative_control_rejected']is True,'Native gate failed')
        harness='shim/runtime/public_harness.c'if public else'shim/runtime/harness.c'
        driver='proof/native_public.py'if public else'proof/native.py'
        c_inputs={harness,'shim/runtime/host.h','proof/original/testNEON.c','proof/original/testRVV.c',
                  'impl/testNEON.c','impl/testRVV.c'}|({'public_spec.c'}if public else set())
        expected_inputs=c_inputs|{driver,'proof/repair.json','proof/repair.patch','proof/originals.json','proof/literal-conversion.json'}
        require(set(status['input_sha256'])==expected_inputs and status['system_headers_in_inventory']is False,
                'Native recursive input inventory missing or unexpected')
        for source,digest in status['input_sha256'].items():
            path=(CASE/source).resolve();require(path.is_relative_to(ROOT.resolve())and sha(path)==digest,'Native current input drift '+source)
        records=status['records']
        require(len(records)==len(labels)and {r['label']for r in records}==set(labels),
                'Missing, duplicated or unexpected actual native execution labels')
        logs={};by_label={}
        for record in records:
            label=record['label'];command=record['command'];by_label[label]=record
            require(record['exit_code']==record['expected_exit_code']==labels[label] and
                    0<record['timeout_seconds']<=1800 and command,'Native exit/limit record differs')
            log=Path(status['run_directory'])/(label+'.log')
            if not log.is_file():log=CASE/'proof/evidence/native'/Path(name).stem/(label+'.log')
            require(sha(log)==record['log_sha256'],'Native log drift')
            text=log.read_text();logs[label]=text
            require(not any(x in text for x in ['runtime error:','ERROR: AddressSanitizer','ERROR: LeakSanitizer']),'Sanitizer diagnostic')
            if label in {'address-run','address-common-wrong'}:
                require(command[0]=='systemd-run'and 'MemoryMax=17179869184'in command and'MemorySwapMax=0'in command,
                        'ASan command lacks actual16GiB/swap0')
                require('"actual_memory_max": "17179869184"'in text and'"actual_memory_swap_max": "0"'in text,
                        'Missing actual ASan memory control')
            else:require(command[:3]==cap,'Native ordinary command lacks16GiB AS limit')
        require(status['compiler_version']==logs['compiler-version'].splitlines()[0], 'Compiler version log differs')
        dependency_text=logs['dependencies'].replace('\\\n',' ')
        require(':'in dependency_text,'Missing actual compiler dependency inventory')
        dependencies={str(current_path(x).relative_to(CASE))for x in shlex.split(dependency_text.split(':',1)[1])}
        require(dependencies==c_inputs,'Compiler recursive C dependencies differ from current native inputs')
        for mode in ['undefined','address']:
            compile_command=by_label[mode+'-compile']['command']
            require('-fsanitize='+mode in compile_command and all(flag in compile_command for flag in
                    ['-frounding-math','-ffp-contract=off','-fno-fast-math','-fno-sanitize-recover=all']),
                    'Native compile flags changed')
            require(any(current_path(x)==(CASE/harness).resolve()for x in compile_command if x.endswith('.c')),
                    'Native compilation does not use current harness')
            binary=str(Path(status['run_directory'])/mode)
            require(compile_command[-2:]==['-o',binary]and by_label[mode+'-run']['command'][-1]==binary and
                    by_label[mode+'-common-wrong']['command'][-2:]==[binary,'wrong'],'Native binary/negative command chain differs')
            lane_key='lanes_per_pair_result'if public else'lanes_per_side'
            matches=re.findall(r'cases=(\d+) '+lane_key+r'=(\d+) original_sum_mismatches=(\d+) repaired_oracle_mismatches=0 VL_modes=2 sum_output_alias=yes max_input_alias=yes',logs[mode+'-run'])
            require(len(matches)==1 and tuple(map(int,matches[0]))==(6192,402480,824),'Actual native corpus result differs')
            expected_counts=dict(cases=6192,**{lane_key:402480},original_sum_mismatches=824)
            if public:expected_counts['public_pair_invocations']=12384
            require(status[mode+'_counts']==expected_counts,'Receipt corpus differs from actual execution log')
            keys=['first_final','second_final','oracle']if public else['neon','rvv','oracle']
            pattern=r'independent oracle rejected .*'+keys[0]+r'=([0-9a-f]{8}) '+keys[1]+r'=([0-9a-f]{8}) oracle=([0-9a-f]{8})'
            rejected=re.findall(pattern,logs[mode+'-common-wrong'])
            require(len(rejected)==1 and rejected[0][0]==rejected[0][1]and rejected[0][0]!=rejected[0][2],
                    'Actual common-wrong oracle mismatch missing')
            expected_negative=dict(zip(keys,rejected[0]));expected_negative['exit_code']=2
            if public:
                require('public_return=1,1'in logs[mode+'-common-wrong'],'Actual public return witness missing')
                expected_negative['both_public_returns']=1
            require(status[mode+'_negative_control']==expected_negative,'Negative receipt differs from actual mismatch log')
        result.append(dict(path=name,sha256=sha(CASE/name),input_sha256=status['input_sha256'],recursive_input_sha256=status['input_sha256']))
    return result


def audit_semantics():
    semantic=read(CASE/'proof/semantics.json');ledger=read(CASE/'proof/intrinsic-ledger.json')
    require(len(ledger['entries'])==40 and ledger['ISA_refinement_proved']is False,'Intrinsic scope changed')
    require(semantic['rounding']=='RNE'and semantic['FP_domain']=='all IEEE754 binary32, NaN/Inf/+-0/subnormal, no ordered/finite input assumption','FP public domain weakened')
    require(semantic['RVV_configuration']['VLEN']==128 and semantic['RVV_configuration']['SEW']==32 and semantic['RVV_configuration']['LMUL']==4 and semantic['RVV_configuration']['VLMAX']==16,'Hardware configuration changed')
    for row in ledger['entries']:
        require(row['body_checked']is False and row['isa_refinement_proved']is False and row['physical_ABI_bridge_proved']is False,'Unsupported intrinsic/ABI claim')
        require(sha(CASE/row['definition_source'])==row['definition_source_sha256'],'Intrinsic model drift')
        for aux in row.get('auxiliary_definitions',[]):require(sha(CASE/aux['definition_source'])==aux['definition_source_sha256'],'Auxiliary model drift')
    for name,row in ledger['official_archive_files'].items():require(sha(CASE/'proof/evidence/official'/name)==row['sha256'],'Official source archive changed')
    return semantic



def audit_counterexamples():
    index=read(CASE/'proof/original-counterexamples.json');folder=CASE/index['artifact_directory'];status=read(folder/'status.json')
    require(index['passed']and status['passed']and sha(folder/'status.json')==index['artifact_status_sha256'],'Original counterexample archive changed')
    witness=index['witness'];require(witness['batch_bytes']==28 and witness['elements']==7 and witness['original_neon_sum_bits']!=witness['original_rvv_sum_bits'],'Missing actual original mismatch')
    records=status['records']
    require(len(records)==2 and {r['label']for r in records}=={'compile','counterexample'},'Missing/duplicate original counterexample commands')
    inputs={'shim/runtime/harness.c','shim/runtime/host.h','proof/original/testNEON.c','proof/original/testRVV.c','impl/testNEON.c','impl/testRVV.c'}
    require(set(status['input_sha256'])==inputs,'Original witness input inventory differs')
    require(all(status['input_sha256'][name]==sha(CASE/name)for name in ['proof/original/testNEON.c','proof/original/testRVV.c']), 'Archived mismatch uses different original kernel source')
    by_label={r['label']:r for r in records}
    for record in records:
        require(record['exit_code']==record.get('expected_exit_code',0)==0 and record['memory_GiB']==16 and
                0<record['timeout_seconds']<=1800 and record['command'][:3]==['prlimit','--as=17179869184:17179869184','--'],
                'Counterexample execution failed or unbounded')
        for suffix in ['stdout','stderr']:
            log=folder/(record['label']+'.'+suffix)
            require(sha(log)==record[suffix+'_sha256'],'Counterexample stream drift')
            require(not any(x in log.read_text()for x in ['runtime error:','ERROR: AddressSanitizer','ERROR: LeakSanitizer']),
                    'Original witness has sanitizer diagnostic')
    compile_command=by_label['compile']['command'];counter_command=by_label['counterexample']['command']
    require('-fsanitize=undefined'in compile_command and'-fno-sanitize-recover=undefined'in compile_command and
            compile_command[-2]=='-o'and counter_command[3:]==[compile_command[-1],'counter'],
            'Original compile/binary/run chain changed')
    text=(folder/'counterexample.stdout').read_text()
    found=re.findall(r'original counterexample n=(\d+) pattern=(\d+) mode=(\d+) maximum=([0-9a-f]{8}) neon_sum=([0-9a-f]{8}) rvv_sum=([0-9a-f]{8}) input=([0-9a-f,]+)',text)
    require(len(found)==1,'Actual original mismatch line missing/duplicate')
    n,pattern,mode,maximum,neon,rvv,values=found[0]
    require((int(n),int(pattern),int(mode))==(7,5,0)and maximum==witness['maximum_bits']and
            neon==witness['original_neon_sum_bits']and rvv==witness['original_rvv_sum_bits']and
            values.split(',')==witness['input_bits']and'counterexample observed; repaired case passed'in text,
            'Original witness dictionary differs from actual output')
    for name,digest in status['input_sha256'].items():require(sha(folder/'inputs'/name)==digest,'Original witness input snapshot drift')
    return dict(scope='Archived original finite mismatch, not a new execution or proof',index_sha256=sha(CASE/'proof/original-counterexamples.json'),status_sha256=sha(folder/'status.json'))


def audit_implementations(run,execute):
    originals,repair=read(CASE/'proof/originals.json'),read(CASE/'proof/repair.json');target=run/'repair-replay/impl';target.mkdir(parents=True);result={}
    for side,filename in [('neon','testNEON.c'),('rvv','testRVV.c')]:
        row=originals['implementations'][side]
        require(sha(ROOT/row['repository_source'])==sha(CASE/row['archived_source'])==row['sha256'],'Original source drift')
        require(sha(CASE/row['current_implementation'])==row['current_sha256'],'Current repaired implementation drift')
        shutil.copyfile(CASE/row['archived_source'],target/filename)
        result[side]=dict(original=row['repository_source'],original_sha256=row['sha256'],actual=row['current_implementation'],actual_sha256=row['current_sha256'])
    require(sha(CASE/repair['patch'])==repair['patch_sha256'],'Repair patch drift')
    execute(['patch','--batch','--forward','--fuzz=0','-p1','-d',target.parent,'-i',CASE/repair['patch']],'exact-repair-patch')
    for side,filename in [('neon','testNEON.c'),('rvv','testRVV.c')]:require(sha(target/filename)==result[side]['actual_sha256'],'Zero-fuzz replay differs')
    audit_counterexamples();return result



def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--freeze', action='store_true')
    parser.add_argument('--prepare-only', action='store_true')
    parser.add_argument('--candidate', action='store_true', help='Build complete reviewable H in private run only; do not freeze public H')
    args = parser.parse_args()
    require(sum([args.freeze,args.prepare_only,args.candidate])==1, 'Choose exactly --prepare-only, --candidate or --freeze')
    run = Path(tempfile.mkdtemp(prefix='full-handoff-', dir=CASE / '.build'))
    records = []
    status = dict(passed=False, whole_kernel_verified=False, formal_proof=False,
                  freeze_requested=args.freeze, candidate_requested=args.candidate, run_directory=str(run), records=records)
    def execute(command, label):
        command = ['prlimit', '--as=17179869184:17179869184', '--', *map(str, command)]
        log = run / (label + '.log')
        with log.open('w') as output:
            try:
                code = subprocess.run(command, cwd=run, stdout=output, stderr=output, timeout=600).returncode
            except subprocess.TimeoutExpired:
                code = 124
        records.append(dict(label=label, command=command, exit_code=code, log_sha256=sha(log)))
        require(code == 0, label + ': ' + log.read_text()[-2000:])
    try:
        inputs = module('current_full_inputs', CASE / 'proof/full_inputs.py')
        coverage = module('actual_call_coverage', CASE / 'proof/full_call_coverage.py')
        inventory = read(CASE / 'proof/component-unit-inventory.json')
        units = inputs.inventory_units(require_complete=not args.prepare_only)
        paths = {}
        for unit in units:
            stem = unit['stem']
            folder = run / stem
            folder.mkdir()
            rendered = inputs.render_unit(stem, folder / (stem + '.c'), unit['construction'])
            expanded = folder / 'expanded.c'
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', *rendered['cpp_flags'],
                     '-I', CASE, rendered['private_source_path'], '-o', expanded], stem + '-cpp')
            paths[stem] = expanded
            if rendered['private_identity_path']:
                raw = folder / 'raw-expanded.c'
                execute(['gcc', '-E', '-P', '-CC', '-nostdinc', *rendered['cpp_flags'],
                         '-I', CASE, rendered['private_identity_path'], '-o', raw], stem + '-raw-cpp')
                require(inputs.tokens(raw.read_text()) == inputs.tokens(expanded.read_text()),
                        'Raw/annotated frontend tokens differ: ' + stem)
            if unit.get('historical_CPP'):
                historical = Path(unit['historical_CPP'])
                require(sha(historical) == unit['historical_CPP_sha256'], 'Historical CPP drift: ' + stem)
                require(inputs.tokens(historical.read_text()) == inputs.tokens(expanded.read_text()),
                        'Current CPP differs from checked component: ' + stem)
            unit.update(cpp_flags=rendered['cpp_flags'], cpp_sha256=sha(expanded),
                        identity_source=rendered['identity_source'])
        call_closure = coverage.audit_sources(paths, inventory, read(CASE / 'proof/semantics.json'),
                                             CASE, require_target_inventory=not args.prepare_only)
        status['call_closure'] = call_closure
        if args.prepare_only:
            status.update(passed=True, scope='current actual C identity/call closure only')
        else:
            if args.freeze:require(not (CASE / 'proof/frozen-full-handoff.json').exists(), 'Existing frozen H must be preserved')
            required_tools = ['check_full.py', 'gate_sources.py', 'parallel.py', 'external_dependencies.py']
            require(all((CASE / 'proof' / n).is_file() for n in required_tools), 'Incomplete whole-case tools')
            strategies = inputs.strategy_units()
            for strategy in strategies:
                goal = inputs.goal_source(strategy, strategy=True)
                fields = re.findall(r'^\s*Axiom (\w+)\s*:', goal.read_text(), re.M)
                types = re.findall(r'^Module Type (\w+)\.', goal.read_text(), re.M)
                require(len(fields) == strategy['fields'] and len(types) == 1, 'Strategy target inventory')
                strategy['field_names'], strategy['module_type'] = fields, types[0]
            own = required_modules(units, strategies, inventory['extra_mathematical_roots'])
            native = audit_native(inventory)
            semantic = audit_semantics()
            implementations = audit_implementations(run, execute)
            files = {CASE / 'README.zh-CN.md', CASE / 'spec.c', CASE / 'public_spec.c'}
            for directory, suffixes in [('impl', {'.c'}), ('shim', {'.c', '.h', '.strategies'}),
                                        ('proof/c', {'.c', '.h', '.json', '.strategies'}),
                                        ('proof/original', {'.c'}), ('proof/native', {'.c', '.h', '.py'})]:
                files |= {p for p in (CASE / directory).rglob('*') if p.is_file() and p.suffix in suffixes}
            generated = {u['stem'] + '_goal' for u in units} | {s['stem'] for s in strategies}
            files |= {CASE / 'proof/coq' / (n + '.v') for n in own if n not in generated}
            files |= {p for p in (CASE / 'proof').glob('*.py')}
            files |= {CASE / 'proof' / n for n in ['component-unit-inventory.json', 'repair.json', 'originals.json',
                      'original-counterexamples.json', 'repair.patch', 'semantics.json', 'intrinsic-ledger.json']}
            files |= {ROOT / r['original'] for r in implementations.values()}
            files |= {CASE / u['component_status'] for u in units}
            files |= {CASE / s['component_status'] for s in strategies}
            for receipt in native:
                files.add(CASE / receipt['path'])
                files |= {CASE / n for n in receipt['input_sha256']}
                files |= {CASE / n for n in receipt['recursive_input_sha256']}
            support_modules=[]
            for namespace,name in []:
                source=ROOT/'verification/qcp/verified/f32-vadd/proof/coq'/namespace/(name+'.v')
                files.add(source)
                support_modules.append(dict(namespace=namespace,name=name+'.v',
                    source=os.path.relpath(source,CASE),source_sha256=sha(source)))
            files|={p for p in(CASE/'proof/evidence').rglob('*')if p.is_file()and '.build'not in p.parts}
            frozen = {os.path.relpath(p.resolve(), CASE): sha(p) for p in sorted(files)}
            config_path=ROOT/'.build/simple-kernels-bootstrap/coq-flags.json'
            config_text=config_path.read_text();config=read(config_path)
            coq_profile=dict(coq_config_text=config_text,coq_config_sha256=sha(config_path),coq_flags=config['flags'][2:],support_modules=[])
            inputs.approved_coq_flags(coq_profile,run)
            handoff = dict(schema=1, namespace=NS,
                           coq_config_text=config_text,coq_config_sha256=sha(config_path),coq_flags=config['flags'][2:],
                           scope='Repaired actual kernel C-shim modular partial correctness; explicit source-reviewed intrinsic specifications; no ISA or termination theorem',
                           units=units, strategies=strategies, own_modules=own, support_modules=support_modules,
                           total_actual_c_vcs=sum(len(u['fields']) for u in units),
                           actual_c_function_count=6, call_closure=call_closure,
                           native_statuses=native, implementations=implementations,
                           public_semantic_boundary=semantic,
                           frozen_source_sha256=frozen,
                           limits=dict(configured_jobs=32, ordinary_per_process_GiB=16,
                                       heavy_per_process_GiB=32, generation_timeout=21600,
                                       ordinary_timeout=7200, heavy_timeout=14400,
                                       address_bits=64, endian='little', VLEN=128, SEW=32, LMUL=4, VLMAX=16, active_AVL_max=4,
                                       all_legal_VL_choices=True, all_binary32_inputs=True, input_padding=3, FP_rounding="RNE", RO_and_mutable_disjoint=True, output_sum_alias_permitted=True, params_NULL_permitted=True),
                           heavy_coq_labels=[], planning_run_directory=str(run))
            text = json.dumps(handoff, indent=2) + '\n'
            (run / 'handoff.json').write_text(text)
            if args.freeze:(CASE / 'proof/frozen-full-handoff.json').write_text(text)
            status.update(passed=True, source_handoff_frozen=args.freeze, complete_handoff_candidate=args.candidate, frozen_inputs=len(frozen),
                          actual_C_fields=handoff['total_actual_c_vcs'], own_modules=len(own))
    except Exception as error:
        status['error'] = repr(error)
    (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({k: v for k, v in status.items() if k not in {'records', 'call_closure'}}, indent=2))
    return 0 if status['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
