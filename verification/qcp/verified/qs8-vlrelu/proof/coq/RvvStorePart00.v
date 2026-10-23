From Coq Require Import ZArith Lia String List.
From Qs8Lrelu Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart00.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_1 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_1.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_1; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_17 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_17.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_17; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_2 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_2.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_2;right;intros;assert(i_pre=30)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_18 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_18.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_18;right;intros;assert(i_pre=14)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store_next_partial_solve_wit_1 : Qs8Lrelu.rvv_store_goal.qcp_s8_rvv_store_next_partial_solve_wit_1.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_s8_rvv_store_next_partial_solve_wit_1; pre_process.
 sep_apply_l_atomic (CharArray.undef_seg_split_to_undef_missing_i p_pre i_pre i_pre vl_pre).
 - dump_pre_spatial; lia.
 - sep_apply_l_atomic (CharArray.undef_missing_i_to_undef_seg_head p_pre i_pre vl_pre).
   + dump_pre_spatial; lia.
   + unfold StoreCharAsElement.undefstoreA. entailer!.  Qed.
End CheckedRvvStorePart00.
