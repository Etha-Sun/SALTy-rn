From X32Transpose Require Import ObservationFacts Types caller_goal.
From Coq Require Import ZArith Lia.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedCaller:X32Transpose.caller_goal.VC_Correct.
Lemma proof_of_test_equivalence_safety_wit_1:X32Transpose.caller_goal.test_equivalence_safety_wit_1.
Proof. unfold X32Transpose.caller_goal.test_equivalence_safety_wit_1;intros;subst.
entailer!;try lia;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_equivalence_return_wit_1:X32Transpose.caller_goal.test_equivalence_return_wit_1.
Proof. unfold X32Transpose.caller_goal.test_equivalence_return_wit_1;right;intros;pose proof(xt_result_chain F G old R_2 R_3 PreH5 PreH3)as Hresult;entailer!. Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_1:X32Transpose.caller_goal.test_equivalence_partial_solve_wit_1.
Proof. unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_1;intros;subst.
entailer!;try lia;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_2_pure:X32Transpose.caller_goal.test_equivalence_partial_solve_wit_2_pure.
Proof. unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_2_pure;try left;intros;subst.
entailer!;try lia;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_2:X32Transpose.caller_goal.test_equivalence_partial_solve_wit_2.
Proof. unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_2;intro Hpure;unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_2_aux;intros;subst.
entailer!;try lia;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_3_pure:X32Transpose.caller_goal.test_equivalence_partial_solve_wit_3_pure.
Proof. unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_3_pure;try left;intros;subst.
assert(Hvalid:xt_valid F W G)by assumption.
pose proof(xt_observation_access F W G row_pre column_pre Hvalid ltac:(lia)ltac:(lia))as[Hnd[Hpos Hin]].
assert(Hpoint:xt_output_exact R(xt_observation_address(xt_output_base G)(xt_output_stride G)row_pre column_pre)(xt_get F(xt_input_address G row_pre column_pre))).
{ eapply xt_result_observation;[exact Hvalid|lia|lia|eassumption]. }
entailer!;try lia;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_3:X32Transpose.caller_goal.test_equivalence_partial_solve_wit_3.
Proof. unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_3;intro Hpure;unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_3_aux;intros;subst.
assert(Hvalid:xt_valid F W G)by assumption.
pose proof(xt_observation_access F W G row_pre column_pre Hvalid ltac:(lia)ltac:(lia))as[Hnd[Hpos Hin]].
assert(Hpoint:xt_output_exact R(xt_observation_address(xt_output_base G)(xt_output_stride G)row_pre column_pre)(xt_get F(xt_input_address G row_pre column_pre))).
{ eapply xt_result_observation;[exact Hvalid|lia|lia|eassumption]. }
entailer!;try lia;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_4_pure:X32Transpose.caller_goal.test_equivalence_partial_solve_wit_4_pure.
Proof. unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_4_pure;try left;intros;subst.
entailer!;try lia;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_4:X32Transpose.caller_goal.test_equivalence_partial_solve_wit_4.
Proof. unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_4;intro Hpure;unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_4_aux;intros;subst.
entailer!;try lia;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_5_pure:X32Transpose.caller_goal.test_equivalence_partial_solve_wit_5_pure.
Proof. unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_5_pure;try left;intros;subst.
assert(Hvalid:xt_valid F W G)by assumption.
pose proof(xt_observation_access F W G row_pre column_pre Hvalid ltac:(lia)ltac:(lia))as[Hnd[Hpos Hin]].
assert(Hpoint:xt_output_exact R(xt_observation_address(xt_output_base G)(xt_output_stride G)row_pre column_pre)(xt_get F(xt_input_address G row_pre column_pre))).
{ eapply xt_result_observation;[exact Hvalid|lia|lia|eassumption]. }
entailer!;try lia;try(subst;apply derivable1_refl). Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_5:X32Transpose.caller_goal.test_equivalence_partial_solve_wit_5.
Proof. unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_5;intro Hpure;unfold X32Transpose.caller_goal.test_equivalence_partial_solve_wit_5_aux;intros;subst.
assert(Hvalid:xt_valid F W G)by assumption.
pose proof(xt_observation_access F W G row_pre column_pre Hvalid ltac:(lia)ltac:(lia))as[Hnd[Hpos Hin]].
assert(Hpoint:xt_output_exact R(xt_observation_address(xt_output_base G)(xt_output_stride G)row_pre column_pre)(xt_get F(xt_input_address G row_pre column_pre))).
{ eapply xt_result_observation;[exact Hvalid|lia|lia|eassumption]. }
entailer!;try lia;try(subst;apply derivable1_refl). Qed.
End CheckedCaller.
Module CallerExact:X32Transpose.caller_goal.VC_Correct:=CheckedCaller.
Print Assumptions CheckedCaller.proof_of_test_equivalence_safety_wit_1.
Print Assumptions CheckedCaller.proof_of_test_equivalence_return_wit_1.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_1.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_2_pure.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_2.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_3_pure.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_3.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_4_pure.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_4.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_5_pure.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_5.
