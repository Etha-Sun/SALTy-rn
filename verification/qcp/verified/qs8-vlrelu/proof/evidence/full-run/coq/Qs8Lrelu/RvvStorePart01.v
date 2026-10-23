From Coq Require Import ZArith Lia String List.
From Qs8Lrelu Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart01.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_2 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_2.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_2; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_18 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_18.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_18; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_3 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_3.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_3;right;intros;assert(i_pre=29)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_19 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_19.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_19;right;intros;assert(i_pre=13)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_store32_safety_wit_1 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_store32_safety_wit_1.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_store32_safety_wit_1; rvv_pure.  Qed.
End CheckedRvvStorePart01.
