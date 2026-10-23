#!/usr/bin/env python3
"""Check the actual two-address self-comparison adapter with one owned vector."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__)
 for n in ['config','dependency-dir','scalar-dir','vector-dir']:p.add_argument('--'+n,type=Path,required=True)
 args=p.parse_args();run=Path(tempfile.mkdtemp(prefix='self-compare-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[]
 assert json.loads((args.scalar_dir.parent/'status.json').read_text())['passed']
 for n in ['Types','VectorModel','VectorFastFrame','VectorScalarChecked']:
  assert(args.vector_dir/(n+'.vo')).exists(),'Model/helper dependency is not compiled: '+n
  assert(HERE/'coq'/(n+'.v')).read_bytes()==(args.vector_dir/(n+'.v')).read_bytes(),'Model/helper source drift: '+n
 flags=json.loads(args.config.read_text())['flags'][2:]
 for d in sorted(args.dependency_dir.resolve().iterdir()):
  if d.is_dir():flags+=['-Q',str(d),''if d.name=='relations'else d.name]
 for d in [args.scalar_dir,args.vector_dir,coq]:flags+=['-Q',str(d.resolve()),'FMax']
 status={'passed':False,'whole_kernel_verified':False,'scope':'Self-comparison actual C body only; two pointer operands, explicit a==b and exactly one vector resource','run_directory':str(run),'records':records}
 def execute(cmd,label,budget=600):
  work=run/'jobs'/label;work.mkdir(parents=True);log=run/(label+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];start=time.monotonic()
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=work,stdout=out,stderr=out,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'label':label,'command':cmd,'cwd':str(work),'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});print(label,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-6000:])
 def compile_module(n):execute(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n)
 try:
  execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/self_compare.c','-o',run/'self_compare.c'],'cpp',60)
  execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'self_compare.c'),'--coq-output-dir='+str(coq),'--coq-logic-path=FMax','-slp',CASE/'shim','FMax'],'qcp',300)
  compile_module('self_compare_goal')
  text=(coq/'self_compare_goal.v').read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',text,re.M);assert names and len(names)==len(set(names))and all(n.startswith('qcp_fmax_vmfne_self_borrow_')for n in names)
  proof='''From Coq Require Import ZArith Lia.
From FMax Require Import Bits Types VectorModel VectorFastFrame self_compare_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac self_frame :=
 unfold UndefStructPredvbool4_t;rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedSelf : self_compare_goal.VC_Correct.
'''
  for n in names:
   aux=', '+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',text,re.M)else''
   proof+=f'''Lemma proof_of_{n} : {n}.
Proof. unfold {n}{aux};try left;intros;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|self_frame]. Qed.
'''
  proof+='End CheckedSelf.\n';(HERE/'coq/SelfChecked.v').write_text(proof);shutil.copyfile(HERE/'coq/SelfChecked.v',coq/'SelfChecked.v');compile_module('SelfChecked')
  gate='From FMax Require Import self_compare_goal SelfChecked.\nModule FinalSelf : self_compare_goal.VC_Correct := SelfChecked.CheckedSelf.\n'+'\n'.join('Print Assumptions FinalSelf.proof_of_'+n+'.'for n in names)+'\n';(coq/'FinalSelfCheck.v').write_text(gate);compile_module('FinalSelfCheck')
  status.update(passed=True,actual_c_vcs=len(names),vc_correct_passed=True)
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  status['source_sha256']={str(q.relative_to(CASE)):sha(q)for q in [CASE/'shim/self_compare.c',CASE/'shim/self_compare.h',HERE/'coq/SelfChecked.v']if q.exists()};status['proof_sha256']={q.name:sha(q)for q in coq.glob('*.v')}
  for q in [run/'status.json',HERE/'self-compare-status.json']:q.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
