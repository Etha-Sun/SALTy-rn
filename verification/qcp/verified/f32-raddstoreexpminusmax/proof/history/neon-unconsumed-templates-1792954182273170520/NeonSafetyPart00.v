From ExpMinusMax Require Import NeonTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_safety_wit_1:ExpMinusMax.neon_unit_goal.test_neon_safety_wit_1.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_safety_wit_1.
 emk_pure_goal.
Qed.
Lemma proof_of_test_neon_safety_wit_17:ExpMinusMax.neon_unit_goal.test_neon_safety_wit_17.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_safety_wit_17.
 emk_pure_goal.
Qed.
Lemma proof_of_test_neon_safety_wit_33:ExpMinusMax.neon_unit_goal.test_neon_safety_wit_33.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_safety_wit_33.
 emk_pure_goal.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_safety_wit_1.
Print Assumptions Checked.proof_of_test_neon_safety_wit_17.
Print Assumptions Checked.proof_of_test_neon_safety_wit_33.
