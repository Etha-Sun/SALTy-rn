From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart00.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_1 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_1.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_1; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_17 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_17.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_17; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_33 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_33.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_33; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_49 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_49.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_49; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_65 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_65.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_65; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_81 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_81.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_81; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_97 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_97.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_97; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_113 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_113.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_113; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_2 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_2.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_2; right; intros; assert (i_pre=126) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_18 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_18.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_18; right; intros; assert (i_pre=110) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_34 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_34.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_34; right; intros; assert (i_pre=94) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_50 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_50.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_50; right; intros; assert (i_pre=78) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_66 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_66.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_66; right; intros; assert (i_pre=62) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_82 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_82.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_82; right; intros; assert (i_pre=46) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_98 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_98.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_98; right; intros; assert (i_pre=30) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_114 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_114.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_114; right; intros; assert (i_pre=14) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store_next_partial_solve_wit_1 : S8Clamp.rvv_store_goal.qcp_s8_rvv_store_next_partial_solve_wit_1.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_store_next_partial_solve_wit_1; pre_process.
 sep_apply_l_atomic (CharArray.undef_seg_split_to_undef_missing_i p_pre i_pre i_pre vl_pre).
 - dump_pre_spatial; lia.
 - sep_apply_l_atomic (CharArray.undef_missing_i_to_undef_seg_head p_pre i_pre vl_pre).
   + dump_pre_spatial; lia.
   + unfold StoreCharAsElement.undefstoreA. entailer!. Qed.
End CheckedRvvStorePart00.
