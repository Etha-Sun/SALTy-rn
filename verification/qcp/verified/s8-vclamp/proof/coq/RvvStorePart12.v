From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart12.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_13 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_13.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_13; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_29 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_29.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_29; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_45 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_45.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_45; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_61 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_61.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_61; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_77 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_77.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_77; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_93 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_93.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_93; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_109 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_109.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_109; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_125 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_125.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_125; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_14 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_14.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_14; right; intros; assert (i_pre=114) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_30 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_30.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_30; right; intros; assert (i_pre=98) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_46 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_46.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_46; right; intros; assert (i_pre=82) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_62 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_62.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_62; right; intros; assert (i_pre=66) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_78 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_78.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_78; right; intros; assert (i_pre=50) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_94 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_94.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_94; right; intros; assert (i_pre=34) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_110 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_110.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_110; right; intros; assert (i_pre=18) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_126 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_126.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_126; right; intros; assert (i_pre=2) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
End CheckedRvvStorePart12.
