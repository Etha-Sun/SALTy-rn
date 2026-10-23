From Coq Require Import ZArith Lia List.
From Qs8Cvt Require Import ProgramModel Observation wrapper_unit_goal.
From QcpVadd Require Import array_read_checked.
From NanBridge Require Import bridge_checked.
From VaddComparator Require Import ComparatorLogic comparator_checked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedWrapper : Qs8Cvt.wrapper_unit_goal.VC_Correct.
Include Qs8Cvt.CharArraysStrategy.CheckedCharArrays.
Include float_array_strategy_proof.CheckedFloatArray.
Include comparator_strategy_proof.CheckedComparatorStrategies.
Include VaddWrapper.wrapper_strategy_proof.CheckedWrapperStrategy.
Lemma proof_of_qcp_vadd_read_return_wit_1 : Qs8Cvt.wrapper_unit_goal.qcp_vadd_read_return_wit_1.
Proof. exact QcpVadd.array_read_checked.CheckedArrayRead.proof_of_qcp_vadd_read_return_wit_1.
Qed.
Lemma proof_of_qcp_vadd_read_partial_solve_wit_1 : Qs8Cvt.wrapper_unit_goal.qcp_vadd_read_partial_solve_wit_1.
Proof. exact QcpVadd.array_read_checked.CheckedArrayRead.proof_of_qcp_vadd_read_partial_solve_wit_1.
Qed.
Lemma proof_of_preserve_float_return_wit_1 : Qs8Cvt.wrapper_unit_goal.preserve_float_return_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_preserve_float_return_wit_1.
Qed.
Lemma proof_of_check_observation_safety_wit_1 : Qs8Cvt.wrapper_unit_goal.check_observation_safety_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_safety_wit_1.
Qed.
Lemma proof_of_check_observation_safety_wit_2 : Qs8Cvt.wrapper_unit_goal.check_observation_safety_wit_2.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_safety_wit_2.
Qed.
Lemma proof_of_check_observation_safety_wit_3 : Qs8Cvt.wrapper_unit_goal.check_observation_safety_wit_3.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_safety_wit_3.
Qed.
Lemma proof_of_check_observation_safety_wit_4 : Qs8Cvt.wrapper_unit_goal.check_observation_safety_wit_4.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_safety_wit_4.
Qed.
Lemma proof_of_check_observation_return_wit_1 : Qs8Cvt.wrapper_unit_goal.check_observation_return_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_return_wit_1.
Qed.
Lemma proof_of_check_observation_return_wit_2 : Qs8Cvt.wrapper_unit_goal.check_observation_return_wit_2.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_return_wit_2.
Qed.
Lemma proof_of_check_observation_return_wit_3 : Qs8Cvt.wrapper_unit_goal.check_observation_return_wit_3.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_return_wit_3.
Qed.
Lemma proof_of_check_observation_return_wit_4 : Qs8Cvt.wrapper_unit_goal.check_observation_return_wit_4.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_return_wit_4.
Qed.
Lemma proof_of_check_observation_partial_solve_wit_1 : Qs8Cvt.wrapper_unit_goal.check_observation_partial_solve_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_partial_solve_wit_1.
Qed.
Lemma proof_of_check_observation_partial_solve_wit_2 : Qs8Cvt.wrapper_unit_goal.check_observation_partial_solve_wit_2.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_partial_solve_wit_2.
Qed.
Lemma proof_of_same_lane_return_wit_1 : Qs8Cvt.wrapper_unit_goal.same_lane_return_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_same_lane_return_wit_1.
Qed.
Lemma proof_of_same_lane_partial_solve_wit_1_pure : Qs8Cvt.wrapper_unit_goal.same_lane_partial_solve_wit_1_pure.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_same_lane_partial_solve_wit_1_pure.
Qed.
Lemma proof_of_same_lane_partial_solve_wit_1 : Qs8Cvt.wrapper_unit_goal.same_lane_partial_solve_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_same_lane_partial_solve_wit_1.
Qed.
Lemma proof_of_compare_outputs_safety_wit_1 : Qs8Cvt.wrapper_unit_goal.compare_outputs_safety_wit_1.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_safety_wit_1; try left; pre_process; unfold FloatArray.full; entailer!.
Qed.
Lemma proof_of_compare_outputs_safety_wit_2 : Qs8Cvt.wrapper_unit_goal.compare_outputs_safety_wit_2.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_safety_wit_2; try left; pre_process; unfold FloatArray.full; entailer!.
Qed.
Lemma proof_of_compare_outputs_safety_wit_3 : Qs8Cvt.wrapper_unit_goal.compare_outputs_safety_wit_3.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_safety_wit_3; try left; pre_process; unfold FloatArray.full; entailer!.
Qed.
Lemma proof_of_compare_outputs_entail_wit_1 : Qs8Cvt.wrapper_unit_goal.compare_outputs_entail_wit_1.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_entail_wit_1; left; intros right_pre left_pre n_pre rs ls Hpos Hbound Hrelated.
  prop_apply (FloatArray.full_Zlength left_pre n_pre ls).
  Intros_p Hlen. entailer!.
Qed.
Lemma proof_of_compare_outputs_entail_wit_2 : Qs8Cvt.wrapper_unit_goal.compare_outputs_entail_wit_2.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_entail_wit_2; try left; pre_process; unfold FloatArray.full; entailer!.
Qed.
Lemma proof_of_compare_outputs_return_wit_1 : Qs8Cvt.wrapper_unit_goal.compare_outputs_return_wit_1.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_return_wit_1; try left; pre_process; unfold FloatArray.full; entailer!.
Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_1_pure : Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_1_pure.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_1_pure; try left; pre_process; unfold FloatArray.full; entailer!.
Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_1 : Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_1.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_1, Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_1_aux; intro _H; try left; pre_process; unfold FloatArray.full; entailer!.
Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_2_pure : Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_2_pure.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_2_pure; try left; pre_process; unfold FloatArray.full; entailer!.
Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_2 : Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_2.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_2, Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_2_aux; intro _H; try left; pre_process; unfold FloatArray.full; entailer!.
Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_3_pure : Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_3_pure.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_3_pure; try left; pre_process; unfold FloatArray.full; entailer!;
    eapply related_Znth; [eassumption | rewrite <- Zlength_correct; lia].
Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_3 : Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_3.
Proof. unfold Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_3, Qs8Cvt.wrapper_unit_goal.compare_outputs_partial_solve_wit_3_aux; intro _H; try left; pre_process; unfold FloatArray.full; entailer!;
    eapply related_Znth; [eassumption | rewrite <- Zlength_correct; lia].
Qed.
Lemma proof_of_equivalent_return_wit_1 : Qs8Cvt.wrapper_unit_goal.equivalent_return_wit_1.
Proof. unfold Qs8Cvt.wrapper_unit_goal.equivalent_return_wit_1;right;intros;entailer!;apply cvt_list_observation.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_1_pure.
Proof. unfold Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_1_pure;intros;entailer!.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_1.
Proof. unfold Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_1,Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_1_aux;intros _;intros;entailer!;apply cvt_list_observation.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_2_pure.
Proof. unfold Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_2_pure;intros;entailer!.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_2.
Proof. unfold Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_2,Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_2_aux;intros _;intros;entailer!;apply cvt_list_observation.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_3_pure : Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_3_pure;left;intros;entailer!;apply cvt_list_observation.
Qed.
Lemma proof_of_equivalent_partial_solve_wit_3 : Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_3.
Proof. unfold Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_3,Qs8Cvt.wrapper_unit_goal.equivalent_partial_solve_wit_3_aux;intros _;intros;entailer!;apply cvt_list_observation.
Qed.
End CheckedWrapper.
