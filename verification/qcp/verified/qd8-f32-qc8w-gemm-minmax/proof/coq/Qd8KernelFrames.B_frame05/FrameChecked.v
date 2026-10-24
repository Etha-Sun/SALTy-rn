From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8API Require Import neon_full_goal.
From Qd8Frame Require Import KernelFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_27:neon_full_goal.test_neon_partial_solve_wit_27.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_27;intros;timeout 1800 solve [qd8_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_29:neon_full_goal.test_neon_partial_solve_wit_29.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_29;intros;timeout 1800 solve [qd8_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_31:neon_full_goal.test_neon_partial_solve_wit_31.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_31;intros;timeout 1800 solve [qd8_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_33:neon_full_goal.test_neon_partial_solve_wit_33.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_33;intros;timeout 1800 solve [qd8_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_35:neon_full_goal.test_neon_partial_solve_wit_35.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_35;intros;timeout 1800 solve [qd8_frame]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_37:neon_full_goal.test_neon_partial_solve_wit_37.
Proof. unfold neon_full_goal.test_neon_partial_solve_wit_37;intros;timeout 1800 solve [qd8_frame]. Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_27.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_29.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_31.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_33.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_35.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_37.
