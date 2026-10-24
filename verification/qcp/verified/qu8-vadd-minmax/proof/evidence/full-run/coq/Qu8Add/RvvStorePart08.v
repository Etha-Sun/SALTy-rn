From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart08.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_9 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_9.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_9; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_25 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_25.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_25; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_10 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_10.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_10;right;intros;assert(i_pre=22)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_26 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_26.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_26;right;intros;assert(i_pre=6)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_store32_partial_solve_wit_2 : Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_partial_solve_wit_2.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_partial_solve_wit_2; intros Hpure; unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_partial_solve_wit_2_aux; intros; subst; rvv_frame.  Qed.
End CheckedRvvStorePart08.
