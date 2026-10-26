From HwcConv Require Import CaseTyped HwcPublicObservationModel public_mode_goal.
Module ActualPublicCaller : HwcConv.public_mode_goal.VC_Correct := HwcConv.CaseTyped.ActualUnit12.
Module IndependentPublicCaller : HwcConv.public_mode_goal.VC_Correct := ActualPublicCaller.
Definition whole_same_output_initial : forall F input zero weights H N top lo hi C O output hs cs start finish ow,
 hwp_state_observe
 (hc_final(hc_visible(hc_neon_raw F input zero weights H N top lo hi)C)O output hs cs C start finish ow)
 (hc_final(hc_visible(hc_rvv_raw F input zero weights H N top lo hi)C)O output hs cs C start finish ow)
 := hwp_final_same_allocation.
Definition whole_exact_unwritten : forall R O output hs cs C start finish ow,
 hwp_unwritten_frame O(hc_final R O output hs cs C start finish ow)output hs cs C start finish ow
 := hwp_final_unwritten.
