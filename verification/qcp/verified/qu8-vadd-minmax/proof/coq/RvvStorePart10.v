From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart10.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_11 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_11.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_11; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_27 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_27.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_27; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_12 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_12.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_12;right;intros;assert(i_pre=20)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_28 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_28.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_28;right;intros;assert(i_pre=4)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
End CheckedRvvStorePart10.
