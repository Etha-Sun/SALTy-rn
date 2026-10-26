From HwcConv Require Import Main443BoundaryModFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_neon_raw hc_neon_pixel dw_arm_fma dw_arm_max dw_arm_min.
Module Checked.
Lemma proof_of_test_neon_entail_wit_1_2:HwcConv.neon_unit_goal.test_neon_entail_wit_1_2.
Proof.
 unfold HwcConv.neon_unit_goal.test_neon_entail_wit_1_2;right;intros;hmi_constants;subst.
 rewrite hc_progress_initial.
 unfold hc_same_bits in *;subst.
 hmb_entry_context2.
 hmb_frame.
 all:try solve[hmb_entry_dispatch2].
 Show.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_1_2.
