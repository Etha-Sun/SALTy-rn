From Coq Require Import ZArith Lia.
From VaddWrapper Require Import wrapper_goal wrapper_strategy_proof.
From VaddComparator Require Import comparator_strategy_proof ComparatorLogic.
Require Import ResultBridge.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac wrapper_finish :=
  try left; pre_process; csimpl;
  cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
  repeat rewrite Z.quot_mul by lia;
  entailer!; try apply identical_outputs_are_related;
  try apply addr_of_LE_var_not_zero;
  try rewrite Z.rem_mul by lia; try lia.
Module CheckedWrapper : wrapper_goal.VC_Correct.
Include CheckedComparatorStrategies.
Include CheckedWrapperStrategy.
Lemma proof_of_equivalent_safety_wit_1 : equivalent_safety_wit_1.
Proof. unfold equivalent_safety_wit_1; wrapper_finish. Qed.
Lemma proof_of_equivalent_entail_wit_1 : equivalent_entail_wit_1.
Proof. unfold equivalent_entail_wit_1; wrapper_finish. Qed.
Lemma proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Proof.
 unfold equivalent_return_wit_1; intros; csimpl.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 rewrite Z.quot_mul by lia.
 Exists (VaddBits.vadd_values n_pre A B) (VaddBits.vadd_values n_pre A B).
 entailer!.
Qed.

Lemma proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Proof. unfold equivalent_partial_solve_wit_1_pure; wrapper_finish. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Proof. unfold equivalent_partial_solve_wit_1, equivalent_partial_solve_wit_1_aux; intro _H; wrapper_finish. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Proof. unfold equivalent_partial_solve_wit_2_pure; wrapper_finish. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Proof. unfold equivalent_partial_solve_wit_2, equivalent_partial_solve_wit_2_aux; intro _H; wrapper_finish. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Proof. unfold equivalent_partial_solve_wit_3_pure; wrapper_finish. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.
Proof. unfold equivalent_partial_solve_wit_3, equivalent_partial_solve_wit_3_aux; intro _H; wrapper_finish. Qed.
End CheckedWrapper.
Print Assumptions CheckedWrapper.proof_of_equivalent_safety_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_entail_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_return_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_3_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_3.
