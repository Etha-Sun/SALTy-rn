From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart04.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_5 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_5.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_5; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_21 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_21.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_21; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_6 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_6.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_6;right;intros;assert(i_pre=26)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_22 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_22.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_22;right;intros;assert(i_pre=10)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_store32_return_wit_1 : Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_return_wit_1.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_store32_return_wit_1; right; intros; assert (i=vl_pre) by lia; subst i;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto].  Qed.
End CheckedRvvStorePart04.
