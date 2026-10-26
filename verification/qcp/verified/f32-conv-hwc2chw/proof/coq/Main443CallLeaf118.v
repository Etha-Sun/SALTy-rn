From HwcConv Require Import Main443CallGeneralTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_118 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_118.
Proof. unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_118;intros;unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_118_aux;hcc_general_solve. Qed.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_118 := proof_of_test_neon_partial_solve_wit_118.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_118.
Print Assumptions Checked.ExactSecond.
