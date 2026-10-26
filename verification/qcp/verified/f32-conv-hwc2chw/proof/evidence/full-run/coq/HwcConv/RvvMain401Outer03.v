From HwcConv Require Import RvvMain401OuterTactics.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_rvv_raw hc_rvv_source_fold dw_rvv_fma hc_progress hc_visible.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_7_3:HwcConv.rvv_unit_goal.test_rvv_entail_wit_7_3.
Proof.
 unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_7_3;left;intros;hmi_constants;subst;hmi_zero.
 hmb_outer_context.
 rewrite hcm_progress_next_row by lia.
 hmb_outer_dispatch.
 Show.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_7_3.
