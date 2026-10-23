From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart15.
Lemma proof_of_test_neon_safety_wit_16 : S8Clamp.neon_unit_goal.test_neon_safety_wit_16.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_16; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_32 : S8Clamp.neon_unit_goal.test_neon_safety_wit_32.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_32; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_48 : S8Clamp.neon_unit_goal.test_neon_safety_wit_48.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_48; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_64 : S8Clamp.neon_unit_goal.test_neon_safety_wit_64.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_64; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_5_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_5_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_5_pure; try left;intros;subst; s8_neon_byte_ranges RawLo RawHi;s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_1 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_1.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_1; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_1_aux; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_17 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_17.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_17; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_33 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_33.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_33; try left;intros;subst; s8_neon_array_split constr:(16%Z).
Qed.
Lemma proof_of_test_neon_partial_solve_wit_49 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_49.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_49; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_65 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_65.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_65; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_81 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_81.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_81; try left;intros;subst; s8_neon_retry_close.
Qed.
End CheckedNeonKernelPart15.
