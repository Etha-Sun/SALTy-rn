#!/usr/bin/env python3
"""Check all repaired RVV VCs with independent proof modules in parallel."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time,threading
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__)
 for n in ['config','dependency-dir','scalar-dir','vector-dir']:p.add_argument('--'+n,type=Path,required=True)
 p.add_argument('--jobs',type=int,default=16);p.add_argument('--generation-dir',type=Path);p.add_argument('--module-timeout',type=int,default=2400);args=p.parse_args();assert args.module_timeout>0 and args.jobs>0;generation=args.generation_dir or Path(json.loads((HERE/'rvv-generation-status.json').read_text())['run_directory']);gen=json.loads((generation/'status.json').read_text());assert gen['generation_passed']and gen['same_frontend_cpp_tokens_identical'];assert sha(CASE/'impl/testRVV.c')==gen['raw_c_sha256']
 run=Path(tempfile.mkdtemp(prefix='rvv-parallel-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[];record_lock=threading.Lock()
 flags=json.loads(args.config.read_text())['flags'][2:]
 for d in sorted(args.dependency_dir.resolve().iterdir()):
  if d.is_dir():flags+=['-Q',str(d),''if d.name=='relations'else d.name]
 for d in [args.scalar_dir,args.vector_dir,coq]:flags+=['-Q',str(d.resolve()),'FMax']
 status={'passed':False,'whole_kernel_verified':False,'scope':'Repaired RVV kernel and case strategy only; all C helper units and wrapper remain necessary for the complete case','run_directory':str(run),'records':records}
 def execute(cmd,label,budget=1200):
  work=run/'jobs'/label;work.mkdir(parents=True);log=run/(label+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];start=time.monotonic()
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=work,stdout=out,stderr=out,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  with record_lock:
   records.append({'label':label,'command':cmd,'cwd':str(work),'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n');print(label,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-6000:])
 def compile_module(n):
  if(HERE/'coq'/(n+'.v')).exists():shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'))
  execute(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n,args.module_timeout)
 try:
  for n in ['ProgramModel','RvvListSupport','RvvResult']:compile_module(n)
  strategy=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
  execute([strategy,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(HERE/'c/rvv_fmax.strategies'),'--coq-output-dir='+str(coq),'--coq-logic-path=FMax'],'StrategyCheck',300)
  for n in ['rvv_fmax_strategy_goal','RvvStrategy','rvv_fmax_strategy_proof']:compile_module(n)
  shutil.copyfile(generation/'rvv_unit_goal.v',coq/'rvv_unit_goal.v');compile_module('rvv_unit_goal')
  goal=(coq/'rvv_unit_goal.v').read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',goal,re.M);assert len(names)==len(set(names))==55
  parts=['RvvCallsPart'+str(i) for i in range(1,6)]
  actual=[]
  for part in parts:
   actual+=re.findall(r'^Lemma proof_of_(\w+) : FMax\.rvv_unit_goal\.\1\.$',(HERE/'coq'/(part+'.v')).read_text(),re.M)
  expected=[n for n in names if '_entail_'not in n and '_return_'not in n]
  assert len(actual)==len(set(actual))==50 and set(actual)==set(expected)
  compile_module('RvvCallsSupport')
  with ThreadPoolExecutor(max_workers=min(args.jobs,len(parts)+1))as pool:
   futures=[pool.submit(compile_module,n)for n in parts+['RvvMemory']]
   for future in futures:future.result()
  for n in ['RvvCalls','RvvChecked']:compile_module(n)
  fields=re.findall(r'^\s*Axiom (rvv_fmax_strategy\d+_correctness) :',(coq/'rvv_fmax_strategy_goal.v').read_text(),re.M);assert len(fields)==4
  gate='''From FMax Require Import rvv_unit_goal RvvChecked rvv_fmax_strategy_goal RvvStrategy.
Module FinalRvv : FMax.rvv_unit_goal.VC_Correct := FMax.RvvChecked.CheckedRvv.
Module FinalStrategy : FMax.rvv_fmax_strategy_goal.rvv_fmax_Strategy_Correct := FMax.RvvStrategy.CheckedRvvFmaxStrategy.
'''
  gate+='\n'.join('Print Assumptions FinalRvv.proof_of_'+n+'.'for n in names)+'\n'+'\n'.join('Print Assumptions FinalStrategy.'+n+'.'for n in fields)+'\n';(coq/'FinalRvvCheck.v').write_text(gate);compile_module('FinalRvvCheck')
  status.update(passed=True,kernel_c_vcs=len(names),strategy_fields=len(fields),vc_correct_passed=True,parallel_leaf_modules=parts,parallel_jobs=args.jobs)
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  status['proof_source_sha256']={q.name:sha(q)for q in coq.glob('*.v')};status['sources_sha256']={str(q.relative_to(CASE)):sha(q)for q in [CASE/'impl/testRVV.c',CASE/'spec.c',CASE/'shim/rvv_frontend.h',HERE/'c/rvv.annotations.json',HERE/'c/rvv_fmax.strategies']}
  for q in [run/'status.json',HERE/'rvv-proof-status.json']:q.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
