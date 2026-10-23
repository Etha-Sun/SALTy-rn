From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvStoreSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.

Module CheckedRvvStorePart02.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_3 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_3.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_3; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_19 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_19.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_19; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_35 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_35.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_35; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_51 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_51.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_51; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_67 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_67.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_67; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_83 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_83.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_83; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_99 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_99.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_99; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_safety_wit_115 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_115.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_safety_wit_115; rvv_pure. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_4 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_4.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_4; right; intros; assert (i_pre=124) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_20 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_20.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_20; right; intros; assert (i_pre=108) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_36 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_36.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_36; right; intros; assert (i_pre=92) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_52 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_52.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_52; right; intros; assert (i_pre=76) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_68 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_68.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_68; right; intros; assert (i_pre=60) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_84 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_84.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_84; right; intros; assert (i_pre=44) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_100 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_100.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_100; right; intros; assert (i_pre=28) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_get128_return_wit_116 : S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_116.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_get128_return_wit_116; right; intros; assert (i_pre=12) by lia; subst i_pre; unfold s8_rvv_nth,s8_rvv_pack128,Znth; cbn; unfold derivable1,andp,coq_prop; intros; split; [reflexivity|tauto]. Qed.
Lemma proof_of_qcp_s8_rvv_store128_entail_wit_1 : S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_entail_wit_1.
Proof. unfold S8Clamp.rvv_store_goal.qcp_s8_rvv_store128_entail_wit_1; intros; rewrite s8_rvv_prefix_zero.
 assert (HH : CharArray.undef_full p_pre vl_pre |-- CharArray.seg p_pre 0 0 nil ** CharArray.undef_seg p_pre 0 vl_pre).
 { rewrite CharArray.seg_empty. unfold CharArray.undef_full,CharArray.undef_seg,store_undef_array. rewrite Z.sub_0_r. entailer!. }
 eapply (derivable1_trans _ (CharArray.undef_full p_pre vl_pre ** _)).
 { pull_cell (CharArray.undef_full p_pre vl_pre). }
 eapply (derivable1_trans _ ((CharArray.seg p_pre 0 0 nil ** CharArray.undef_seg p_pre 0 vl_pre) ** _)).
 { apply derivable1_sepcon_mono; [exact HH|apply derivable1_refl]. }
 rvv_frame. Qed.
End CheckedRvvStorePart02.
