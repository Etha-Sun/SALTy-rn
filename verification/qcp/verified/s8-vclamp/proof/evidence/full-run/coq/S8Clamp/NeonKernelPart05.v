From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart05.
Lemma proof_of_test_neon_safety_wit_6 : S8Clamp.neon_unit_goal.test_neon_safety_wit_6.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_6; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_22 : S8Clamp.neon_unit_goal.test_neon_safety_wit_22.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_22; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_38 : S8Clamp.neon_unit_goal.test_neon_safety_wit_38.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_38; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_54 : S8Clamp.neon_unit_goal.test_neon_safety_wit_54.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_54; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_safety_wit_70 : S8Clamp.neon_unit_goal.test_neon_safety_wit_70.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_70; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_37_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_37_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_37_pure; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_7 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_7.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_7; intros Hpure;unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_7_aux; try left;intros;subst; s8_neon_byte_ranges RawLo RawHi;s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_23 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_23.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_23; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_39 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_39.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_39; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_55 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_55.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_55; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_71 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_71.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_71; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_89 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_89.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_89; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart05.
