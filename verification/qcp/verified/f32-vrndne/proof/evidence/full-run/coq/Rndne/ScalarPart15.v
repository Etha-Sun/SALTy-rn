From Rndne Require Import ScalarSupport scalar_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart15.
Lemma proof_of_qcp_rnd_nan_bits_safety_wit_1 : Rndne.scalar_goal.qcp_rnd_nan_bits_safety_wit_1.
Proof. unfold Rndne.scalar_goal.qcp_rnd_nan_bits_safety_wit_1; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_key_return_wit_2 : Rndne.scalar_goal.qcp_rnd_key_return_wit_2.
Proof. unfold Rndne.scalar_goal.qcp_rnd_key_return_wit_2; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_gt_bits_return_wit_5 : Rndne.scalar_goal.qcp_rnd_gt_bits_return_wit_5.
Proof. unfold Rndne.scalar_goal.qcp_rnd_gt_bits_return_wit_5; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_abs_lt_bits_safety_wit_2 : Rndne.scalar_goal.qcp_rnd_abs_lt_bits_safety_wit_2.
Proof. unfold Rndne.scalar_goal.qcp_rnd_abs_lt_bits_safety_wit_2; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_ne_bits_safety_wit_4 : Rndne.scalar_goal.qcp_rnd_ne_bits_safety_wit_4.
Proof. unfold Rndne.scalar_goal.qcp_rnd_ne_bits_safety_wit_4; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_ne_bits_partial_solve_wit_3 : Rndne.scalar_goal.qcp_rnd_ne_bits_partial_solve_wit_3.
Proof. unfold Rndne.scalar_goal.qcp_rnd_ne_bits_partial_solve_wit_3; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_arm_nan_partial_solve_wit_4 : Rndne.scalar_goal.qcp_rnd_arm_nan_partial_solve_wit_4.
Proof. unfold Rndne.scalar_goal.qcp_rnd_arm_nan_partial_solve_wit_4; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_arm_add_partial_solve_wit_8 : Rndne.scalar_goal.qcp_rnd_arm_add_partial_solve_wit_8.
Proof. unfold Rndne.scalar_goal.qcp_rnd_arm_add_partial_solve_wit_8; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_arm_sub_partial_solve_wit_6 : Rndne.scalar_goal.qcp_rnd_arm_sub_partial_solve_wit_6.
Proof. unfold Rndne.scalar_goal.qcp_rnd_arm_sub_partial_solve_wit_6; rndne_scalar_finish. Qed.
Lemma proof_of_qcp_rnd_rvv_sub_partial_solve_wit_2 : Rndne.scalar_goal.qcp_rnd_rvv_sub_partial_solve_wit_2.
Proof. unfold Rndne.scalar_goal.qcp_rnd_rvv_sub_partial_solve_wit_2; rndne_scalar_finish. Qed.
End CheckedScalarPart15.
