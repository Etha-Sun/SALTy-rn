#!/usr/bin/env python3
"""Audit the complete current C closure and freeze exact fresh-replay inputs.
Preparation and historical component checks never establish a complete proof.
"""
from pathlib import Path
import argparse, json, re, shutil, subprocess, tempfile
import coverage
from full_inputs import CASE, NS, units, render_unit, sha, tokens, source_guard
from audit_return_ownership import require_clean
import record_status

MATHEMATICAL_ROOTS=['FrontendBridge','LoopCompatibility','ControlLoopFacts','MemoryAliasFacts']

def dependency_closure(rows):
    generated={u['stem']+'_goal':Path(u['goal_artifact']) for u in rows}
    sources={p.stem:p for p in (CASE/'proof/coq').glob('*.v')}
    pending=[u['typed_instance'].split('.')[1] for u in rows]+list(generated)+MATHEMATICAL_ROOTS
    needed=set()
    while pending:
        name=pending.pop()
        if name in needed:
            continue
        assert name in sources or name in generated,'Missing local source '+name
        needed.add(name);path=generated.get(name,sources.get(name))
        text=re.sub(r'\(\*.*?\*\)','',path.read_text(),flags=re.S)
        if name not in generated:
            assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort|Declare\s+Module)\b',text),'Unchecked local declaration '+name
        for match in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',text):
            prefix,body=match.groups()
            for word in body.split():
                full=(prefix+'.'+word) if prefix else word
                if full.startswith(NS+'.'):
                    local=full[len(NS)+1:]
                    assert '.' not in local,'Unexpected local subnamespace '+full
                    pending.append(local)
    return sorted(needed),generated

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--freeze',action='store_true')
    parser.add_argument('--prepare-only',action='store_true')
    args=parser.parse_args();assert not(args.freeze and args.prepare_only)
    run=Path(tempfile.mkdtemp(prefix='full-preflight-',dir=CASE/'.build'))
    records=[];state=dict(passed=False,formal_proof=False,whole_kernel_verified=False,
        scope='Current input/CPP/call-closure diagnostic only; not a QCP or Coq proof',
        run_directory=str(run),records=records)
    handoff={}
    try:
        source_guard();rows=units(require_checked=not args.prepare_only)
        declarations={};definitions={};calls=[];drift=[]
        coverage.C_KEYWORDS.add('return')
        for unit in rows:
            stem=unit['stem'];rendered=render_unit(unit)
            source=run/(stem+'.c');source.write_text(rendered['text'])
            expanded=run/(stem+'.expanded.c')
            record_status.execute(['gcc','-E','-P','-CC','-nostdinc',*rendered['cpp_flags'],str(source),'-o',str(expanded)],run,run/(stem+'-cpp.log'))
            goal=Path(unit['goal_artifact'])
            assert sha(goal)==unit['goal_sha256'],'Original target changed '+stem
            require_clean(goal)
            fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M)
            assert fields==unit['fields'] and len(fields)==unit['expected_fields']
            if rendered['identity_text']:
                raw=run/(stem+'.raw.c');raw.write_text(rendered['identity_text'])
                raw_cpp=run/(stem+'.raw.expanded.c')
                record_status.execute(['gcc','-E','-P','-CC','-nostdinc',str(raw),'-o',str(raw_cpp)],run,run/(stem+'-identity.log'))
                assert tokens(raw_cpp.read_text())==tokens(expanded.read_text()),'Frontend executable identity '+stem
            original_cpp=unit['cpp_sha256']
            unit.update(historical_component_cpp_sha256=original_cpp,cpp_sha256=sha(expanded),cpp_flags=rendered['cpp_flags'])
            if unit['cpp_sha256']!=original_cpp:
                drift.append(dict(stem=stem,historical_cpp_sha256=original_cpp,current_cpp_sha256=unit['cpp_sha256'],
                    admission='Historical CPP is not reused. Fresh QCP must reproduce the exact original goal and all current declarations/contracts must close.'))
            parsed=list(coverage._functions(expanded.read_text(),stem));bodies=[]
            for name,signature,contract,edges in parsed:
                pair=(signature,contract)
                assert name not in declarations or declarations[name]==pair,'C signature/Require/Ensure differs '+name+' in '+stem
                declarations[name]=pair
                if edges is not None:
                    definitions.setdefault(name,[]).append(stem);bodies.append(name)
                    calls.extend((name,edge) for edge in edges)
            unit['functions_defined']=sorted(bodies)
        missing=sorted(set(declarations)-set(definitions))
        unbound=sorted({edge for _,edge in calls}-set(definitions))
        assert not missing and not unbound,('C closure incomplete',missing,unbound)
        assert all(len(v)==1 for v in definitions.values()),'Duplicate actual C body provider'
        required=['test_neon','test_rvv','equivalent','rdsum_equal_i32']
        assert set(required)<=set(definitions),'Missing actual kernel/public observation body'
        assert len(rows)==35 and sum(len(u['fields']) for u in rows)==1590
        closure=dict(definitions=definitions,calls=sorted(set(calls)),unbound_callees=unbound,
                     declarations_without_checked_body=missing,unique_c_functions_with_bodies=len(definitions),
                     exact_contract_and_signature_match=True)
        state.update(actual_c_units=35,actual_c_vcs=1590,actual_c_bodies=len(definitions),call_closure=closure,
                     historical_cpp_drift=drift)
        if not args.prepare_only:
            identity_path=CASE/'proof/current-cpp-drift-status.json'
            identity=json.loads(identity_path.read_text())
            assert identity['passed'] and not identity['formal_proof'] and not identity['whole_kernel_verified']
            expected_drift={item['stem'] for item in drift}
            assert {item['stem'] for item in identity['records']}==expected_drift
            for item in identity['records']:
                current=next(u for u in rows if u['stem']==item['stem'])
                assert item['passed'] and item['exit_code']==0
                assert item['current_cpp_sha256']==current['cpp_sha256']
                assert item['current_goal_sha256']==item['expected_goal_sha256']==current['goal_sha256']
            own,generated=dependency_closure(rows)
            identities=record_status.identity(CASE,run)
            for side,count in [('neon',412),('rvv',123)]:
                row=next(u for u in rows if u['stem']==side+'_unit')
                assert len(row['fields'])==count
                provider=CASE/'proof/coq'/(row['typed_instance'].split('.')[1]+'.v')
                text=provider.read_text()
                assert re.search(r'\bModule\s+'+re.escape(row['typed_instance'].split('.')[-1])+r'\s*(?::|<:)\s*'+re.escape(NS+'.'+side+'_unit_goal.VC_Correct')+r'\b',text),'Missing explicit whole-kernel VC_Correct'
            native=CASE/'proof/formal-native-status.json'
            limits=json.loads((CASE/'proof/semantics.json').read_text())
            handoff=dict(namespace=NS,units=rows,strategies=[],total_actual_c_vcs=1590,total_strategy_fields=0,
                actual_c_function_count=len(definitions),whole_kernel_bodies_required=required,
                own_modules=own,generated_modules=sorted(generated),native_status='proof/formal-native-status.json',
                native_status_sha256=sha(native),limits=limits,call_closure=closure,
                historical_cpp_drift=drift,preparation_run=str(run))
            handoff['mathematical_roots']=MATHEMATICAL_ROOTS
            files={CASE/'spec.c',CASE/'README.md',CASE/'proof/originals.json',CASE/'proof/repair.json',
                   CASE/'proof/original-counterexamples.json',CASE/'proof/semantics.json',native,
                   CASE/'proof/intrinsic-ledger.json',
                   CASE/'proof/native-asan-status.json',CASE/'proof/component-unit-inventory.json',
                   CASE/'proof/type-width-status.json',
                   CASE/'proof/frontend-scope.json',CASE/'proof/loop-compatibility.json',
                   CASE/'proof/progress-invariant-repair.json',identity_path}
            for directory in ['shim','impl','proof/c','proof/original','proof/native']:
                files.update(p for p in (CASE/directory).rglob('*') if p.is_file() and p.suffix in {'.c','.h','.json','.strategies','.inc'})
            files.update((CASE/'proof').glob('*.py'));files.update((CASE/'proof').glob('repair*.patch'))
            files.update(CASE/'proof/coq'/(name+'.v') for name in own if name not in generated)
            files.update(CASE/u['component_status'] for u in rows)
            for item in identities['native']:
                files.update(CASE/name for name in json.loads((CASE/item['path']).read_text())['input_sha256'])
            frozen={str(p.relative_to(CASE)):sha(p) for p in sorted(files)}
            handoff['frozen_source_sha256']=frozen
            state.update(own_modules=len(own),frozen_inputs=len(frozen))
            (run/'preview-handoff.json').write_text(json.dumps(handoff,indent=2)+'\n')
            if args.freeze:
                target=CASE/'proof/frozen-full-handoff.json'
                assert not target.exists(),'Preserve existing frozen H explicitly before refreeze'
                target.write_text(json.dumps(handoff,indent=2)+'\n')
        state['passed']=True
    except Exception as error:
        state['error']=str(error)
    (run/'status.json').write_text(json.dumps(state,indent=2)+'\n')
    print(json.dumps({k:v for k,v in state.items() if k not in ['records','call_closure']},indent=2))
    return 0 if state['passed'] else 1

if __name__=='__main__':
    raise SystemExit(main())
