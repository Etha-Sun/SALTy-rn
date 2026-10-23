From Coq Require Import ZArith Lia String List.
From Qs8Lrelu Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart05.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_6 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_6.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_6; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_22 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_22.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_22; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_7 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_7.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_7;right;intros;assert(i_pre=25)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_23 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_23.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_23;right;intros;assert(i_pre=9)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_store32_partial_solve_wit_1_pure : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_store32_partial_solve_wit_1_pure.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_store32_partial_solve_wit_1_pure; rvv_pure.  Qed.
End CheckedRvvStorePart05.
