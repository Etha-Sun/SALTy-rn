From Coq Require Import ZArith Lia.
From ExpMinusMax Require Import PublicModel RvvTactics public_caller_goal.
Import Snaive_C_Rules64. Local Open Scope sac. Local Open Scope Z_scope.
Module CheckedPublicCaller:ExpMinusMax.public_caller_goal.VC_Correct.
Lemma proof_of_expminusmax_checked_pair_safety_wit_1:ExpMinusMax.public_caller_goal.expminusmax_checked_pair_safety_wit_1.
Proof. unfold ExpMinusMax.public_caller_goal.expminusmax_checked_pair_safety_wit_1.
 em_intro;try unfold em_pair_result;try(lazymatch goal with H:em_valid ?F ?W ?P ?M ?Q ?S ?N|-_=>let HO:=fresh in assert(HO:em_pair_observation F P M Q S N O)by(apply em_pair_observation_correct;unfold em_valid in H;lia)end);emkf_frame.
Qed.
Lemma proof_of_expminusmax_checked_pair_return_wit_1:ExpMinusMax.public_caller_goal.expminusmax_checked_pair_return_wit_1.
Proof. unfold ExpMinusMax.public_caller_goal.expminusmax_checked_pair_return_wit_1.
 em_intro;try unfold em_pair_result;try(lazymatch goal with H:em_valid ?F ?W ?P ?M ?Q ?S ?N|-_=>let HO:=fresh in assert(HO:em_pair_observation F P M Q S N O)by(apply em_pair_observation_correct;unfold em_valid in H;lia)end);emkf_frame.
Qed.
Lemma proof_of_expminusmax_checked_pair_partial_solve_wit_1_pure:ExpMinusMax.public_caller_goal.expminusmax_checked_pair_partial_solve_wit_1_pure.
Proof. unfold ExpMinusMax.public_caller_goal.expminusmax_checked_pair_partial_solve_wit_1_pure.
 em_intro;try unfold em_pair_result;try(lazymatch goal with H:em_valid ?F ?W ?P ?M ?Q ?S ?N|-_=>let HO:=fresh in assert(HO:em_pair_observation F P M Q S N O)by(apply em_pair_observation_correct;unfold em_valid in H;lia)end);emkf_frame.
Qed.
Lemma proof_of_expminusmax_checked_pair_partial_solve_wit_1:ExpMinusMax.public_caller_goal.expminusmax_checked_pair_partial_solve_wit_1.
Proof. unfold ExpMinusMax.public_caller_goal.expminusmax_checked_pair_partial_solve_wit_1,ExpMinusMax.public_caller_goal.expminusmax_checked_pair_partial_solve_wit_1_aux.
 em_intro;try unfold em_pair_result;try(lazymatch goal with H:em_valid ?F ?W ?P ?M ?Q ?S ?N|-_=>let HO:=fresh in assert(HO:em_pair_observation F P M Q S N O)by(apply em_pair_observation_correct;unfold em_valid in H;lia)end);emkf_frame.
Qed.
Lemma proof_of_expminusmax_checked_pair_partial_solve_wit_2_pure:ExpMinusMax.public_caller_goal.expminusmax_checked_pair_partial_solve_wit_2_pure.
Proof. unfold ExpMinusMax.public_caller_goal.expminusmax_checked_pair_partial_solve_wit_2_pure.
 em_intro;try unfold em_pair_result;try(lazymatch goal with H:em_valid ?F ?W ?P ?M ?Q ?S ?N|-_=>let HO:=fresh in assert(HO:em_pair_observation F P M Q S N O)by(apply em_pair_observation_correct;unfold em_valid in H;lia)end);emkf_frame.
Qed.
Lemma proof_of_expminusmax_checked_pair_partial_solve_wit_2:ExpMinusMax.public_caller_goal.expminusmax_checked_pair_partial_solve_wit_2.
Proof. unfold ExpMinusMax.public_caller_goal.expminusmax_checked_pair_partial_solve_wit_2,ExpMinusMax.public_caller_goal.expminusmax_checked_pair_partial_solve_wit_2_aux.
 em_intro;try unfold em_pair_result;try(lazymatch goal with H:em_valid ?F ?W ?P ?M ?Q ?S ?N|-_=>let HO:=fresh in assert(HO:em_pair_observation F P M Q S N O)by(apply em_pair_observation_correct;unfold em_valid in H;lia)end);emkf_frame.
Qed.
End CheckedPublicCaller.
Module ExactPublicCaller:ExpMinusMax.public_caller_goal.VC_Correct:=CheckedPublicCaller.
Print Assumptions ExactPublicCaller.proof_of_expminusmax_checked_pair_safety_wit_1.
Print Assumptions ExactPublicCaller.proof_of_expminusmax_checked_pair_return_wit_1.
Print Assumptions ExactPublicCaller.proof_of_expminusmax_checked_pair_partial_solve_wit_1_pure.
Print Assumptions ExactPublicCaller.proof_of_expminusmax_checked_pair_partial_solve_wit_1.
Print Assumptions ExactPublicCaller.proof_of_expminusmax_checked_pair_partial_solve_wit_2_pure.
Print Assumptions ExactPublicCaller.proof_of_expminusmax_checked_pair_partial_solve_wit_2.
