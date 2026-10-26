From HwcConv Require Import Main443AdvancedPureTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_65_pure : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_65_pure.
Proof.
 unfold HwcConv.neon_unit_goal.test_neon_partial_solve_wit_65_pure;right;intros;hcm_constants;subst;hcm_domain;hcp_columns.
 pose proof(hcm_word_quot_index N 3 ltac:(lia) ltac:(split;lia))as[Hq0 Hq1].
 repeat rewrite Z.quot_div_nonneg in Hq0,Hq1 by lia.
 rewrite Hq1.
 entailer!;lia.
Qed.
Definition ExactSecond : HwcConv.neon_unit_goal.test_neon_partial_solve_wit_65_pure := proof_of_test_neon_partial_solve_wit_65_pure.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_65_pure.
Print Assumptions Checked.ExactSecond.
