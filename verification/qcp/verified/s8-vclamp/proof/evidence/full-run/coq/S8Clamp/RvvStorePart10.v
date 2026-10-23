From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart10.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_11 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_11.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_11; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_27 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_27.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_27; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_43 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_43.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_43; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_59 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_59.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_59; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_75 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_75.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_75; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_91 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_91.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_91; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_107 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_107.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_107; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_123 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_123.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_123; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_12 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_12.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_12; right; intros; assert (i_pre=116) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_28 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_28.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_28; right; intros; assert (i_pre=100) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_44 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_44.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_44; right; intros; assert (i_pre=84) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_60 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_60.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_60; right; intros; assert (i_pre=68) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_76 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_76.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_76; right; intros; assert (i_pre=52) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_92 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_92.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_92; right; intros; assert (i_pre=36) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_108 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_108.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_108; right; intros; assert (i_pre=20) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_124 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_124.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_124; right; intros; assert (i_pre=4) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
End CheckedRvvStorePart10.
