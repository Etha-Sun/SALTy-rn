From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart03.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_4 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_4.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_4; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_20 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_20.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_20; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_5 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_5.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_5;right;intros;assert(i_pre=27)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_21 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_21.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_21;right;intros;assert(i_pre=11)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_store32_entail_wit_2 : Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_entail_wit_2.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_entail_wit_2; right; intros; subst;
 unfold derivable1,andp,coq_prop; intros; split;
 [apply u8_rvv_take_step; rewrite u8_rvv_pack32_length; lia|tauto].  Qed.
End CheckedRvvStorePart03.
