From Coq Require Import ZArith Lia.
From VaddComparator Require Import ComparatorLogic comparator_strategy_goal comparator_strategy_proof comparator_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedComparator : comparator_goal.VC_Correct.
Include CheckedComparatorStrategies.
Lemma proof_of_compare_outputs_safety_wit_1 : compare_outputs_safety_wit_1.
Proof. unfold compare_outputs_safety_wit_1; try left; pre_process; unfold FloatArray.full; entailer!. Qed.
Lemma proof_of_compare_outputs_safety_wit_2 : compare_outputs_safety_wit_2.
Proof. unfold compare_outputs_safety_wit_2; try left; pre_process; unfold FloatArray.full; entailer!. Qed.
Lemma proof_of_compare_outputs_safety_wit_3 : compare_outputs_safety_wit_3.
Proof. unfold compare_outputs_safety_wit_3; try left; pre_process; unfold FloatArray.full; entailer!. Qed.
Lemma proof_of_compare_outputs_entail_wit_1 : compare_outputs_entail_wit_1.
Proof. unfold compare_outputs_entail_wit_1; left; intros right_pre left_pre n_pre rs ls Hpos Hbound Hrelated.
  prop_apply (FloatArray.full_Zlength left_pre n_pre ls).
  Intros_p Hlen. entailer!. Qed.
Lemma proof_of_compare_outputs_entail_wit_2 : compare_outputs_entail_wit_2.
Proof. unfold compare_outputs_entail_wit_2; try left; pre_process; unfold FloatArray.full; entailer!. Qed.
Lemma proof_of_compare_outputs_return_wit_1 : compare_outputs_return_wit_1.
Proof. unfold compare_outputs_return_wit_1; try left; pre_process; unfold FloatArray.full; entailer!. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_1_pure : compare_outputs_partial_solve_wit_1_pure.
Proof. unfold compare_outputs_partial_solve_wit_1_pure; try left; pre_process; unfold FloatArray.full; entailer!. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_1 : compare_outputs_partial_solve_wit_1.
Proof. unfold compare_outputs_partial_solve_wit_1, compare_outputs_partial_solve_wit_1_aux; intro _H; try left; pre_process; unfold FloatArray.full; entailer!. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_2_pure : compare_outputs_partial_solve_wit_2_pure.
Proof. unfold compare_outputs_partial_solve_wit_2_pure; try left; pre_process; unfold FloatArray.full; entailer!. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_2 : compare_outputs_partial_solve_wit_2.
Proof. unfold compare_outputs_partial_solve_wit_2, compare_outputs_partial_solve_wit_2_aux; intro _H; try left; pre_process; unfold FloatArray.full; entailer!. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_3_pure : compare_outputs_partial_solve_wit_3_pure.
Proof. unfold compare_outputs_partial_solve_wit_3_pure; try left; pre_process; unfold FloatArray.full; entailer!;
    eapply related_Znth; [eassumption | rewrite <- Zlength_correct; lia]. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_3 : compare_outputs_partial_solve_wit_3.
Proof. unfold compare_outputs_partial_solve_wit_3, compare_outputs_partial_solve_wit_3_aux; intro _H; try left; pre_process; unfold FloatArray.full; entailer!;
    eapply related_Znth; [eassumption | rewrite <- Zlength_correct; lia]. Qed.
End CheckedComparator.
Print Assumptions CheckedComparator.proof_of_compare_outputs_safety_wit_1.
Print Assumptions CheckedComparator.proof_of_compare_outputs_safety_wit_2.
Print Assumptions CheckedComparator.proof_of_compare_outputs_safety_wit_3.
Print Assumptions CheckedComparator.proof_of_compare_outputs_entail_wit_1.
Print Assumptions CheckedComparator.proof_of_compare_outputs_entail_wit_2.
Print Assumptions CheckedComparator.proof_of_compare_outputs_return_wit_1.
Print Assumptions CheckedComparator.proof_of_compare_outputs_partial_solve_wit_1_pure.
Print Assumptions CheckedComparator.proof_of_compare_outputs_partial_solve_wit_1.
Print Assumptions CheckedComparator.proof_of_compare_outputs_partial_solve_wit_2_pure.
Print Assumptions CheckedComparator.proof_of_compare_outputs_partial_solve_wit_2.
Print Assumptions CheckedComparator.proof_of_compare_outputs_partial_solve_wit_3_pure.
Print Assumptions CheckedComparator.proof_of_compare_outputs_partial_solve_wit_3.
