From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart07.
Lemma proof_of_test_neon_safety_wit_8 : S8Clamp.neon_unit_goal.test_neon_safety_wit_8.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_8; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_24 : S8Clamp.neon_unit_goal.test_neon_safety_wit_24.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_24; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_40 : S8Clamp.neon_unit_goal.test_neon_safety_wit_40.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_40; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_56 : S8Clamp.neon_unit_goal.test_neon_safety_wit_56.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_56; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_72 : S8Clamp.neon_unit_goal.test_neon_safety_wit_72.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_72; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_66_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_66_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_66_pure; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_9 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_9.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_9; intros Hpure;unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_9_aux; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_25 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_25.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_25; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_41 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_41.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_41; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_57 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_57.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_57; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_73 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_73.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_73; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_91 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_91.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_91; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart07.
