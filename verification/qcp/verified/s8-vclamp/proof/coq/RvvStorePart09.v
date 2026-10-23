From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart09.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_10 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_10.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_10; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_26 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_26.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_26; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_42 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_42.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_42; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_58 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_58.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_58; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_74 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_74.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_74; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_90 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_90.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_90; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_106 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_106.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_106; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_122 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_122.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_122; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_11 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_11.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_11; right; intros; assert (i_pre=117) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_27 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_27.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_27; right; intros; assert (i_pre=101) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_43 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_43.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_43; right; intros; assert (i_pre=85) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_59 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_59.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_59; right; intros; assert (i_pre=69) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_75 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_75.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_75; right; intros; assert (i_pre=53) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_91 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_91.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_91; right; intros; assert (i_pre=37) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_107 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_107.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_107; right; intros; assert (i_pre=21) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_123 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_123.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_123; right; intros; assert (i_pre=5) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
End CheckedRvvStorePart09.
