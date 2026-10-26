From HwcConv Require Import Main443BoundaryOuterTactics.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_neon_raw hc_neon_pixel hc_neon_rows_fold hc_neon_row_group dw_arm_fma dw_arm_max dw_arm_min hc_progress hc_visible.
Module Checked.
Lemma proof_of_test_neon_entail_wit_6_3:HwcConv.neon_unit_goal.test_neon_entail_wit_6_3.
Proof.
 unfold HwcConv.neon_unit_goal.test_neon_entail_wit_6_3;left;intros;hmi_constants;subst;hmi_zero.
 hmb_outer_context.
 rewrite hcm_progress_next_row by lia.
 Exists LMax_2 LMin_2.
 hmb_outer_dispatch.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_6_3.
