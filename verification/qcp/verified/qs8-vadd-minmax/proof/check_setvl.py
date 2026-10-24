#!/usr/bin/env python3
"""Fresh actual min(AVL,32) body and typed ordinary-Coq gate."""
from pathlib import Path
import argparse,json,re,hashlib,subprocess,tempfile,shutil,time
C=Path(__file__).resolve().parent.parent;sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='setvl-proof-',dir=C/'.build'));coq=r/'coq';coq.mkdir();mods=['Model','ShiftFacts','Types','RvvModel','SetvlChecked'];files=['proof/check_setvl.py','shim/setvl.c','shim/setvl.h','shim/scalar.h','shim/types.h','shim/types_def.h']+['proof/coq/'+n+'.v'for n in mods];inputs={n:sha(C/n)for n in files};records=[];s=dict(passed=False,vc_correct_passed=False,whole_kernel_verified=False,scope='actual C selected VLEN128 e8m2 setvl min(AVL,32), not ISA-wide vsetvl refinement',run_directory=str(r),input_sha256=inputs,records=records)
 def run(n,cmd):
  log=r/(n+'.log');t=time.monotonic()
  with log.open('w')as f:p=subprocess.run(['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)],cwd=r,stdout=f,stderr=f,timeout=1200)
  records.append(dict(label=n,command=list(map(str,cmd)),exit_code=p.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));assert not p.returncode,log.read_text()[-2000:]
 try:
  cpp=r/'setvl.c';out=r/'generated';out.mkdir();run('cpp',['gcc','-E','-P','-CC','-nostdinc',C/'shim/setvl.c','-o',cpp]);run('qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(cpp),'--coq-output-dir='+str(out),'--coq-logic-path=Qs8Add','-slp',C/'shim','Qs8Add']);goal=out/'setvl_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==4;shutil.copyfile(goal,coq/goal.name)
  flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'Qs8Add']
  for n in mods:shutil.copyfile(C/'proof/coq'/(n+'.v'),coq/(n+'.v'))
  order=['Model','ShiftFacts','Types','RvvModel','setvl_goal','SetvlChecked']
  for n in order:run(n,[*flags,'-time',coq/(n+'.v')])
  gate='From Qs8Add Require Import SetvlChecked.\nModule Typed : Qs8Add.setvl_goal.VC_Correct := Qs8Add.SetvlChecked.CheckedSetvl.\n'+''.join('Print Assumptions Typed.proof_of_'+f+'.\n'for f in fields);(coq/'SetvlGate.v').write_text(gate);run('SetvlGate',[*flags,'-time',coq/'SetvlGate.v']);assert inputs=={n:sha(C/n)for n in files};s.update(passed=True,vc_correct_passed=True,checked_c_vcs=4,fields=fields,checked_module='Qs8Add.SetvlChecked.CheckedSetvl',cpp_sha256=sha(cpp),goal_sha256=sha(goal),final_gate_sha256=sha(coq/'SetvlGate.v'),final_assumptions_log_sha256=sha(r/'SetvlGate.log'),no_component_vo_reused=True)
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');d=C/'proof/setvl-status.json'
 if d.exists():(C/'proof/history'/('setvl-status-'+sha(d)+'.json')).write_bytes(d.read_bytes())
 d.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','checked_c_vcs','error']},indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
