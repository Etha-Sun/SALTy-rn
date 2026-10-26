(* Pure value composition for the actual helper->max->min pipeline.
   Does not import any main C goal; all lane getters below are in bounds. *)
From HwcConv Require Import CachedRowsBridgeCandidate NeonRowsPixelModel RvvKernelModel.
From Coq Require Import ZArith Lia Ring.
Local Open Scope Z_scope.
Lemma hcm_clamped_pixel_lane : forall F input zero weights H N top y x block lane
 p0 p1 p2 w A B C LMin LMax lo hi,
 p0=hc_row_base input zero H N(2*y-top)->
 p1=hc_row_base input zero H N(2*y-top+1)->
 p2=hc_row_base input zero H N(2*y-top+2)->
 w=weights+448*block->
 hc_neon_rows_acc A F p0 p1 p2 w N x 9->
 hc_neon_max4 B A LMin->hc_neon_min4 C B LMax->
 hc_neon_dup4 LMin lo->hc_neon_dup4 LMax hi->0<=lane<4->
 hc_fget C lane=hc_neon_pixel F input zero weights H N top y x block lane lo hi.
Proof.
 intros F input zero weights H N top y x block lane p0 p1 p2 w A B C LMin LMax lo hi
 HP0 HP1 HP2 HW HA HB HC HL HH HI.
 unfold hc_neon_min4 in HC;rewrite(HC lane HI).
 unfold hc_neon_max4 in HB;rewrite(HB lane HI).
 unfold hc_neon_dup4 in HL,HH;rewrite(HL lane HI),(HH lane HI).
 unfold hc_neon_rows_acc in HA;rewrite(HA lane HI).
 subst p0 p1 p2 w;apply hc_cached_pixel.
Qed.
Lemma hcm_second_cached_rows : forall input zero H N top y,
 hc_row_base input zero H N(2*y-top+2)=hc_row_base input zero H N(2*(y+1)-top) /\
 hc_row_base input zero H N(2*y-top+3)=hc_row_base input zero H N(2*(y+1)-top+1) /\
 hc_row_base input zero H N(2*y-top+4)=hc_row_base input zero H N(2*(y+1)-top+2).
Proof. apply hc_cached_second_row. Qed.
Print Assumptions hcm_clamped_pixel_lane.
Print Assumptions hcm_second_cached_rows.
