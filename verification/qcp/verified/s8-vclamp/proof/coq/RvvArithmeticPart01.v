From Coq Require Import ZArith Lia List String.
From S8Clamp Require Import RvvArithmeticSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int64 undef_store_int64 s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max.
Module CheckedRvvArithmeticPart01.
Local Transparent s8_rvv_min_lane.
Lemma proof_of_qcp_s8_rvv_min_lane_return_wit_2 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_min_lane_return_wit_2.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_min_lane_return_wit_2; left; intros; unfold s8_rvv_min_lane; destruct (Z.ltb_spec i_pre vl_pre); try lia; entailer!. Qed.
Local Opaque s8_rvv_min_lane.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_12 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_12.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_12; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_28 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_28.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_28; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_44 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_44.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_44; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_60 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_60.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_60; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_76 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_76.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_76; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_92 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_92.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_92; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_108 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_108.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_108; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_safety_wit_124 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_124.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_safety_wit_124; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_11_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_11_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_11_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s10")) a10. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_11 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_11.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_11; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_11_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s10")) a10|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_27_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_27_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_27_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s26")) a26. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_27 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_27.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_27; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_27_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s26")) a26|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_43_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_43_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_43_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s42")) a42. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_43 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_43.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_43; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_43_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s42")) a42|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_59_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_59_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_59_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s58")) a58. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_59 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_59.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_59; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_59_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s58")) a58|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_75_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_75_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_75_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s74")) a74. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_75 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_75.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_75; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_75_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s74")) a74|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_91_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_91_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_91_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s90")) a90. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_91 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_91.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_91; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_91_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s90")) a90|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_107_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_107_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_107_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s106")) a106. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_107 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_107.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_107; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_107_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s106")) a106|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_123_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_123_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_123_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s122")) a122. Qed.
Lemma proof_of_qcp_s8_rvv_vmin_borrow_partial_solve_wit_123 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_123.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_123; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmin_borrow_partial_solve_wit_123_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s122")) a122|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_10 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_10.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_10; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_26 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_26.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_26; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_42 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_42.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_42; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_58 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_58.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_58; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_74 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_74.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_74; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_90 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_90.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_90; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_106 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_106.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_106; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_safety_wit_122 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_122.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_safety_wit_122; rvv_arith_pure. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_9_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_9_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_9_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s8")) a8. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_9 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_9.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_9; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_9_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s8")) a8|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_25_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_25_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_25_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s24")) a24. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_25 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_25.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_25; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_25_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s24")) a24|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_41_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_41_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_41_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s40")) a40. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_41 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_41.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_41; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_41_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s40")) a40|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_57_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_57_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_57_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s56")) a56. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_57 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_57.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_57; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_57_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s56")) a56|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_73_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_73_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_73_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s72")) a72. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_73 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_73.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_73; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_73_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s72")) a72|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_89_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_89_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_89_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s88")) a88. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_89 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_89.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_89; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_89_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s88")) a88|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_105_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_105_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_105_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s104")) a104. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_105 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_105.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_105; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_105_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s104")) a104|apply derivable1_refl]. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_121_pure : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_121_pure.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_121_pure; right; intros; rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s120")) a120. Qed.
Lemma proof_of_qcp_s8_rvv_vmax_borrow_partial_solve_wit_121 : S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_121.
Proof. unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_121; intros Hpure; unfold S8Clamp.rvv_arithmetic_goal.qcp_s8_rvv_vmax_borrow_partial_solve_wit_121_aux; intros; subst; repeat progress rewrite <- logic_equiv_andp_assoc; apply _derivable1_andp_intros; [rvv_char_bounds (&(a_pre # "vint8m8_t" ->ₛ "s120")) a120|apply derivable1_refl]. Qed.
End CheckedRvvArithmeticPart01.
