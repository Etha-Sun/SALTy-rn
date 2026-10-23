#!/usr/bin/env python3
"""Fresh actual 128-lane RVV helper goals, parallel ordinary Coq, full typed unit."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time,threading
from concurrent.futures import ThreadPoolExecutor,as_completed
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
UNITS={'arithmetic':('rvv_arithmetic','RvvArithmetic',780,'rvv_vectors'),
       'load':('rvv_load','RvvLoad',386,'rvv_vectors'),
       'store':('rvv_store','RvvStore',265,'rvv_store')}
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def headers(p):
    found=set()
    def visit(q):
        q=q.resolve()
        if q in found:return
        if not q.is_relative_to(CASE):raise ValueError('Include escaped this case: '+str(q))
        found.add(q)
        for n in re.findall(r'^\s*#\s*include\s+"([^"]+)"',q.read_text(),re.M):visit(q.parent/n)
    visit(p)
    return found

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--unit',choices=UNITS,required=True);p.add_argument('--config',type=Path,required=True)
    p.add_argument('--generation-dir',type=Path);p.add_argument('--jobs',type=int,default=16)
    p.add_argument('--module-timeout',type=int,default=3600);a=p.parse_args()
    if not 1<=a.jobs<=16 or a.module_timeout<=0:p.error('jobs must be 1..16 and timeout positive')
    stem,title,count,strategy=UNITS[a.unit];(CASE/'.build').mkdir(exist_ok=True)
    run=Path(tempfile.mkdtemp(prefix=stem+'-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();out=run/'generated';out.mkdir()
    records=[];lock=threading.Lock();status={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,
      'scope':'actual 128-lane RVV C helper unit under separate checked callee contracts; no ISA theorem',
      'run_directory':str(run),'records':records,'configuration':{'VLEN':128,'SEW':8,'LMUL':8,'VLMAX':128},'parallel_jobs':a.jobs}
    def execute(cmd,label,budget=1200):
        work=run/'jobs'/label;work.mkdir(parents=True,exist_ok=True);log=run/(label+'.log')
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];start=time.monotonic()
        with log.open('w') as f:
            try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=budget).returncode
            except subprocess.TimeoutExpired:code=124
        with lock:
            records.append({'label':label,'command':cmd,'cwd':str(work),'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
            (run/'records.json').write_text(json.dumps(records,indent=2)+'\n')
        print(label,code,flush=True)
        if code:raise RuntimeError(label+': '+log.read_text()[-3500:])
    try:
        parts=[title+'Part'+str(i).zfill(2) for i in range(16)]
        public_modules=['Model','Types','MemoryModel','RvvModel','RvvFacts','RvvFrame','SignedWindow','S8ArraysStrategy','s8_arrays_strategy_proof',strategy+'_strategy_proof',title+'Support',*parts,title+'Checked']
        sources=set(headers(CASE/'shim'/(stem+'.c')))
        for s in ['s8_arrays',strategy]:sources.update(headers(CASE/'proof/c'/(s+'.strategies')))
        sources.update(CASE/'proof/coq'/(n+'.v') for n in public_modules)
        sources.add(Path(__file__).resolve());inputs={str(q.relative_to(CASE)):sha(q) for q in sorted(sources)}
        for n in public_modules:shutil.copy2(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
        src=run/(stem+'.c');execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim'/(stem+'.c'),'-o',src],'cpp',300)
        if a.generation_dir:
            prior=a.generation_dir.resolve();old=prior/(stem+'.c')
            if not old.exists() or old.read_bytes()!=src.read_bytes():raise ValueError('Supplied generation does not match byte-exact current live CPP')
            candidates=[prior/'generated'/(stem+'_goal.v'),prior/(stem+'_goal.v')]
            goal=next((q for q in candidates if q.exists()),None)
            if goal is None:raise ValueError('Supplied generation has no completed actual goal')
            status['generation_reused_after_live_cpp_identity']=str(prior)
        else:
            execute(['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(src),'--coq-output-dir='+str(out),'--coq-logic-path=S8Clamp','-slp',CASE/'shim','S8Clamp','-slp',CASE/'proof/c','S8Clamp'],'qcp',2400)
            goal=out/(stem+'_goal.v')
        shutil.copy2(goal,coq/goal.name);fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
        if len(fields)!=len(set(fields)) or len(fields)!=count:raise ValueError('Actual C field set/count changed')
        actual=[]
        for n in parts:
            actual+=re.findall(r'^Lemma proof_of_(\w+) : S8Clamp\.'+re.escape(stem)+r'_goal\.\1\.$',(coq/(n+'.v')).read_text(),re.M)
        if len(actual)!=len(set(actual)) or set(actual)!=set(fields):raise ValueError('Parallel leaf proof coverage mismatch')
        flags=[*json.loads(a.config.read_text())['flags'],'-time','-Q',str(coq),'S8Clamp']
        def compile(n):execute([*flags,coq/(n+'.v')],n,a.module_timeout)
        tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck';strategy_fields={}
        for n in ['s8_arrays',strategy]:
            d=run/('strategy-'+n);d.mkdir();execute([tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/'proof/c'/(n+'.strategies')),'--coq-output-dir='+str(d),'--coq-logic-path=S8Clamp'],'strategy-'+n,300)
            q=d/(n+'_strategy_goal.v');shutil.copy2(q,coq/q.name)
            strategy_fields[n]=re.findall(r'^  Axiom (\w+)_correctness :',q.read_text(),re.M)
        expected={'s8_arrays':2,'rvv_vectors':1,'rvv_store':5}
        if any(len(v)!=expected[k] for k,v in strategy_fields.items()):raise ValueError('Strategy field set changed')
        base=['Model','Types','MemoryModel','RvvModel','RvvFacts','RvvFrame','SignedWindow','s8_arrays_strategy_goal','S8ArraysStrategy','s8_arrays_strategy_proof',strategy+'_strategy_goal',strategy+'_strategy_proof',stem+'_goal',title+'Support']
        for n in base:compile(n)
        with ThreadPoolExecutor(max_workers=a.jobs) as pool:
            for f in as_completed([pool.submit(compile,n) for n in parts]):f.result()
        compile(title+'Checked')
        gate=['From S8Clamp Require Import '+stem+'_goal '+title+'Checked RvvModel RvvFacts S8ArraysStrategy '+strategy+'_strategy_proof.',
              'Module Typed : S8Clamp.'+stem+'_goal.VC_Correct := S8Clamp.'+title+'Checked.Checked'+title+'.']
        gate+=['Print Assumptions Typed.proof_of_'+n+'.' for n in fields]
        for n,fs in strategy_fields.items():
            mod='S8Clamp.S8ArraysStrategy.CheckedS8Arrays' if n=='s8_arrays' else 'S8Clamp.'+strategy+'_strategy_proof.'+('CheckedRvvVectorsStrategy' if strategy=='rvv_vectors' else 'CheckedRvvStoreStrategy')
            gate+=['Print Assumptions '+mod+'.'+f+'_correctness.' for f in fs]
        math=[]
        for n in ['RvvModel','RvvFacts']:
            for f in re.findall(r'^Lemma (\w+)',(coq/(n+'.v')).read_text(),re.M):math.append('S8Clamp.'+n+'.'+f)
        gate+=['Print Assumptions '+f+'.' for f in math]
        (coq/(title+'Gate.v')).write_text('\n'.join(gate)+'\n');compile(title+'Gate')
        if inputs!={str(q.relative_to(CASE)):sha(q) for q in sorted(sources)}:raise ValueError('Bound C/Coq source changed during proof')
        status.update(passed=True,vc_correct_passed=True,checked_c_vcs=len(fields),fields=fields,
          checked_module='S8Clamp.'+title+'Checked.Checked'+title,checked_strategy_fields=sum(map(len,strategy_fields.values())),
          math_support_lemmas=len(math),input_sha256=inputs,cpp_sha256=sha(src),goal_sha256=sha(goal),
          parallel_leaf_modules=parts,no_component_vo_reused=True,fresh_compiled_modules=base+parts+[title+'Checked',title+'Gate'],
          compiled_source_sha256={q.name:sha(q) for q in coq.glob('*.v')},config_sha256=sha(a.config),tool_sha256=sha(Path(shutil.which('qcp')).resolve()),strategy_tool_sha256=sha(tool),external_libraries_rebuilt=False,
          final_gate_sha256=sha(coq/(title+'Gate.v')),final_assumptions_log_sha256=sha(run/(title+'Gate.log')),
          callee_providers=['scalar-status.json'] if a.unit=='arithmetic' else ['load-status.json'] if a.unit=='load' else [])
    except Exception as e:status['error']=str(e);print(e,flush=True)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');dest=CASE/'proof'/('rvv-'+a.unit+'-status.json');history=CASE/'proof/history';history.mkdir(exist_ok=True)
    if dest.exists():
        old=dest.read_bytes();(history/(dest.stem+'-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
    dest.write_text(json.dumps(status,indent=2)+'\n')
    print(json.dumps({'passed':status['passed'],'run_directory':str(run),'error':status.get('error')},indent=2));return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
