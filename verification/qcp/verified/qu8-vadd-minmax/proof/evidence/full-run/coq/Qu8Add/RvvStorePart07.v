From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart07.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_8 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_8.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_8; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_24 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_24.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_24; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_9 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_9.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_9;right;intros;assert(i_pre=23)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_25 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_25.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_25;right;intros;assert(i_pre=7)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_store32_partial_solve_wit_2_pure : Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_partial_solve_wit_2_pure.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_partial_solve_wit_2_pure; rvv_pure.  Qed.
End CheckedRvvStorePart07.
