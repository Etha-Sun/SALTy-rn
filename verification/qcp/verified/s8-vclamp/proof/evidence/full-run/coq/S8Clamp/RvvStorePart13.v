From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart13.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_14 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_14.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_14; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_30 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_30.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_30; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_46 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_46.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_46; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_62 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_62.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_62; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_78 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_78.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_78; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_94 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_94.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_94; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_110 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_110.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_110; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_126 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_126.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_126; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_15 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_15.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_15; right; intros; assert (i_pre=113) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_31 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_31.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_31; right; intros; assert (i_pre=97) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_47 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_47.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_47; right; intros; assert (i_pre=81) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_63 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_63.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_63; right; intros; assert (i_pre=65) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_79 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_79.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_79; right; intros; assert (i_pre=49) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_95 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_95.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_95; right; intros; assert (i_pre=33) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_111 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_111.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_111; right; intros; assert (i_pre=17) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_127 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_127.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_127; right; intros; assert (i_pre=1) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
End CheckedRvvStorePart13.
