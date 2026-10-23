#!/usr/bin/env python3
"""Compile the unchanged NEON's fresh goals and genuine proof partitions."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent;ROOT=next(p for p in CASE.parents if(p/'.git').exists())
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--dependency-dir',type=Path,required=True);p.add_argument('--prepare-only',action='store_true');p.add_argument('--calls',action='store_true');p.add_argument('--complete',action='store_true');p.add_argument('--run',type=Path);a=p.parse_args()
 cfg=json.loads(a.config.read_text());dep=a.dependency_dir.resolve();generation=json.loads((HERE/'neon-generation-status.json').read_text());assert generation['generation_passed'];source_run=Path(generation['run_directory']);assert sha(source_run/'neon_unit_goal.v')==generation['goal_sha256']
 for relative,digest in generation['live_sources_sha256'].items():assert sha(CASE/relative)==digest,'Input changed after original C generation: '+relative
 run=a.run.resolve()if a.run else Path(tempfile.mkdtemp(prefix='neon-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir(exist_ok=True);records=[]
 flags=cfg['flags'][2:]
 for folder in sorted(dep.iterdir()):
  if folder.is_dir():flags+=['-Q',str(folder),''if folder.name=='relations'else folder.name]
 flags+=['-Q',str(coq),'VCMul'];status={'passed':False,'whole_kernel_verified':False,'scope':'Original NEON fresh C VC proof partitions; no complete paired kernel','run_directory':str(run),'generation_directory':str(source_run),'records':records,'goal_sha256':generation['goal_sha256']}
 def execute(cmd,label,timeout=3600):
  cmd=[shutil.which('prlimit'),'--as=17179869184:17179869184','--',*map(str,cmd)];work=run/'jobs'/label;work.mkdir(parents=True,exist_ok=True);start=time.monotonic();log=run/(label+'.log')
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=work,stdout=out,stderr=out,timeout=timeout).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'command':cmd,'label':label,'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
  print(label,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-6500:])
 def compile(name):
  source=HERE/'coq'/(name+'.v')
  if source.exists():shutil.copyfile(source,coq/source.name)
  execute(['qcp-env','coqc','-time',*flags,coq/(name+'.v')],name)
 try:
  if not a.run:
   shutil.copyfile(source_run/'neon_unit_goal.v',coq/'neon_unit_goal.v')
   execute([Path(shutil.which('qcp')).resolve().parent/'StrategyCheck','--arch=64','--endian=little','--no-exec-info','--input-file='+str(HERE/'c/neon_vcmul.strategies'),'--coq-output-dir='+str(coq),'--coq-logic-path=VCMul'],'strategy')
   for name in ['Model','ComplexModel','FastFrame','neon_vcmul_strategy_goal','NeonStrategy','neon_vcmul_strategy_proof','neon_unit_goal']:compile(name)
  goal=(coq/'neon_unit_goal.v').read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',goal,re.M)
  pure=[n for n in names if '_safety_'in n or n.endswith('_pure')];calls=[n for n in names if '_partial_'in n and not n.endswith('_pure')]
  base='''From Coq Require Import ZArith Lia.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import InvariantFacts NeonLoopBridge.
From QcpRvv32 Require Import FastFrame.
From ByValue Require Import neon_copy_checked.
From VCMul Require Import Model ComplexModel neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque vcmul_mla vcmul_mls fp32_mul fp32_add fp32_sub complex_real_prefix complex_imag_prefix.
Ltac quotient_facts :=
 repeat match goal with |- context[Z.quot ?x ?d] =>
  let Hx:=fresh in assert(Hx:0<=x)by lia;
  let Hd:=fresh in assert(Hd:0<d)by lia;
  pose proof(Z.quot_rem' x d);
  pose proof(Z.rem_bound_pos x d Hx Hd);
  let q:=fresh "q" in let E:=fresh in remember(Z.quot x d)as q eqn:E in *;clear E
 end.
Ltac land_facts :=
 repeat progress match goal with |- context[Z.land ?x ?y] =>
 let z:=eval vm_compute in (Z.land x y) in change (Z.land x y) with z end.
Ltac pure_finish :=
 try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold same_fp32,fp32_bits_equal in *; subst;
 rewrite ?sizeof_float in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress match goal with H:context[Z.land ?x ?y] |- _ =>
  let T:=type of H in let Tred:=eval vm_compute in T in change Tred in H end;
 try solve [congruence];
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];land_facts;quotient_facts;lia.
Ltac open_undef :=
 match goal with |- ?P |-- ?Q =>
 multimatch Q with context[FloatArray.undef_seg ?p ?k ?n] =>
 lazymatch P with context[FloatArray.undef_full p n] =>
 let kred:=eval vm_compute in k in
 first [constr_eq kred 4;sep_apply_l_atomic(float_undef_open4 p n)
 |constr_eq kred 2;sep_apply_l_atomic(float_undef_open2 p n)
 |constr_eq kred 1;sep_apply_l_atomic(float_undef_open1 p n)];
 [dump_pre_spatial;lia|idtac]
 end end end.
Ltac open_undef_tail :=
 match goal with |- ?P |-- ?Q =>
 multimatch P with context[FloatArray.undef_seg ?p 2 ?n] =>
 multimatch Q with context[FloatArray.undef_seg p ?j n] =>
 let jred:=eval vm_compute in j in constr_eq jred 3;
 sep_apply_l_atomic(FloatArray.undef_seg_unfold p 2 n);
 [dump_pre_spatial;lia|unfold StoreFloatAsElement.undefstoreA]
 end end end.
Ltac copy_finish :=
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;rewrite ?sizeof_float in *;
 unfold same_fp32,fp32_bits_equal in *; subst;
 try open_undef;try open_undef_tail;rewrite ?sizeof_float;
 unfold VCMul.Model.UndefStructPredfloat32x4_t,
 QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,
 VCMul.Model.UndefStructPredfloat32x2_t,QcpNeon.NeonBridge.UndefStructPredfloat32x2_t;
 rewrite ?VCMul.Model.local_field_address; try csimpl;
 rewrite ?Z.mul_0_l,?Z.add_0_r;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros;repeat first[assumption|split|reflexivity];land_facts;quotient_facts;lia
 |forget_rhs_fields;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |forget_rhs_fields;opaque_leaves;sepcon_assoc_change;fast_cancel].
'''
  for module,selected,tactic in [('NeonPure',pure,'pure_finish'),('NeonCalls',calls,'try left;intros;copy_finish')]:
   source=base+'Module Checked'+module+'.\n'
   for name in selected:
    aux=', '+name+'_aux'if 'Definition '+name+'_aux 'in goal else''
    qualified='VCMul.neon_unit_goal.'+name
    aux=', '+qualified+'_aux'if 'Definition '+name+'_aux 'in goal else''
    source+=f'Lemma proof_of_{name} : {qualified}.\nProof. unfold {qualified}{aux}; {tactic}. Qed.\n'
   source+='End Checked'+module+'.\n'
   (HERE/'coq'/(module+'.v')).write_text(source)
  status['partitions']={'pure':pure,'calls':calls,'remaining':[n for n in names if n not in pure+calls]};status['generated_c_vcs']=len(names)
  if not a.prepare_only:
   if a.complete:
    assert (coq/'NeonCalls.vo').exists(),'Compile the exact qualified 99-call partition first'
    assert (coq/'NeonCalls.v').read_bytes()==(HERE/'coq/NeonCalls.v').read_bytes(),'Call proof source changed after compile'
    for extra in ['NeonFacts','NeonMemory','NeonPure']:compile(extra)
    gate=(HERE/'coq/NeonGate.v').read_text()+'\n'+'\n'.join('Print Assumptions CheckedOriginalNeon.proof_of_'+n+'.'for n in names)+'\n'
    (coq/'NeonKernelGate.v').write_text(gate)
    execute(['qcp-env','coqc','-time',*flags,coq/'NeonKernelGate.v'],'NeonKernelGate')
    status.update(passed=True,partition_passed=True,checked_partition='NeonComplete',checked_c_vcs=len(names),vc_correct_passed=True,complete_original_neon_c_body=True,paired_kernel_gate_passed=False)
   else:
    selected='NeonCalls'if a.calls else'NeonPure';compile(selected);status.update(partition_passed=True,checked_partition=selected,checked_c_vcs=len(calls if a.calls else pure))
  else:status['preparation_passed']=True
 except Exception as error:status['error']=str(error);print(error,flush=True)
 finally:
  (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(HERE/'neon-proof-status.json').write_text(json.dumps(status,indent=2)+'\n');print('RUN',run,flush=True)
 return 0 if status.get('partition_passed') or status.get('preparation_passed') else 1
if __name__=='__main__':raise SystemExit(main())
