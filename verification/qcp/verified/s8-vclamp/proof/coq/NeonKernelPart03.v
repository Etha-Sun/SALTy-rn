From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart03.
Lemma proof_of_test_neon_safety_wit_4 : S8Clamp.neon_unit_goal.test_neon_safety_wit_4.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_4; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_20 : S8Clamp.neon_unit_goal.test_neon_safety_wit_20.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_20; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_36 : S8Clamp.neon_unit_goal.test_neon_safety_wit_36.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_36; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_safety_wit_52 : S8Clamp.neon_unit_goal.test_neon_safety_wit_52.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_52; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_safety_wit_68 : S8Clamp.neon_unit_goal.test_neon_safety_wit_68.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_68; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_13_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_13_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_13_pure; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_5 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_5.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_5; intros Hpure;unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_5_aux; try left;intros;subst; s8_neon_byte_ranges RawLo RawHi;s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_21 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_21.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_21; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_37 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_37.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_37; intros Hpure;unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_37_aux; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_53 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_53.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_53; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_69 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_69.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_69; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_87 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_87.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_87; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart03.
