From Rndne Require Import ScalarSupport scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart2.
Lemma proof_of_qcp_rnd_abs_partial_solve_wit_2 : Rndne.scalar_goal.qcp_rnd_abs_partial_solve_wit_2.
Proof. unfold Rndne.scalar_goal.qcp_rnd_abs_partial_solve_wit_2; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_nan_bits_return_wit_2 : Rndne.scalar_goal.qcp_rnd_nan_bits_return_wit_2.
Proof. unfold Rndne.scalar_goal.qcp_rnd_nan_bits_return_wit_2; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_gt_bits_safety_wit_3 : Rndne.scalar_goal.qcp_rnd_gt_bits_safety_wit_3.
Proof. unfold Rndne.scalar_goal.qcp_rnd_gt_bits_safety_wit_3; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_gt_bits_partial_solve_wit_1 : Rndne.scalar_goal.qcp_rnd_gt_bits_partial_solve_wit_1.
Proof. unfold Rndne.scalar_goal.qcp_rnd_gt_bits_partial_solve_wit_1; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_abs_lt_bits_return_wit_3 : Rndne.scalar_goal.qcp_rnd_abs_lt_bits_return_wit_3.
Proof. unfold Rndne.scalar_goal.qcp_rnd_abs_lt_bits_return_wit_3; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_ne_bits_safety_wit_7 : Rndne.scalar_goal.qcp_rnd_ne_bits_safety_wit_7.
Proof. unfold Rndne.scalar_goal.qcp_rnd_ne_bits_safety_wit_7; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_ne_partial_solve_wit_1 : Rndne.scalar_goal.qcp_rnd_ne_partial_solve_wit_1.
Proof. unfold Rndne.scalar_goal.qcp_rnd_ne_partial_solve_wit_1; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_arm_add_safety_wit_2 : Rndne.scalar_goal.qcp_rnd_arm_add_safety_wit_2.
Proof. unfold Rndne.scalar_goal.qcp_rnd_arm_add_safety_wit_2; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_arm_add_partial_solve_wit_11 : Rndne.scalar_goal.qcp_rnd_arm_add_partial_solve_wit_11.
Proof. unfold Rndne.scalar_goal.qcp_rnd_arm_add_partial_solve_wit_11; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_arm_sub_partial_solve_wit_9 : Rndne.scalar_goal.qcp_rnd_arm_sub_partial_solve_wit_9.
Proof. unfold Rndne.scalar_goal.qcp_rnd_arm_sub_partial_solve_wit_9; rndne_scalar_finish. Qed.
End CheckedScalarPart2.
