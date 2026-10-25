From Coq Require Import ZArith Lia List.
From DwChw Require Import Store8Facts Types FastFrame store8_unit_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac dw8_mem_intro:=lazymatch goal with |-?P|--?Q=>idtac| |-forall _,_=>intro;dw8_mem_intro end.
Ltac dw8_mem_frame:=repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia]
 |apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedStore8Memory.
Lemma proof_of_dw_store8_entail_wit_1:DwChw.store8_unit_goal.dw_store8_entail_wit_1.
Proof. unfold DwChw.store8_unit_goal.dw_store8_entail_wit_1.
 dw8_mem_intro;unfold dw_values8;cbn[Z.to_nat seq map].
 rewrite FloatArray.full_empty.
 sep_apply(FloatArray.undef_full_to_undef_seg out_pre vl_pre).
 dw8_mem_frame.
Qed.
Lemma proof_of_dw_store8_entail_wit_2:DwChw.store8_unit_goal.dw_store8_entail_wit_2.
Proof. unfold DwChw.store8_unit_goal.dw_store8_entail_wit_2.
 right;dw8_mem_intro;unfold dw_same in PreH1;subst retval.
 rewrite dw_values8_succ by lia.
 sep_apply(dw_float_single (out_pre+i*sizeof(FLOAT))(dw_fp8 a0 a1 a2 a3 a4 a5 a6 a7 i)).
 replace 1 with(i+1-i)at 1 by lia.
 sep_apply(FloatArray.full_merge_to_full out_pre i(i+1)
 (dw_values8 a0 a1 a2 a3 a4 a5 a6 a7 i)[dw_fp8 a0 a1 a2 a3 a4 a5 a6 a7 i] ltac:(lia)).
 entailer!.
Qed.
Lemma proof_of_dw_store8_return_wit_1:DwChw.store8_unit_goal.dw_store8_return_wit_1.
Proof. unfold DwChw.store8_unit_goal.dw_store8_return_wit_1.
 right;dw8_mem_intro;assert(i=vl_pre)by lia;subst i.
 rewrite FloatArray.undef_seg_empty by lia;entailer!.
Qed.
Lemma proof_of_dw_store8_partial_solve_wit_2:DwChw.store8_unit_goal.dw_store8_partial_solve_wit_2.
Proof. unfold DwChw.store8_unit_goal.dw_store8_partial_solve_wit_2.
 dw8_mem_intro;pose proof(dw_float_undef_head out_pre i vl_pre ltac:(lia))as Hhead.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in Hhead.
 sep_apply Hhead.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 dw8_mem_frame.
Qed.
End CheckedStore8Memory.
Print Assumptions CheckedStore8Memory.proof_of_dw_store8_entail_wit_1.
Print Assumptions CheckedStore8Memory.proof_of_dw_store8_entail_wit_2.
Print Assumptions CheckedStore8Memory.proof_of_dw_store8_return_wit_1.
Print Assumptions CheckedStore8Memory.proof_of_dw_store8_partial_solve_wit_2.
