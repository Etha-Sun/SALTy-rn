From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8API Require Import neon_full_goal.
From Qd8Frame Require Import KernelFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_5:neon_full_goal.test_neon_partial_solve_wit_5.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_5;intros;timeout 1800 solve [qd8_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_11:neon_full_goal.test_neon_partial_solve_wit_11.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_11;intros;timeout 1800 solve [qd8_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_13:neon_full_goal.test_neon_partial_solve_wit_13.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_13;intros;timeout 1800 solve [qd8_frame]. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_5.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_11.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_13.
