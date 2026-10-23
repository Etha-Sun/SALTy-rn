#!/usr/bin/env python3
"""Generate and check the actual scalar C helper unit; no whole kernel claim."""
import argparse,json,hashlib,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--module-timeout',type=int,default=300);a=p.parse_args()
 run=Path(tempfile.mkdtemp(prefix='rvv-active-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),'Qu8Cvt'];records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'Actual scalar C cast/widen/wrap/multiply helper bodies only','run_directory':str(run),'records':records}
 def execute(cmd,label,budget=300):
  work=run/('job-'+label);work.mkdir();cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];start=time.monotonic()
  with(run/(label+'.log')).open('w')as f:
   try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(run/(label+'.log'))});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n');print(label,code,flush=True)
  if code:raise RuntimeError((run/(label+'.log')).read_text()[-5000:])
 def cc(n):
  src=HERE/'coq'/(n+'.v')
  if src.exists():shutil.copyfile(src,coq/(n+'.v'))
  execute(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n,a.module_timeout)
 try:
  for n in ['Model','UnsignedModel','Types','RvvModel']:cc(n)
  execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/rvv_active.c','-o',run/'rvv_active.c'],'cpp')
  execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'rvv_active.c'),'--coq-output-dir='+str(coq),'--coq-logic-path=Qu8Cvt'],'qcp')
  cc('rvv_active_goal');g=(coq/'rvv_active_goal.v').read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',g,re.M);assert names and len(names)==len(set(names))
  text='''From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qu8Cvt Require Import RvvModel rvv_active_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac active_cases :=
 repeat match goal with
 | |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y);cbn
 end.
Ltac cvt_scalar_finish :=
 try rewrite Z.min_l by lia;
 try rewrite Z.min_r by lia;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 try match goal with |- context[signed_last_nbits ?x 16] => pose proof(signed_Lastnbits_range x 16 ltac:(lia)) end;
 try match goal with |- context[unsigned_last_nbits ?x 16] => pose proof(unsigned_Lastnbits_range x 16 ltac:(lia)) end;
 try match goal with |- context[unsigned_last_nbits ?x 32] => pose proof(unsigned_Lastnbits_range x 32 ltac:(lia)) end;
 entailer!;try congruence;try lia.
Module CheckedActive : Qu8Cvt.rvv_active_goal.VC_Correct.
'''
  for n in names:
   if n=='__riscv_vsetvl_e8m2_return_wit_2':
    text+="""Lemma proof_of___riscv_vsetvl_e8m2_return_wit_2 : Qu8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_return_wit_2.
Proof.
 unfold Qu8Cvt.rvv_active_goal.__riscv_vsetvl_e8m2_return_wit_2;intros n Hsmall Hnonneg Hmax.
 unfold cvt_vl;rewrite Z.min_l by lia.
 unfold derivable1,andp,orp,coq_prop;intros m [_ Hemp].
 destruct(Z.eq_dec n 0);[left|right];repeat first[assumption|split|lia].
Qed.
"""
    continue
   aux=', Qu8Cvt.rvv_active_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',g,re.M)else''
   text+=f'Lemma proof_of_{n} : Qu8Cvt.rvv_active_goal.{n}.\nProof. unfold Qu8Cvt.rvv_active_goal.{n}{aux};try left;intros;unfold cvt_active_add_u16,cvt_add_u16,cvt_u16,cvt_active_int,cvt_active_sub16,cvt_active_float,cvt_active_mul,cvt_vl,cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;active_cases;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.\n'
  text+='End CheckedActive.\n';(HERE/'coq/RvvActiveChecked.v').write_text(text);cc('RvvActiveChecked')
  gate='From Qu8Cvt Require Import rvv_active_goal RvvActiveChecked.\nModule FinalActive : Qu8Cvt.rvv_active_goal.VC_Correct := Qu8Cvt.RvvActiveChecked.CheckedActive.\n'+''.join('Print Assumptions FinalActive.proof_of_'+n+'.\n'for n in names);(coq/'FinalActiveCheck.v').write_text(gate);cc('FinalActiveCheck');s.update(passed=True,vc_correct_passed=True,actual_c_vcs=len(names))
 except Exception as e:s['error']=str(e);print(e,flush=True)
 finally:
  s['source_sha256']={str(p.relative_to(CASE)):sha(p)for p in [CASE/'shim/rvv_active.c',CASE/'shim/formal_model.h',HERE/'coq/Model.v',HERE/'coq/RvvModel.v']};s['proof_source_sha256']={p.name:sha(p)for p in coq.glob('*.v')}
  for p in [run/'status.json',HERE/'rvv-active-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
