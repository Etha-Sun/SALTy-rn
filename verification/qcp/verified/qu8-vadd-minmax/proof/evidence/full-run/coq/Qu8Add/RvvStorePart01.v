From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart01.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_2 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_2.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_2; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_18 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_18.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_18; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_3 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_3.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_3;right;intros;assert(i_pre=29)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_19 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_19.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_19;right;intros;assert(i_pre=13)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_store32_safety_wit_1 : Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_safety_wit_1.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_safety_wit_1; rvv_pure.  Qed.
End CheckedRvvStorePart01.
