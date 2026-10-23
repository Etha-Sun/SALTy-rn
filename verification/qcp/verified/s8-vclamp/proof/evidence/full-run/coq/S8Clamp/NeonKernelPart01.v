From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart01.
Lemma proof_of_test_neon_safety_wit_2 : S8Clamp.neon_unit_goal.test_neon_safety_wit_2.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_2; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_18 : S8Clamp.neon_unit_goal.test_neon_safety_wit_18.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_18; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_34 : S8Clamp.neon_unit_goal.test_neon_safety_wit_34.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_34; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_safety_wit_50 : S8Clamp.neon_unit_goal.test_neon_safety_wit_50.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_50; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_66 : S8Clamp.neon_unit_goal.test_neon_safety_wit_66.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_66; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_9_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_9_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_9_pure; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_3 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_3.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_3; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_3_aux; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_19 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_19.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_19; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_35 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_35.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_35; try left;intros;subst; s8_neon_array_split constr:(16%Z).
Qed.
Lemma proof_of_test_neon_partial_solve_wit_51 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_51.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_51; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_67 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_67.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_67; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_83 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_83.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_83; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart01.
