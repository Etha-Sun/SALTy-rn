From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvArithmeticSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int64 undef_store_int64 s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.
Module CheckedRvvArithmeticPart09.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_4 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_4.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_4; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_20 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_20.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_20; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_36 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_36.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_36; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_52 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_52.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_52; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_68 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_68.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_68; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_84 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_84.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_84; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_100 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_100.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_100; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_116 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_116.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_116; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_3_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_3_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_3_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s2")) a2. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_3 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_3.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_3; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_3_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s2")) a2|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_19_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_19_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_19_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s18")) a18. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_19 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_19.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_19; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_19_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s18")) a18|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_35_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_35_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_35_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s34")) a34. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_35 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_35.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_35; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_35_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s34")) a34|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_51_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_51_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_51_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s50")) a50. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_51 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_51.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_51; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_51_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s50")) a50|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_67_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_67_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_67_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s66")) a66. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_67 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_67.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_67; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_67_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s66")) a66|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_83_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_83_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_83_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s82")) a82. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_83 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_83.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_83; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_83_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s82")) a82|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_99_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_99_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_99_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s98")) a98. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_99 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_99.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_99; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_99_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s98")) a98|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_115_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_115_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_115_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s114")) a114. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_115 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_115.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_115; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_115_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s114")) a114|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_2 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_2.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_2; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_18 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_18.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_18; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_34 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_34.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_34; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_50 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_50.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_50; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_66 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_66.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_66; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_82 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_82.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_82; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_98 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_98.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_98; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_114 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_114.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_114; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_1_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_1_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_1_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s0")) a0. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_1 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_1.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_1; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_1_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s0")) a0|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_17_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_17_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_17_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s16")) a16. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_17 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_17.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_17; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_17_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s16")) a16|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_33_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_33_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_33_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s32")) a32. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_33 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_33.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_33; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_33_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s32")) a32|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_49_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_49_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_49_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s48")) a48. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_49 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_49.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_49; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_49_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s48")) a48|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_65_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_65_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_65_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s64")) a64. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_65 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_65.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_65; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_65_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s64")) a64|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_81_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_81_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_81_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s80")) a80. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_81 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_81.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_81; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_81_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s80")) a80|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_97_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_97_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_97_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s96")) a96. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_97 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_97.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_97; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_97_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s96")) a96|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_113_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_113_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_113_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s112")) a112. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_113 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_113.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_113; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_113_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s112")) a112|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_129 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_129.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_129; intros; subst; rvv_frame. Qed.
End CheckedRvvArithmeticPart09.
