"""Regenerate all public C units and rebuild the complete original/AVL128 Coq closure."""
from pathlib import Path
import argparse, concurrent.futures, hashlib, importlib.util, json, os, re, shutil, subprocess, time
from sources import CASE, sha, tokens, render_unit, render_kernel, audit_coverage

PROOF = CASE/'proof'; QCP = CASE.parent.parent
def dump(path, value): path.write_text(json.dumps(value,indent=2)+'\n')
def operational_files():
    result = [CASE/'spec.c']
    for folder in ['impl','shim','proof/coq','proof/c']:
        result += [p for p in (CASE/folder).rglob('*') if p.is_file()]
    result += list(PROOF.glob('*.py'))
    result += [PROOF/'units.json', PROOF/'coq-source-lock.json']
    return sorted(result)
def audit_inputs():
    lock = json.loads((PROOF/'input-lock.json').read_text())
    assert set(lock) == {str(p.relative_to(CASE)) for p in operational_files()}
    for n,h in lock.items(): assert sha(CASE/n)==h, ('input changed',n)
    root = QCP.parent.parent
    for side,filename in [('source','testNEON.c'),('target','testRVV.c')]:
        assert (CASE/'impl'/filename).read_bytes() == (root/'kernels'/side/'u8-vclamp.c').read_bytes()
    original = (CASE/'impl/testRVV.c').read_text(); repaired = original
    for variable in ['batch64','batch']:
        needle='__riscv_vsetvl_e8m8('+variable+')'; assert repaired.count(needle)==1
        repaired=repaired.replace(needle,'__riscv_vsetvl_e8m8('+variable+' < 128 ? '+variable+' : 128)')
    assert repaired == (CASE/'impl/variants/testRVV.avl128.c').read_text()
    return lock

def main():
    assert __debug__, 'optimized Python is not an acceptance mode'
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--jobs',type=int,default=16)
    p.add_argument('--name',default='fresh-'+str(int(time.time())))
    p.add_argument('--freeze',action='store_true')
    p.add_argument('--generate-only',action='store_true')
    a=p.parse_args(); assert 16<=a.jobs<=64, 'user policy: at least 16 batch workers'
    if a.freeze:
        dump(PROOF/'input-lock.json',{str(p.relative_to(CASE)):sha(p) for p in operational_files()})
        audit_inputs(); print('Frozen current public sources and replay scripts'); return 0
    inputs=audit_inputs(); run=CASE/'.build'/a.name; run.mkdir(parents=True,exist_ok=False)
    config_spec=importlib.util.spec_from_file_location('qcp_environment',QCP/'tools/environment.py')
    environment=importlib.util.module_from_spec(config_spec);config_spec.loader.exec_module(environment)
    env=environment.load_environment(); dump(run/'environment.json',env)
    records=[]; started=time.monotonic()
    def execute(label,cmd,cwd,limit):
        before=time.monotonic();log=cwd/(label+'.log')
        with log.open('w')as stream:
            try: rc=subprocess.run(list(map(str,cmd)),cwd=cwd,stdout=stream,stderr=subprocess.STDOUT,
                                   timeout=limit,env={**os.environ,'COQPATH':''}).returncode
            except subprocess.TimeoutExpired:rc=124
        r=dict(stage=label,command=list(map(str,cmd)),exit=rc,seconds=time.monotonic()-before,
               log=str(log.relative_to(run)),log_sha256=sha(log))
        assert rc==0, r
        return r
    units=json.loads((PROOF/'units.json').read_text())
    def generate(unit):
        folder=run/'units'/unit['name'];folder.parent.mkdir(exist_ok=True)
        entry,raw=render_unit(unit,folder);shutil.copyfile(entry,folder/'annotated-input.c')
        local=[];cpp=folder/'expanded.c'
        local.append(execute('cpp',['gcc','-E','-P','-CC','-nostdinc',entry,'-o',cpp],folder,60))
        if raw:
            rp=folder/'raw-expanded.c'
            local.append(execute('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',raw,'-o',rp],folder,60))
            assert tokens(cpp.read_text())==tokens(rp.read_text()), 'source/CPP drift'
        shutil.copyfile(cpp,entry)
        cmd=['prlimit','--as=17179869184','--stack=67108864','--cpu=900','--',env['qcp'],
             '--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--no-record-strategies',
             '--input-file='+str(entry),'--coq-output-dir='+str(folder),'--coq-logic-path='+unit['logic']]
        if unit['slp']:cmd+=['-slp',str(folder),'FullU8']
        local.append(execute('qcp',cmd,folder,915))
        goal=entry.with_name(entry.stem+'_goal.v')
        assert sha(goal)==unit['expected_goal_sha256']==sha(PROOF/'coq'/unit['expected']), ('raw goal changed',unit['name'])
        fields=re.findall(r'^Axiom proof_of_(\w+)',goal.read_text(),re.M);assert len(fields)==unit['C_VCs']
        strategies=[]
        for source in sorted(folder.glob('*.strategies')):
            expected=PROOF/'coq/FullU8'/(source.stem+'_strategy_goal.v')
            if not expected.exists():continue
            local.append(execute('strategy-'+source.stem,[env['strategy'],'--arch=64','--endian=little',
                '--input-file='+str(source),'--coq-output-dir='+str(folder),'--coq-logic-path=FullU8'],folder,120))
            actual=folder/expected.name;assert actual.read_bytes()==expected.read_bytes()
            strategies.append(dict(name=source.stem,goal=str(actual),sha256=sha(actual)))
        result=dict(passed=True,name=unit['name'],CPP=str(cpp),CPP_sha256=sha(cpp),goal=str(goal),
                    goal_sha256=sha(goal),C_VCs=len(fields),expected=unit['expected'],records=local,
                    source_CPP_identity_checked=raw is not None,strategies=strategies)
        dump(folder/'result.json',result);print('C_REPLAY',unit['name'],len(fields),flush=True)
        return result
    state=dict(passed=False,whole_kernel_verified=False,parallel_jobs=a.jobs,per_process_memory_GiB=16,
               run_directory=str(run),input_sha256=inputs,records=records,external_libraries_rebuilt=False)
    try:
        if not a.generate_only:
            from native import run_native
            state['native']=run_native(run,a.jobs)
        with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs) as pool:
            results=list(pool.map(generate,units))
        coverage=audit_coverage(results);dump(run/'coverage.json',coverage)
        state.update(actual_C_units=results,call_coverage=coverage)
        # Negative control exercises the same source-identity guard used by generation.
        original=(CASE/'impl/testRVV.c').read_text(); mutant=original.replace('batch -= vl;','batch -= 1;',1)
        assert mutant!=original
        try:render_kernel('rvv_original',override=mutant)
        except AssertionError:state['source_tamper_rejected']=True
        else:raise AssertionError('mutated source accepted')
        if a.generate_only:
            state.update(generation_passed=True,scope='generation_and_source_audit_only')
            return 0
        coq=run/'coq';shutil.copytree(PROOF/'coq',coq);assert not list(coq.rglob('*.vo'))
        locks=json.loads((PROOF/'coq-source-lock.json').read_text())
        assert all(sha(coq/n)==h for n,h in locks.items())
        for result in results:
            shutil.copyfile(result['goal'],coq/result['expected'])
            for strategy in result['strategies']:
                shutil.copyfile(strategy['goal'],coq/'FullU8'/Path(strategy['goal']).name)
        project=[];flags=env['flags'];i=0
        while i<len(flags):
            if flags[i]in ['-R','-Q']:project.append(' '.join(flags[i:i+3]));i+=3
            else:i+=1
        project += ['-Q '+str(f)+' '+f.name for f in sorted(coq.iterdir()) if f.is_dir()]
        project += sorted(locks);(coq/'_CoqProject').write_text('\n'.join(project)+'\n')
        makefile=Path(env['coqc']).parent/'coq_makefile'
        records.append(execute('makefile',[makefile,'-f','_CoqProject','-o','Makefile'],coq,120))
        with (coq/'Makefile').open('a')as f:
            f.write('\nU8PackedKernel/unit_goal.vo RvvRepair/unit_goal.vo: U8PackedKernel/Prelude.vo\n')
        records.append(execute('compile',['make','-f','Makefile','-j'+str(a.jobs),
            'COQBIN='+str(makefile.parent)+'/', 'COQC=python3 '+str(PROOF/'coqc_worker.py'),
            'U8CaseClosure/CaseChecked.vo','RvvRepair/CaseChecked.vo','RvvRepair/Policy.vo'],coq,14400))
        modules=[json.loads(p.read_text())for p in sorted((coq/'.work').rglob('result.json'))]
        assert len(modules)==458 and all(m['exit']==0 and m['source_unchanged']for m in modules)
        assert all(sha(coq/n)==h for n,h in locks.items())
        assert {m['source']for m in modules}=={str(p.relative_to(coq).with_suffix('.v'))for p in coq.rglob('*.vo')}
        reports={};assumptions=set()
        for name,count in [('U8CaseClosure/CaseChecked',939),('RvvRepair/ControllerChecked',88),
                            ('RvvRepair/CaseChecked',6),('RvvRepair/Policy',6)]:
            log=coq/'.work'/name/'coqc.log';text=log.read_text()
            assert text.count('Axioms:')+text.count('Closed under the global context')==count
            names=set(re.findall(r"^([\w.']+)\s*:",text,re.M))-{'Axioms'}
            assert all(n.startswith(('CNotation.','SeparationLogic.Snaive_C_Rules64.',
                                     'FunctionalExtensionality.','PropExtensionality.'))for n in names)
            assumptions.update(names);reports[name]=dict(count=count,log_sha256=sha(log))
            if name.endswith('/Policy'):assert text.count('Closed under the global context')==6
        for module in modules:
            assert sha(coq/module['source'])==module['source_sha256']
            assert sha((coq/module['source']).with_suffix('.vo'))==module['object_sha256']
            assert not re.search(r'\b(?:Admitted|admit)\b',re.sub(r'\(\*.*?\*\)','',(coq/module['source']).read_text(),flags=re.S))
        negative=run/'false-goal';negative.mkdir()
        source=negative/'FalseProbe.v';source.write_text('Goal False. Proof. exact I. Qed.\n')
        probe=subprocess.run([env['coqc'],'-q',str(source)],cwd=negative,capture_output=True,text=True,timeout=60)
        (negative/'coqc.log').write_text(probe.stdout+probe.stderr)
        assert probe.returncode!=0 and not source.with_suffix('.vo').exists()
        state['false_goal_rejected']=True
        assert audit_inputs()==inputs
        state.update(passed=True,whole_kernel_verified=True,scope='full',modules=modules,
            fresh_compiled_local_modules=len(modules),old_project_vo_reused=False,
            original_case_C_VCs=939,repaired_case_C_VCs=973,counts_not_additive=True,
            Print_reports=reports,inherited_assumption_names=sorted(assumptions),
            max_compiler_peak_RSS_KiB=max(m['peak_RSS_KiB']for m in modules),
            verification_scope='C-shim modular equivalence / partial correctness under public contracts')
    except Exception as error:
        state['error']=repr(error);print('FAILED',repr(error),flush=True)
    finally:
        state['seconds']=time.monotonic()-started;dump(run/'result.json',state)
        print('RESULT',run/'result.json',state['passed'],flush=True)
    return 0 if state['passed'] else 1

if __name__=='__main__':raise SystemExit(main())
