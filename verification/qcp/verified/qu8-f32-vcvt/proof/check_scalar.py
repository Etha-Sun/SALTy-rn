#!/usr/bin/env python3
"""Generate and check the actual scalar C helper unit; no whole kernel claim."""
import argparse,json,hashlib,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--module-timeout',type=int,default=300);a=p.parse_args()
 run=Path(tempfile.mkdtemp(prefix='scalar-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),'Qu8Cvt'];records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'Actual scalar C cast/widen/wrap/multiply helper bodies only','run_directory':str(run),'records':records}
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
  cc('Model')
  execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/scalar_primitives.c','-o',run/'scalar_primitives.c'],'cpp')
  execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'scalar_primitives.c'),'--coq-output-dir='+str(coq),'--coq-logic-path=Qu8Cvt'],'qcp')
  cc('scalar_primitives_goal');g=(coq/'scalar_primitives_goal.v').read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',g,re.M);assert names and len(names)==len(set(names))
  text='''From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qu8Cvt Require Import Model scalar_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac cvt_scalar_finish :=
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 try match goal with |- context[signed_last_nbits ?x 16] => pose proof(signed_Lastnbits_range x 16 ltac:(lia)) end;
 try match goal with |- context[unsigned_last_nbits ?x 32] => pose proof(unsigned_Lastnbits_range x 32 ltac:(lia)) end;
 entailer!;try congruence;try lia.
Module CheckedScalar : Qu8Cvt.scalar_primitives_goal.VC_Correct.
'''
  for n in names:
   aux=', Qu8Cvt.scalar_primitives_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',g,re.M)else''
   text+=f'Lemma proof_of_{n} : Qu8Cvt.scalar_primitives_goal.{n}.\nProof. unfold Qu8Cvt.scalar_primitives_goal.{n}{aux};try left;intros;unfold cvt_same,cvt_addw,cvt_sub16,cvt_seed,cvt_s16 in *;rewrite ?signed_unsigned_revolutive_less by lia; cvt_scalar_finish. Qed.\n'
  text+='End CheckedScalar.\n';(HERE/'coq/ScalarChecked.v').write_text(text);cc('ScalarChecked')
  gate='From Qu8Cvt Require Import scalar_primitives_goal ScalarChecked.\nModule FinalScalar : Qu8Cvt.scalar_primitives_goal.VC_Correct := Qu8Cvt.ScalarChecked.CheckedScalar.\n'+''.join('Print Assumptions FinalScalar.proof_of_'+n+'.\n'for n in names);(coq/'FinalScalarCheck.v').write_text(gate);cc('FinalScalarCheck');s.update(passed=True,vc_correct_passed=True,actual_c_vcs=len(names))
 except Exception as e:s['error']=str(e);print(e,flush=True)
 finally:
  s['source_sha256']={str(p.relative_to(CASE)):sha(p)for p in [CASE/'shim/scalar_primitives.c',CASE/'shim/formal_model.h',HERE/'coq/Model.v']};s['proof_source_sha256']={p.name:sha(p)for p in coq.glob('*.v')}
  for p in [run/'status.json',HERE/'scalar-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
