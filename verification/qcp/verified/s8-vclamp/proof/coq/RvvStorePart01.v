From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart01.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_2 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_2.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_2; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_18 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_18.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_18; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_34 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_34.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_34; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_50 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_50.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_50; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_66 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_66.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_66; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_82 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_82.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_82; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_98 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_98.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_98; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_114 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_114.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_114; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_3 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_3.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_3; right; intros; assert (i_pre=125) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_19 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_19.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_19; right; intros; assert (i_pre=109) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_35 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_35.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_35; right; intros; assert (i_pre=93) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_51 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_51.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_51; right; intros; assert (i_pre=77) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_67 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_67.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_67; right; intros; assert (i_pre=61) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_83 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_83.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_83; right; intros; assert (i_pre=45) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_99 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_99.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_99; right; intros; assert (i_pre=29) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_115 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_115.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_115; right; intros; assert (i_pre=13) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store128_safety_wit_1 : S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_safety_wit_1.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_safety_wit_1; rvv_pure. Qed.
End CheckedRvvStorePart01.
