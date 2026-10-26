From HwcConv Require Import Main443V4InitExtras.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_neon_raw hc_neon_pixel hc_neon_rows_fold hc_neon_row_group dw_arm_fma dw_arm_max dw_arm_min hc_progress hc_visible.
Module Checked.
Lemma proof_of_test_neon_entail_wit_2_23:HwcConv.neon_unit_goal.test_neon_entail_wit_2_23.
Proof.
 unfold HwcConv.neon_unit_goal.test_neon_entail_wit_2_23;left;hmi_prepare;hmi_context.
 Exists LMax_2 LMin_2.
 hmi_init_dispatch3.
 all:try solve[hmi_v4_output].
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_2_23.
