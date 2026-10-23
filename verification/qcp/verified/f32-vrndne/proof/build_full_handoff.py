#!/usr/bin/env python3
"""Prepare exact live C inventories; freeze only after every component gate passes.

This generates CPP and strategy interfaces, not a whole-kernel proof. Historical
component certificates and native JSON remain byte-preserved. The final full
runner regenerates all28 actual C targets and all10 strategy groups afresh.
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
import sys
import tempfile

sys.dont_write_bytecode = True
CASE = Path(__file__).resolve().parent.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
BASE = ROOT / 'verification/qcp/verified/f32-vadd'
NAMESPACE = 'Rndne'
EXCLUDED = {'CheckedNeonSeedProbe', 'neon_seed_probe_goal'}
STRATEGIES = [
    ('Rndne','rndne_rvv','proof/c/rndne_rvv.strategies','Rndne.RvvStrategy.CheckedRndneRvvStrategy',2),
    ('Rndne','rndne_memory','proof/c/rndne_memory.strategies','Rndne.RndneStrategy.CheckedRndneStrategy',4),
    ('QcpNeon', 'neon_bridge', '../../verified/f32-vadd/proof/c/QcpNeon/neon_bridge.strategies', 'QcpNeon.neon_bridge_strategy_proof.CheckedNeonBridge', 4),
    ('QcpNeonLoop', 'neon_tail', '../../verified/f32-vadd/proof/c/QcpNeonLoop/neon_tail.strategies', 'QcpNeonLoop.neon_tail_strategy_proof.CheckedNeonTail', 3),
    ('QcpVadd', 'float_array', '../../verified/f32-vadd/proof/c/QcpVadd/float_array.strategies', 'QcpVadd.float_array_strategy_proof.CheckedFloatArray', 2),
    ('QcpRvv32', 'rvv_arrays', '../../verified/f32-vadd/proof/c/QcpRvv32/rvv_arrays.strategies', 'QcpRvv32.rvv_arrays_strategy_proof.CheckedRvvArray', 3),
    ('QcpRvv32', 'rvv_store', '../../verified/f32-vadd/proof/c/QcpRvv32/rvv_store.strategies', 'QcpRvv32.rvv_store_strategy_proof.CheckedRvvStoreStrategy', 5),
    ('QcpRvv32', 'rvv_loop', '../../verified/f32-vadd/proof/c/QcpRvv32/rvv_loop.strategies', 'QcpRvv32.rvv_loop_strategy_proof.CheckedRvvLoopStrategy', 2),
    ('VaddComparator', 'comparator', '../../verified/f32-vadd/proof/c/VaddComparator/comparator.strategies', 'VaddComparator.comparator_strategy_proof.CheckedComparatorStrategies', 4),
    ('VaddWrapper', 'wrapper', '../../verified/f32-vadd/proof/c/VaddWrapper/wrapper.strategies', 'VaddWrapper.wrapper_strategy_proof.CheckedWrapperStrategy', 1),
]


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def read(p):
    return json.loads(Path(p).read_text())


def require(ok, message):
    if not ok:
        raise ValueError(message)


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def locate(path):
    p = Path(path)
    if p.exists():
        return p
    for i, component in enumerate(p.parts):
        if component == CASE.name:
            candidate = CASE.joinpath(*p.parts[i+1:])
            if candidate.exists():
                return candidate
    return p


def relative_includes(text, destination, origin):
    def fix(match):
        p = Path(match[1])
        p = p if p.is_absolute() else origin / p
        require(p.resolve().is_relative_to(ROOT.resolve()), 'Include escapes repository')
        return '#include "' + os.path.relpath(p.resolve(), destination.parent) + '"'
    return re.sub(r'^\s*#\s*include\s*"([^\"]+)"', fix, text, flags=re.M)


def include(path, destination):
    return '#include "' + os.path.relpath(CASE / path, destination.parent) + '"\n'


def template(stem, destination):
    raw, identity, flags = None, None, []
    if stem in {'neon_unit', 'rvv_unit'}:
        isa = stem.split('_')[0]
        generator = module('rndne_live_kernel', CASE/'proof/generate_kernel.py')
        original, annotated, annotations = generator.kernel_text(isa)
        require(annotations == read(CASE/'proof/c'/(isa+'.annotations.json')), 'Installed kernel annotation drift')
        text = '#include "'+str(CASE/'shim'/(isa+'_frontend.h'))+'"\n/*@ Extern Coq (fp32_of_real : real -> fp32) */\n'+annotated
        if isa=='rvv':text=text[:text.index(annotated)]+'/*@ include strategies "rndne_rvv.strategies" */\n'+annotated
        identity = 'impl/'+('testNEON.c' if isa=='neon' else 'testRVV.c')
        raw = destination.with_name(stem+'.raw.c')
        raw.write_text(include('shim/'+isa+'_frontend.h',raw)+include(identity,raw))
    elif stem == 'wrapper_unit':
        generator = module('rndne_live_wrapper', CASE/'proof/generate_wrapper.py')
        original,text,annotations = generator.wrapper_text()
        require(annotations == read(CASE/'proof/c/wrapper.annotations.json'), 'Installed wrapper annotation drift')
        raw = destination.with_name(stem+'.raw.c');raw.write_text(include('spec.c',raw));identity='spec.c'
    else:
        text = (include('shim/program_model.h',destination) if stem in {'memory_neon','memory_rvv_load','memory_rvv_store','rvv_control'} else '') + include('shim/'+stem+'.c',destination)
    return (relative_includes(text,destination,CASE) if stem.endswith('_unit') else text),flags,raw,identity


def goal_for(stem, status, preflight=None):
    candidates = []
    expected = preflight.get('goal_sha256') if preflight else status.get('goal_sha256')
    if preflight:
        candidates.append(locate(preflight['goal']))
    roots = [locate(status[key]) for key in ['run_directory', 'generation_dir', 'generation_run_directory'] if status.get(key)]
    if stem in {'neon_unit', 'rvv_unit', 'wrapper_unit'}:
        label = stem.split('_')[0]
        generation = read(CASE / 'proof' / (label + '-generation-status.json'))
        roots.append(locate(generation['run_directory']))
    for r in roots:
        candidates.extend(r / sub / (stem + '_goal.v') for sub in ['', 'coq', 'generated'])
    for p in candidates:
        if p.is_file():
            if expected:
                require(sha(p) == expected, 'Existing historical checked goal changed: ' + str(p))
            return p
    archive = CASE / 'proof/evidence/full-run'
    if (archive / 'status.json').exists():
        old = read(archive / 'status.json')
        matches = [u for u in old['actual_c_units'] if u['stem'] == stem]
        require(len(matches) == 1, 'Archive unit goal inventory ambiguous')
        u = matches[0]
        p = archive / 'units' / u['label'].replace('/', '-') / 'goal.v'
        require(sha(p) == u['goal_sha256'] and (not expected or expected == u['goal_sha256']), 'Archived checked goal changed')
        return p
    raise ValueError('Cannot locate exact actual checked goal for ' + stem)



def check_component(path, status, freeze):
    if not freeze:
        return {}
    require(status.get('passed') is True, 'Incomplete component ' + path)
    require(status.get('vc_correct_passed') is True, 'Incomplete typed component '+path)
    require(all(r['exit_code']==0 for r in status.get('records',[])), 'Failed component record '+path)
    public_proofs = {}
    for key in ['input_sha256', 'live_source_sha256', 'source_sha256', 'sources_sha256', 'proof_source_sha256', 'proof_sources_sha256']:
        values = status.get(key, {})
        if not isinstance(values, dict):
            continue
        for name, digest in values.items():
            source = CASE / name
            if not source.is_file() and '/' not in name:
                source = CASE / 'proof/coq' / (name if name.endswith('.v') else name + '.v')
            if source.is_file():
                if sha(source) != digest:
                    raise ValueError('Component input drift: '+path+':'+name)
                if source.parent == CASE / 'proof/coq' and source.stem not in EXCLUDED:
                    public_proofs[str(source.relative_to(CASE))] = sha(source)
            elif '/' in name:
                raise ValueError('Missing component source: ' + name)
            else:
                # Private generated goals/final local gates are not replacement
                # inputs for the full proof. Check retained bytes when available.
                candidate = locate(status['run_directory']) / 'coq' / name
                if candidate.exists():
                    require(sha(candidate) == digest, 'Historical private component source changed: ' + name)
    return public_proofs



def required_local_modules(units, strategies, generated_sources):
    """Select recursive actual typed-interface dependencies, not unused experiments.

    The full runner's independent coqdep and ordinary coqc subsequently resolve
    every selected import from fresh sources with no component objects.
    """
    sources = {p.stem: p for p in (CASE / 'proof/coq').glob('*.v')}
    generated = {u['stem'] + '_goal' for u in units}
    generated |= {Path(s['file']).stem + '_strategy_goal' for s in strategies if s['namespace'] == NAMESPACE}
    roots = {u['typed_instance'].split('.')[1] for u in units}
    roots |= {s['typed_instance'].split('.')[1] for s in strategies if s['namespace'] == NAMESPACE}
    if 'ForStepBridge' in sources:
        roots.add('ForStepBridge')
    roots |= generated
    needed, pending = set(), list(roots)
    while pending:
        name = pending.pop()
        if name in needed:
            continue
        require(name not in EXCLUDED and (name in sources or name in generated), 'Missing actual local dependency: ' + name)
        needed.add(name)
        source = generated_sources[name] if name in generated else sources[name]
        clean = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
        if name not in generated:
            require(not re.search(r'\b(?:Axiom|Parameter|Admitted|admit)\b', clean), 'Unchecked project declaration: ' + name)
        for match in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)', clean):
            prefix, body = match.groups()
            for word in body.split():
                qualified = (prefix + '.' + word) if prefix else word
                if qualified.startswith(NAMESPACE + '.'):
                    local = qualified[len(NAMESPACE) + 1:]
                    require('.' not in local, 'Unexpected local library subnamespace: ' + qualified)
                    pending.append(local)
    # Every actual C/strategy goal is a mandatory root even if a malformed proof
    # module failed to import it; final explicit aliases check the exact types.
    needed |= generated
    return sorted(needed)


def inventory():
    rows=[('bits','bits','Rndne.BitsChecked.CheckedBits',None),('scalar','scalar','Rndne.ScalarChecked.CheckedScalar',None)]
    vectors=read(CASE/'proof/vector-status.json')
    for u in vectors['units']:
        rows.append((u['name'],'vector','Rndne.VectorChecked.Checked_'+u['name'],u))
    for u in read(CASE/'proof/memory-status.json')['units']:
        rows.append((u['stem'],'memory',u['module'],u))
    rows += [(isa+'_unit',isa+'-proof','Rndne.'+isa.title()+'Checked.Checked'+isa.title(),None) for isa in ['neon','rvv']]
    rows += [('wrapper_unit','wrapper-proof','Rndne.WrapperChecked.CheckedWrapper',None)]
    require(len(rows)==28 and len({r[0]for r in rows})==28,'Actual translation unit inventory')
    return rows


def component_goal(stem,status,unit):
    expected=(unit or {}).get('goal_sha256',status.get('goal_sha256'))
    candidates=[]
    if unit and unit.get('generation_directory'):
        candidates.append(locate(unit['generation_directory'])/(stem+'_goal.v'))
    if stem.endswith('_unit'):
        generation=read(CASE/'proof'/(stem.split('_')[0]+'-generation-status.json'))
        if generation.get('generation_passed'):
            expected=generation['goal_sha256'];candidates.append(locate(generation['run_directory'])/(stem+'_goal.v'))
    if status.get('run_directory'):
        root=locate(status['run_directory']);candidates += [root/sub/(stem+'_goal.v')for sub in ['','coq','generated']]
    candidates.append(CASE/'proof/coq'/(stem+'_goal.v'))
    for source in candidates:
        if source.is_file():
            require(expected and sha(source)==expected,'Changed checked target: '+stem)
            return source
    archive=CASE/'proof/evidence/full-run'
    if (archive/'status.json').exists():
        old=read(archive/'status.json');matches=[u for u in old['actual_c_units']if u['stem']==stem]
        require(len(matches)==1,'Ambiguous archived target')
        u=matches[0];source=archive/'units'/u['label'].replace('/','-')/'goal.v'
        require(sha(source)==u['goal_sha256'] and (not expected or expected==u['goal_sha256']),'Archived target drift')
        return source
    raise ValueError('Missing checked actual goal: '+stem)


def archived_cpp(stem,goal_sha):
    folder=CASE/'proof/evidence/full-run';full=read(folder/'status.json')
    require(full.get('passed') and full.get('whole_kernel_verified'),'No completed immutable CPP archive fallback')
    rows=[u for u in full['actual_c_units']if u['stem']==stem]
    require(len(rows)==1 and rows[0]['goal_sha256']==goal_sha,'Archived CPP/checked goal binding differs')
    p=folder/'units'/rows[0]['label'].replace('/','-')/'expanded.c'
    require(sha(p)==rows[0]['cpp_sha256'],'Archived actual CPP bytes changed')
    return p


def audit_component_cpp(stem,certificate,receipt,unit,expanded,run,execute):
    """Match every TU to retained CPP or a reconstruction of byte-pinned input.

    Direct-QCP helper runs did not retain separate CPP; those are labelled as
    reconstructions of the exact recorded source input, not historical CPP or
    a new proof. All receipt source/header hashes are checked first.
    """
    check_component(certificate,receipt,True)
    detail={'component_status':certificate,'component_status_sha256':sha(CASE/certificate),'formal_proof_replayed':False}
    if stem in {'memory_neon','memory_rvv_load','memory_rvv_store','rvv_control'}:
        source=locate(receipt['run_directory'])/(stem+'.c');expected=unit['c_sha256']
        if not source.exists():source=archived_cpp(stem,receipt['units'][next(i for i,u in enumerate(receipt['units'])if u['stem']==stem)]['goal_sha256'])
        require(sha(source)==expected,'Historical memory CPP changed: '+stem)
        detail.update(method='retained_actual_component_cpp',historical_cpp_retained=True)
    elif stem.endswith('_unit'):
        generation=read(CASE/'proof'/(stem.split('_')[0]+'-generation-status.json'))
        require(generation['generation_passed'] and generation['goal_sha256']==receipt['goal_sha256'],'Component/current generation goal identity: '+stem)
        source=locate(generation['run_directory'])/(stem+'.c')
        if not source.exists():source=archived_cpp(stem,generation['goal_sha256'])
        expected=generation.get('c_sha256',generation.get('cpp_sha256'));require(expected and sha(source)==expected,'Historical function CPP changed: '+stem)
        detail.update(method='retained_actual_generation_cpp_bound_to_checked_goal',historical_cpp_retained=True,generation_goal_sha256=generation['goal_sha256'])
    else:
        wanted='qcp-'+stem if certificate=='proof/vector-status.json'else'qcp'
        records=[r for r in receipt['records']if r['label']==wanted and r['exit_code']==0]
        require(len(records)==1,'Ambiguous historical QCP input record: '+stem)
        inputs=[v.split('=',1)[1]for v in records[0]['command']if v.startswith('--input-file=')]
        require(len(inputs)==1,'Historical direct-QCP input missing: '+stem)
        recorded=Path(inputs[0]);relative='shim/'+stem+'.c';original=CASE/relative
        require(CASE.name in recorded.parts and list(recorded.parts[-2:])==['shim',stem+'.c'],'Unexpected direct-QCP source recipe: '+inputs[0])
        maps=[receipt.get(key,{})for key in ['input_sha256','source_sha256','sources_sha256']]
        hashes=[m[relative]for m in maps if isinstance(m,dict)and relative in m]
        require(hashes and all(h==sha(original)for h in hashes),'Direct-QCP source bytes changed: '+stem)
        source=run/(stem+'.component-input.cpp.c');execute(['gcc','-E','-P','-CC','-nostdinc',original,'-o',source],stem+'-component-input-cpp');expected=sha(source)
        detail.update(method='current_cpp_of_byte_pinned_historical_direct_input',historical_cpp_retained=False,historical_input_path=inputs[0],historical_input_sha256=sha(original),all_recorded_input_hashes_checked=True)
    require(sha(expanded)==expected,'Full TU CPP differs from actual component input: '+stem)
    detail.update(expected_cpp_sha256=expected,current_cpp_sha256=sha(expanded),cpp_bytes_identical=True)
    return detail


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--freeze',action='store_true')
    parser.add_argument('--prepare-only',action='store_true',help='CPP/body audit even while the final kernel goal is pending; never installs H')
    args=parser.parse_args();require(not(args.freeze and args.prepare_only),'Choose preparation or final freeze')
    run=Path(tempfile.mkdtemp(prefix='full-handoff-',dir=CASE/'.build'));folder=CASE/'proof/c/full';folder.mkdir(exist_ok=True)
    records=[];status={'passed':False,'formal_proof':False,'whole_kernel_verified':False,'freeze_requested':args.freeze,'prepare_only':args.prepare_only,'run_directory':str(run),'records':records}
    def execute(command,label):
        command=['prlimit','--as=17179869184:17179869184','--',*map(str,command)];log=run/(label+'.log')
        with log.open('w')as output:
            try:ec=subprocess.run(command,cwd=run,stdout=output,stderr=output,timeout=600).returncode
            except subprocess.TimeoutExpired:ec=124
        records.append({'label':label,'command':command,'exit_code':ec,'log_sha256':sha(log)})
        require(ec==0,label+': '+log.read_text()[-3000:])
    try:
        require(not(CASE/'proof/frozen-full-handoff.json').exists(),'Existing H: preserve explicitly before a new freeze')
        full=module('rndne_full',CASE/'proof/check_full.py');coverage=module('rndne_coverage',BASE/'proof/coverage.py');coverage.C_KEYWORDS.add('return')
        units=[];components={};definitions={};declarations={};calls=set();public_proofs={};generated={};pending=[]
        for stem,component,checked,pre in inventory():
            certificate='proof/'+component+'-status.json';path=CASE/certificate;receipt=read(path)if path.exists()else{}
            if receipt.get('passed'):
                public_proofs.update(check_component(certificate,receipt,args.freeze))
                components[certificate]={'path':certificate,'sha256':sha(path)}
            elif args.freeze:raise ValueError('Incomplete component: '+certificate)
            tu=folder/(stem+'.c');text,flags,raw,identity=template(stem,tu);tu.write_text(text)
            source=run/(stem+'.c');source.write_text(full.render_unit_text(CASE,{'translation_unit':str(tu.relative_to(CASE))}))
            expanded=run/(stem+'.expanded.c');execute(['gcc','-E','-P','-CC','-nostdinc',*flags,source,'-I',CASE,'-o',expanded],stem+'-cpp')
            cpp_identity=audit_component_cpp(stem,certificate,receipt,pre,expanded,run,execute) if receipt.get('passed') else None
            if raw:
                original=run/(stem+'.raw.expanded.c');execute(['gcc','-E','-P','-CC','-nostdinc',*flags,raw,'-I',CASE,'-o',original],stem+'-raw-cpp')
                require(full.tokens(original.read_text())==full.tokens(expanded.read_text()),'Raw/frontend token drift: '+stem)
            bodies=[]
            for name,signature,contract,edges in coverage._functions(expanded.read_text(),stem):
                pair=signature,contract;require(name not in declarations or declarations[name]==pair,'C signature/contract mismatch: '+name);declarations[name]=pair
                if edges is not None:
                    definitions.setdefault(name,[]).append(stem);bodies.append(name);calls.update(edges)
            goal=None
            try:goal=component_goal(stem,receipt,pre)
            except ValueError:
                if not args.prepare_only:raise
                pending.append(stem)
            fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M)if goal else []
            expected=full.EXPECTED_UNITS[stem]
            if goal:
                require(fields and len(fields)==len(set(fields)) and (expected is None or len(fields)==expected),'Actual target count drift: '+stem)
                generated[stem+'_goal']=goal
            u=dict(stem=stem,translation_unit=str(tu.relative_to(CASE)),cpp_flags=flags,cpp_sha256=sha(expanded),goal_sha256=sha(goal)if goal else None,fields=fields,functions_defined=sorted(bodies),typed_instance=checked,strategy_application_limit=1024,component_cpp_identity=cpp_identity)
            if raw:u.update(raw_translation_unit=str(raw.relative_to(CASE)),identity_source=identity)
            units.append(u)
        require(not set(declarations)-set(definitions),'Declarations without bodies: '+str(sorted(set(declarations)-set(definitions))))
        require(not calls-set(definitions),'Unbound callees: '+str(sorted(calls-set(definitions))))
        require(len(definitions)==full.EXPECTED_BODIES_COUNT,'Unique actual function count: '+str(len(definitions)))
        public=run/'public.expanded.c';execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'spec.c','-I',CASE,'-o',public],'public-cpp')
        for name,signature,contract,_ in coverage._functions(public.read_text(),'public spec'):
            require(name in declarations and declarations[name]==(signature,contract),'Public contract/signature not bound: '+name)
        status.update(units=len(units),known_actual_c_fields=sum(len(u['fields'])for u in units),pending_actual_targets=pending,actual_c_bodies=len(definitions),actual_body_call_closure=True)
        if args.prepare_only:
            (run/'unit-preflight.json').write_text(json.dumps({'units':units,'definitions':definitions,'calls':sorted(calls),'scope':'CPP and exact declarations/body/call identity only; not a proof'},indent=2)+'\n')
            status.update(passed=True)
        else:
            require(not pending and all(isinstance(n,int)for n in full.EXPECTED_UNITS.values()),'Final actual RVV interface count not fixed')
            strategies=[];tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
            for namespace,stem,path,checked,count in STRATEGIES:
                out=run/('strategy-'+namespace+'-'+stem);out.mkdir();execute([tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/path),'--coq-output-dir='+str(out),'--coq-logic-path='+namespace],'strategy-'+namespace+'-'+stem)
                goal=out/(stem+'_strategy_goal.v');fields=re.findall(r'^\s*Axiom (\w+)\s*:',goal.read_text(),re.M);require(len(fields)==count,'Strategy count drift')
                if namespace==NAMESPACE:generated[stem+'_strategy_goal']=goal
                else:require(goal.read_bytes()==(BASE/'proof/coq'/namespace/goal.name).read_bytes(),'Inherited strategy target drift')
                strategies.append(dict(file=path,namespace=namespace,fields=fields,goal_sha256=sha(goal),typed_instance=checked))
            require(len(strategies)==10 and sum(len(s['fields'])for s in strategies)==30,'Strategy inventory')
            own=required_local_modules(units,strategies,generated)
            native_path='proof/native-status.json';native=read(CASE/native_path)
            require(native.get('passed') and native['independent_oracle']=='C nearbyintf under FE_TONEAREST, independently from both magic-number implementations' and native['input_and_output_guards_preserved'],'Native acceptance')
            require(all(r['exit_code']==0 for r in native['records']),'Failed native record')
            recursive=native['input_sha256'];require(len(recursive)>=52 and not native['system_headers_in_inventory'],'Recursive native dependency inventory')
            for name,digest in recursive.items():require((CASE/name).resolve().is_relative_to(ROOT.resolve())and sha(CASE/name)==digest,'Native input drift: '+name)
            originals=read(CASE/'proof/originals.json');require(originals['repair_applied']is False,'Unexpected repair schema')
            implementations={}
            for side in ['neon','rvv']:
                row=originals['files'][side];require(sha(ROOT/row['source_path'])==sha(CASE/row['original_path'])==sha(CASE/row['impl_path'])==row['sha256'],'Original source drift: '+side)
                implementations[side]=dict(actual=row['impl_path'],actual_sha256=row['sha256'],original=row['source_path'],original_copy=row['original_path'],original_sha256=row['sha256'],variant='original')
            files={CASE/'spec.c',Path(__file__),CASE/'proof/check_full.py',CASE/'proof/originals.json',CASE/native_path}
            files|={ROOT/row['source_path']for row in originals['files'].values()}
            files|={CASE/p for p in components};files|={CASE/('proof/'+n+'-generation-status.json')for n in ['neon','rvv','wrapper']}
            for directory,extensions in [('impl',{'.c'}),('shim',{'.c','.h','.strategies'}),('proof/c',{'.c','.h','.json','.strategies'}),('proof/original',{'.c'})]:
                files|={p for p in (CASE/directory).rglob('*')if p.is_file()and p.suffix in extensions}
            files|={CASE/'proof/coq'/(n+'.v')for n in own if not n.endswith('_goal')}
            files|={p for p in (CASE/'proof').glob('*.py')if p.name not in {'record_status.py','audit_relocation.py'}}
            files|={CASE/n for n in recursive};files|={CASE/s['file']for s in strategies}
            frozen={os.path.relpath(p.resolve(),CASE):sha(p)for p in sorted(files)}
            h=dict(namespace=NAMESPACE,scope='Original NEON and RVV fixed C-shim partial correctness over all binary32 inputs under RNE',total_actual_c_vcs=sum(len(u['fields'])for u in units),actual_c_function_count=len(definitions),whole_kernel_bodies_required=['test_neon','test_rvv','compare_outputs','equivalent'],units=units,strategies=strategies,own_modules=own,components=list(components.values()),component_public_proof_sha256=public_proofs,support_statuses=[],implementations=implementations,native_status=native_path,native_status_sha256=sha(CASE/native_path),native_success_field='passed',native_required_values={k:native[k]for k in ['independent_oracle','input_and_output_guards_preserved','cases_per_sanitizer','lanes_per_side_per_sanitizer']},native_input_sha256=recursive,native_recursive_source_count=len(recursive),auxiliary_native_statuses=[],frozen_source_sha256=frozen,diagnostics_excluded=sorted(EXCLUDED),limits=dict(pointer_bits=64,endian='little',vlen_bits=128,rvv_configurations=['e32m8'],vlmax=32,selected_vl='min(AVL,32)',input_padding_floats=3,output_padding_floats=0,batch_domain='positive byte batch divisible by4; 0<n<=4611686018427387903',parameter_domain='Unused params may be NULL; all binary32 input bit patterns including NaN/Inf/signed zero/subnormal',rounding='RNE; original magic add/sub sequence',observation='Numeric equality or both NaN; payload/sign flags/traps unobserved',arm_environment='A64 DN=0 FZ=0 AH=0',isa_refinement='open',physical_struct_abi_refinement='not claimed',termination_theorem='not claimed',abstract_round_to_nearest_even_spec='not formally established; independent finite nearbyintf native oracle'),planning_run_directory=str(run))
            (run/'handoff.json').write_text(json.dumps(h,indent=2)+'\n')
            if args.freeze:(CASE/'proof/frozen-full-handoff.json').write_text(json.dumps(h,indent=2)+'\n')
            status.update(passed=True,strategy_groups=len(strategies),strategy_fields=30,own_modules=len(own),frozen_inputs=len(frozen))
    except Exception as error:status['error']=str(error)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({k:v for k,v in status.items()if k!='records'},indent=2));return 0 if status['passed']else 1

if __name__=='__main__':raise SystemExit(main())
