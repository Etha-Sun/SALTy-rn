From HwcConv Require Import RvvMain401ChannelTactics.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_rvv_raw hc_rvv_source_fold dw_rvv_fma hc_progress hc_visible.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_5_1:HwcConv.rvv_unit_goal.test_rvv_entail_wit_5_1.
Proof.
 unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_5_1;left;hmi_prepare.
 hr401_channel_context.
 assert(Hcsmall:c=1)by lia;subst c.
 hr401_channel_preaddress;hr401_channel_prerows;hr401g_dispatch.
 Show.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_5_1.
