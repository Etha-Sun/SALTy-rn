From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart08.
Lemma proof_of_test_neon_safety_wit_9 : S8Clamp.neon_unit_goal.test_neon_safety_wit_9.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_9; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_25 : S8Clamp.neon_unit_goal.test_neon_safety_wit_25.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_25; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_41 : S8Clamp.neon_unit_goal.test_neon_safety_wit_41.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_41; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_57 : S8Clamp.neon_unit_goal.test_neon_safety_wit_57.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_57; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_73 : S8Clamp.neon_unit_goal.test_neon_safety_wit_73.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_73; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_68_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_68_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_68_pure; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_10 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_10.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_10; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_26 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_26.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_26; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_42 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_42.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_42; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_58 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_58.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_58; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_74 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_74.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_74; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_92 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_92.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_92; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_92_aux; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart08.
