From Coq Require Import ZArith Lia String List.
From Qs8I8Cvt Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart06.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_7 : Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_7.
Proof.  unfold Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_7; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_safety_wit_23 : Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_23.
Proof.  unfold Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_safety_wit_23; rvv_pure.  Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_8 : Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_8.
Proof. unfold Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_8;right;intros;assert(i_pre=24)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_get32_return_wit_24 : Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_24.
Proof. unfold Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_get32_return_wit_24;right;intros;assert(i_pre=8)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qcv_rvv_store32_partial_solve_wit_1 : Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_store32_partial_solve_wit_1.
Proof.  unfold Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_store32_partial_solve_wit_1, Qs8I8Cvt.rvv_store_goal.qcp_qcv_rvv_store32_partial_solve_wit_1_aux; intros _; rvv_pure.  Qed.
End CheckedRvvStorePart06.
