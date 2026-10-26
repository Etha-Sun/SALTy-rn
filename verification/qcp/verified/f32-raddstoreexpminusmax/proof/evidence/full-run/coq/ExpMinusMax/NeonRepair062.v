From ExpMinusMax Require Import NeonRepairTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_9:ExpMinusMax.neon_unit_goal.test_neon_partial_solve_wit_9.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_partial_solve_wit_9,ExpMinusMax.neon_unit_goal.test_neon_partial_solve_wit_9_aux.
 em_intro;emkx_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_9.
