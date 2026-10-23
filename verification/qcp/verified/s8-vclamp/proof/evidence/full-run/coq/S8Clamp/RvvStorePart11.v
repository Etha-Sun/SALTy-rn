From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart11.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_12 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_12.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_12; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_28 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_28.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_28; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_44 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_44.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_44; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_60 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_60.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_60; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_76 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_76.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_76; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_92 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_92.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_92; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_108 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_108.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_108; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_124 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_124.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_124; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_13 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_13.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_13; right; intros; assert (i_pre=115) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_29 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_29.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_29; right; intros; assert (i_pre=99) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_45 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_45.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_45; right; intros; assert (i_pre=83) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_61 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_61.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_61; right; intros; assert (i_pre=67) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_77 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_77.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_77; right; intros; assert (i_pre=51) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_93 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_93.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_93; right; intros; assert (i_pre=35) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_109 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_109.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_109; right; intros; assert (i_pre=19) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_125 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_125.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_125; right; intros; assert (i_pre=3) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
End CheckedRvvStorePart11.
