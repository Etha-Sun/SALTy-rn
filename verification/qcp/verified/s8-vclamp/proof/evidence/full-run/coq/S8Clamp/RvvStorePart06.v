From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart06.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_7 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_7.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_7; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_23 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_23.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_23; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_39 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_39.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_39; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_55 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_55.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_55; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_71 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_71.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_71; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_87 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_87.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_87; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_103 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_103.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_103; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_119 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_119.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_119; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_8 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_8.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_8; right; intros; assert (i_pre=120) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_24 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_24.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_24; right; intros; assert (i_pre=104) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_40 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_40.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_40; right; intros; assert (i_pre=88) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_56 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_56.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_56; right; intros; assert (i_pre=72) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_72 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_72.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_72; right; intros; assert (i_pre=56) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_88 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_88.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_88; right; intros; assert (i_pre=40) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_104 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_104.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_104; right; intros; assert (i_pre=24) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_120 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_120.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_120; right; intros; assert (i_pre=8) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store128_partial_solve_wit_1 : S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_partial_solve_wit_1.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_partial_solve_wit_1, S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_partial_solve_wit_1_aux; intros _; rvv_pure. Qed.
End CheckedRvvStorePart06.
