From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From SpmmSpec Require Import Memory tuple_strategy_proof.
From SpmmVectors Require Import vectors_strategy_proof.
From SpmmCaller Require Import caller_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: VC_Correct.
Include TupleChecked.
Include SpmmVectors.vectors_strategy_proof.Checked.
Lemma proof_of_equivalent_safety_wit_1 : equivalent_safety_wit_1.
Proof. unfold equivalent_safety_wit_1;intros;entailer!;try (unfold INT_MAX,INT_MIN;lia). Qed.
Lemma proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Proof. unfold equivalent_return_wit_1;intros;entailer!;try (unfold INT_MAX,INT_MIN;lia). Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Proof. unfold equivalent_partial_solve_wit_1_pure;intros;entailer!;try (unfold INT_MAX,INT_MIN;lia). Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Proof. unfold equivalent_partial_solve_wit_1, equivalent_partial_solve_wit_1_aux;intros;entailer!;try (unfold INT_MAX,INT_MIN;lia). Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Proof. unfold equivalent_partial_solve_wit_2_pure;intros;entailer!;try (unfold INT_MAX,INT_MIN;lia). Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Proof. unfold equivalent_partial_solve_wit_2, equivalent_partial_solve_wit_2_aux;intros;entailer!;try (unfold INT_MAX,INT_MIN;lia). Qed.
End Checked.
Print Assumptions Checked.proof_of_equivalent_safety_wit_1.
Print Assumptions Checked.proof_of_equivalent_return_wit_1.
Print Assumptions Checked.proof_of_equivalent_partial_solve_wit_1_pure.
Print Assumptions Checked.proof_of_equivalent_partial_solve_wit_1.
Print Assumptions Checked.proof_of_equivalent_partial_solve_wit_2_pure.
Print Assumptions Checked.proof_of_equivalent_partial_solve_wit_2.
