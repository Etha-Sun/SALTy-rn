From HwcConv Require Import Main443CallWindowTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_46 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_46.
Proof. unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_46;intros;unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_46_aux;hcc_window_solve. Qed.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_46 := proof_of_test_neon_partial_solve_wit_46.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_46.
Print Assumptions Checked.ExactSecond.
