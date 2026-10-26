From ExpMinusMax Require Import NeonTactics neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_which_implies_wit_11:ExpMinusMax.neon_unit_goal.test_neon_which_implies_wit_11.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_which_implies_wit_11.
 left;intros;first[apply em_record_stage_exact|apply em_record_stage_i4|apply em_record_stage_u4].
Qed.
Lemma proof_of_test_neon_which_implies_wit_27:ExpMinusMax.neon_unit_goal.test_neon_which_implies_wit_27.
Proof. unfold ExpMinusMax.neon_unit_goal.test_neon_which_implies_wit_27.
 left;intros;first[apply em_record_stage_exact|apply em_record_stage_i4|apply em_record_stage_u4].
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_which_implies_wit_11.
Print Assumptions Checked.proof_of_test_neon_which_implies_wit_27.
