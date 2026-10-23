From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvArithmeticSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int64 undef_store_int64 s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.
Module CheckedRvvArithmeticPart12.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_7 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_7.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_7; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_23 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_23.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_23; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_39 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_39.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_39; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_55 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_55.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_55; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_71 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_71.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_71; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_87 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_87.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_87; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_103 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_103.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_103; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_119 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_119.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_119; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_6_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_6_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_6_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s5")) a5. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_6 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_6.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_6; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_6_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s5")) a5|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_22_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_22_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_22_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s21")) a21. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_22 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_22.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_22; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_22_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s21")) a21|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_38_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_38_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_38_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s37")) a37. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_38 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_38.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_38; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_38_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s37")) a37|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_54_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_54_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_54_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s53")) a53. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_54 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_54.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_54; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_54_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s53")) a53|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_70_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_70_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_70_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s69")) a69. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_70 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_70.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_70; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_70_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s69")) a69|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_86_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_86_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_86_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s85")) a85. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_86 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_86.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_86; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_86_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s85")) a85|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_102_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_102_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_102_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s101")) a101. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_102 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_102.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_102; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_102_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s101")) a101|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_118_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_118_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_118_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s117")) a117. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_118 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_118.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_118; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_118_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s117")) a117|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_5 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_5.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_5; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_21 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_21.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_21; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_37 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_37.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_37; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_53 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_53.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_53; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_69 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_69.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_69; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_85 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_85.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_85; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_101 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_101.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_101; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_117 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_117.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_117; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_4_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_4_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_4_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s3")) a3. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_4 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_4.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_4; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_4_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s3")) a3|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_20_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_20_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_20_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s19")) a19. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_20 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_20.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_20; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_20_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s19")) a19|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_36_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_36_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_36_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s35")) a35. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_36 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_36.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_36; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_36_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s35")) a35|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_52_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_52_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_52_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s51")) a51. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_52 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_52.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_52; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_52_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s51")) a51|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_68_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_68_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_68_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s67")) a67. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_68 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_68.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_68; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_68_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s67")) a67|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_84_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_84_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_84_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s83")) a83. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_84 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_84.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_84; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_84_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s83")) a83|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_100_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_100_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_100_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s99")) a99. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_100 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_100.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_100; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_100_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s99")) a99|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_116_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_116_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_116_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s115")) a115. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_116 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_116.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_116; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_116_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s115")) a115|apply derivable1_refl]. Qed.
End CheckedRvvArithmeticPart12.
