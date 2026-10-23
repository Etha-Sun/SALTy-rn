From Coq Require Import ZArith String List Lia.
From S8Clamp Require Import NeonKernelArrayFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Module CheckedNeonKernelPart02.
Lemma proof_of_test_neon_safety_wit_3 : S8Clamp.neon_unit_goal.test_neon_safety_wit_3.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_3; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_19 : S8Clamp.neon_unit_goal.test_neon_safety_wit_19.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_19; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_safety_wit_35 : S8Clamp.neon_unit_goal.test_neon_safety_wit_35.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_35; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_safety_wit_51 : S8Clamp.neon_unit_goal.test_neon_safety_wit_51.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_51; try left;intros;subst; s8_neon_bits_false.
Qed.
Lemma proof_of_test_neon_safety_wit_67 : S8Clamp.neon_unit_goal.test_neon_safety_wit_67.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_safety_wit_67; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_11_pure : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_11_pure.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_11_pure; try left;intros;subst; s8_neon_retry_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_4 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_4.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_4; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_4_aux; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_20 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_20.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_20; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_36 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_36.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_36; try left;intros;subst; s8_neon_array_split constr:(16%Z).
Qed.
Lemma proof_of_test_neon_partial_solve_wit_52 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_52.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_52; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_68 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_68.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_68; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_68_aux; try left; intros; subst; s8_neon_close.
Qed.
Lemma proof_of_test_neon_partial_solve_wit_86 : S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_86.
Proof. unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_86; intros Hpure; unfold S8Clamp.neon_unit_goal.test_neon_partial_solve_wit_86_aux; try left; intros; subst; s8_neon_close.
Qed.
End CheckedNeonKernelPart02.
