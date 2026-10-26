From HwcConv Require Import Main443CallGeneralTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_7 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_7.
Proof. unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_7;intros;unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_7_aux;hcc_solve. Qed.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_7 := proof_of_test_neon_partial_solve_wit_7.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_7.
Print Assumptions Checked.ExactSecond.
