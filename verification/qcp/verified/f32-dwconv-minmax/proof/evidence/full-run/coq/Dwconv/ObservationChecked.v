From Coq Require Import ZArith Lia.
From NanBridge Require Import BridgeLogic.
From Dwconv Require Import observation_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedObservation : Dwconv.observation_goal.VC_Correct.
Lemma proof_of_preserve_float_return_wit_1 : Dwconv.observation_goal.preserve_float_return_wit_1.
Proof. unfold Dwconv.observation_goal.preserve_float_return_wit_1;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_check_observation_safety_wit_1 : Dwconv.observation_goal.check_observation_safety_wit_1.
Proof. unfold Dwconv.observation_goal.check_observation_safety_wit_1;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_check_observation_safety_wit_2 : Dwconv.observation_goal.check_observation_safety_wit_2.
Proof. unfold Dwconv.observation_goal.check_observation_safety_wit_2;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_check_observation_safety_wit_3 : Dwconv.observation_goal.check_observation_safety_wit_3.
Proof. unfold Dwconv.observation_goal.check_observation_safety_wit_3;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_check_observation_safety_wit_4 : Dwconv.observation_goal.check_observation_safety_wit_4.
Proof. unfold Dwconv.observation_goal.check_observation_safety_wit_4;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_check_observation_return_wit_1 : Dwconv.observation_goal.check_observation_return_wit_1.
Proof. unfold Dwconv.observation_goal.check_observation_return_wit_1;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_check_observation_return_wit_2 : Dwconv.observation_goal.check_observation_return_wit_2.
Proof. unfold Dwconv.observation_goal.check_observation_return_wit_2;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_check_observation_return_wit_3 : Dwconv.observation_goal.check_observation_return_wit_3.
Proof. unfold Dwconv.observation_goal.check_observation_return_wit_3;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_check_observation_return_wit_4 : Dwconv.observation_goal.check_observation_return_wit_4.
Proof. unfold Dwconv.observation_goal.check_observation_return_wit_4;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_check_observation_partial_solve_wit_1 : Dwconv.observation_goal.check_observation_partial_solve_wit_1.
Proof. unfold Dwconv.observation_goal.check_observation_partial_solve_wit_1;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_check_observation_partial_solve_wit_2 : Dwconv.observation_goal.check_observation_partial_solve_wit_2.
Proof. unfold Dwconv.observation_goal.check_observation_partial_solve_wit_2;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_same_lane_return_wit_1 : Dwconv.observation_goal.same_lane_return_wit_1.
Proof. unfold Dwconv.observation_goal.same_lane_return_wit_1;try left;pre_process;unfold bit_same in *;subst;unfold returned_one in *;entailer!;try reflexivity;exfalso;eauto using same_ne_left_self_eq_false,same_ne_right_self_eq_false. Qed.
Lemma proof_of_same_lane_partial_solve_wit_1_pure : Dwconv.observation_goal.same_lane_partial_solve_wit_1_pure.
Proof. unfold Dwconv.observation_goal.same_lane_partial_solve_wit_1_pure;pre_process. Qed.
Lemma proof_of_same_lane_partial_solve_wit_1 : Dwconv.observation_goal.same_lane_partial_solve_wit_1.
Proof. unfold Dwconv.observation_goal.same_lane_partial_solve_wit_1,Dwconv.observation_goal.same_lane_partial_solve_wit_1_aux;intros _;pre_process. Qed.
End CheckedObservation.
Print Assumptions CheckedObservation.proof_of_preserve_float_return_wit_1.
Print Assumptions CheckedObservation.proof_of_check_observation_safety_wit_1.
Print Assumptions CheckedObservation.proof_of_check_observation_safety_wit_2.
Print Assumptions CheckedObservation.proof_of_check_observation_safety_wit_3.
Print Assumptions CheckedObservation.proof_of_check_observation_safety_wit_4.
Print Assumptions CheckedObservation.proof_of_check_observation_return_wit_1.
Print Assumptions CheckedObservation.proof_of_check_observation_return_wit_2.
Print Assumptions CheckedObservation.proof_of_check_observation_return_wit_3.
Print Assumptions CheckedObservation.proof_of_check_observation_return_wit_4.
Print Assumptions CheckedObservation.proof_of_check_observation_partial_solve_wit_1.
Print Assumptions CheckedObservation.proof_of_check_observation_partial_solve_wit_2.
Print Assumptions CheckedObservation.proof_of_same_lane_return_wit_1.
Print Assumptions CheckedObservation.proof_of_same_lane_partial_solve_wit_1_pure.
Print Assumptions CheckedObservation.proof_of_same_lane_partial_solve_wit_1.
