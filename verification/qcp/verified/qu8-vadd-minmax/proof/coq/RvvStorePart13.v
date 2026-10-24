From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart13.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_14 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_14.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_14; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_30 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_30.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_30; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_15 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_15.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_15;right;intros;assert(i_pre=17)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_31 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_31.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_31;right;intros;assert(i_pre=1)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
End CheckedRvvStorePart13.
