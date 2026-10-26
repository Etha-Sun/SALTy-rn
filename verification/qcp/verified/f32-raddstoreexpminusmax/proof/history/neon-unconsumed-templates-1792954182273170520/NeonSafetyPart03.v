From ExpMinusMax Require Import NeonTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_safety_wit_4:ExpMinusMax.neon_unit_goal.test_neon_safety_wit_4.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_safety_wit_4.
 emk_pure_goal.
Qed.
Lemma proof_of_test_neon_safety_wit_20:ExpMinusMax.neon_unit_goal.test_neon_safety_wit_20.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_safety_wit_20.
 emk_pure_goal.
Qed.
Lemma proof_of_test_neon_safety_wit_36:ExpMinusMax.neon_unit_goal.test_neon_safety_wit_36.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_safety_wit_36.
 emk_pure_goal.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_safety_wit_4.
Print Assumptions Checked.proof_of_test_neon_safety_wit_20.
Print Assumptions Checked.proof_of_test_neon_safety_wit_36.
