From Coq Require Import ZArith Lia String List.
From Qu8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart15.
Lemma proof_of_qcp_qu_rvv_get32_safety_wit_16 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_16.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_safety_wit_16; rvv_pure.  Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_1 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_1.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_1;right;intros;assert(i_pre=31)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qu_rvv_get32_return_wit_17 : Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_17.
Proof. unfold Qu8Add.rvv_store_goal.qcp_qu_rvv_get32_return_wit_17;right;intros;assert(i_pre=15)by lia;subst i_pre;unfold u8_rvv_nth,u8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_u8_rvv_store_next_return_wit_1 : Qu8Add.rvv_store_goal.qcp_u8_rvv_store_next_return_wit_1.
Proof.  unfold Qu8Add.rvv_store_goal.qcp_u8_rvv_store_next_return_wit_1; right; intros; unfold u8_rvv_snoc; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto].  Qed.
End CheckedRvvStorePart15.
