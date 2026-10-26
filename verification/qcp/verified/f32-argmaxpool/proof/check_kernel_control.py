#!/usr/bin/env python3
"""Fresh actual ordinary assertion-provider body and its typed interface."""
from pathlib import Path
import hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='control-actual-',dir=C/'.build'));records=[]
 inputs={n:sha(C/n)for n in ['proof/check_kernel_control.py','shim/kernel_control.h','shim/kernel_control.c','shim/formal_model.h']}
 s=dict(passed=False,whole_kernel_verified=False,scope='actual_ordinary_assertion_provider_C_body_only',run_directory=str(run),input_sha256=inputs,records=records)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(C/'shim/kernel_control.c'),'-o',str(run/'control_unit.c')]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'control_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]:
   log=run/(label+'.log');start=time.monotonic();cmd=['prlimit','--as=17179869184:17179869184','--']+cmd
   with log.open('w')as f:p=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=7200)
   records.append(dict(label=label,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-start,log_sha256=sha(log)));assert p.returncode==0,log.read_text()[-1500:]
  goal=run/'control_unit_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==1
  (C/'proof/coq/control_unit_goal.v').write_bytes(goal.read_bytes())
  t='From ArgmaxPool Require Import Model control_unit_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope sac.\nModule CheckedControl : ArgmaxPool.control_unit_goal.VC_Correct.\n'
  for name in fields:t+='Lemma proof_of_'+name+' : ArgmaxPool.control_unit_goal.'+name+'.\nProof. unfold ArgmaxPool.control_unit_goal.'+name+';intros;entailer!. Qed.\n'
  t+='End CheckedControl.\nModule ExactControl:ArgmaxPool.control_unit_goal.VC_Correct:=CheckedControl.\n'+''.join('Print Assumptions ExactControl.proof_of_'+n+'.\n'for n in fields)
  (C/'proof/coq/KernelControlChecked.v').write_text(t)
  cmd=['python3',str(C/'proof/check_math.py'),'--targets','KernelControlChecked','--jobs','32','--max-live','1','--timeout','7200'];log=run/'ordinary.log'
  with log.open('w')as f:p=subprocess.run(cmd,cwd=C,env=env,stdout=f,stderr=f,timeout=7500)
  assert p.returncode==0,log.read_text()[-1500:]
  closure=json.loads((C/'.build/coq-status-KernelControlChecked.json').read_text());assert closure['passed'];assert closure['source_sha256']['control_unit_goal']==sha(goal)
  assert all(sha(C/n)==h for n,h in inputs.items())
  s.update(passed=True,actual_C_fields=1,unique_ordinary_C_functions=['ap_assert'],goal_sha256=sha(goal),typed_module='ArgmaxPool.KernelControlChecked.ExactControl',ordinary_closure=closure)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'proof/kernel-control-status.json').write_bytes((run/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
