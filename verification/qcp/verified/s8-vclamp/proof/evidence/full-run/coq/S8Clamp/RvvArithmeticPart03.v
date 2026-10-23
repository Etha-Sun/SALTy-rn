From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvArithmeticSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int64 undef_store_int64 s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.
Module CheckedRvvArithmeticPart03.
Local Transparent s8_rvv_max_lane.
Lemma proof_of_qcp_s8_rvv_max_lane_return_wit_1 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_max_lane_return_wit_1.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_max_lane_return_wit_1; left; intros; unfold s8_rvv_max_lane; destruct (Z.ltb_spec i_pre vl_pre); try lia; entailer!. Qed.
Local Opaque s8_rvv_max_lane.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_14 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_14.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_14; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_30 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_30.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_30; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_46 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_46.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_46; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_62 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_62.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_62; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_78 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_78.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_78; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_94 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_94.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_94; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_110 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_110.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_110; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_126 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_126.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_126; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_13_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_13_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_13_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s12")) a12. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_13 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_13.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_13; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_13_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s12")) a12|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_29_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_29_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_29_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s28")) a28. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_29 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_29.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_29; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_29_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s28")) a28|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_45_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_45_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_45_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s44")) a44. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_45 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_45.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_45; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_45_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s44")) a44|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_61_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_61_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_61_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s60")) a60. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_61 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_61.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_61; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_61_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s60")) a60|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_77_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_77_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_77_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s76")) a76. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_77 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_77.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_77; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_77_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s76")) a76|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_93_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_93_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_93_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s92")) a92. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_93 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_93.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_93; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_93_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s92")) a92|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_109_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_109_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_109_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s108")) a108. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_109 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_109.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_109; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_109_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s108")) a108|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_125_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_125_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_125_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s124")) a124. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_125 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_125.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_125; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_125_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s124")) a124|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_12 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_12.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_12; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_28 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_28.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_28; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_44 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_44.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_44; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_60 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_60.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_60; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_76 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_76.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_76; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_92 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_92.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_92; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_108 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_108.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_108; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_124 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_124.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_124; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_11_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_11_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_11_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s10")) a10. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_11 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_11.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_11; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_11_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s10")) a10|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_27_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_27_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_27_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s26")) a26. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_27 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_27.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_27; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_27_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s26")) a26|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_43_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_43_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_43_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s42")) a42. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_43 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_43.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_43; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_43_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s42")) a42|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_59_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_59_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_59_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s58")) a58. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_59 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_59.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_59; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_59_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s58")) a58|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_75_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_75_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_75_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s74")) a74. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_75 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_75.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_75; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_75_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s74")) a74|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_91_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_91_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_91_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s90")) a90. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_91 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_91.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_91; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_91_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s90")) a90|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_107_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_107_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_107_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s106")) a106. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_107 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_107.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_107; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_107_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s106")) a106|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_123_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_123_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_123_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s122")) a122. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_123 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_123.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_123; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_123_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s122")) a122|apply derivable1_refl]. Qed.
End CheckedRvvArithmeticPart03.
