From HwcConv Require Import RvvMain401AdvanceFacts.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_rvv_raw hc_rvv_source_fold dw_rvv_fma hc_progress hc_visible.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_6_2:HwcConv.rvv_unit_goal.test_rvv_entail_wit_6_2.
Proof.
 unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_6_2;hmi_prepare.
 assert(Hdone:ow_done=Z.quot(N+1)2)by lia;subst ow_done.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 rewrite hr401_finish_group_progress by lia.
 repeat Left.
 replace(Cn-0)with Cn by ring.
 assert(Hpending:forall p0 p1 p2 p3 q0 q1 q2 q3,
 hc_channel_pending Output Hs Cs Cn End output_y Cn p0 p1 p2 p3 q0 q1 q2 q3).
 { intros;unfold hc_channel_pending;intro;lia. }
 hr401g_dispatch.
 Show.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_6_2.
