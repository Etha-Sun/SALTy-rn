From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart00.
Lemma proof_of_test_neon_safety_wit_1 : S8Clamp.neon_unit_goal.test_neon_safety_wit_1.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_1; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_17 : S8Clamp.neon_unit_goal.test_neon_safety_wit_17.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_17; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_33 : S8Clamp.neon_unit_goal.test_neon_safety_wit_33.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_33; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_safety_wit_49 : S8Clamp.neon_unit_goal.test_neon_safety_wit_49.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_49; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_65 : S8Clamp.neon_unit_goal.test_neon_safety_wit_65.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_65; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_7_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_7_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_7_pure; try left;intros;subst; s8_neon_byte_ranges RawLo RawHi;s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_2 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_2.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_2; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_2_aux; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_18 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_18.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_18; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_34 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_34.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_34; try left;intros;subst; s8_neon_array_split constr:(16%Z).
Qed.
Lemma proof_of_test_neon_partial_solve_wit_50 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_50.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_50; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_66 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_66.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_66; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_66_aux; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_82 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_82.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_82; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart00.
