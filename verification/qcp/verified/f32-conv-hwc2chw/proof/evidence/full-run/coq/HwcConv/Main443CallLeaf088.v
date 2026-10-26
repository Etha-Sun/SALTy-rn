From HwcConv Require Import Main443CallGeneralTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_88 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_88.
Proof. unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_88;intros;hcc_solve. Qed.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_88 := proof_of_test_neon_partial_solve_wit_88.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_88.
Print Assumptions Checked.ExactSecond.
