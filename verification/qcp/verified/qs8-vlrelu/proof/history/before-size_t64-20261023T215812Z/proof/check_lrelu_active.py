#!/usr/bin/env python3
"""Fresh compare/select C bodies and their exact typed interface; component only."""
from pathlib import Path
import json,re,hashlib,os,subprocess,tempfile,time,shutil
CASE=Path(__file__).resolve().parent.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
run=Path(tempfile.mkdtemp(prefix='lrelu-active-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[]
inputs=['shim/lrelu_active.c','shim/lrelu_active.h','shim/lrelu_selection.h','shim/rvv_active.h','shim/types.h','shim/types_def.h','shim/scalar.h','proof/check_lrelu_active.py',*[f'proof/coq/{n}.v'for n in ['Model','Types','ScalarFacts','LreluModel','RvvModel','LreluActiveModel']]]
hashes={n:sha(CASE/n)for n in inputs}
flags=json.loads((ROOT/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),'Qs8Lrelu']
env={**os.environ,'PATH':str(ROOT/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
s={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records,'input_sha256':hashes,'scope':'Three active-lane compare/splat/merge C helpers under the fixed kernel mask convention; component only'}
def exe(label,command):
 cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,command)];work=run/'jobs'/label;work.mkdir(parents=True);t=time.monotonic();log=run/(label+'.log')
 with log.open('w')as f:
  try:code=subprocess.run(cmd,cwd=work,env=env,stdout=f,stderr=f,timeout=3600).returncode
  except subprocess.TimeoutExpired:code=124
 records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(label,code,flush=True)
 if code:raise RuntimeError(label+': '+log.read_text()[-4000:])
try:
 exe('cpp',['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/lrelu_active.c','-o',run/'lrelu_active.c'])
 out=run/'generated';out.mkdir();exe('qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(run/'lrelu_active.c'),'--coq-output-dir='+str(out),'--coq-logic-path=Qs8Lrelu'])
 goal=out/'lrelu_active_goal.v';shutil.copyfile(goal,coq/goal.name);g=goal.read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',g,re.M);assert fields and len(fields)==len(set(fields))
 for n in ['Model','Types','ScalarFacts','LreluModel','RvvModel','LreluActiveModel']:
  shutil.copyfile(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'));exe(n,['qcp-env','coqc','-time',*flags,coq/(n+'.v')])
 exe('goal',['qcp-env','coqc','-time',*flags,coq/goal.name])
 text='''From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Lrelu Require Import LreluModel RvvModel LreluActiveModel lrelu_active_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac selection_cases :=
 repeat match goal with
 | |-context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b);cbn
 | |-context[Z.eqb ?a ?b]=>destruct(Z.eqb_spec a b);cbn
 end.
Module CheckedLreluActive : Qs8Lrelu.lrelu_active_goal.VC_Correct.
'''
 for f in fields:
  aux=', Qs8Lrelu.lrelu_active_goal.'+f+'_aux'if re.search(r'^Definition '+f+r'_aux\b',g,re.M)else''
  text+=f'''Lemma proof_of_{f} : Qs8Lrelu.lrelu_active_goal.{f}.
Proof. unfold Qs8Lrelu.lrelu_active_goal.{f}{aux};try left;intros;
 unfold qlr_active_mask,qlr_active_splat,qlr_active_merge;selection_cases;
 entailer!;try lia;try congruence.
Qed.
'''
 text+='End CheckedLreluActive.\n';checked=coq/'LreluActiveChecked.v';checked.write_text(text);shutil.copyfile(checked,CASE/'proof/coq'/checked.name);exe('checked',['qcp-env','coqc','-time',*flags,checked])
 gate=coq/'LreluActiveGate.v';gate.write_text('From Qs8Lrelu Require Import lrelu_active_goal LreluActiveChecked.\nModule ActualLreluActive : Qs8Lrelu.lrelu_active_goal.VC_Correct := Qs8Lrelu.LreluActiveChecked.CheckedLreluActive.\n'+''.join('Print Assumptions ActualLreluActive.proof_of_'+f+'.\n'for f in fields));exe('gate',['qcp-env','coqc','-time',*flags,gate]);reports=re.findall(r'^(?:Axioms:|Closed under the global context)',(run/'gate.log').read_text(),re.M);assert len(reports)==len(fields)
 assert all(sha(CASE/n)==d for n,d in hashes.items());s.update(passed=True,vc_correct_passed=True,actual_c_functions=['qcp_qlr_active_mask','qcp_qlr_active_splat','qcp_qlr_active_merge'],fields=fields,checked_c_vcs=len(fields),typed_instance='Qs8Lrelu.LreluActiveChecked.CheckedLreluActive',goal_sha256=sha(goal),cpp_sha256=sha(run/'lrelu_active.c'),ordinary_coq_modules=9,no_component_vo_reused=True,compiled_source_sha256={p.name:sha(p)for p in coq.glob('*.v')},final_assumptions_log_sha256=sha(run/'gate.log'))
except Exception as e:s['error']=str(e);print(e,flush=True)
finally:
 p=CASE/'proof/lrelu-active-status.json'
 if p.exists():
  history=CASE/'proof/history';history.mkdir(exist_ok=True);shutil.copyfile(p,history/('lrelu-active-status-'+sha(p)+'.json'))
 for p in [run/'status.json',CASE/'proof/lrelu-active-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print('RUN',run,flush=True)
raise SystemExit(0 if s['passed']else 1)
