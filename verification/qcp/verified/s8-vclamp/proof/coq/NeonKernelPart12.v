From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart12.
Lemma proof_of_test_neon_safety_wit_13 : S8Clamp.neon_unit_goal.test_neon_safety_wit_13.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_13; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_29 : S8Clamp.neon_unit_goal.test_neon_safety_wit_29.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_29; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_45 : S8Clamp.neon_unit_goal.test_neon_safety_wit_45.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_45; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_61 : S8Clamp.neon_unit_goal.test_neon_safety_wit_61.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_61; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_2_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_2_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_2_pure; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_88_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_88_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_88_pure; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_14 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_14.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_14; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_30 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_30.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_30; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_46 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_46.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_46; intros Hpure;unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_46_aux; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_62 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_62.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_62; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_78 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_78.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_78; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_96 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_96.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_96; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart12.
