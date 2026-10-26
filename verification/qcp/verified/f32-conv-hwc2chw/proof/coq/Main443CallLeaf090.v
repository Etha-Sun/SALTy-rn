From HwcConv Require Import Main443CallGeneralTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_90 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_90.
Proof. unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_90;intros;hcc_solve. Qed.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_90 := proof_of_test_neon_partial_solve_wit_90.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_90.
Print Assumptions Checked.ExactSecond.
