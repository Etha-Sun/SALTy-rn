From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart08.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_9 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_9.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_9; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_25 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_25.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_25; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_41 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_41.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_41; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_57 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_57.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_57; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_73 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_73.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_73; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_89 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_89.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_89; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_105 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_105.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_105; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_121 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_121.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_121; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_10 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_10.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_10; right; intros; assert (i_pre=118) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_26 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_26.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_26; right; intros; assert (i_pre=102) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_42 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_42.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_42; right; intros; assert (i_pre=86) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_58 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_58.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_58; right; intros; assert (i_pre=70) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_74 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_74.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_74; right; intros; assert (i_pre=54) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_90 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_90.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_90; right; intros; assert (i_pre=38) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_106 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_106.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_106; right; intros; assert (i_pre=22) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_122 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_122.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_122; right; intros; assert (i_pre=6) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store128_partial_solve_wit_2 : S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_partial_solve_wit_2.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_partial_solve_wit_2; intros Hpure; unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_partial_solve_wit_2_aux; intros; subst; rvv_frame. Qed.
End CheckedRvvStorePart08.
