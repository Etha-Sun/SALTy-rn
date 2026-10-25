#!/usr/bin/env python3
"""Fresh actual caller body and exact typed interface, conditional on callees.

The complete case gate must also close the two actual kernels and every
ordinary callee. Proving this observer alone grants no whole-kernel credit.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='caller-fresh-',dir=C/'.build'));coq=r/'coq';coq.mkdir();records=[]
 mods=['Bits','Model','Types','MemoryModel','MemoryViews','PackModel','ProgramModel','ContractModel','KernelState','WriteFacts','WindowFacts','CompareModel','CompareTypes','CompareFacts','FastFrame','StateObservation','TraceLookup']
 gen=json.loads((C/'proof/caller-generation-status.json').read_text());assert gen['generation_passed'];goal=Path(gen['run_directory'])/'generated/caller_goal.v';assert sha(goal)==gen['goal_sha256'];assert gen['input_sha256']=={p:sha(C/p)for p in gen['input_sha256']}
 files=['spec.c','proof/check_caller.py','proof/caller-generation-status.json']+['proof/coq/'+n+'.v'for n in mods];inputs={p:sha(C/p)for p in files};s=dict(passed=False,whole_kernel_verified=False,callee_closure_pending=True,scope='ordinary actualC observer for anywritten address; whole-case closure of both kernels/ordinary helpers is separately mandatory',run_directory=str(r),input_sha256=inputs,records=records,process_limit_GiB=16,actual_live_jobs=1)
 flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool'];env={**os.environ,'PATH':str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def run(n):
  cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];log=r/(n+'.log');start=time.monotonic()
  with log.open('w')as out:cp=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=out,timeout=7200)
  records.append(dict(label=n,command=cmd,exit_code=cp.returncode,seconds=time.monotonic()-start,source_sha256=sha(coq/(n+'.v')),log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert cp.returncode==0,log.read_text()[-2400:]
 try:
  for n in mods:shutil.copy2(C/'proof/coq'/(n+'.v'),coq/(n+'.v'));run(n)
  shutil.copy2(goal,coq/goal.name);run('caller_goal');text=goal.read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);assert len(fields)==10
  proof='''From Coq Require Import ZArith Lia.
From MaxPool Require Import Types TraceLookup CompareFacts FastFrame caller_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque mp_complete mp_out mp_data mp_ptr_data mp_probe_value.
Ltac mp_intro := lazymatch goal with |- _ |-- _=>idtac | |- forall _, _=>intro;mp_intro end.
Ltac mp_caller_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[solve[assumption|reflexivity|congruence|lia]
 |solve[eapply mp_complete_probe_known;[lia|lia|eassumption]]
 |solve[eapply mp_written_window;eassumption]
 |solve[match goal with HG:mp_geometry ?F ?PT ?W ?P ?K ?C ?table ?offset ?stride ?inc ?output ?outinc,
          HW:mp_written ?P ?C ?output ?outinc ?p |- _=>
     pose proof(mp_written_window F PT W P K C table offset stride inc output outinc p HG HW)as Hp;
     unfold mp_write_window in Hp;lia end]
 |split].
Ltac mp_caller_frame :=
 rewrite ?mp_local_field_address;
 repeat progress rewrite<-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[mp_caller_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedCaller : MaxPool.caller_goal.VC_Correct.
'''
  for f in fields:
   aux='unfold MaxPool.caller_goal.'+f+'_aux;'if re.search(r'^Definition '+re.escape(f)+r' :=\s*\w+_pure\s*->',text,re.M)else'';tactic='mp_caller_pure'if'safety'in f or f.endswith('_pure')else'mp_caller_frame';proof+='Lemma proof_of_'+f+' : MaxPool.caller_goal.'+f+'.\nProof. unfold MaxPool.caller_goal.'+f+';'+aux+'try left;mp_intro;'+tactic+'. Qed.\n'
  proof+='End CheckedCaller.\n'+''.join('Print Assumptions CheckedCaller.proof_of_'+f+'.\n'for f in fields);(coq/'CallerChecked.v').write_text(proof);run('CallerChecked');assert inputs=={p:sha(C/p)for p in inputs};s.update(passed=True,actual_c_vcs=len(fields),fields=fields,checked_module='MaxPool.CallerChecked.CheckedCaller',goal_sha256=sha(goal),proof_sha256=sha(coq/'CallerChecked.v'),assumptions_log_sha256=sha(r/'CallerChecked.log'),all_case_dependencies_rebuilt_from_v=True)
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/caller-status.json'
 if dest.exists():(C/'proof/history'/('caller-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_c_vcs','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
