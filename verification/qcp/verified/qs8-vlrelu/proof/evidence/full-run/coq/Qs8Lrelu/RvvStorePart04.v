From Coq Require Import ZArith Lia String List.
From Qs8Lrelu Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart04.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_5 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_5.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_5; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_21 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_21.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_21; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_6 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_6.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_6;right;intros;assert(i_pre=26)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_22 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_22.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_22;right;intros;assert(i_pre=10)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_store32_return_wit_1 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_store32_return_wit_1.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_store32_return_wit_1; right; intros; assert (i=vl_pre) by lia; subst i;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto].  Qed.
End CheckedRvvStorePart04.
