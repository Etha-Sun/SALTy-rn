From Coq Require Import ZArith Lia String.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullU8 Require Import U8Logic U8KernelLogic arrays_strategy_goal arrays_strategy_proof.
From U8Public Require Import public_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedCaller.
Lemma proof_of_equivalent_safety_wit_1 : equivalent_safety_wit_1.
Proof. unfold equivalent_safety_wit_1;intros; entailer!. Qed.
Lemma proof_of_equivalent_safety_wit_2 : equivalent_safety_wit_2.
Proof. unfold equivalent_safety_wit_2;intros; entailer!. Qed.
Lemma proof_of_equivalent_entail_wit_1 : equivalent_entail_wit_1.
Proof. unfold equivalent_entail_wit_1;intros; entailer!. Qed.
Lemma proof_of_equivalent_entail_wit_2 : equivalent_entail_wit_2.
Proof. unfold equivalent_entail_wit_2;intros; entailer!. Qed.
Lemma proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Proof. unfold equivalent_return_wit_1;intros; entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Proof. unfold equivalent_partial_solve_wit_1_pure;intros; entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Proof. unfold equivalent_partial_solve_wit_1,equivalent_partial_solve_wit_1_aux;intros; entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Proof. unfold equivalent_partial_solve_wit_2_pure;intros; entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Proof. unfold equivalent_partial_solve_wit_2,equivalent_partial_solve_wit_2_aux;intros; entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.
Proof. unfold equivalent_partial_solve_wit_3;intros; sep_apply(UCharArray.full_split_to_missing_i left_pre i n_pre (u8_phase_all n_pre (u8_bound lo) (u8_bound hi) A) 0);[|lia];unfold StoreUCharAsElement.storeA;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_4 : equivalent_partial_solve_wit_4.
Proof. unfold equivalent_partial_solve_wit_4;intros; sep_apply(UCharArray.full_split_to_missing_i right_pre i n_pre (u8_phase_all n_pre (u8_bound lo) (u8_bound hi) A) 0);[|lia];unfold StoreUCharAsElement.storeA;entailer!. Qed.
End CheckedCaller.
Print Assumptions CheckedCaller.proof_of_equivalent_safety_wit_1.
Print Assumptions CheckedCaller.proof_of_equivalent_safety_wit_2.
Print Assumptions CheckedCaller.proof_of_equivalent_entail_wit_1.
Print Assumptions CheckedCaller.proof_of_equivalent_entail_wit_2.
Print Assumptions CheckedCaller.proof_of_equivalent_return_wit_1.
Print Assumptions CheckedCaller.proof_of_equivalent_partial_solve_wit_1_pure.
Print Assumptions CheckedCaller.proof_of_equivalent_partial_solve_wit_1.
Print Assumptions CheckedCaller.proof_of_equivalent_partial_solve_wit_2_pure.
Print Assumptions CheckedCaller.proof_of_equivalent_partial_solve_wit_2.
Print Assumptions CheckedCaller.proof_of_equivalent_partial_solve_wit_3.
Print Assumptions CheckedCaller.proof_of_equivalent_partial_solve_wit_4.
