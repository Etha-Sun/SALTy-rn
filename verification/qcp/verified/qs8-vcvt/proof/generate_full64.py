#!/usr/bin/env python3
"""Fresh generation of the entire live C/strategy closure, not a proof result."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import argparse,json,subprocess,tempfile,time,threading,re,shutil
from full_inputs import CASE,NS,units,render_unit,sha,tokens
from build_full_handoff import STRATEGIES
from audit_return_ownership import require_clean
def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--jobs',type=int,default=16)
    parser.add_argument('--timeout',type=int,default=7200)
    args=parser.parse_args();assert __debug__ and args.jobs==16 and 0<args.timeout<=14400
    run=Path(tempfile.mkdtemp(prefix='complete64-generation-',dir=CASE/'.build'))
    records=[];lock=threading.Lock();actual=[];strategies=[]
    inputs={str(p.relative_to(CASE)):sha(p) for folder in ['shim','impl','proof/c']
        for p in (CASE/folder).rglob('*') if p.is_file()}
    inputs.update({n:sha(CASE/n) for n in ['spec.c','proof/generate_full64.py','proof/full_inputs.py']})
    status=dict(passed=False,generation_passed=False,whole_kernel_verified=False,
        scope='Actual full64 C/strategy generation only; no formal-proof credit',
        run_directory=str(run),parallel_jobs=args.jobs,per_process_memory_GiB=16,
        input_sha256=inputs,records=records,actual_C_units=actual,strategies=strategies)
    def execute(label,command,cwd):
        command=['prlimit','--as=17179869184:17179869184','--',*map(str,command)]
        log=run/(label+'.log');start=time.monotonic()
        with log.open('w') as stream:
            try:code=subprocess.run(command,cwd=cwd,stdout=stream,stderr=stream,timeout=args.timeout).returncode
            except subprocess.TimeoutExpired:code=124
        with lock:records.append(dict(label=label,command=command,exit_code=code,
            seconds=time.monotonic()-start,log_sha256=sha(log)))
        print(label,code,flush=True)
        assert code==0,log.read_text()[-3000:]
    try:
        def generate(u):
            stem=u['stem'];folder=run/stem;folder.mkdir()
            rendered=render_unit(u);source=folder/(stem+'.c');source.write_text(rendered['text'])
            expanded=folder/'expanded.c'
            execute(stem+'-cpp',['gcc','-E','-P','-CC','-nostdinc',*rendered['cpp_flags'],source,'-o',expanded],folder)
            if rendered['identity_text']:
                raw=folder/'raw.c';raw.write_text(rendered['identity_text']);out=folder/'raw-expanded.c'
                execute(stem+'-identity-cpp',['gcc','-E','-P','-CC','-nostdinc',*rendered['cpp_flags'],raw,'-o',out],folder)
                assert tokens(out.read_text())==tokens(expanded.read_text())
            source.write_bytes(expanded.read_bytes())
            limit=4096 if stem in ['scalar','rvv_load','rvv_store'] else 1024
            execute(stem+'-qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info',
                '--strategy-application-limit='+str(limit),'--input-file='+str(source),
                '--coq-output-dir='+str(folder),'--coq-logic-path='+NS,
                '-slp',CASE/'shim',NS,'-slp',CASE/'proof/c',NS],folder)
            goal=folder/(stem+'_goal.v');require_clean(goal)
            fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M)
            result=dict(stem=stem,goal=str(goal),goal_sha256=sha(goal),fields=fields,
                CPP_sha256=sha(expanded),actual_fields=len(fields),expected_fields=u['expected_fields'])
            with lock:actual.append(result)
            assert len(fields)==u['expected_fields'],(stem,len(fields),u['expected_fields'])
            if stem in ['neon_unit','rvv_unit']:
                isa=stem.split('_')[0]
                (CASE/'proof'/(isa+'-generation-status.json')).write_text(json.dumps(dict(
                    generation_passed=True,whole_kernel_verified=False,run_directory=str(folder),
                    generated_c_vcs=len(fields),actual_size_t_bits=64,input_sha256=inputs),indent=2)+'\n')
        with ThreadPoolExecutor(max_workers=args.jobs) as pool:list(pool.map(generate,units()))
        tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
        def strategy(item):
            file,proof,count=item;stem=Path(file).stem;folder=run/('strategy-'+stem);folder.mkdir()
            execute(stem+'-strategy',[tool,'--arch=64','--endian=little','--no-exec-info',
                '--input-file='+str(CASE/file),'--coq-output-dir='+str(folder),'--coq-logic-path='+NS],folder)
            goal=folder/(stem+'_strategy_goal.v')
            fields=re.findall(r'^\s*Axiom (\w+)\s*:',goal.read_text(),re.M)
            assert len(fields)==count,(stem,len(fields),count)
            with lock:strategies.append(dict(stem=stem,fields=fields,goal_sha256=sha(goal),goal=str(goal)))
        with ThreadPoolExecutor(max_workers=args.jobs) as pool:list(pool.map(strategy,STRATEGIES))
        assert all(sha(CASE/n)==d for n,d in inputs.items())
        assert len(actual)==26 and sum(x['actual_fields'] for x in actual)==1672
        status.update(passed=True,generation_passed=True,actual_size_t_bits=64)
    except Exception as error:status['error']=str(error);print(error,flush=True)
    for path in [run/'status.json',CASE/'proof/full64-generation-status.json']:
        path.write_text(json.dumps(status,indent=2)+'\n')
    print('RUN',run,flush=True)
    return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
