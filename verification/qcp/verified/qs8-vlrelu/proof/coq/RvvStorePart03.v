From Coq Require Import ZArith Lia String List.
From Qs8Lrelu Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart03.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_4 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_4.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_4; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_20 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_20.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_20; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_5 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_5.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_5;right;intros;assert(i_pre=27)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_21 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_21.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_21;right;intros;assert(i_pre=11)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_store32_entail_wit_2 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_store32_entail_wit_2.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_store32_entail_wit_2; right; intros; subst;
 unfold derivable1,andp,coq_prop; intros; split;
 [apply s8_rvv_take_step; rewrite s8_rvv_pack32_length; lia|tauto].  Qed.
End CheckedRvvStorePart03.
