From HwcConv Require Import Main443CallGeneralTactics Main443PixelValuesFacts Main443TileStoreFacts Main443TileAddressFacts Main443CursorStepFacts Main443InitNormalize HwcTileFacts.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_neon_pixel dw_arm_fma dw_arm_min dw_arm_max hc_neon_rows_acc hc_neon_max4 hc_neon_min4 hc_neon_dup4.
Ltac hcb_row:=first[assumption|reflexivity|solve[etransitivity;[eassumption|f_equal;ring]]].
Ltac hcb_dispatch:=first[
 lazymatch goal with|-_ |-- andp _ _=>apply _derivable1_andp_intros;[hcb_dispatch|hcb_dispatch]end|
 lazymatch goal with|-_ |-- coq_prop _=>apply hmi_pure_intro end|
 solve[sepcon_assoc_change;fast_cancel]|
 match goal with|-?G=>idtac "ATOMIC_SPATIAL_REMAINING" G end].
Module Checked.
Lemma proof_of_test_neon_entail_wit_3 : HwcConv.neon_unit_goal.test_neon_entail_wit_3.
Proof.
 unfold HwcConv.neon_unit_goal.test_neon_entail_wit_3;right;hcc_prepare.
 assert(HFN:hc_footprint Input(3*H*N+3))by(unfold hc_input_domain in PreH18;tauto).
 pose proof(hcm_footprint_width_range Input H N PreH25 PreH26 HFN)as HN64.
 pose proof(hcm_word_quot_index N iw HN64 ltac:(split;lia))as[HQ HQ1].
 hcm_domain;hcp_columns;
 repeat progress(rewrite Z.rem_mod_nonneg in * by lia);
 repeat progress(rewrite Z.quot_div_nonneg in HQ,HQ1 by lia);rewrite HQ1 in *.
 pose proof(hcm_width_step N iw ltac:(lia)ltac:(lia))as HWidth;
 repeat progress(rewrite Z.quot_div_nonneg in HWidth by lia).
 repeat match goal with HE:(hc_addr64 ?e = ?e)|-_=>rewrite HE in * end.
 assert(HK0:forall lane,0<=lane<4->hc_fget R_9 lane=hc_neon_raw F Input Zero Weights H N Top Lo Hi(Cn-c)lane output_y((N-iw)/2)).
 { intros lane HL. unfold hc_neon_raw.
 eapply hcm_clamped_pixel_lane with (A:=R)(B:=R_5)(LMin:=LMin_2)(LMax:=LMax_2)(p0:=(hc_row_base Input Zero H N(2*output_y-Top+0)))(p1:=(hc_row_base Input Zero H N(2*output_y-Top+1)))(p2:=(hc_row_base Input Zero H N(2*output_y-Top+2)))(w:=Weights+448*((Cn-c)/4)).
 - f_equal;ring.
 - f_equal;ring.
 - f_equal;ring.
 - reflexivity.
 - exact PreH16.
 - exact PreH12.
 - exact PreH8.
 - exact PreH80.
 - exact PreH81.
 - exact HL. }
 assert(HK1:forall lane,0<=lane<4->hc_fget R_11 lane=hc_neon_raw F Input Zero Weights H N Top Lo Hi(Cn-c)lane output_y((N-iw)/2+1)).
 { intros lane HL. unfold hc_neon_raw.
 eapply hcm_clamped_pixel_lane with (A:=R_3)(B:=R_7)(LMin:=LMin_2)(LMax:=LMax_2)(p0:=(hc_row_base Input Zero H N(2*output_y-Top+0)))(p1:=(hc_row_base Input Zero H N(2*output_y-Top+1)))(p2:=(hc_row_base Input Zero H N(2*output_y-Top+2)))(w:=Weights+448*((Cn-c)/4)).
 - f_equal;ring.
 - f_equal;ring.
 - f_equal;ring.
 - reflexivity.
 - exact PreH14.
 - exact PreH10.
 - exact PreH6.
 - exact PreH80.
 - exact PreH81.
 - exact HL. }
 assert(HK2:forall lane,0<=lane<4->hc_fget R_10 lane=hc_neon_raw F Input Zero Weights H N Top Lo Hi(Cn-c)lane (output_y+1)((N-iw)/2)).
 { intros lane HL. unfold hc_neon_raw.
 eapply hcm_clamped_pixel_lane with (A:=R_2)(B:=R_6)(LMin:=LMin_2)(LMax:=LMax_2)(p0:=(hc_row_base Input Zero H N(2*output_y-Top+2)))(p1:=(hc_row_base Input Zero H N(2*output_y-Top+3)))(p2:=(hc_row_base Input Zero H N(2*output_y-Top+4)))(w:=Weights+448*((Cn-c)/4)).
 - f_equal;ring.
 - f_equal;ring.
 - f_equal;ring.
 - reflexivity.
 - exact PreH15.
 - exact PreH11.
 - exact PreH7.
 - exact PreH80.
 - exact PreH81.
 - exact HL. }
 assert(HK3:forall lane,0<=lane<4->hc_fget R_12 lane=hc_neon_raw F Input Zero Weights H N Top Lo Hi(Cn-c)lane (output_y+1)((N-iw)/2+1)).
 { intros lane HL. unfold hc_neon_raw.
 eapply hcm_clamped_pixel_lane with (A:=R_4)(B:=R_8)(LMin:=LMin_2)(LMax:=LMax_2)(p0:=(hc_row_base Input Zero H N(2*output_y-Top+2)))(p1:=(hc_row_base Input Zero H N(2*output_y-Top+3)))(p2:=(hc_row_base Input Zero H N(2*output_y-Top+4)))(w:=Weights+448*((Cn-c)/4)).
 - f_equal;ring.
 - f_equal;ring.
 - f_equal;ring.
 - reflexivity.
 - exact PreH13.
 - exact PreH9.
 - exact PreH5.
 - exact PreH80.
 - exact PreH81.
 - exact HL. }
 lazymatch goal with |- ?P |-- _ => lazymatch P with context[hc_output W ?Updated]=>
 assert(HState:Updated=hc_progress(hc_visible(hc_neon_raw F Input Zero Weights H N Top Lo Hi)Cn)O Output Hs Cs Cn Start End((N+1)/2)output_y(Cn-c)((N-iw)/2+2)) end end.
 {
 replace(Output+Cs*hc_store_channel Cn(Cn-c)0+Hs*hc_store_row End output_y 0+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)0)(hc_store_row End output_y 0)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)1+Hs*hc_store_row End output_y 0+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)1)(hc_store_row End output_y 0)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)2+Hs*hc_store_row End output_y 0+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)2)(hc_store_row End output_y 0)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)3+Hs*hc_store_row End output_y 0+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)3)(hc_store_row End output_y 0)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)0+Hs*hc_store_row End output_y 1+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)0)(hc_store_row End output_y 1)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)1+Hs*hc_store_row End output_y 1+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)1)(hc_store_row End output_y 1)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)2+Hs*hc_store_row End output_y 1+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)2)(hc_store_row End output_y 1)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)3+Hs*hc_store_row End output_y 1+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)3)(hc_store_row End output_y 1)((N-iw)/2))by(unfold hc_output_address;ring).

 rewrite(hcm_zip_tile_two(hc_neon_raw F Input Zero Weights H N Top Lo Hi)
 (hc_progress(hc_visible(hc_neon_raw F Input Zero Weights H N Top Lo Hi)Cn)O Output Hs Cs Cn Start End((N+1)/2)output_y(Cn-c)((N-iw)/2))
 Output Hs Cs Cn End output_y(Cn-c)((N-iw)/2)R_9 R_11 R_10 R_12 R_13 R_14 R_15 R_16 HK0 HK1 HK2 HK3 PreH4 PreH3 PreH2 PreH1).
 apply hc_tile_progress_step;first[assumption|lia].
 }
 rewrite HState,HWidth.
 Exists LMax_2 LMin_2.
 hcb_dispatch.
 all:try assumption;try lia.
 all:try solve[eapply hcm_input_cursor_step;first[unfold hc_footprint,hc_u64_limit;repeat split;lia|lia]].
 all:try solve[unfold hc_output_address in *;lia].
 all:try tauto.
 all:try solve[replace(N-(iw-4))with((N-iw)+1*4)by ring;rewrite Z.mod_add by lia;assumption].
 all:match goal with|-?G=>idtac "BULK_REMAINING" G end.
Qed.
End Checked.
Definition Second : HwcConv.neon_unit_goal.test_neon_entail_wit_3:=Checked.proof_of_test_neon_entail_wit_3.
Print Assumptions Checked.proof_of_test_neon_entail_wit_3.
Print Assumptions Second.
