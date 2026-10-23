From Coq Require Import ZArith Lia String List.
From Qs8Lrelu Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart11.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_12 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_12.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_12; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_28 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_28.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_28; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_13 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_13.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_13;right;intros;assert(i_pre=19)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_29 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_29.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_29;right;intros;assert(i_pre=3)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
End CheckedRvvStorePart11.
