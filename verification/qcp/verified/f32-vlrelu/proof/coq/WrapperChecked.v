From Coq Require Import ZArith Lia.
From VLRelu.wrapper Require Import wrapper_goal.
From VaddWrapper Require Import wrapper_strategy_proof.
From VLRelu Require Import Model.
From VaddComparator Require Import comparator_strategy_proof ComparatorLogic.
From QcpRvv32 Require Import FastFrame.
Require Import ResultBridge.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* Only normalize scalar size/arithmetic. Never unfold the array predicates or
   the nested params field address while cancelling the unchanged frame. *)
Ltac wrapper_norm :=
 change (sizeof(FLOAT)) with 4 in *;
 repeat rewrite Z.quot_mul in * by lia;
 repeat rewrite Z.rem_mul in * by lia.
Ltac wrapper_pure :=
 repeat match goal with |- _ |-- _ && _ => apply _derivable1_andp_intros end;
 first [solve [apply derivable1_andp_elim2]
       |solve [unfold derivable1, coq_prop; intros;
               first [assumption | reflexivity | lia | apply identical_outputs_are_related]]].
Ltac wrapper_frame :=
 repeat match goal with |- _ |-- _ && _ => apply _derivable1_andp_intros end;
 try solve [repeat rewrite <- logic_equiv_sepcon_assoc; fast_cancel];
 try solve [wrapper_pure].

Module CheckedWrapper : wrapper_goal.VC_Correct.
Include CheckedComparatorStrategies.
Include CheckedWrapperStrategy.

Lemma proof_of_equivalent_entail_wit_1 : equivalent_entail_wit_1.
Proof. unfold equivalent_entail_wit_1; right; intros; wrapper_norm; wrapper_pure. Qed.

Lemma proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Proof. unfold equivalent_return_wit_1; right; intros; wrapper_norm; wrapper_pure. Qed.

Lemma proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Proof. unfold equivalent_partial_solve_wit_1_pure; intros; wrapper_norm; wrapper_pure. Qed.

Lemma proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Proof. unfold equivalent_partial_solve_wit_1, equivalent_partial_solve_wit_1_aux;
 intros _H; intros; wrapper_norm; wrapper_frame. Qed.

Lemma proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Proof. unfold equivalent_partial_solve_wit_2_pure; intros; wrapper_norm; wrapper_pure. Qed.

Lemma proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Proof. unfold equivalent_partial_solve_wit_2, equivalent_partial_solve_wit_2_aux;
 intros _H; intros; wrapper_norm; wrapper_frame. Qed.

Lemma proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Proof. unfold equivalent_partial_solve_wit_3_pure; right; intros; wrapper_norm; wrapper_pure. Qed.

Lemma proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.
Proof. unfold equivalent_partial_solve_wit_3, equivalent_partial_solve_wit_3_aux;
 intros _H; intros; wrapper_norm; wrapper_frame. Qed.
End CheckedWrapper.

Print Assumptions CheckedWrapper.proof_of_equivalent_entail_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_return_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_3_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_3.
