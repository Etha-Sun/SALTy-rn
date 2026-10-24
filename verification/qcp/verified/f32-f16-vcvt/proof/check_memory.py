#!/usr/bin/env python3
"""Fresh actual float-load/control and ushort-store C with checked strategies."""
from pathlib import Path
import argparse,json,re,subprocess,tempfile,time,hashlib,shutil,concurrent.futures,sys
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if(p/'.git').exists());B=R/'verification/qcp/verified/f32-vadd';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--jobs',type=int,default=16);a=ap.parse_args();assert 1<=a.jobs<=16
 run=Path(tempfile.mkdtemp(prefix='memory-proof-',dir=C/'.build'));records=[];units=[];strategies=[];s={'passed':False,'whole_kernel_verified':False,'scope':'actual_memory_helpers_only','run_directory':str(run),'records':records,'units':units,'strategies':strategies}
 stems=['memory_rvv_load','rvv_control','memory_rvv_store'];sourcefiles=[C/'shim'/(n+'.c')for n in stems]+list((C/'shim').glob('*.h'))+[H/'c/f16_memory.strategies',H/'c/f16_ushort_store.strategies',Path(__file__)];s['input_sha256']={str(p.relative_to(C)):sha(p)for p in sourcefiles}
 slp=['-slp',str(C/'shim'),'F32F16','-slp',str(H/'c'),'F32F16']
 for p in sorted((B/'proof/c').iterdir()):
  if p.is_dir():slp+=['-slp',str(p),p.name]
 def execute(cmd,label):
  cmd=list(map(str,cmd));w=run/'jobs'/label;w.mkdir(parents=True);log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:ec=subprocess.run(['prlimit','--as=17179869184:17179869184','--']+cmd,cwd=w,stdout=f,stderr=f,timeout=3600).returncode
   except subprocess.TimeoutExpired:ec=124
  records.append({'label':label,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(label,ec,flush=True);return ec
 def generate(stem):
  out=run/stem;out.mkdir();src=out/(stem+'.c');cpp=['gcc','-E','-P','-CC','-nostdinc',str(C/'shim'/(stem+'.c')),'-o',str(src)];assert execute(cpp,stem+'-cpp')==0;assert execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(src),'--coq-output-dir='+str(out),'--coq-logic-path=F32F16',*slp],stem+'-qcp')==0
  goal=out/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;shutil.copyfile(goal,H/'coq'/goal.name);return{'stem':stem,'fields':fields,'checked_c_vcs':len(fields),'goal_sha256':sha(goal),'cpp_sha256':sha(src),'generation_directory':str(out),'source':'shim/'+stem+'.c'}
 try:
  tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
  for name in ['f16_memory','f16_ushort_store']:
   out=run/('strategy-'+name);out.mkdir();assert execute([tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(H/'c'/(name+'.strategies')),'--coq-output-dir='+str(out),'--coq-logic-path=F32F16',*slp],'strategy-'+name)==0
   goal=out/(name+'_strategy_goal.v');shutil.copyfile(goal,H/'coq'/goal.name);fields=re.findall(r'^\s*Axiom (\w+)\s*:',goal.read_text(),re.M);strategies.append({'stem':name,'fields':fields,'goal_sha256':sha(goal),'generation_directory':str(out)})
  units.extend(concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs).map(generate,stems))
  # Typed bindings use BASE proofs only where this exact C/body contract was
  # already checked. The ushort store has its own newly proved implementation.
  old=R/'verification/qcp/verified/f32-vrndne/proof/coq'
  for stem,outname in [('memory_rvv_load','MemoryRvvLoadChecked'),('rvv_control','RvvControlChecked')]:
   text=(old/(stem+'_checked.v')).read_text().replace('Rndne.memory','F32F16.memory').replace('Rndne.rvv','F32F16.rvv').replace('From Rndne Require Import','From F32F16 Require Import').replace('rndne_memory_strategy_proof','f16_memory_strategy_proof').replace('Rndne.RndneStrategy.CheckedRndneStrategy','F32F16.F16Strategy.CheckedF16Strategy');(H/'coq'/(outname+'.v')).write_text(text)
  cmd=[sys.executable,str(H/'check_coq.py'),'--targets','MemoryRvvLoadChecked','RvvControlChecked','UShortStoreChecked','--jobs',str(a.jobs),'--timeout','3600'];assert execute(cmd,'ordinary-source-closure')==0
  info=json.loads((C/'.build/coq-status-MemoryRvvLoadChecked-RvvControlChecked-UShortStoreChecked.json').read_text());assert info['passed'];s['ordinary_closure']=info
  checks=[('memory_rvv_load','MemoryRvvLoadChecked.Checked_memory_rvv_load'),('rvv_control','RvvControlChecked.Checked_rvv_control'),('memory_rvv_store','UShortStoreChecked.CheckedUShortStore')]
  gate='From F32F16 Require Import MemoryRvvLoadChecked RvvControlChecked UShortStoreChecked.\n'
  for stem,mod in checks:
   row=next(u for u in units if u['stem']==stem);row['checked_module']='F32F16.'+mod;gate+=f'Module Gate_{stem} : F32F16.{stem}_goal.VC_Correct := F32F16.{mod}.\n';gate+='\n'.join('Print Assumptions Gate_'+stem+'.proof_of_'+f+'.'for f in row['fields'])+'\n'
  gate+='Module GateMemoryStrategy : F32F16.f16_memory_strategy_goal.f16_memory_Strategy_Correct := F32F16.F16Strategy.CheckedF16Strategy.\nModule GateStoreStrategy : F32F16.f16_ushort_store_strategy_goal.f16_ushort_store_Strategy_Correct := F32F16.UShortStoreStrategy.CheckedUShortStoreStrategy.\n'
  for index,item in enumerate(strategies):gate+='\n'.join('Print Assumptions '+('GateMemoryStrategy' if index==0 else 'GateStoreStrategy')+'.'+f+'.'for f in item['fields'])+'\n'
  (H/'coq/MemoryGate.v').write_text(gate);private_gate=Path(info['run_directory'])/'coq/MemoryGate.v';shutil.copyfile(H/'coq/MemoryGate.v',private_gate);gate_command=info['records'][0]['command'][:-1]+[str(private_gate)];assert execute(gate_command,'final-typed-gate')==0
  s['final_ordinary_closure']={**info,'source_sha256':{**info['source_sha256'],'MemoryGate':sha(private_gate)},'final_gate_same_fresh_environment':True};assert s['final_ordinary_closure']['passed'];assert all(sha(C/p)==h for p,h in s['input_sha256'].items());s.update(passed=True,vc_correct_passed=True,checked_c_vcs=sum(u['checked_c_vcs']for u in units),checked_strategy_fields=sum(len(u['fields'])for u in strategies),source_sha256={**s['input_sha256'],**{'proof/coq/'+n+'.v':h for n,h in s['final_ordinary_closure']['source_sha256'].items()}})
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'memory-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run,flush=True);raise SystemExit(0 if s['passed'] else 1)
if __name__=='__main__':main()
