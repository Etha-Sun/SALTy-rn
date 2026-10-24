From Qu8Add Require Import NeonKernelArrayAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_safety_wit_8 : Qu8Add.neon_unit_goal.test_neon_safety_wit_8.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_safety_wit_8;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_safety_wit_24 : Qu8Add.neon_unit_goal.test_neon_safety_wit_24.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_safety_wit_24;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_safety_wit_40 : Qu8Add.neon_unit_goal.test_neon_safety_wit_40.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_safety_wit_40;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_safety_wit_56 : Qu8Add.neon_unit_goal.test_neon_safety_wit_56.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_safety_wit_56;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_safety_wit_72 : Qu8Add.neon_unit_goal.test_neon_safety_wit_72.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_safety_wit_72;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_3_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_3_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_32_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_32_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_32_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_57_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_57_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_57_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_82_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_82_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_82_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_112_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_112_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_112_pure;try left;intros;subst;prop_apply(qu_full_values input_a_pre(batch_pre+7)A);Intros_p HAValues;qu_kernel_pure_with_arrays. Qed.
Lemma proof_of_test_neon_partial_solve_wit_135_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_135_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_135_pure;try left;intros;subst;prop_apply(qu_full_values input_b_pre(batch_pre+7)B);Intros_p HBValues;qu_kernel_pure_with_arrays. Qed.
Lemma proof_of_test_neon_partial_solve_wit_158_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_158_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_158_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_181_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_181_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_181_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_197_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_197_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_197_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_224_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_224_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_224_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_246_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_246_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_246_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_270_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_270_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_270_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_296_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_296_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_296_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_312_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_312_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_312_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_345_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_345_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_345_pure;try left;intros;subst;qu_kernel_pure. Qed.
Lemma proof_of_test_neon_partial_solve_wit_385_pure : Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_385_pure.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_partial_solve_wit_385_pure;try left;intros;subst;qu_kernel_pure. Qed.
