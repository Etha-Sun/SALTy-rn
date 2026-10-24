From Coq Require Import ZArith Lia String List.
From Qs8Add Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Module CheckedRvvStorePart14.
Lemma proof_of_qcp_qa_rvv_get32_safety_wit_15 : Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_safety_wit_15.
Proof.  unfold Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_safety_wit_15; rvv_pure.  Qed.
Lemma proof_of_qcp_qa_rvv_get32_safety_wit_31 : Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_safety_wit_31.
Proof.  unfold Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_safety_wit_31; rvv_pure.  Qed.
Lemma proof_of_qcp_qa_rvv_get32_return_wit_16 : Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_return_wit_16.
Proof. unfold Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_return_wit_16;right;intros;assert(i_pre=16)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
Lemma proof_of_qcp_qa_rvv_get32_return_wit_32 : Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_return_wit_32.
Proof. unfold Qs8Add.rvv_store_goal.qcp_qa_rvv_get32_return_wit_32;right;intros;assert(i_pre=0)by lia;subst i_pre;unfold s8_rvv_nth,s8_rvv_pack32,Znth;cbn;unfold derivable1,andp,coq_prop;intros;split;[reflexivity|tauto]. Qed.
End CheckedRvvStorePart14.
