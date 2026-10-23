From Coq Require Import ZArith Lia List.
From FMax Require Import ProgramModel Observation wrapper_unit_goal.
From QcpVadd Require Import array_read_checked.
From NanBridge Require Import bridge_checked.
From VaddComparator Require Import comparator_checked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedWrapperCalls.
Lemma proof_of_equivalent_safety_wit_1 : FMax.wrapper_unit_goal.equivalent_safety_wit_1.
Proof. unfold FMax.wrapper_unit_goal.equivalent_safety_wit_1;try left;pre_process;subst;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;entailer!;try lia. Qed.
Lemma proof_of_equivalent_safety_wit_2 : FMax.wrapper_unit_goal.equivalent_safety_wit_2.
Proof. unfold FMax.wrapper_unit_goal.equivalent_safety_wit_2;try left;pre_process;subst;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;entailer!;try lia. Qed.
Lemma proof_of_equivalent_entail_wit_1 : FMax.wrapper_unit_goal.equivalent_entail_wit_1.
Proof. unfold FMax.wrapper_unit_goal.equivalent_entail_wit_1;right;intros;
 replace (4*n_pre) with (n_pre*4) by ring;
 rewrite Z.rem_mul,Z.quot_mul by lia;entailer!. Qed.
Lemma proof_of_equivalent_entail_wit_2 : FMax.wrapper_unit_goal.equivalent_entail_wit_2.
Proof. unfold FMax.wrapper_unit_goal.equivalent_entail_wit_2;right;intros;
 unfold VaddComparator.ComparatorLogic.outputs_related;entailer!;
 apply FMax.Observation.mm_list_observation. Qed.
Lemma proof_of_equivalent_return_wit_1 : FMax.wrapper_unit_goal.equivalent_return_wit_1.
Proof. unfold FMax.wrapper_unit_goal.equivalent_return_wit_1;intros;Exists (mm_arm_values n_pre A B) (mm_rvv_values n_pre A B);entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : FMax.wrapper_unit_goal.equivalent_partial_solve_wit_1_pure.
Proof. unfold FMax.wrapper_unit_goal.equivalent_partial_solve_wit_1_pure;try left;pre_process;subst;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;entailer!;try lia. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : FMax.wrapper_unit_goal.equivalent_partial_solve_wit_1.
Proof. unfold FMax.wrapper_unit_goal.equivalent_partial_solve_wit_1, FMax.wrapper_unit_goal.equivalent_partial_solve_wit_1_aux;intros _;intros;rewrite <- PreH1;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : FMax.wrapper_unit_goal.equivalent_partial_solve_wit_2_pure.
Proof. unfold FMax.wrapper_unit_goal.equivalent_partial_solve_wit_2_pure;try left;pre_process;subst;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;entailer!;try lia. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : FMax.wrapper_unit_goal.equivalent_partial_solve_wit_2.
Proof. unfold FMax.wrapper_unit_goal.equivalent_partial_solve_wit_2, FMax.wrapper_unit_goal.equivalent_partial_solve_wit_2_aux;intros _;intros;rewrite <- PreH1;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3_pure : FMax.wrapper_unit_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold FMax.wrapper_unit_goal.equivalent_partial_solve_wit_3_pure;try left;pre_process;subst;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;entailer!;try lia. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3 : FMax.wrapper_unit_goal.equivalent_partial_solve_wit_3.
Proof. unfold FMax.wrapper_unit_goal.equivalent_partial_solve_wit_3, FMax.wrapper_unit_goal.equivalent_partial_solve_wit_3_aux;try left;pre_process;subst;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;entailer!;try lia. Qed.
End CheckedWrapperCalls.
