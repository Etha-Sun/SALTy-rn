From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart06.
Lemma proof_of_test_neon_safety_wit_7 : S8Clamp.neon_unit_goal.test_neon_safety_wit_7.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_7; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_23 : S8Clamp.neon_unit_goal.test_neon_safety_wit_23.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_23; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_39 : S8Clamp.neon_unit_goal.test_neon_safety_wit_39.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_39; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_55 : S8Clamp.neon_unit_goal.test_neon_safety_wit_55.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_55; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_71 : S8Clamp.neon_unit_goal.test_neon_safety_wit_71.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_71; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_46_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_46_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_46_pure; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_8 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_8.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_8; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_24 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_24.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_24; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_40 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_40.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_40; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_56 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_56.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_56; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_72 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_72.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_72; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_72_aux; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_90 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_90.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_90; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_90_aux; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart06.
