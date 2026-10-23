From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart05.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_6 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_6.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_6; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_22 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_22.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_22; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_38 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_38.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_38; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_54 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_54.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_54; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_70 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_70.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_70; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_86 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_86.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_86; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_102 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_102.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_102; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_118 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_118.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_118; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_7 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_7.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_7; right; intros; assert (i_pre=121) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_23 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_23.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_23; right; intros; assert (i_pre=105) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_39 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_39.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_39; right; intros; assert (i_pre=89) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_55 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_55.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_55; right; intros; assert (i_pre=73) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_71 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_71.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_71; right; intros; assert (i_pre=57) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_87 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_87.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_87; right; intros; assert (i_pre=41) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_103 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_103.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_103; right; intros; assert (i_pre=25) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_119 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_119.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_119; right; intros; assert (i_pre=9) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store128_partial_solve_wit_1_pure : S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_partial_solve_wit_1_pure.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_partial_solve_wit_1_pure; rvv_pure. Qed.
End CheckedRvvStorePart05.
