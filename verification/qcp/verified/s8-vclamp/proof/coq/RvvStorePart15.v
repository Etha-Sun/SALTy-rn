From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart15.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_16 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_16.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_16; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_32 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_32.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_32; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_48 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_48.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_48; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_64 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_64.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_64; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_80 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_80.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_80; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_96 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_96.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_96; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_112 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_112.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_112; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_1 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_1.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_1; right; intros; assert (i_pre=127) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_17 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_17.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_17; right; intros; assert (i_pre=111) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_33 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_33.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_33; right; intros; assert (i_pre=95) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_49 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_49.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_49; right; intros; assert (i_pre=79) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_65 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_65.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_65; right; intros; assert (i_pre=63) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_81 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_81.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_81; right; intros; assert (i_pre=47) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_97 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_97.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_97; right; intros; assert (i_pre=31) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_113 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_113.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_113; right; intros; assert (i_pre=15) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store_next_return_wit_1 : S8Clamp.rvv_store_goal.qcp_s8_rvv_store_next_return_wit_1.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_store_next_return_wit_1; right; intros; unfold s8_rvv_snoc; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
End CheckedRvvStorePart15.
