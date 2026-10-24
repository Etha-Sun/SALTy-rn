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
import subprocess
import tempfile

CASE = Path(__file__).resolve().parent.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
NS = 'Dwconv'
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
    name='proof/native-public-status.json'
    status=read(CASE/name)
    require(status['passed']is True and status['per_process_memory_GiB']==16,'Native gate failed')
    require(status['ordinary_helper_smoke']and status['public_comparator_wrong_pair_rejected']and
            status['common_wrong_negative_control_rejected'],'Incomplete independent/public/helper controls')
    for mode in ['undefined','address']:
        require(status[mode+'_finite_counts']==dict(cases=18720,lanes_per_side=1544400),'Incomplete native corpus')
        require(status[mode+'_negative_control']['exit_code']==1,'Common-wrong oracle not rejected')
    for source,digest in status['input_sha256'].items():
        require((CASE/source).resolve().is_relative_to(ROOT.resolve())and sha(CASE/source)==digest,
                'Native current recursive input changed: '+source)
    run=Path(status['run_directory'])
    for record in status['records']:
        require(record['exit_code']==record['expected_exit_code'],'Native execution failed')
        log=run/(record['label']+'.log')
        if not log.is_file():log=CASE/'proof/evidence/native/native-public-status'/(record['label']+'.log')
        require(sha(log)==record['log_sha256'],'Native execution log drift')
        if record['label']=='address-run':
            lines=log.read_text().splitlines()
            require(any('"actual_memory_max": "17179869184"'in x and
                        '"actual_memory_swap_max": "0"'in x for x in lines),'Missing actual ASan cgroup bounds')
    return [dict(path=name,sha256=sha(CASE/name),input_sha256=status['input_sha256'],
                 recursive_input_sha256=status['input_sha256'])]


def audit_semantics():
    semantic=read(CASE/'proof/semantics.json')
    require(len(semantic['intrinsic_ledger'])==24,'Intrinsic inventory changed')
    require(semantic['fp_environment']['all_FP32']is True and
            semantic['fp_environment']['bounds_order_required']is False,'FP public domain weakened')
    for row in semantic['intrinsic_ledger']:
        require(row['isa_refinement_proved']is False,'Unsupported ISA claim')
        for name,digest in row['source_files_sha256'].items():
            require(sha(CASE/name)==digest,'Intrinsic model changed: '+name)
    for source in semantic['primary_sources'].values():
        if 'relative_copy'in source:require(sha(CASE/source['relative_copy'])==source['sha256'],'ISA source copy drift')
    return semantic


def audit_counterexamples():
    index=read(CASE/'proof/original-counterexamples.json')
    require({x['kind']for x in index['artifacts']}=={'original-counterexamples','repair-replay'},
            'Original counterexample/repair archive set differs')
    for row in index['artifacts']:
        require(row['archived_files_sha256'],'Empty original evidence archive')
        for name,digest in row['archived_files_sha256'].items():
            require((CASE/name).resolve().is_relative_to(CASE.resolve())and sha(CASE/name)==digest,
                    'Original counterexample/repair artifact changed: '+name)
    old=read(CASE/'proof/evidence/original-counterexamples/status.json')
    require(old['passed']is True and len(old['records'])==3 and
            {r['label']for r in old['records']}=={'packed_c1','nan_acc_c4','nan_bound_c4'},'Original witnesses incomplete')
    for record in old['records']:
        require(record['exit_code']==record['expected_exit_code']==1 and
                sha(CASE/'proof/evidence/original-counterexamples'/(record['label']+'.log'))==record['log_sha256'],
                'Original witness execution drift')
    for name,digest in old['original_sha256'].items():
        require(sha(CASE/'proof/original'/name)==digest==
                sha(CASE/'proof/evidence/original-counterexamples/originals'/name),'Witness used different original C')
    repair=read(CASE/'proof/evidence/repair-replay/status.json')
    require(repair['passed']and repair['exit_code']==0 and
            repair['exact_replay']==dict(NEON=True,RVV=True),'Historical exact patch replay failed')
    return dict(scope='Archived actual original witnesses, no new execution or Coq credit',
                index_sha256=sha(CASE/'proof/original-counterexamples.json'))


def audit_implementations(run,execute):
    originals,repair=read(CASE/'proof/originals.json'),read(CASE/'proof/repair.json')
    result={}
    target=run/'repair-replay/impl';target.mkdir(parents=True)
    for side,filename in [('neon','testNEON.c'),('rvv','testRVV.c')]:
        old=originals['implementations']['impl/'+filename]
        require(sha(ROOT/old['source_path'])==sha(CASE/old['original_copy'])==old['sha256'],'Original drift')
        require(sha(CASE/'impl'/filename)==old['repaired_sha256'],'Actual repaired source changed')
        shutil.copyfile(CASE/old['original_copy'],target/filename)
        result[side]=dict(original=old['source_path'],original_sha256=old['sha256'],
                          actual='impl/'+filename,actual_sha256=old['repaired_sha256'])
    require(sha(CASE/repair['patch'])==repair['patch_sha256'],'Repair patch drift')
    execute(['patch','--batch','--forward','--fuzz=0','-p1','-d',target.parent,'-i',CASE/repair['patch']],
            'exact-repair-patch')
    for side,filename in [('neon','testNEON.c'),('rvv','testRVV.c')]:
        require(sha(target/filename)==result[side]['actual_sha256'],'Zero-fuzz patch did not reconstruct current C')
    counterexamples=CASE/'proof/original-counterexamples.json'
    require(counterexamples.is_file(),'Public original counterexample archive required')
    audit_counterexamples()
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--freeze', action='store_true')
    parser.add_argument('--prepare-only', action='store_true')
    args = parser.parse_args()
    require(args.freeze != args.prepare_only, 'Choose --prepare-only or --freeze')
    run = Path(tempfile.mkdtemp(prefix='full-handoff-', dir=CASE / '.build'))
    records = []
    status = dict(passed=False, whole_kernel_verified=False, formal_proof=False,
                  freeze_requested=args.freeze, run_directory=str(run), records=records)
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
        units = inputs.inventory_units(require_complete=args.freeze)
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
                                             CASE, require_target_inventory=args.freeze)
        status['call_closure'] = call_closure
        if args.prepare_only:
            status.update(passed=True, scope='current actual C identity/call closure only')
        else:
            require(not (CASE / 'proof/frozen-full-handoff.json').exists(), 'Existing frozen H must be preserved')
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
            files = {CASE / 'README.zh-CN.md', CASE / 'spec.c'}
            for directory, suffixes in [('impl', {'.c'}), ('shim', {'.c', '.h', '.strategies'}),
                                        ('proof/c', {'.c', '.h', '.json', '.strategies'}),
                                        ('proof/original', {'.c'}), ('proof/native', {'.c', '.h', '.py'})]:
                files |= {p for p in (CASE / directory).rglob('*') if p.is_file() and p.suffix in suffixes}
            generated = {u['stem'] + '_goal' for u in units} | {s['stem'] for s in strategies}
            files |= {CASE / 'proof/coq' / (n + '.v') for n in own if n not in generated}
            files |= {p for p in (CASE / 'proof').glob('*.py')}
            files |= {CASE / 'proof' / n for n in ['component-unit-inventory.json', 'repair.json', 'originals.json',
                      'original-counterexamples.json', 'repair.patch', 'semantics.json']}
            files |= {ROOT / r['original'] for r in implementations.values()}
            files |= {CASE / u['component_status'] for u in units}
            files |= {CASE / s['component_status'] for s in strategies}
            for receipt in native:
                files.add(CASE / receipt['path'])
                files |= {CASE / n for n in receipt['input_sha256']}
                files |= {CASE / n for n in receipt['recursive_input_sha256']}
            support_modules=[]
            for namespace,name in [('QcpRvv32','FastFrame'),('NanBridge','BridgeLogic')]:
                source=ROOT/'verification/qcp/verified/f32-vadd/proof/coq'/namespace/(name+'.v')
                files.add(source)
                support_modules.append(dict(namespace=namespace,name=name+'.v',
                    source=os.path.relpath(source,CASE),source_sha256=sha(source)))
            files|={p for p in(CASE/'proof/evidence').rglob('*')if p.is_file()and '.build'not in p.parts}
            frozen = {os.path.relpath(p.resolve(), CASE): sha(p) for p in sorted(files)}
            handoff = dict(schema=1, namespace=NS,
                           scope='Repaired actual kernel C-shim modular partial correctness; explicit source-reviewed intrinsic specifications; no ISA or termination theorem',
                           units=units, strategies=strategies, own_modules=own, support_modules=support_modules,
                           total_actual_c_vcs=sum(len(u['fields']) for u in units),
                           actual_c_function_count=15, call_closure=call_closure,
                           native_statuses=native, implementations=implementations,
                           public_semantic_boundary=semantic,
                           frozen_source_sha256=frozen,
                           limits=dict(configured_jobs=32, ordinary_per_process_GiB=16,
                                       heavy_per_process_GiB=32, generation_timeout=21600,
                                       ordinary_timeout=7200, heavy_timeout=14400,
                                       address_bits=64, endian='little', VLEN=128, SEW=32, LMUL=4, VLMAX=16, active_AVL_max=4,
                                       all_legal_VL_choices=True, all_binary32_inputs_and_bounds=True),
                           planning_run_directory=str(run))
            text = json.dumps(handoff, indent=2) + '\n'
            (run / 'handoff.json').write_text(text)
            (CASE / 'proof/frozen-full-handoff.json').write_text(text)
            status.update(passed=True, source_handoff_frozen=True, frozen_inputs=len(frozen),
                          actual_C_fields=handoff['total_actual_c_vcs'], own_modules=len(own))
    except Exception as error:
        status['error'] = repr(error)
    (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({k: v for k, v in status.items() if k not in {'records', 'call_closure'}}, indent=2))
    return 0 if status['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
