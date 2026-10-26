From HwcConv Require Import Main443CallTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_26 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_26.
Proof. unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_26;intros;hcc_solve. Qed.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_26 := proof_of_test_neon_partial_solve_wit_26.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_26.
Print Assumptions Checked.ExactSecond.
