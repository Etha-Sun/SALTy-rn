From Coq Require Import ZArith Lia List.
From Qs8Mul Require Import Store32Facts Types FastFrame qm_store32_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac qm_mem_intro:=lazymatch goal with |-?P|--?Q=>idtac| |-forall _,_=>intro;qm_mem_intro end.
Ltac qm_mem_frame:=repeat progress rewrite <-logic_equiv_andp_assoc;
 first[solve[unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia]
 |apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Module CheckedStore32Memory.
Lemma proof_of_qm_store32_entail_wit_1:Qs8Mul.qm_store32_goal.qm_store32_entail_wit_1.
Proof. unfold Qs8Mul.qm_store32_goal.qm_store32_entail_wit_1.
qm_mem_intro.
 unfold qm_take32;cbn[Z.to_nat firstn].
 rewrite CharArray.full_empty.
 sep_apply(CharArray.undef_full_to_undef_seg out_pre vl_pre).
 qm_mem_frame.
Qed.
Lemma proof_of_qm_store32_entail_wit_2:Qs8Mul.qm_store32_goal.qm_store32_entail_wit_2.
Proof. unfold Qs8Mul.qm_store32_goal.qm_store32_entail_wit_2.
right;qm_mem_intro;subst retval.
 unfold qm_vec32;entailer!.
 symmetry;apply qm_take32_succ;[lia|cbn[qm_list32 length];lia].
Qed.
Lemma proof_of_qm_store32_return_wit_1:Qs8Mul.qm_store32_goal.qm_store32_return_wit_1.
Proof. unfold Qs8Mul.qm_store32_goal.qm_store32_return_wit_1.
right;qm_mem_intro.
 assert(i=vl_pre)by lia;subst i;entailer!.
Qed.
Lemma proof_of_qm_store32_partial_solve_wit_2:Qs8Mul.qm_store32_goal.qm_store32_partial_solve_wit_2.
Proof. unfold Qs8Mul.qm_store32_goal.qm_store32_partial_solve_wit_2.
qm_mem_intro.
 pose proof(qm_char_undef_head out_pre i vl_pre ltac:(lia))as Hhead.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in Hhead.
 sep_apply Hhead.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 qm_mem_frame.
Qed.
End CheckedStore32Memory.
Print Assumptions CheckedStore32Memory.proof_of_qm_store32_entail_wit_1.
Print Assumptions CheckedStore32Memory.proof_of_qm_store32_entail_wit_2.
Print Assumptions CheckedStore32Memory.proof_of_qm_store32_return_wit_1.
Print Assumptions CheckedStore32Memory.proof_of_qm_store32_partial_solve_wit_2.
