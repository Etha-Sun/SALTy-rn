From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart05.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_6 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_6.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_6; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_22 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_22.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_22; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_7 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_7.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_7;right;intros;assert(i_pre=25)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_23 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_23.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_23;right;intros;assert(i_pre=9)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_store32_partial_solve_wit_1_pure : Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_partial_solve_wit_1_pure.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_partial_solve_wit_1_pure; rvv_pure.  Qed.
End CheckedRvvStorePart05.
