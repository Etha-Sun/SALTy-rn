From HwcConv Require Import Main443CallGeneralTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_65 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_65.
Proof. unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_65;intros;unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_65_aux;hcc_general_solve. Qed.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_65 := proof_of_test_neon_partial_solve_wit_65.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_65.
Print Assumptions Checked.ExactSecond.
