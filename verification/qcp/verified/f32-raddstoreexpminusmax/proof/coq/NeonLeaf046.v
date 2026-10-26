From ExpMinusMax Require Import NeonTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_1_pure:ExpMinusMax.neon_unit_goal.test_neon_partial_solve_wit_1_pure.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_partial_solve_wit_1_pure.
 emk_pure_goal.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_1_pure.
