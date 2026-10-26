From ExpMinusMax Require Import NeonTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_safety_wit_12:ExpMinusMax.neon_unit_goal.test_neon_safety_wit_12.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_safety_wit_12.
 emk_pure_goal.
Qed.
Lemma proof_of_test_neon_safety_wit_28:ExpMinusMax.neon_unit_goal.test_neon_safety_wit_28.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_safety_wit_28.
 emk_pure_goal.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_safety_wit_12.
Print Assumptions Checked.proof_of_test_neon_safety_wit_28.
