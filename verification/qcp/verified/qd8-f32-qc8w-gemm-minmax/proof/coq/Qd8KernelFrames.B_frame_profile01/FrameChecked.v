From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8API Require Import neon_full_goal.
From Qd8Frame Require Import KernelFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_57:neon_full_goal.test_neon_partial_solve_wit_57.
Proof.
 Time (unfold neon_full_goal.test_neon_partial_solve_wit_57;intros).
 Time qd8_layout.
 Time (repeat progress rewrite <-logic_equiv_andp_assoc).
 Time (apply _derivable1_andp_intros).
 - Time (unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia).
 - Time qd8_forget_cells.
   Time opaque_leaves.
   Time sepcon_assoc_change.
   Time fast_cancel.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_57.
