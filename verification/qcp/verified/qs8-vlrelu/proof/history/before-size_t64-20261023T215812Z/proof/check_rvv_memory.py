#!/usr/bin/env python3
"""Fresh QCP + ordinary Coq for all32-lane actual byte RVV memory C bodies."""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,threading,time
CASE=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--config',type=Path,required=True);ap.add_argument('--jobs',type=int,default=16);a=ap.parse_args();assert 1<=a.jobs<=16
 run=Path(tempfile.mkdtemp(prefix='rvv-memory-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[];lock=threading.Lock()
 status=dict(passed=False,vc_correct_passed=False,whole_kernel_verified=False,run_directory=str(run),records=records,scope='Actual RVV32 load/get/store_next/store32 C bodies; kernel/wrapper not established')
 def execute(label,cmd,timeout=1800):
  work=run/('job-'+label);work.mkdir();cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:c=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=timeout).returncode
   except subprocess.TimeoutExpired:c=124
  with lock:records.append(dict(label=label,command=cmd,exit_code=c,seconds=time.monotonic()-t,log_sha256=sha(log)))
  print(label,c,flush=True)
  if c:raise RuntimeError(label+': '+log.read_text()[-3000:])
 try:
  core=['Model','Types','ScalarFacts','MemoryModel','RvvModel','RvvMemoryModel','RvvMemoryFacts','RvvFrame','S8ArraysStrategy','s8_arrays_strategy_proof','rvv_store_strategy_proof']
  support=['RvvLoadSupport','RvvStoreSupport'];parts=[f'Rvv{k}Part{i:02}'for k in ['Load','Store']for i in range(16)];checked=['RvvLoadChecked','RvvStoreChecked'];mods=core+support+parts+checked
  inputs=['proof/check_rvv_memory.py','shim/scalar.h','shim/types.h','shim/types_def.h','shim/array_model.h','shim/rvv_memory.h','shim/rvv_load.c','shim/rvv_store.c','proof/c/s8_arrays.strategies','proof/c/rvv_store.strategies']+['proof/coq/'+n+'.v'for n in mods]
  hashes={n:sha(CASE/n)for n in inputs};flags=list(json.loads(a.config.read_text())['flags'])+['-Q',str(coq),'Qs8Lrelu']
  for n in mods:shutil.copyfile(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
  tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck';strategies=[]
  for n,interface,module in [('s8_arrays','s8_arrays_Strategy_Correct','S8ArraysStrategy.CheckedS8Arrays'),('rvv_store','rvv_store_Strategy_Correct','rvv_store_strategy_proof.CheckedRvvStoreStrategy')]:
   out=run/('strategy-'+n);out.mkdir();execute(n+'-StrategyCheck',[tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/'proof/c'/(n+'.strategies')),'--coq-output-dir='+str(out),'--coq-logic-path=Qs8Lrelu']);g=out/(n+'_strategy_goal.v');shutil.copyfile(g,coq/g.name);fields=re.findall(r'^  Axiom (\w+)\s*:',g.read_text(),re.M);assert len(fields)==(2 if n=='s8_arrays' else 5);strategies.append(dict(stem=n+'_strategy_goal',module_type=interface,checked_module=module,fields=fields,goal_sha256=sha(g)))
  units=[]
  for k,count in [('Load',98),('Store',73)]:
   stem='rvv_'+k.lower();c=run/(stem+'.c');execute(stem+'-cpp',['gcc','-E','-P','-CC','-nostdinc',CASE/'shim'/(stem+'.c'),'-o',c]);out=run/('generated-'+stem);out.mkdir();execute(stem+'-qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(c),'--coq-output-dir='+str(out),'--coq-logic-path=Qs8Lrelu','-slp',CASE/'shim','Qs8Lrelu','-slp',CASE/'proof/c','Qs8Lrelu']);g=out/(stem+'_goal.v');shutil.copyfile(g,coq/g.name);fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',g.read_text(),re.M);assert len(fields)==count;units.append(dict(label=stem,stem=stem,fields=fields,checked_module='Rvv'+k+'Checked.CheckedRvv'+k,cpp_sha256=sha(c),goal_sha256=sha(g)))
  for n in ['Model','Types','ScalarFacts','MemoryModel','RvvModel','RvvMemoryModel','RvvMemoryFacts','RvvFrame','s8_arrays_strategy_goal','S8ArraysStrategy','s8_arrays_strategy_proof','rvv_store_strategy_goal','rvv_store_strategy_proof','rvv_load_goal','rvv_store_goal',*support]:execute(n,[*flags,coq/(n+'.v')])
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:list(pool.map(lambda n:execute(n,[*flags,coq/(n+'.v')]),parts))
  for n in checked:execute(n,[*flags,coq/(n+'.v')])
  gate=[]
  for i,u in enumerate(units):
   gate+=['Require Import Qs8Lrelu.'+u['stem']+'_goal Qs8Lrelu.'+u['checked_module'].split('.')[0]+'.',f'Module Typed{i} : Qs8Lrelu.'+u['stem']+'_goal.VC_Correct := Qs8Lrelu.'+u['checked_module']+'.'];gate+=['Print Assumptions Typed'+str(i)+'.proof_of_'+n+'.'for n in u['fields']]
  for i,s in enumerate(strategies):
   gate+=[f'Module Strategy{i} : Qs8Lrelu.'+s['stem']+'.'+s['module_type']+' := Qs8Lrelu.'+s['checked_module']+'.'];gate+=['Print Assumptions Strategy'+str(i)+'.'+n+'.'for n in s['fields']]
  for n in ['Model','ScalarFacts','RvvMemoryFacts']:
   gate+=['Print Assumptions Qs8Lrelu.'+n+'.'+m+'.'for m in re.findall(r'^Lemma (\w+)',(coq/(n+'.v')).read_text(),re.M)]
  (coq/'RvvMemoryGate.v').write_text('\n'.join(gate)+'\n');execute('RvvMemoryGate',[*flags,coq/'RvvMemoryGate.v'])
  assert hashes=={n:sha(CASE/n)for n in inputs},'Input changed during actual fresh proof'
  status.update(passed=True,vc_correct_passed=True,checked_c_vcs=171,checked_strategy_fields=7,actual_c_units=units,strategies=strategies,input_sha256=hashes,no_component_vo_reused=True,config_sha256=sha(a.config),final_gate_sha256=sha(coq/'RvvMemoryGate.v'),final_assumptions_log_sha256=sha(run/'RvvMemoryGate.log'),jobs=a.jobs)
 except Exception as e:status['error']=str(e)
 (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');dest=CASE/'proof/rvv-memory-status.json'
 if dest.exists():old=dest.read_bytes();(CASE/'proof/history'/('rvv-memory-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
 dest.write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({k:status.get(k)for k in ['passed','run_directory','checked_c_vcs','error']},indent=2),flush=True);return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
