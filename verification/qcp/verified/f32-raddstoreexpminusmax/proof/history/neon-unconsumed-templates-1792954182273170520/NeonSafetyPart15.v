From ExpMinusMax Require Import NeonTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_safety_wit_16:ExpMinusMax.neon_unit_goal.test_neon_safety_wit_16.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_safety_wit_16.
 emk_pure_goal.
Qed.
Lemma proof_of_test_neon_safety_wit_32:ExpMinusMax.neon_unit_goal.test_neon_safety_wit_32.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_safety_wit_32.
 emk_pure_goal.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_safety_wit_16.
Print Assumptions Checked.proof_of_test_neon_safety_wit_32.
