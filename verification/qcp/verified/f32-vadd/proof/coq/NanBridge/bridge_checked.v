From Coq Require Import ZArith Lia.
From NanBridge Require Import BridgeLogic bridge_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Module Checked : VC_Correct.
Lemma proof_of_preserve_float_return_wit_1 : preserve_float_return_wit_1.
Proof.
  unfold preserve_float_return_wit_1.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_check_observation_safety_wit_1 : check_observation_safety_wit_1.
Proof.
  unfold check_observation_safety_wit_1.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_check_observation_safety_wit_2 : check_observation_safety_wit_2.
Proof.
  unfold check_observation_safety_wit_2.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_check_observation_safety_wit_3 : check_observation_safety_wit_3.
Proof.
  unfold check_observation_safety_wit_3.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_check_observation_safety_wit_4 : check_observation_safety_wit_4.
Proof.
  unfold check_observation_safety_wit_4.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_check_observation_return_wit_1 : check_observation_return_wit_1.
Proof.
  unfold check_observation_return_wit_1.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_check_observation_return_wit_2 : check_observation_return_wit_2.
Proof.
  unfold check_observation_return_wit_2.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_check_observation_return_wit_3 : check_observation_return_wit_3.
Proof.
  unfold check_observation_return_wit_3.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_check_observation_return_wit_4 : check_observation_return_wit_4.
Proof.
  unfold check_observation_return_wit_4.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_check_observation_partial_solve_wit_1 : check_observation_partial_solve_wit_1.
Proof.
  unfold check_observation_partial_solve_wit_1.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_check_observation_partial_solve_wit_2 : check_observation_partial_solve_wit_2.
Proof.
  unfold check_observation_partial_solve_wit_2.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_same_lane_return_wit_1 : same_lane_return_wit_1.
Proof.
  unfold same_lane_return_wit_1.
  try left.
  pre_process; unfold bit_same in *; subst;
  unfold returned_one in *; entailer!; try reflexivity;
  exfalso; eauto using same_ne_left_self_eq_false, same_ne_right_self_eq_false.
Qed.
Lemma proof_of_same_lane_partial_solve_wit_1_pure : same_lane_partial_solve_wit_1_pure.
Proof. pre_process. Qed.
Lemma proof_of_same_lane_partial_solve_wit_1 : same_lane_partial_solve_wit_1.
Proof.
  unfold same_lane_partial_solve_wit_1, same_lane_partial_solve_wit_1_aux.
  intros _. pre_process.
Qed.
End Checked.
Print Assumptions Checked.proof_of_preserve_float_return_wit_1.
Print Assumptions Checked.proof_of_check_observation_safety_wit_1.
Print Assumptions Checked.proof_of_check_observation_safety_wit_2.
Print Assumptions Checked.proof_of_check_observation_safety_wit_3.
Print Assumptions Checked.proof_of_check_observation_safety_wit_4.
Print Assumptions Checked.proof_of_check_observation_return_wit_1.
Print Assumptions Checked.proof_of_check_observation_return_wit_2.
Print Assumptions Checked.proof_of_check_observation_return_wit_3.
Print Assumptions Checked.proof_of_check_observation_return_wit_4.
Print Assumptions Checked.proof_of_check_observation_partial_solve_wit_1.
Print Assumptions Checked.proof_of_check_observation_partial_solve_wit_2.
Print Assumptions Checked.proof_of_same_lane_return_wit_1.
Print Assumptions Checked.proof_of_same_lane_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_same_lane_partial_solve_wit_1.
