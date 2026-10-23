From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart04.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_5 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_5.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_5; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_21 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_21.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_21; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_37 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_37.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_37; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_53 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_53.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_53; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_69 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_69.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_69; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_85 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_85.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_85; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_101 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_101.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_101; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_117 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_117.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_117; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_6 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_6.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_6; right; intros; assert (i_pre=122) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_22 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_22.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_22; right; intros; assert (i_pre=106) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_38 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_38.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_38; right; intros; assert (i_pre=90) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_54 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_54.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_54; right; intros; assert (i_pre=74) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_70 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_70.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_70; right; intros; assert (i_pre=58) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_86 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_86.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_86; right; intros; assert (i_pre=42) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_102 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_102.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_102; right; intros; assert (i_pre=26) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_118 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_118.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_118; right; intros; assert (i_pre=10) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store128_return_wit_1 : S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_return_wit_1.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_return_wit_1; right; intros; assert (i=vl_pre) by lia; subst i; apply derivable1_refl. Qed.
End CheckedRvvStorePart04.
