From ExpMinusMax Require Import NeonTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_which_implies_wit_15:ExpMinusMax.neon_unit_goal.test_neon_which_implies_wit_15.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_which_implies_wit_15.
 left;intros;first[apply em_record_stage_exact|apply em_record_stage_i4|apply em_record_stage_u4].
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_which_implies_wit_15.
