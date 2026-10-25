#!/usr/bin/env python3
"""Actual local width probes, with a strict fresh complete VC interface."""
from pathlib import Path
import hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
R=next(p for p in C.parents if(p/'.git').exists())
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='width64-fresh-',dir=C/'.build'));Q=run/'coq';gen=run/'generated';Q.mkdir();gen.mkdir();files=['proof/c/type_width.c','shim/types.h','proof/check_width.py'];pins={p:sha(C/p)for p in files};records=[]
 s={'passed':False,'whole_kernel_verified':False,'scope':'Three actual unsigned64 size_t/uintptr and unsigned32 C probes only','run_directory':str(run),'input_sha256':pins,'records':records,'configured_jobs':32,'max_live_processes':1,'per_process_memory_GiB':16,'timeout_seconds':7200}
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def execute(label,command):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,command)];log=run/(label+'.log');start=time.monotonic()
  try:
   with log.open('w')as f:rc=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=7200).returncode
  except subprocess.TimeoutExpired:rc=124
  records.append({'label':label,'command':cmd,'exit_code':rc,'seconds':time.monotonic()-start,'log_sha256':sha(log)});print(label,rc,flush=True);assert rc==0,(label,log.read_text()[-2500:])
 try:
  expanded=run/'type_width.c';execute('cpp',['gcc','-E','-P','-CC','-nostdinc',C/'proof/c/type_width.c','-o',expanded]);execute('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(expanded),'--coq-output-dir='+str(gen),'--coq-logic-path=DwChw','-slp',C/'shim','DwChw'])
  goal=gen/'type_width_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields
  shutil.copy2(goal,Q/goal.name)
  source='From Coq Require Import ZArith.\nFrom SimpleC.SL Require Import Mem SeparationLogic.\nFrom DwChw Require Import type_width_goal.\nImport Snaive_C_Rules64. Local Open Scope sac.\nModule CheckedWidth : type_width_goal.VC_Correct.\n'
  for f in fields:
   source+='Lemma proof_of_'+f+' : type_width_goal.'+f+'.\nProof. unfold type_width_goal.'+f+';try left;intros;try change (unsigned_last_nbits (-1) 64) with 18446744073709551615 in *;try change (unsigned_last_nbits (-1) 32) with 4294967295 in *;entailer!. Qed.\n'
  source+='End CheckedWidth.\nModule ExactWidthAgain : type_width_goal.VC_Correct := CheckedWidth.\n'+''.join('Print Assumptions ExactWidthAgain.proof_of_'+f+'.\n'for f in fields)
  proof=Q/'Width64Checked.v';proof.write_text(source)
  cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());flags=cfg['flags']+['-Q',str(Q),'DwChw']
  for name in ['type_width_goal','Width64Checked']:execute(name,[*flags,Q/(name+'.v')])
  assert pins=={p:sha(C/p)for p in files};reports=len(re.findall(r'^(?:Axioms:|Closed under the global context)',(run/'Width64Checked.log').read_text(),re.M));assert reports==len(fields)
  for p in [goal,proof]:shutil.copy2(p,C/'proof/coq'/p.name)
  s.update(passed=True,actual_C_fields=len(fields),actual_C_bodies=3,fresh_local_modules=2,Print_reports=reports,fields=fields,goal_sha256=sha(goal),cpp_sha256=sha(expanded),proof_sha256=sha(proof),typed_instance='DwChw.Width64Checked.CheckedWidth',second_exact_ascription=True)
 except Exception as error:s['error']=str(error)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');target=C/'proof/width-status.json'
 if target.exists():
  history=C/'proof/history';history.mkdir(exist_ok=True);shutil.copy2(target,history/(target.stem+'-'+sha(target)+'.json'))
 target.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:v for k,v in s.items()if k not in ['input_sha256','records']},indent=2));raise SystemExit(not s['passed'])
if __name__=='__main__':main()
