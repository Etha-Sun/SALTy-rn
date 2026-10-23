From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart07.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_8 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_8.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_8; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_24 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_24.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_24; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_40 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_40.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_40; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_56 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_56.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_56; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_72 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_72.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_72; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_88 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_88.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_88; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_104 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_104.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_104; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_120 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_120.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_120; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_9 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_9.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_9; right; intros; assert (i_pre=119) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_25 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_25.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_25; right; intros; assert (i_pre=103) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_41 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_41.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_41; right; intros; assert (i_pre=87) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_57 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_57.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_57; right; intros; assert (i_pre=71) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_73 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_73.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_73; right; intros; assert (i_pre=55) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_89 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_89.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_89; right; intros; assert (i_pre=39) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_105 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_105.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_105; right; intros; assert (i_pre=23) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_121 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_121.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_121; right; intros; assert (i_pre=7) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store128_partial_solve_wit_2_pure : S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_partial_solve_wit_2_pure.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_partial_solve_wit_2_pure; rvv_pure. Qed.
End CheckedRvvStorePart07.
