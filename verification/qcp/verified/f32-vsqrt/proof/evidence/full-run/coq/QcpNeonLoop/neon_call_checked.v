Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeonLoop Require Import neon_loop_unit_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonCalls.
Lemma proof_of_test_neon_partial_solve_wit_1 : test_neon_partial_solve_wit_1.
Proof. unfold test_neon_partial_solve_wit_1. intros _. unfold test_neon_partial_solve_wit_1_aux. intros. entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_2 : test_neon_partial_solve_wit_2.
Proof. unfold test_neon_partial_solve_wit_2. intros _. unfold test_neon_partial_solve_wit_2_aux. intros. entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_3 : test_neon_partial_solve_wit_3.
Proof. unfold test_neon_partial_solve_wit_3. intros _. unfold test_neon_partial_solve_wit_3_aux. intros. entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_4 : test_neon_partial_solve_wit_4.
Proof. unfold test_neon_partial_solve_wit_4. intros _. unfold test_neon_partial_solve_wit_4_aux. intros. entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_5 : test_neon_partial_solve_wit_5.
Proof. unfold test_neon_partial_solve_wit_5. intros _. unfold test_neon_partial_solve_wit_5_aux. intros. entailer!. Qed.
End CheckedNeonCalls.
Print Assumptions CheckedNeonCalls.proof_of_test_neon_partial_solve_wit_1.
Print Assumptions CheckedNeonCalls.proof_of_test_neon_partial_solve_wit_2.
Print Assumptions CheckedNeonCalls.proof_of_test_neon_partial_solve_wit_3.
Print Assumptions CheckedNeonCalls.proof_of_test_neon_partial_solve_wit_4.
Print Assumptions CheckedNeonCalls.proof_of_test_neon_partial_solve_wit_5.
