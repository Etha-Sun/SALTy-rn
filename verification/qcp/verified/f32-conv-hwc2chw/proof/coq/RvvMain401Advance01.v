From HwcConv Require Import RvvMain401AdvanceFacts.
From Coq Require Import Lia Ring.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_rvv_raw hc_rvv_source_fold dw_rvv_fma hc_progress hc_visible.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_6_1:HwcConv.rvv_unit_goal.test_rvv_entail_wit_6_1.
Proof.
 unfold HwcConv.rvv_unit_goal.test_rvv_entail_wit_6_1;left;hmi_prepare.
 assert(Hdone:ow_done=Z.quot(N+1)2)by lia;subst ow_done.
 repeat rewrite Z.quot_div_nonneg in * by lia.
 assert(Hnext:hc_channel_pending Output Hs Cs Cn End output_y(Cn-(c-4))
 (hr401_cursor_step current_o0c0 output_channel_increment)(hr401_cursor_step current_o0c1 output_channel_increment)
 (hr401_cursor_step current_o0c2 output_channel_increment)(hr401_cursor_step current_o0c3 output_channel_increment)
 (hr401_cursor_step current_o1c0 output_channel_increment)(hr401_cursor_step current_o1c1 output_channel_increment)
 (hr401_cursor_step current_o1c2 output_channel_increment)(hr401_cursor_step current_o1c3 output_channel_increment)).
 { eapply hr401_pending_next_channel;try eassumption;lia. }
 unfold hr401_cursor_step in Hnext.
 assert(Hrem:Z.rem(Cn-(c-4))4=0).
 { replace(Cn-(c-4))with(Cn-c+4)by ring;apply hr401_rem_add4;lia. }
 pose proof(hr401_weight_block_resource F Input Zero Weights Params H N Top Start End Cn(c-4)PreH3 ltac:(lia))as[Hnextfoot Hnextwin].
 pose proof(hr401_footprint_addr _ _ Hnextfoot ltac:(lia))as Hnextaddr.
 assert(Hweight:w+448=hc_addr64(Weights+448*((Cn-(c-4))/4))).
 { rewrite Hnextaddr,PreH53.
   replace(Cn-(c-4))with(Cn-c+4)by ring.
   rewrite<-!Z.quot_div_nonneg by lia;rewrite hr401_quot_add4 by lia;ring. }
 rewrite hcm_progress_next_channel.
 replace(Cn-c+4)with(Cn-(c-4))by ring.
 hr401g_dispatch.
 Show.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_6_1.
