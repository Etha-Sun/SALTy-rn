#!/usr/bin/env python3
"""Fresh ordinary Coq gate for the live repaired 128-lane RVV C function."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time,threading
from concurrent.futures import ThreadPoolExecutor,as_completed
from pathlib import Path
from generate_rvv_kernel import CASE,kernel_text,included_sources,tokens

def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__)
 p.add_argument('--generation-dir',type=Path,required=True);p.add_argument('--config',type=Path,required=True)
 p.add_argument('--jobs',type=int,default=16);p.add_argument('--module-timeout',type=int,default=3600)
 a=p.parse_args()
 if not 1<=a.jobs<=16 or a.module_timeout<=0:p.error('jobs must be 1..16 and timeout positive')
 run=Path(tempfile.mkdtemp(prefix='rvv-kernel-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir()
 records=[];lock=threading.Lock();status={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,
  'scope':'complete repaired RVV C function under separately checked callee contracts; final case gate closes providers; no ISA/ABI refinement or termination theorem',
  'run_directory':str(run),'records':records,'parallel_jobs':a.jobs,'configuration':{'VLEN':128,'SEW':8,'LMUL':8,'VLMAX':128}}
 def execute(cmd,label,budget=1200):
  cwd=run/'jobs'/label;cwd.mkdir(parents=True,exist_ok=True);log=run/(label+'.log')
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];start=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(cmd,cwd=cwd,stdout=f,stderr=f,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:
   records.append({'label':label,'command':cmd,'cwd':str(cwd),'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
   (run/'records.json').write_text(json.dumps(records,indent=2)+'\n')
  print(label,code,flush=True)
  if code:raise RuntimeError(label+': '+log.read_text()[-5000:])
 try:
  parts=['RvvKernelPart'+str(i).zfill(2)for i in range(16)]
  base=['Model','Types','MemoryModel','ProgramModel','RvvModel','RvvFacts','RvvFrame','NeonStoreModel','NeonFacts','RvvKernelModel','RvvKernelFacts','SignedWindow',
   's8_arrays_strategy_goal','S8ArraysStrategy','s8_arrays_strategy_proof','rvv_vectors_strategy_goal','rvv_vectors_strategy_proof',
   'rvv_kernel_strategy_goal','rvv_kernel_strategy_proof','rvv_unit_goal','RvvKernelSupport']
  generated={'s8_arrays_strategy_goal','rvv_vectors_strategy_goal','rvv_kernel_strategy_goal','rvv_unit_goal'}
  public=[n for n in base if n not in generated]+parts+['RvvKernelChecked']
  paths=set(included_sources(CASE/'shim/rvv_frontend.c'))
  strategies=['s8_arrays','rvv_vectors','rvv_kernel']
  for n in strategies:paths.update(included_sources(CASE/'proof/c'/(n+'.strategies')))
  paths.update(CASE/q for q in ['impl/testRVV.c','spec.c','proof/c/rvv.annotations.json','proof/generate_rvv_kernel.py'])
  paths.update(CASE/'proof/coq'/(n+'.v')for n in public);paths.add(Path(__file__).resolve())
  inputs={str(q.relative_to(CASE)):sha(q)for q in sorted(paths)}
  for n in public:shutil.copy2(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
  src=run/'rvv_unit.input.c';src.write_text('#include "'+str(CASE/'shim/rvv_frontend.c')+'"\n'+kernel_text())
  cpp=run/'rvv_unit.c';execute(['gcc','-E','-P','-CC','-nostdinc',src,'-o',cpp],'cpp',300)
  prior=a.generation_dir.resolve();old=prior/'rvv_unit.c';goal=prior/'generated/rvv_unit_goal.v'
  if not old.exists()or old.read_bytes()!=cpp.read_bytes():raise ValueError('Generation differs from byte-exact current live CPP')
  if not goal.exists():raise ValueError('Missing completed actual C goal')
  gstatus=json.loads((prior/'status.json').read_text())
  if not gstatus.get('generation_passed')or gstatus.get('goal_sha256')!=sha(goal):raise ValueError('Generation status/goal binding missing')
  shutil.copy2(goal,coq/goal.name)
  fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
  if not fields or len(fields)!=len(set(fields))or not all(n.startswith('test_rvv_')for n in fields):raise ValueError('Invalid actual kernel field set')
  leaves=[]
  for n in parts:leaves+=re.findall(r'^Lemma proof_of_(\w+) : S8Clamp\.rvv_unit_goal\.\1\.$',(coq/(n+'.v')).read_text(),re.M)
  if len(leaves)!=len(set(leaves))or set(leaves)!=set(fields):raise ValueError('Kernel leaf coverage mismatch')
  flags=[*json.loads(a.config.read_text())['flags'],'-time','-Q',str(coq),'S8Clamp']
  def compile(n):execute([*flags,coq/(n+'.v')],n,a.module_timeout)
  tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck';sf={}
  for n in strategies:
   d=run/('strategy-'+n);d.mkdir();execute([tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/'proof/c'/(n+'.strategies')),'--coq-output-dir='+str(d),'--coq-logic-path=S8Clamp'],'strategy-'+n,300)
   q=d/(n+'_strategy_goal.v');shutil.copy2(q,coq/q.name);sf[n]=re.findall(r'^  Axiom (\w+)_correctness :',q.read_text(),re.M)
  if {n:len(fs)for n,fs in sf.items()}!={'s8_arrays':2,'rvv_vectors':1,'rvv_kernel':1}:raise ValueError('Strategy coverage changed')
  for n in base:compile(n)
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:
   for f in as_completed([pool.submit(compile,n)for n in parts]):f.result()
  compile('RvvKernelChecked')
  gate=['From S8Clamp Require Import rvv_unit_goal RvvKernelChecked.',
    'Module Typed : S8Clamp.rvv_unit_goal.VC_Correct := S8Clamp.RvvKernelChecked.CheckedRvvKernel.']
  gate+=['Print Assumptions Typed.proof_of_'+n+'.'for n in fields]
  mods={'s8_arrays':'S8Clamp.S8ArraysStrategy.CheckedS8Arrays','rvv_vectors':'S8Clamp.rvv_vectors_strategy_proof.CheckedRvvVectorsStrategy','rvv_kernel':'S8Clamp.rvv_kernel_strategy_proof.CheckedRvvKernelStrategy'}
  for n,fs in sf.items():gate+=['Print Assumptions '+mods[n]+'.'+f+'_correctness.'for f in fs]
  math=[]
  for n in ['RvvModel','RvvFacts','RvvKernelFacts','RvvKernelSupport']:
   math+=['S8Clamp.'+n+'.'+f for f in re.findall(r'^Lemma (\w+)',(coq/(n+'.v')).read_text(),re.M)]
  gate+=['Print Assumptions '+n+'.'for n in math]
  (coq/'RvvKernelGate.v').write_text('\n'.join(gate)+'\n');compile('RvvKernelGate')
  if inputs!={str(q.relative_to(CASE)):sha(q)for q in sorted(paths)}:raise ValueError('Bound source changed during proof')
  status.update(passed=True,vc_correct_passed=True,checked_c_vcs=len(fields),fields=fields,
   checked_module='S8Clamp.RvvKernelChecked.CheckedRvvKernel',checked_strategy_fields=sum(map(len,sf.values())),math_support_lemmas=len(math),
   input_sha256=inputs,cpp_sha256=sha(cpp),goal_sha256=sha(goal),generation_directory=str(prior),
   parallel_leaf_modules=parts,no_component_vo_reused=True,fresh_compiled_modules=base+parts+['RvvKernelChecked','RvvKernelGate'],
   compiled_source_sha256={q.name:sha(q)for q in coq.glob('*.v')},config_sha256=sha(a.config),tool_sha256=sha(Path(shutil.which('qcp')).resolve()),
   strategy_tool_sha256=sha(tool),external_libraries_rebuilt=False,final_gate_sha256=sha(coq/'RvvKernelGate.v'),
   final_assumptions_log_sha256=sha(run/'RvvKernelGate.log'))
 except Exception as e:status['error']=str(e)
 (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(CASE/'proof/rvv-kernel-status.json').write_text(json.dumps(status,indent=2)+'\n')
 print(json.dumps({'passed':status['passed'],'run_directory':str(run),'error':status.get('error')},indent=2));return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
