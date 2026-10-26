From ExpMinusMax Require Import NeonTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_132:ExpMinusMax.neon_unit_goal.test_neon_partial_solve_wit_132.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_partial_solve_wit_132.
 em_intro;emk_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_132.
