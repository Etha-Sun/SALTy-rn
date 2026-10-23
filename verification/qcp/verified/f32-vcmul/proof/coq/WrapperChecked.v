From Coq Require Import ZArith Lia.
From VCMul.wrapper Require Import wrapper_goal.
From VaddWrapper Require Import wrapper_strategy_proof.
From VCMul Require Import Model ComplexModel.
From VaddComparator Require Import comparator_strategy_proof ComparatorLogic.
From QcpRvv32 Require Import FastFrame.
Require Import ResultBridge.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma vcmul_batch_halves : forall n, Z.quot (n*4) 2=2*n.
Proof. intros;replace(n*4)with((2*n)*2)by ring;rewrite Z.quot_mul by lia;reflexivity. Qed.
(* Only normalize scalar size/arithmetic. Never unfold the array predicates or
   the nested params field address while cancelling the unchanged frame. *)
Ltac wrapper_norm :=
 change (sizeof(FLOAT)) with 4 in *;
 rewrite ?vcmul_batch_halves in *;
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

Module CheckedWrapper : VCMul.wrapper.wrapper_goal.VC_Correct.
Include CheckedComparatorStrategies.
Include CheckedWrapperStrategy.
Lemma proof_of_equivalent_safety_wit_1 : VCMul.wrapper.wrapper_goal.equivalent_safety_wit_1.
Proof. unfold VCMul.wrapper.wrapper_goal.equivalent_safety_wit_1;intros;wrapper_norm;wrapper_pure. Qed.

Lemma proof_of_equivalent_entail_wit_1 : VCMul.wrapper.wrapper_goal.equivalent_entail_wit_1.
Proof. unfold VCMul.wrapper.wrapper_goal.equivalent_entail_wit_1; right; intros; wrapper_norm; wrapper_pure. Qed.

Lemma proof_of_equivalent_return_wit_1 : VCMul.wrapper.wrapper_goal.equivalent_return_wit_1.
Proof. unfold VCMul.wrapper.wrapper_goal.equivalent_return_wit_1; right; intros; wrapper_norm; wrapper_pure. Qed.

Lemma proof_of_equivalent_partial_solve_wit_1_pure : VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_1_pure.
Proof. unfold VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_1_pure; intros; wrapper_norm; wrapper_pure. Qed.

Lemma proof_of_equivalent_partial_solve_wit_1 : VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_1.
Proof. unfold VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_1, VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_1_aux;
 intros _H; intros; wrapper_norm; wrapper_frame. Qed.

Lemma proof_of_equivalent_partial_solve_wit_2_pure : VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_2_pure.
Proof. unfold VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_2_pure; intros; wrapper_norm; wrapper_pure. Qed.

Lemma proof_of_equivalent_partial_solve_wit_2 : VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_2.
Proof. unfold VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_2, VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_2_aux;
 intros _H; intros; wrapper_norm; wrapper_frame. Qed.

Lemma proof_of_equivalent_partial_solve_wit_3_pure : VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_3_pure; right; intros; wrapper_norm; wrapper_pure. Qed.

Lemma proof_of_equivalent_partial_solve_wit_3 : VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_3.
Proof. unfold VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_3, VCMul.wrapper.wrapper_goal.equivalent_partial_solve_wit_3_aux;
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

Print Assumptions CheckedWrapper.proof_of_equivalent_safety_wit_1.
