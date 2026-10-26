From HwcConv Require Import Main443CallTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_1 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_1.
Proof. unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_1;intros;unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_1_aux;hcc_solve. Qed.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_1 := proof_of_test_neon_partial_solve_wit_1.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_1.
Print Assumptions Checked.ExactSecond.
