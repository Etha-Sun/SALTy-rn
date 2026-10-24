From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart09.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_10 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_10.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_10; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_26 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_26.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_26; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_11 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_11.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_11;right;intros;assert(i_pre=21)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_27 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_27.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_27;right;intros;assert(i_pre=5)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
End CheckedRvvStorePart09.
