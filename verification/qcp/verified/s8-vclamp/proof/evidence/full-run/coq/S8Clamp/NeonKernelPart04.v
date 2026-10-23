From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart04.
Lemma proof_of_test_neon_safety_wit_5 : S8Clamp.neon_unit_goal.test_neon_safety_wit_5.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_5; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_21 : S8Clamp.neon_unit_goal.test_neon_safety_wit_21.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_21; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_37 : S8Clamp.neon_unit_goal.test_neon_safety_wit_37.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_37; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_53 : S8Clamp.neon_unit_goal.test_neon_safety_wit_53.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_53; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_safety_wit_69 : S8Clamp.neon_unit_goal.test_neon_safety_wit_69.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_69; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_15_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_15_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_15_pure; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_6 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_6.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_6; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_22 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_22.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_22; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_38 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_38.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_38; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_54 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_54.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_54; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_70 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_70.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_70; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_70_aux; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_88 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_88.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_88; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_88_aux; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart04.
