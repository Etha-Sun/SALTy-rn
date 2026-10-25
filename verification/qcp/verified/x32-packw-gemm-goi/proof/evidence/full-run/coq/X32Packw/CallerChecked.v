From Coq Require Import ZArith List Lia.
From X32Packw Require Import MainAccessFacts ObservationFacts caller_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Ltac pw_caller_auto:=
 intros;subst;unfold pw_exact,pw_observation in *;
 try rewrite pw_program_idempotent in *;
 try match goal with H:pw_program_storage ?F ?W ?G |- _=>
 let Hc:=fresh"Hnodup"in pose proof H as Hc;unfold pw_program_storage in Hc;destruct Hc as[_[Hc _]] end;
 solve[entailer!].
Module CheckedCaller : X32Packw.caller_goal.VC_Correct.
Lemma proof_of_test_equivalence_safety_wit_1:test_equivalence_safety_wit_1.
Proof. unfold test_equivalence_safety_wit_1.
 first[solve[right;pw_caller_auto]|solve[left;pw_caller_auto]|solve[pw_caller_auto]].
Qed.
Lemma proof_of_test_equivalence_return_wit_1:test_equivalence_return_wit_1.
Proof. unfold test_equivalence_return_wit_1.
 first[solve[right;pw_caller_auto]|solve[left;pw_caller_auto]|solve[pw_caller_auto]].
Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_1_pure:test_equivalence_partial_solve_wit_1_pure.
Proof. unfold test_equivalence_partial_solve_wit_1_pure.
 first[solve[right;pw_caller_auto]|solve[left;pw_caller_auto]|solve[pw_caller_auto]].
Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_1:test_equivalence_partial_solve_wit_1.
Proof. unfold test_equivalence_partial_solve_wit_1, test_equivalence_partial_solve_wit_1_aux.
 first[solve[right;pw_caller_auto]|solve[left;pw_caller_auto]|solve[pw_caller_auto]].
Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_2_pure:test_equivalence_partial_solve_wit_2_pure.
Proof. unfold test_equivalence_partial_solve_wit_2_pure.
 first[solve[right;pw_caller_auto]|solve[left;pw_caller_auto]|solve[pw_caller_auto]].
Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_2:test_equivalence_partial_solve_wit_2.
Proof. unfold test_equivalence_partial_solve_wit_2, test_equivalence_partial_solve_wit_2_aux.
 first[solve[right;pw_caller_auto]|solve[left;pw_caller_auto]|solve[pw_caller_auto]].
Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_3_pure:test_equivalence_partial_solve_wit_3_pure.
Proof. unfold test_equivalence_partial_solve_wit_3_pure.
 first[solve[right;pw_caller_auto]|solve[left;pw_caller_auto]|solve[pw_caller_auto]].
Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_3:test_equivalence_partial_solve_wit_3.
Proof. unfold test_equivalence_partial_solve_wit_3, test_equivalence_partial_solve_wit_3_aux.
 first[solve[right;pw_caller_auto]|solve[left;pw_caller_auto]|solve[pw_caller_auto]].
Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_4_pure:test_equivalence_partial_solve_wit_4_pure.
Proof. unfold test_equivalence_partial_solve_wit_4_pure.
 first[solve[right;pw_caller_auto]|solve[left;pw_caller_auto]|solve[pw_caller_auto]].
Qed.
Lemma proof_of_test_equivalence_partial_solve_wit_4:test_equivalence_partial_solve_wit_4.
Proof. unfold test_equivalence_partial_solve_wit_4, test_equivalence_partial_solve_wit_4_aux.
 first[solve[right;pw_caller_auto]|solve[left;pw_caller_auto]|solve[pw_caller_auto]].
Qed.
End CheckedCaller.
Module CallerExact : X32Packw.caller_goal.VC_Correct := CheckedCaller.
Print Assumptions CheckedCaller.proof_of_test_equivalence_safety_wit_1.
Print Assumptions CheckedCaller.proof_of_test_equivalence_return_wit_1.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_1_pure.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_1.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_2_pure.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_2.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_3_pure.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_3.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_4_pure.
Print Assumptions CheckedCaller.proof_of_test_equivalence_partial_solve_wit_4.
