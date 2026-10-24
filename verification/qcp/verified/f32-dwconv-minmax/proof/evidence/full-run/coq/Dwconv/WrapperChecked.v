From Coq Require Import ZArith Lia.
From Dwconv Require Import CompareSupport public_wrapper_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedWrapper : Dwconv.public_wrapper_goal.VC_Correct.
Lemma proof_of_equivalent_entail_wit_1 : Dwconv.public_wrapper_goal.equivalent_entail_wit_1.
Proof. unfold Dwconv.public_wrapper_goal.equivalent_entail_wit_1;left;dw_prepare.
assert(Hnd1:List.NoDup W1)by assumption.
assert(Hnd2:List.NoDup W2)by assumption.
prop_apply(dw_output_addresses_canonical W1(dw_neon_result F P D lo hi O1)Hnd1).
prop_apply(dw_output_addresses_canonical W2(dw_rvv_result F P(dw_rebase D out2)lo hi O2)Hnd2).
Intros.
assert(Hdomain1:dw_output_domain W1 D)by(eapply dw_valid_output_domain;eassumption).
assert(Hdomain2:dw_output_domain W2(dw_rebase D out2))by(eapply dw_valid_output_domain;eassumption).
assert(Hobserve:dw_pair_observed D out2(dw_neon_result F P D lo hi O1)(dw_rvv_result F P(dw_rebase D out2)lo hi O2)).
{ eapply dw_complete_outputs_observed;eassumption. }
dw_frame. Qed.
Lemma proof_of_equivalent_return_wit_1 : Dwconv.public_wrapper_goal.equivalent_return_wit_1.
Proof. unfold Dwconv.public_wrapper_goal.equivalent_return_wit_1;dw_compare_finish. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_1_pure.
Proof. unfold Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_1_pure;dw_compare_finish. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_1.
Proof. unfold Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_1,Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_1_aux;dw_compare_finish. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_2_pure.
Proof. unfold Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_2_pure;dw_compare_finish. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_2.
Proof. unfold Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_2,Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_2_aux;dw_compare_finish. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3_pure : Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_3_pure;dw_compare_finish. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3 : Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_3.
Proof. unfold Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_3,Dwconv.public_wrapper_goal.equivalent_partial_solve_wit_3_aux;dw_compare_finish. Qed.
Include Dwconv.MapStrategyChecked.CheckedMaps.
End CheckedWrapper.
Print Assumptions CheckedWrapper.proof_of_equivalent_entail_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_return_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_1.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_2.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_3_pure.
Print Assumptions CheckedWrapper.proof_of_equivalent_partial_solve_wit_3.
