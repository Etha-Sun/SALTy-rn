From ExpMinusMax Require Import NeonTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_2:ExpMinusMax.neon_unit_goal.test_neon_partial_solve_wit_2.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_partial_solve_wit_2,ExpMinusMax.neon_unit_goal.test_neon_partial_solve_wit_2_aux.
 em_intro;emk_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_2.
