#!/usr/bin/env python3
"""Fresh core and actual full-kernel call/safety leaf checks, finite budgets."""
from pathlib import Path
import argparse,json,re,subprocess,tempfile,shutil,time,hashlib,threading
from concurrent.futures import ThreadPoolExecutor
HERE=Path(__file__).resolve().parent;CASE=HERE.parent;ROOT=next(p for p in CASE.parents if(p/'.git').exists());BASE=ROOT/'verification/qcp/verified/f32-vadd'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--isa',choices=['neon','rvv'],required=True);p.add_argument('--config',type=Path,required=True);p.add_argument('--dependency-dir',type=Path,required=True);p.add_argument('--generation-dir',type=Path);p.add_argument('--jobs',type=int,default=16);p.add_argument('--module-timeout',type=int,default=300);p.add_argument('--resume',type=Path);a=p.parse_args();isa=a.isa
 gen=a.generation_dir or Path(json.loads((HERE/(isa+'-generation-status.json')).read_text())['run_directory']);assert json.loads((gen/'status.json').read_text())['generation_passed']
 run=a.resume or Path(tempfile.mkdtemp(prefix=isa+'-calls-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir(exist_ok=True);flags=json.loads(a.config.read_text())['flags'][2:]
 for d in sorted(a.dependency_dir.resolve().iterdir()):
  if d.is_dir():flags+=['-Q',str(d),''if d.name=='relations'else d.name]
 flags+=['-Q',str(coq),'Qu8Cvt'];records=[];lock=threading.Lock();status={'passed':False,'whole_kernel_verified':False,'run_directory':str(run),'generation_dir':str(gen),'records':records}
 def exe(cmd,label,budget=300):
  work=run/'jobs'/label;work.mkdir(parents=True,exist_ok=True);cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];t=time.monotonic()
  with(run/(label+'.log')).open('w')as f:
   try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:
   records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n');print(label,code,flush=True)
  return code
 def cc(n,copy=True):
  if copy:shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'))
  if exe(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n,a.module_timeout):raise RuntimeError((run/(n+'.log')).read_text()[-4000:])
 try:
  if not a.resume:
   for n in ['Model','UnsignedModel','Types','MemoryModel','RvvModel','ProgramModel','ProgramFacts','FastFrame','CharWindow','CharFrame']:cc(n)
   strategy=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
   for stem in ['char_arrays']+(['cvt_rvv']if isa=='rvv'else[]):
    cmd=[strategy,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(HERE/'c'/(stem+'.strategies')),'--coq-output-dir='+str(coq),'--coq-logic-path=Qu8Cvt']
    for d in sorted((BASE/'proof/c').iterdir()):
     if d.is_dir():cmd+=['-slp',d,d.name]
    cmd+=['-slp',CASE/'shim','Qu8Cvt','-slp',HERE/'c','Qu8Cvt']
    assert exe(cmd,stem+'-StrategyCheck')==0;cc(stem+'_strategy_goal',False)
    for n in (['UCharArraysStrategy','char_arrays_strategy_proof']if stem=='char_arrays'else['RvvStrategy','cvt_rvv_strategy_proof']):cc(n)
   shutil.copyfile(gen/(isa+'_unit_goal.v'),coq/(isa+'_unit_goal.v'));cc(isa+'_unit_goal',False)
  cc('KernelCallsSupport');cc('KernelBounds');
  if isa=='rvv':cc('RvvKernelBounds')
  g=(coq/(isa+'_unit_goal.v')).read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',g,re.M)
  excluded=set(json.loads((HERE/'neon-memory-fields.json').read_text()))if isa=='neon'else set(json.loads((HERE/'rvv-memory-fields.json').read_text()))
  names=[n for n in names if n not in excluded];status['target_fields']=names
  def leaf(n):
   module=isa+'_call_'+n;aux=', Qu8Cvt.'+isa+'_unit_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',g,re.M)else''
   text=f'From Qu8Cvt Require Import KernelBounds {isa}_unit_goal.\nFrom Coq Require Import ZArith Lia List.\nFrom QcpVadd Require Import VaddBits.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\nLemma proof_of_{n} : Qu8Cvt.{isa}_unit_goal.{n}.\nProof. unfold Qu8Cvt.{isa}_unit_goal.{n}{aux};try left;cvt_complete. Qed.\nPrint Assumptions proof_of_{n}.\n'
   public=HERE/'coq'/(module+'.v');text=public.read_text()if public.exists()else text;(coq/(module+'.v')).write_text(text);public.write_text(text);code=exe(['qcp-env','coqc','-time',*flags,coq/(module+'.v')],module,a.module_timeout);return{'field':n,'module':module,'exit_code':code}
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:status['results']=list(pool.map(leaf,names))
  status['passed']=all(r['exit_code']==0 for r in status['results']);status['passed_fields']=sum(r['exit_code']==0 for r in status['results'])
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  for p in[run/'status.json',HERE/(isa+'-calls-status.json')]:p.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
