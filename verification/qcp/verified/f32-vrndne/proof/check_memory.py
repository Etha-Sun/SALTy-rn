#!/usr/bin/env python3
"""Fresh real float memory/control bodies bound to exact checked interfaces."""
from pathlib import Path
import json,subprocess,hashlib,time,tempfile,shutil,re,concurrent.futures
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if (p/'.git').exists());BASE=R/'verification/qcp/verified/f32-vadd';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='memory-proof-',dir=C/'.build'));coq=run/'coq';coq.mkdir();dep=BASE/'.build/full-1f5wequq/coq';cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());flags=cfg['flags']+sum((['-Q',str(p),'' if p.name=='relations' else p.name] for p in sorted(dep.iterdir()) if p.is_dir()),[])+['-Q',str(coq),'Rndne'];records=[];units=['memory_neon','memory_rvv_load','memory_rvv_store','rvv_control'];mods=['Bits','Model','Types','VectorModel','ProgramModel','rndne_memory_strategy_goal','RndneStrategy','rndne_memory_strategy_proof'];s={'passed':False,'whole_kernel_verified':False,'scope':'actual_float_memory_and_control_providers_only','run_directory':str(run),'records':records}
 sources=[C/'shim'/(u+'.c') for u in units]+list((C/'shim').glob('*.h'))+[H/'coq'/(m+'.v') for m in mods]+[H/'c/rndne_memory.strategies',Path(__file__)];s['input_sha256']={str(p.relative_to(C)):sha(p) for p in sources}
 def execute(cmd,label,budget=1200):
  cmd=list(map(str,cmd));log=run/(label+'.log');work=run/'jobs'/label;work.mkdir(parents=True,exist_ok=True);start=time.monotonic()
  try:
   with log.open('w') as f:r=subprocess.run(['prlimit','--as='+str(16*1024**3),'--']+cmd,cwd=work,stdout=f,stderr=f,timeout=budget)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  records.append({'command':cmd,'label':label,'exit_code':ec,'seconds':time.monotonic()-start,'log_sha256':sha(log)});print(label,ec,flush=True);return ec
 def generate(stem):
  p=run/(stem+'.raw.c');p.write_text('#include "'+str(C/'shim/program_model.h')+'"\n#include "'+str(C/'shim'/(stem+'.c'))+'"\n');cpp=run/(stem+'.c');assert execute(['gcc','-E','-P','-CC','-nostdinc',p,'-o',cpp],stem+'-cpp',60)==0
  cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(cpp),'--coq-output-dir='+str(coq),'--coq-logic-path=Rndne','-slp',str(C/'shim'),'Rndne','-slp',str(H/'c'),'Rndne']
  for d in sorted((BASE/'proof/c').iterdir()):
   if d.is_dir():cmd+=['-slp',str(d),d.name]
  assert execute(cmd,stem+'-qcp',1200)==0,stem
  return stem
 try:
  list(concurrent.futures.ThreadPoolExecutor(max_workers=4).map(generate,units))
  for n in mods:shutil.copyfile(H/'coq'/(n+'.v'),coq/(n+'.v'));assert execute(flags+[coq/(n+'.v')],n)==0,n
  for stem in units:assert execute(flags+[coq/(stem+'_goal.v')],stem+'_goal')==0,stem
  inventory=[]
  for stem in units:
   fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',(coq/(stem+'_goal.v')).read_text(),re.M);assert fields
   text='From Rndne Require Import '+stem+'_goal rndne_memory_strategy_proof.\nFrom ByValue Require Import shim_checked.\nFrom QcpRvv32 Require Import rvv_load_checked rvv_store_checked rvv_loop_pure_checked.\nFrom ByvalueRvv Require Import shim_checked.\nModule Checked_'+stem+' : Rndne.'+stem+'_goal.VC_Correct.\nInclude Rndne.RndneStrategy.CheckedRndneStrategy.\n'
   for ns,mod,checked in [('QcpVadd','float_array_strategy_proof','CheckedFloatArray'),('QcpNeon','neon_bridge_strategy_proof','CheckedNeonBridge'),('QcpNeonLoop','neon_tail_strategy_proof','CheckedNeonTail'),('QcpRvv32','rvv_arrays_strategy_proof','CheckedRvvArray'),('QcpRvv32','rvv_store_strategy_proof','CheckedRvvStoreStrategy'),('QcpRvv32','rvv_loop_strategy_proof','CheckedRvvLoopStrategy')]:
    # Goal imports checked strategy modules; only include if that module is in VC_Correct.
    text+='Include '+ns+'.'+mod+'.'+checked+'.\n'
   for f in fields:
    if stem=='memory_neon':provider='ByValue.shim_checked.CheckedShim'
    elif f.startswith('qcp_byvalue_load_'):provider='ByvalueRvv.shim_checked.Checked'
    elif f.startswith(('qcp_rvv_read_lane_','__riscv_vle32_')):provider='QcpRvv32.rvv_load_checked.CheckedRvvLoad'
    elif f.startswith(('qcp_rvv_get32_','qcp_rvv_store_next_','__riscv_vse32_')):provider='QcpRvv32.rvv_store_checked.CheckedRvvStore'
    elif f.startswith('__riscv_vsetvl_'):provider='QcpRvv32.rvv_loop_pure_checked.CheckedRvvLoopPure'
    else:raise ValueError(f)
    text+=f'Lemma proof_of_{f} : Rndne.{stem}_goal.{f}.\nProof. exact {provider}.proof_of_{f}. Qed.\n'
   text+='End Checked_'+stem+'.\n';name=stem+'_checked';(coq/(name+'.v')).write_text(text);inventory.append({'stem':stem,'fields':fields,'checked_c_vcs':len(fields),'goal_sha256':sha(coq/(stem+'_goal.v')),'c_sha256':sha(run/(stem+'.c')),'module':'Rndne.'+name+'.Checked_'+stem})
  assert all(ec==0 for ec in concurrent.futures.ThreadPoolExecutor(max_workers=4).map(lambda st:execute(flags+[coq/(st+'_checked.v')],st+'_checked'),units)),'memory typed interface failed'
  gate='From Rndne Require Import '+' '.join(u+'_checked' for u in units)+'.\n'
  for u in inventory:
   stem=u['stem'];gate+=f'Module Final_{stem} : Rndne.{stem}_goal.VC_Correct := {u["module"]}.\n';gate+='\n'.join('Print Assumptions Final_'+stem+'.proof_of_'+f+'.' for f in u['fields'])+'\n'
  (coq/'MemoryGate.v').write_text(gate);assert execute(flags+[coq/'MemoryGate.v'],'MemoryGate')==0
  for u in units:
   for suffix in ['_goal.v','_checked.v']:shutil.copyfile(coq/(u+suffix),H/'coq'/(u+suffix))
  shutil.copyfile(coq/'MemoryGate.v',H/'coq/MemoryGate.v');assert all(sha(C/p)==h for p,h in s['input_sha256'].items());s.update(passed=True,vc_correct_passed=True,units=inventory,checked_c_vcs=sum(u['checked_c_vcs'] for u in inventory))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'memory-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s['passed'] else 1)
if __name__=='__main__':main()
