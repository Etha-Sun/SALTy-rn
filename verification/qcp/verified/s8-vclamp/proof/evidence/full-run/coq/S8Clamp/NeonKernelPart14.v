From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart14.
Lemma proof_of_test_neon_safety_wit_15 : S8Clamp.neon_unit_goal.test_neon_safety_wit_15.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_15; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_31 : S8Clamp.neon_unit_goal.test_neon_safety_wit_31.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_31; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_47 : S8Clamp.neon_unit_goal.test_neon_safety_wit_47.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_47; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_63 : S8Clamp.neon_unit_goal.test_neon_safety_wit_63.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_63; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_4_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_4_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_4_pure; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_92_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_92_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_92_pure; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_16 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_16.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_16; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_32 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_32.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_32; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_48 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_48.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_48; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_64 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_64.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_64; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_80 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_80.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_80; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart14.
