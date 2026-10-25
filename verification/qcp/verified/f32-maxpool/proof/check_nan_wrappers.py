#!/usr/bin/env python3
"""Actual four-wrapper VC_Correct; ordinary propagation body remains pending."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);a=p.parse_args();g=json.loads((C/'proof/nan-wrappers-generation-status.json').read_text());assert g['generation_passed'];assert all(sha(C/n)==h for n,h in g['input_sha256'].items());math=json.loads((C/'proof/math-complete-status.json').read_text());assert math['passed']
 r=Path(tempfile.mkdtemp(prefix='nan-wrappers-proof-',dir=C/'.build'));coq=r/'coq';coq.mkdir();cloned={};records=[]
 for n in math['dependency_graph']:
  for ext in ['.v','.vo']:
   src=Path(math['run_directory'])/'coq'/(n+ext);shutil.copy2(src,coq/src.name)
  assert sha(coq/(n+'.v'))==math['compiled_source_sha256'][n]==sha(C/'proof/coq'/(n+'.v'));cloned[n]=dict(source_sha256=sha(coq/(n+'.v')),vo_sha256=sha(coq/(n+'.vo')))
 goal=Path(g['run_directory'])/'generated/nan_wrappers_goal.v';assert sha(goal)==g['goal_sha256'];shutil.copy2(goal,coq/goal.name);text=goal.read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);assert len(fields)==28
 # Return cells are initialized once; no returned-record undef+init recovery.
 matches=list(re.finditer(r'(?m)^Definition (\w+)\s*:=',text));screen=[]
 for i,m in enumerate(matches):
  if not re.search(r'_return_wit_\d+$',m[1]):continue
  b=text[m.end():matches[i+1].start()];before=b.split('|--',1)[0]
  cells=re.findall(r'record_return\)\s*#\s*"vfloat32m8_t"\s*->ₛ\s*"(s\d+)"\)\)\s*#\s*Float\s*\|->([^\n]*)',before)
  assert len(cells)==32 and len({x[0]for x in cells})==32 and all(not x[1].lstrip().startswith('_')for x in cells),(m[1],cells)
  assert not re.search(r'UndefStructPred\w+\s+\(?record_return',before);screen.append(m[1])
 inputs={n:sha(C/n)for n in ['proof/check_nan_wrappers.py','proof/nan-wrappers-generation-status.json','proof/math-complete-status.json']};s=dict(passed=False,whole_kernel_verified=False,ordinary_propagate_body_pending=True,scope='actual fourordinary wrappers checked on pinnedfreshmathdependencyobjects; canonical5helper wholeunit and every callee remain separate mandatoryclosure',run_directory=str(r),records=records,input_sha256=inputs,cloned_math_modules=cloned,returned_record_single_owner_fields=screen)
 flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool'];env={**os.environ,'PATH':str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def run(n):
  cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];log=r/(n+'.log');t=time.monotonic()
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=out,timeout=7200).returncode
   except subprocess.TimeoutExpired:code=124
  records.append(dict(label=n,command=cmd,exit_code=code,seconds=time.monotonic()-t,source_sha256=sha(coq/(n+'.v')),log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert code==0,log.read_text()[-3000:]
 try:
  run('nan_wrappers_goal')
  proof='''From Coq Require Import ZArith Lia.
From MaxPool Require Import Types VectorModel BitRangeFacts CompareFacts FastFrame nan_wrappers_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac mp_intro := lazymatch goal with |- _ |-- _=>idtac | |- forall _,_=>intro;mp_intro end.
Ltac mp_match :=
 unfold mp_fmatch;intro;
 repeat match goal with Hlt: ?j < ?vl,H:mp_fmatch ?j ?vl ?v ?e |- context[?v] =>
  rewrite (H Hlt) end;
 unfold mp_arm_max,mp_arm_min,mp_rvv_max,mp_rvv_min;
 rewrite ?mp_restore_float_rvv;reflexivity.
Ltac mp_pure := unfold derivable1,andp,coq_prop;intros;
 repeat first[solve[assumption|reflexivity|lia|mp_match]|split].
Ltac mp_frame :=
 unfold UndefStructPredvfloat32m8_t;rewrite ?mp_local_field_address;
 repeat progress rewrite<-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[mp_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedNanWrappers : MaxPool.nan_wrappers_goal.VC_Correct.
'''
  for f in fields:
   body='unfold MaxPool.nan_wrappers_goal.'+f+';'
   if re.search(r'^Definition '+re.escape(f)+r' :=\s*\w+_pure\s*->',text,re.M):body+='intro Hpure;unfold MaxPool.nan_wrappers_goal.'+f+'_aux;'
   body+='try left;mp_intro;'
   if '_return_'in f:
    suffix='_3';body+='Exists '+' '.join('r'+str(i)+suffix for i in reversed(range(16,32)))+';Exists '+' '.join('r'+str(i)+suffix for i in reversed(range(16)))+';mp_frame.'
   elif f.endswith('_pure'):body+='mp_pure.'
   else:body+='mp_frame.'
   proof+='Lemma proof_of_'+f+' : MaxPool.nan_wrappers_goal.'+f+'.\nProof. '+body+' Qed.\n'
  proof+='End CheckedNanWrappers.\n'+''.join('Print Assumptions CheckedNanWrappers.proof_of_'+f+'.\n'for f in fields);(coq/'NanWrappersChecked.v').write_text(proof);run('NanWrappersChecked');assert inputs=={n:sha(C/n)for n in inputs};s.update(passed=True,actual_C_VCs=28,fields=fields,checked_module='MaxPool.NanWrappersChecked.CheckedNanWrappers',goal_sha256=sha(goal),proof_sha256=sha(coq/'NanWrappersChecked.v'))
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'proof/nan-wrappers-status.json').write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_VCs','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
