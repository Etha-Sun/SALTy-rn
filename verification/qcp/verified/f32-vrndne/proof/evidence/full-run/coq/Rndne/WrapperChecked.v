From Coq Require Import ZArith Lia List.
From Rndne Require Import Model ProgramModel ProgramFacts VectorSupport rndne_memory_strategy_proof wrapper_unit_goal.
From QcpVadd Require Import array_read_checked.
From NanBridge Require Import bridge_checked.
From VaddComparator Require Import ComparatorLogic comparator_strategy_proof.
From VaddWrapper Require Import wrapper_strategy_proof.
From QcpRvv32 Require Import FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rndne_wrapper_norm :=
 change (sizeof(FLOAT)) with 4 in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 repeat rewrite Z.quot_mul in * by lia;
 repeat rewrite Z.rem_mul in * by lia.
Ltac rndne_wrapper_pure :=
 repeat match goal with |- _ |-- _ && _ => apply _derivable1_andp_intros end;
 first [solve [apply derivable1_andp_elim2]
 |solve [unfold derivable1,coq_prop;intros;first [assumption|reflexivity|lia|apply rndne_lists_related]]].
Ltac rndne_wrapper_frame :=
 repeat match goal with |- _ |-- _ && _ => apply _derivable1_andp_intros end;
 first [solve [opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve [rndne_wrapper_pure]].
Module CheckedWrapper : Rndne.wrapper_unit_goal.VC_Correct.
Include QcpVadd.float_array_strategy_proof.CheckedFloatArray.
Include QcpNeon.neon_bridge_strategy_proof.CheckedNeonBridge.
Include QcpNeonLoop.neon_tail_strategy_proof.CheckedNeonTail.
Include QcpRvv32.rvv_arrays_strategy_proof.CheckedRvvArray.
Include QcpRvv32.rvv_store_strategy_proof.CheckedRvvStoreStrategy.
Include QcpRvv32.rvv_loop_strategy_proof.CheckedRvvLoopStrategy.
Include VaddComparator.comparator_strategy_proof.CheckedComparatorStrategies.
Include VaddWrapper.wrapper_strategy_proof.CheckedWrapperStrategy.
Include Rndne.RndneStrategy.CheckedRndneStrategy.
Lemma proof_of_qcp_vadd_read_return_wit_1 : Rndne.wrapper_unit_goal.qcp_vadd_read_return_wit_1.
Proof. exact QcpVadd.array_read_checked.CheckedArrayRead.proof_of_qcp_vadd_read_return_wit_1. Qed.
Lemma proof_of_qcp_vadd_read_partial_solve_wit_1 : Rndne.wrapper_unit_goal.qcp_vadd_read_partial_solve_wit_1.
Proof. exact QcpVadd.array_read_checked.CheckedArrayRead.proof_of_qcp_vadd_read_partial_solve_wit_1. Qed.
Lemma proof_of_preserve_float_return_wit_1 : Rndne.wrapper_unit_goal.preserve_float_return_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_preserve_float_return_wit_1. Qed.
Lemma proof_of_check_observation_safety_wit_1 : Rndne.wrapper_unit_goal.check_observation_safety_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_safety_wit_1. Qed.
Lemma proof_of_check_observation_safety_wit_2 : Rndne.wrapper_unit_goal.check_observation_safety_wit_2.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_safety_wit_2. Qed.
Lemma proof_of_check_observation_safety_wit_3 : Rndne.wrapper_unit_goal.check_observation_safety_wit_3.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_safety_wit_3. Qed.
Lemma proof_of_check_observation_safety_wit_4 : Rndne.wrapper_unit_goal.check_observation_safety_wit_4.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_safety_wit_4. Qed.
Lemma proof_of_check_observation_return_wit_1 : Rndne.wrapper_unit_goal.check_observation_return_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_return_wit_1. Qed.
Lemma proof_of_check_observation_return_wit_2 : Rndne.wrapper_unit_goal.check_observation_return_wit_2.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_return_wit_2. Qed.
Lemma proof_of_check_observation_return_wit_3 : Rndne.wrapper_unit_goal.check_observation_return_wit_3.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_return_wit_3. Qed.
Lemma proof_of_check_observation_return_wit_4 : Rndne.wrapper_unit_goal.check_observation_return_wit_4.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_return_wit_4. Qed.
Lemma proof_of_check_observation_partial_solve_wit_1 : Rndne.wrapper_unit_goal.check_observation_partial_solve_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_partial_solve_wit_1. Qed.
Lemma proof_of_check_observation_partial_solve_wit_2 : Rndne.wrapper_unit_goal.check_observation_partial_solve_wit_2.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_check_observation_partial_solve_wit_2. Qed.
Lemma proof_of_same_lane_return_wit_1 : Rndne.wrapper_unit_goal.same_lane_return_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_same_lane_return_wit_1. Qed.
Lemma proof_of_same_lane_partial_solve_wit_1_pure : Rndne.wrapper_unit_goal.same_lane_partial_solve_wit_1_pure.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_same_lane_partial_solve_wit_1_pure. Qed.
Lemma proof_of_same_lane_partial_solve_wit_1 : Rndne.wrapper_unit_goal.same_lane_partial_solve_wit_1.
Proof. exact NanBridge.bridge_checked.Checked.proof_of_same_lane_partial_solve_wit_1. Qed.
Lemma proof_of_compare_outputs_safety_wit_1 : Rndne.wrapper_unit_goal.compare_outputs_safety_wit_1.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_safety_wit_1; try left; pre_process; unfold FloatArray.full; entailer!.  Qed.
Lemma proof_of_compare_outputs_safety_wit_2 : Rndne.wrapper_unit_goal.compare_outputs_safety_wit_2.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_safety_wit_2; try left; pre_process; unfold FloatArray.full; entailer!.  Qed.
Lemma proof_of_compare_outputs_safety_wit_3 : Rndne.wrapper_unit_goal.compare_outputs_safety_wit_3.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_safety_wit_3; try left; pre_process; unfold FloatArray.full; entailer!.  Qed.
Lemma proof_of_compare_outputs_entail_wit_1 : Rndne.wrapper_unit_goal.compare_outputs_entail_wit_1.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_entail_wit_1; left; intros right_pre left_pre n_pre rs ls Hpos Hbound Hrelated.
  prop_apply (FloatArray.full_Zlength left_pre n_pre ls).
  Intros_p Hlen. entailer!.  Qed.
Lemma proof_of_compare_outputs_entail_wit_2 : Rndne.wrapper_unit_goal.compare_outputs_entail_wit_2.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_entail_wit_2; try left; pre_process; unfold FloatArray.full; entailer!.  Qed.
Lemma proof_of_compare_outputs_return_wit_1 : Rndne.wrapper_unit_goal.compare_outputs_return_wit_1.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_return_wit_1; try left; pre_process; unfold FloatArray.full; entailer!.  Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_1_pure : Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_1_pure.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_1_pure; try left; pre_process; unfold FloatArray.full; entailer!.  Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_1 : Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_1.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_1, Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_1_aux; intro _H; try left; pre_process; unfold FloatArray.full; entailer!.  Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_2_pure : Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_2_pure.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_2_pure; try left; pre_process; unfold FloatArray.full; entailer!.  Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_2 : Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_2.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_2, Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_2_aux; intro _H; try left; pre_process; unfold FloatArray.full; entailer!.  Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_3_pure : Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_3_pure.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_3_pure; try left; pre_process; unfold FloatArray.full; entailer!;
    eapply related_Znth; [eassumption | rewrite <- Zlength_correct; lia].  Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_3 : Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_3.
Proof.  unfold Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_3, Rndne.wrapper_unit_goal.compare_outputs_partial_solve_wit_3_aux; intro _H; try left; pre_process; unfold FloatArray.full; entailer!;
    eapply related_Znth; [eassumption | rewrite <- Zlength_correct; lia].  Qed.
Lemma proof_of_equivalent_entail_wit_1 : Rndne.wrapper_unit_goal.equivalent_entail_wit_1.
Proof. unfold Rndne.wrapper_unit_goal.equivalent_entail_wit_1; right;intros;rndne_wrapper_norm;rndne_wrapper_pure. Qed.
Lemma proof_of_equivalent_entail_wit_2 : Rndne.wrapper_unit_goal.equivalent_entail_wit_2.
Proof. unfold Rndne.wrapper_unit_goal.equivalent_entail_wit_2; right;intros;rndne_wrapper_norm;rndne_wrapper_pure. Qed.
Lemma proof_of_equivalent_return_wit_1 : Rndne.wrapper_unit_goal.equivalent_return_wit_1.
Proof. unfold Rndne.wrapper_unit_goal.equivalent_return_wit_1; intros; rndne_wrapper_norm; Exists (rndne_values n_pre A) (rndne_rvv_values n_pre A);rndne_wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_1_pure.
Proof. unfold Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_1_pure; intros;rndne_wrapper_norm;rndne_wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_1.
Proof. unfold Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_1, Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_1_aux; intros;rndne_wrapper_norm;rndne_wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_2_pure.
Proof. unfold Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_2_pure; intros;rndne_wrapper_norm;rndne_wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_2.
Proof. unfold Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_2, Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_2_aux; intros;rndne_wrapper_norm;rndne_wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3_pure : Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_3_pure; intros;rndne_wrapper_norm;rndne_wrapper_frame. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3 : Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_3.
Proof. unfold Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_3, Rndne.wrapper_unit_goal.equivalent_partial_solve_wit_3_aux; intros;rndne_wrapper_norm;rndne_wrapper_frame. Qed.
End CheckedWrapper.
Print Assumptions CheckedWrapper.proof_of_qcp_vadd_read_return_wit_1.
Print Assumptions CheckedWrapper.proof_of_qcp_vadd_read_partial_solve_wit_1.
Print Assumptions CheckedWrapper.proof_of_preserve_float_return_wit_1.
Print Assumptions CheckedWrapper.proof_of_check_observation_safety_wit_1.
Print Assumptions CheckedWrapper.proof_of_check_observation_safety_wit_2.
Print Assumptions CheckedWrapper.proof_of_check_observation_safety_wit_3.
Print Assumptions CheckedWrapper.proof_of_check_observation_safety_wit_4.
Print Assumptions CheckedWrapper.proof_of_check_observation_return_wit_1.
Print Assumptions CheckedWrapper.proof_of_check_observation_return_wit_2.
Print Assumptions CheckedWrapper.proof_of_check_observation_return_wit_3.
Print Assumptions CheckedWrapper.proof_of_check_observation_return_wit_4.
Print Assumptions CheckedWrapper.proof_of_check_observation_partial_solve_wit_1.
Print Assumptions CheckedWrapper.proof_of_check_observation_partial_solve_wit_2.
Print Assumptions CheckedWrapper.proof_of_same_lane_return_wit_1.
Print Assumptions CheckedWrapper.proof_of_same_lane_partial_solve_wit_1_pure.
Print Assumptions CheckedWrapper.proof_of_same_lane_partial_solve_wit_1.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_safety_wit_1.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_safety_wit_2.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_safety_wit_3.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_entail_wit_1.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_entail_wit_2.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_return_wit_1.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_partial_solve_wit_1_pure.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_partial_solve_wit_1.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_partial_solve_wit_2_pure.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_partial_solve_wit_2.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_partial_solve_wit_3_pure.
Print Assumptions CheckedWrapper.proof_of_compare_outputs_partial_solve_wit_3.
Print Assumptions CheckedWrapper.proof_of_equivalent_entail_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_entail_wit_2.
Print Assumptions CheckedWrapper.proof_of_equivalent_return_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_3_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_3.
