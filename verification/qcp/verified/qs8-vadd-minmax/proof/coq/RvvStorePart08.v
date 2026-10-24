From Coq Require Import ZArith Lia String List.
From Qs8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart08.
Lemma proof_of_qcp_qa_rvv_get32_safety_wit_9 : Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_safety_wit_9.
Proof.  unfold Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_safety_wit_9; rvv_pure.  Qed.
Lemma proof_of_qcp_qa_rvv_get32_safety_wit_25 : Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_safety_wit_25.
Proof.  unfold Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_safety_wit_25; rvv_pure.  Qed.
Lemma proof_of_qcp_qa_rvv_get32_return_wit_10 : Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_return_wit_10.
Proof. unfold Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_return_wit_10;right;intros;assert(i_pre=22)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qa_rvv_get32_return_wit_26 : Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_return_wit_26.
Proof. unfold Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_return_wit_26;right;intros;assert(i_pre=6)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qa_rvv_store32_partial_solve_wit_2 : Qs8Add.rvv_store_goal.qcp_qa_rvv_store32_partial_solve_wit_2.
Proof.  unfold Qs8Add.rvv_store_goal.qcp_qa_rvv_store32_partial_solve_wit_2; intros Hpure; unfold Qs8Add.rvv_store_goal.qcp_qa_rvv_store32_partial_solve_wit_2_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvStorePart08.
