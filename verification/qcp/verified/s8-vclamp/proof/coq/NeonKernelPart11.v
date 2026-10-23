From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart11.
Lemma proof_of_test_neon_safety_wit_12 : S8Clamp.neon_unit_goal.test_neon_safety_wit_12.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_12; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_28 : S8Clamp.neon_unit_goal.test_neon_safety_wit_28.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_28; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_44 : S8Clamp.neon_unit_goal.test_neon_safety_wit_44.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_44; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_60 : S8Clamp.neon_unit_goal.test_neon_safety_wit_60.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_60; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_1_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_1_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_1_pure; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_86_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_86_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_86_pure; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_13 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_13.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_13; intros Hpure;unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_13_aux; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_29 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_29.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_29; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_45 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_45.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_45; try left;intros;subst; s8_neon_array_split constr:(8%Z).
Qed.
Lemma proof_of_test_neon_partial_solve_wit_61 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_61.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_61; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_77 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_77.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_77; try left;intros;subst; s8_neon_normalized_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_95 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_95.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_95; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart11.
