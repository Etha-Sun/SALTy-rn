From Coq Require Import ZArith Lia String List.
From Qs8I8Cvt Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart12.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_13 : Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_13.
Proof.  unfold Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_13; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_29 : Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_29.
Proof.  unfold Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_29; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_14 : Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_14.
Proof. unfold Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_14;right;intros;assert(i_pre=18)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_30 : Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_30.
Proof. unfold Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_30;right;intros;assert(i_pre=2)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
End CheckedRvvStorePart12.
