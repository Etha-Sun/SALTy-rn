From Coq Require Import ZArith Lia String List.
From Qs8Lrelu Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart15.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_16 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_16.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_16; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_1 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_1.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_1;right;intros;assert(i_pre=31)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_17 : Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_17.
Proof. unfold Qs8Lrelu.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_17;right;intros;assert(i_pre=15)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store_next_return_wit_1 : Qs8Lrelu.rvv_store_goal.qcp_s8_rvv_store_next_return_wit_1.
Proof.  unfold Qs8Lrelu.rvv_store_goal.qcp_s8_rvv_store_next_return_wit_1; right; intros; unfold s8_rvv_snoc; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto].  Qed.
End CheckedRvvStorePart15.
