#!/usr/bin/env python3
"""Emit proofs only for the fixed primitive statement shapes in this case."""
import argparse,re
from pathlib import Path
HERE=Path(__file__).resolve().parent
p=argparse.ArgumentParser();p.add_argument('goal',type=Path);a=p.parse_args()
goal=a.goal.read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',goal,re.M)
assert names and len(names)==len(set(names))
source='''From Coq Require Import ZArith Lia.
From VCMul Require Import Model FastFrame primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac primitive_frame :=
 unfold same_fp32 in *; subst;
 unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t,UndefStructPredvfloat32m4_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia
 |opaque_leaves; sepcon_assoc_change; fast_cancel]
 |opaque_leaves; sepcon_assoc_change; fast_cancel].
Module CheckedPrimitives : VC_Correct.
'''
for name in names:
 assert any(name.startswith(p)for p in ['qcp_vcmul_','vmulq_f32_','vmlaq_f32_','vmlsq_f32_','__riscv_vfmul_vv_f32m4_','__riscv_vfadd_vv_f32m4_','__riscv_vfsub_vv_f32m4_']),'Unknown primitive '+name
 aux=', '+name+'_aux' if 'Definition '+name+'_aux 'in goal else ''
 if name.startswith('qcp_vcmul_'):
  tactic='''try left; intros;
 unfold same_fp32,vcmul_mla,vcmul_mls,vcmul_active_mul,vcmul_active_add,vcmul_active_sub;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 try rewrite vcmul_c_zero; entailer!; try lia'''
 elif name.endswith('_pure') or '_safety_' in name:
  tactic='intros; try change Int.max_signed with 2147483647 in *; try change Int.min_signed with (-2147483648) in *; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold same_fp32 in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia'
 else:tactic='try left; intros; primitive_frame'
 source+=f'Lemma proof_of_{name} : {name}.\nProof. unfold {name}{aux}; {tactic}. Qed.\n'
source+='End CheckedPrimitives.\n'
source+='\n'.join('Print Assumptions CheckedPrimitives.proof_of_'+n+'.'for n in names)+'\n'
(HERE/'coq/PrimitivesChecked.v').write_text(source)
print('Generated',len(names),'concrete VC proof fields')
