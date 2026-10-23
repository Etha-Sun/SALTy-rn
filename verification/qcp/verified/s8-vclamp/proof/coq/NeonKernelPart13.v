From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart13.
Lemma proof_of_test_neon_safety_wit_14 : S8Clamp.neon_unit_goal.test_neon_safety_wit_14.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_14; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_30 : S8Clamp.neon_unit_goal.test_neon_safety_wit_30.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_30; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_46 : S8Clamp.neon_unit_goal.test_neon_safety_wit_46.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_46; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_62 : S8Clamp.neon_unit_goal.test_neon_safety_wit_62.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_62; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_3_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_3_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_3_pure; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_90_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_90_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_90_pure; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_15 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_15.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_15; intros Hpure;unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_15_aux; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_31 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_31.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_31; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_47 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_47.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_47; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_63 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_63.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_63; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_79 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_79.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_79; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_97 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_97.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_97; try left;intros;subst; s8_neon_normalized_close.
Qed.
End CheckedNeonKernelPart13.
