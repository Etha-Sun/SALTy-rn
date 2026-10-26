From HwcConv Require Import Main443CallGeneralTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_76 : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_76.
Proof. unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_76;intros;hcc_solve. Qed.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_76 := proof_of_test_neon_partial_solve_wit_76.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_76.
Print Assumptions Checked.ExactSecond.
