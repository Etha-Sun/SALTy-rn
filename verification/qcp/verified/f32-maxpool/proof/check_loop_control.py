#!/usr/bin/env python3
"""Fresh actual C control-layout probes; not whole-kernel evidence."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='loop-control-fresh-',dir=C/'.build'));coq=r/'coq';coq.mkdir();mods=['Bits','Model','MemoryModel'];files=['proof/check_loop_control.py','proof/c/loop_control_probe.c','shim/formal_model.h','shim/read_table.h']+['proof/coq/'+n+'.v'for n in mods];inputs={s:sha(C/s)for s in files};records=[];status=dict(passed=False,whole_kernel_verified=False,run_directory=str(r),input_sha256=inputs,records=records);env=os.environ.copy();env['PATH']=str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool']
 def run(label,cmd):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=7200)
  records.append(dict(label=label,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(status,indent=2)+'\n');assert p.returncode==0,log.read_text()[-3000:]
 try:
  run('cpp',['gcc','-E','-P','-CC','-nostdinc',C/'proof/c/loop_control_probe.c','-o',r/'loop_control.c']);gen=r/'generated';gen.mkdir();run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(r/'loop_control.c'),'--coq-output-dir='+str(gen),'--coq-logic-path=MaxPool','-slp',C/'shim','MaxPool'])
  for n in mods:shutil.copy2(C/'proof/coq'/(n+'.v'),coq/(n+'.v'));run(n,[*flags,'-time',coq/(n+'.v')])
  goal=gen/'loop_control_goal.v';shutil.copy2(goal,coq/goal.name);run('loop_control_goal',[*flags,'-time',coq/goal.name]);fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields
  source='From Coq Require Import ZArith Lia.\nFrom SimpleC.SL Require Import Mem SeparationLogic.\nFrom MaxPool Require Import MemoryModel loop_control_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope. Local Open Scope sac.\nModule CheckedLoopControl : MaxPool.loop_control_goal.VC_Correct.\n'
  for f in fields:
   aux='unfold MaxPool.loop_control_goal.'+f+'_aux;' if 'partial_solve' in f and not f.endswith('_pure') else ''
   source+='Lemma proof_of_'+f+' : MaxPool.loop_control_goal.'+f+'.\nProof. unfold MaxPool.loop_control_goal.'+f+';'+aux+'try left;intros;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;entailer!;lia. Qed.\n'
  source+='End CheckedLoopControl.\n'+''.join('Print Assumptions CheckedLoopControl.proof_of_'+f+'.\n'for f in fields);(coq/'LoopControlChecked.v').write_text(source);run('LoopControlChecked',[*flags,'-time',coq/'LoopControlChecked.v']);assert inputs=={s:sha(C/s)for s in inputs};status.update(passed=True,actual_c_vcs=len(fields),fields=fields,checked_module='MaxPool.LoopControlChecked.CheckedLoopControl',cpp_sha256=sha(r/'loop_control.c'),goal_sha256=sha(goal),proof_sha256=sha(coq/'LoopControlChecked.v'),no_component_vo_reused=True)
 except Exception as e:status['error']=str(e)
 (r/'status.json').write_text(json.dumps(status,indent=2)+'\n');dest=C/'proof/loop-control-status.json'
 if dest.exists():(C/'proof/history'/('loop-control-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:status.get(k)for k in ['passed','run_directory','actual_c_vcs','error']}));return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
