#!/usr/bin/env python3
"""Compile a complete actual kernel VC_Correct in one fresh source dependency DAG."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import argparse,hashlib,importlib.util,json,os,re,shutil,subprocess,tempfile,time,threading
P=Path(__file__).resolve().parent;CASE=P.parent;ROOT=next(p for p in CASE.parents if(p/'.git').exists());NS='Qu8Rsum'
def load(n,p):
 s=importlib.util.spec_from_file_location(n,p);m=importlib.util.module_from_spec(s);s.loader.exec_module(m);return m
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 pa=argparse.ArgumentParser();pa.add_argument('side',choices=['neon','rvv']);pa.add_argument('--jobs',type=int,default=16);a=pa.parse_args();side=a.side;calls=json.loads((P/(side+'-calls-status.json')).read_text());assert calls['passed']or side=='neon';gen=json.loads((P/(side+'-generation-status.json')).read_text());goal=Path(gen['run_directory'])/(side+'_unit_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M);assert len(fields)==(126 if side=='neon'else 46)
 owners={r['field']:r['module']for r in calls['fields']};
 if side=='neon':owners={n:'NeonCall_'+n for n in fields if '_entail_'not in n and '_return_'not in n}
 mem={'rvv':{'test_rvv_entail_wit_1':'RvvInit','test_rvv_entail_wit_2':'RvvLoop','test_rvv_return_wit_1':'RvvReturn'},'neon':{**{'test_neon_entail_wit_'+str(i):'NeonInit'for i in [1,2,5]},'test_neon_entail_wit_3':'NeonInnerLoop','test_neon_entail_wit_4':'NeonOuterLoop','test_neon_entail_wit_6':'NeonRemainderLoop','test_neon_return_wit_1':'NeonReturns','test_neon_return_wit_3':'NeonReturns','test_neon_return_wit_2':'NeonTailReturn'}}[side];owners.update(mem);assert set(owners)==set(fields)
 stem=side.capitalize()+'Checked';checked='Checked'+side.capitalize();s='From '+NS+' Require Import '+side+'_unit_goal ByteStrategy '+' '.join(sorted(set(owners.values())))+'.\nModule '+checked+' : '+NS+'.'+side+'_unit_goal.VC_Correct.\nInclude '+NS+'.ByteStrategy.CheckedByteArrays.\n'
 for n in fields:s+='Definition proof_of_'+n+' : '+NS+'.'+side+'_unit_goal.'+n+' := '+NS+'.'+owners[n]+'.proof_of_'+n+'.\n'
 s+='End '+checked+'.\n'+''.join('Print Assumptions '+checked+'.proof_of_'+n+'.\n'for n in fields);(P/'coq'/(stem+'.v')).write_text(s)
 run=Path(tempfile.mkdtemp(prefix=side+'-interface-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[];lock=threading.Lock();status={'passed':False,'whole_kernel_verified':False,'scope':'Complete typed actual '+side+' component; final case rechecks current source fresh','run_directory':str(run),'records':records,'input_sha256':{},'actual_c_vcs':len(fields),'typed_instance':NS+'.'+stem+'.'+checked};flags=json.loads((ROOT/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),NS];env={**os.environ,'PATH':str(ROOT/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def execute(cmd,label,timeout=7200):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];work=run/'jobs'/label;work.mkdir(parents=True);log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(cmd,cwd=work,env=env,stdout=f,stderr=f,timeout=7200).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(log)});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n')
  print(label,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-3500:])
 try:
  strategy=Path('/tmp/qcp214-src/linux-binary/StrategyCheck');execute([strategy,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(P/'c/byte_arrays.strategies'),'--coq-output-dir='+str(coq),'--coq-logic-path='+NS],'StrategyCheck');shutil.copyfile(goal,coq/goal.name)
  b=load('rsum_builder',P/'build_full_handoff.py');names=b.required_modules([{'stem':side+'_unit','goal':str(goal),'typed_instance':status['typed_instance']}],coq/'byte_arrays_strategy_goal.v');modules=[]
  for name in names:
   if not name.endswith('_goal'):
    src=P/'coq'/(name+'.v');status['input_sha256'][str(src.relative_to(CASE))]=sha(src);shutil.copyfile(src,coq/src.name)
   modules.append({'namespace':NS,'name':name+'.v','path':str((coq/(name+'.v')).relative_to(run))})
  parallel=load('rsum_parallel',b.BASE/'proof/parallel.py');parallel.compile_modules(modules,run,flags,execute,a.jobs)
  text=(run/(NS+'-'+stem+'.log')).read_text();assert len(re.findall(r'^(?:Axioms:|Closed under the global context)',text,re.M))==len(fields)
  for n,v in status['input_sha256'].items():assert sha(CASE/n)==v,'Source changed '+n
  status.update(passed=True,vc_correct_passed=True,goal_sha256=sha(goal),fresh_source_modules=len(names),no_component_vo_reused=True,proof_source_sha256={p.name:sha(p)for p in coq.glob('*.v')})
 except Exception as e:status['error']=str(e);print(e,flush=True)
 for dest in [run/'status.json',P/(side+'-proof-status.json')]:dest.write_text(json.dumps(status,indent=2)+'\n')
 print(run,flush=True);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
