From HwcConv Require Import Main443CallGeneralTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_113 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_113.
Proof. unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_113;intros;unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_113_aux;hcc_general_solve. Qed.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_113 := proof_of_test_neon_partial_solve_wit_113.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_113.
Print Assumptions Checked.ExactSecond.
