From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart09.
Lemma proof_of_test_neon_safety_wit_10 : S8Clamp.neon_unit_goal.test_neon_safety_wit_10.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_10; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_26 : S8Clamp.neon_unit_goal.test_neon_safety_wit_26.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_26; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_42 : S8Clamp.neon_unit_goal.test_neon_safety_wit_42.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_42; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_58 : S8Clamp.neon_unit_goal.test_neon_safety_wit_58.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_58; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_74 : S8Clamp.neon_unit_goal.test_neon_safety_wit_74.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_74; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_70_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_70_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_70_pure; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_11 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_11.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_11; intros Hpure;unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_11_aux; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_27 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_27.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_27; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_43 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_43.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_43; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_59 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_59.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_59; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_75 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_75.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_75; try left;intros;subst; s8_neon_normalized_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_93 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_93.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_93; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart09.
