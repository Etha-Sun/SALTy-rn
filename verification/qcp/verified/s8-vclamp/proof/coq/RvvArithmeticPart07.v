From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvArithmeticSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int64 undef_store_int64 s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.
Module CheckedRvvArithmeticPart07.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_2 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_2.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_2; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_18 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_18.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_18; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_34 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_34.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_34; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_50 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_50.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_50; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_66 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_66.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_66; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_82 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_82.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_82; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_98 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_98.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_98; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_114 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_114.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_114; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_1_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_1_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_1_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s0")) a0. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_1 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_1.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_1; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_1_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s0")) a0|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_17_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_17_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_17_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s16")) a16. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_17 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_17.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_17; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_17_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s16")) a16|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_33_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_33_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_33_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s32")) a32. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_33 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_33.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_33; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_33_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s32")) a32|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_49_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_49_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_49_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s48")) a48. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_49 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_49.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_49; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_49_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s48")) a48|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_65_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_65_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_65_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s64")) a64. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_65 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_65.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_65; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_65_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s64")) a64|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_81_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_81_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_81_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s80")) a80. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_81 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_81.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_81; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_81_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s80")) a80|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_97_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_97_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_97_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s96")) a96. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_97 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_97.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_97; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_97_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s96")) a96|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_113_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_113_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_113_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s112")) a112. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_113 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_113.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_113; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_113_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s112")) a112|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_129 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_129.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_129; intros; subst; rvv_frame. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_16 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_16.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_16; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_32 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_32.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_32; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_48 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_48.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_48; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_64 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_64.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_64; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_80 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_80.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_80; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_96 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_96.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_96; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_112 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_112.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_112; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_128 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_128.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_128; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_15_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_15_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_15_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s14")) a14. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_15 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_15.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_15; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_15_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s14")) a14|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_31_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_31_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_31_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s30")) a30. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_31 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_31.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_31; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_31_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s30")) a30|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_47_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_47_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_47_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s46")) a46. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_47 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_47.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_47; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_47_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s46")) a46|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_63_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_63_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_63_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s62")) a62. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_63 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_63.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_63; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_63_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s62")) a62|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_79_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_79_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_79_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s78")) a78. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_79 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_79.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_79; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_79_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s78")) a78|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_95_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_95_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_95_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s94")) a94. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_95 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_95.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_95; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_95_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s94")) a94|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_111_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_111_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_111_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s110")) a110. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_111 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_111.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_111; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_111_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s110")) a110|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_127_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_127_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_127_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s126")) a126. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_127 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_127.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_127; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_127_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s126")) a126|apply derivable1_refl]. Qed.
End CheckedRvvArithmeticPart07.
