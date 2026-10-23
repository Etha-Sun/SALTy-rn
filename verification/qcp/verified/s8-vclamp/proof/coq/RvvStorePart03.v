From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart03.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_4 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_4.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_4; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_20 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_20.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_20; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_36 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_36.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_36; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_52 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_52.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_52; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_68 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_68.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_68; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_84 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_84.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_84; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_100 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_100.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_100; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_116 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_116.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_116; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_5 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_5.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_5; right; intros; assert (i_pre=123) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_21 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_21.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_21; right; intros; assert (i_pre=107) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_37 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_37.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_37; right; intros; assert (i_pre=91) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_53 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_53.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_53; right; intros; assert (i_pre=75) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_69 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_69.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_69; right; intros; assert (i_pre=59) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_85 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_85.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_85; right; intros; assert (i_pre=43) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_101 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_101.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_101; right; intros; assert (i_pre=27) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_117 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_117.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_117; right; intros; assert (i_pre=11) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store128_entail_wit_2 : S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_entail_wit_2.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_entail_wit_2; right; intros; subst;
 unfold derivable1,andp,coq_prop; intros; split;
 [apply s8_rvv_take_step; rewrite s8_rvv_pack128_length; lia|tauto]. Qed.
End CheckedRvvStorePart03.
