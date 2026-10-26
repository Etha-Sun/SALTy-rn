From HwcConv Require Import Main443TailMemorySupportV3.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_neon_pixel hc_neon_rows_acc hc_neon_max4 hc_neon_min4 hc_neon_dup4 hc_neon_zip1 hc_neon_zip2 hc_fget.
Module Checked.
Lemma proof_of_test_neon_entail_wit_5_2 : HwcConv.neon_unit_goal.test_neon_entail_wit_5_2.
Proof.
 unfold HwcConv.neon_unit_goal.test_neon_entail_wit_5_2;hcc_prepare;hmi_zero;hct_context;hct_word_index N iw.
 assert(HK0:forall lane,0<=lane<4->hc_fget R_9 lane=hc_neon_raw F Input Zero Weights H N Top Lo Hi(Cn-c)lane output_y((N-iw)/2)).
 { intros lane HL.
 unfold hc_neon_raw.
 eapply hcm_clamped_pixel_lane with (A:=R)(B:=R_5)(LMin:=LMin_2)(LMax:=LMax_2)(p0:=(hc_row_base Input Zero H N(2*output_y-Top)))(p1:=(hc_row_base Input Zero H N(2*output_y-Top+1)))(p2:=(hc_row_base Input Zero H N(2*output_y-Top+2)))(w:=Weights+448*((Cn-c)/4)).
 - f_equal;ring.
 - f_equal;ring.
 - f_equal;ring.
 - reflexivity.
 - exact PreH15.
 - exact PreH10.
 - exact PreH6.
 - exact PreH81.
 - exact PreH82.
 - exact HL. }
 assert(HK2:forall lane,0<=lane<4->hc_fget R_10 lane=hc_neon_raw F Input Zero Weights H N Top Lo Hi(Cn-c)lane (output_y+1)((N-iw)/2)).
 { intros lane HL.
 unfold hc_neon_raw.
 eapply hcm_clamped_pixel_lane with (A:=R_2)(B:=R_6)(LMin:=LMin_2)(LMax:=LMax_2)(p0:=(hc_row_base Input Zero H N(2*output_y-Top+2)))(p1:=(hc_row_base Input Zero H N(2*output_y-Top+3)))(p2:=(hc_row_base Input Zero H N(2*output_y-Top+4)))(w:=Weights+448*((Cn-c)/4)).
 - f_equal;ring.
 - f_equal;ring.
 - f_equal;ring.
 - reflexivity.
 - exact PreH14.
 - exact PreH9.
 - exact PreH5.
 - exact PreH81.
 - exact PreH82.
 - exact HL. }
 pose proof(hcm_width_tail_one N iw ltac:(lia)ltac:(assumption)ltac:(lia))as HTail.
 rewrite !Z.quot_div_nonneg in HTail by lia.
 lazymatch goal with |- ?P |-- _ => lazymatch P with context[hc_output W ?Updated]=>
 assert(HState:Updated=hc_progress(hc_visible(hc_neon_raw F Input Zero Weights H N Top Lo Hi)Cn)O Output Hs Cs Cn Start End((N+1)/2)output_y(Cn-c)((N-iw)/2+1)) end end.
 {
 replace(Output+Cs*hc_store_channel Cn(Cn-c)0+Hs*hc_store_row End output_y 0+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)0)(hc_store_row End output_y 0)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)1+Hs*hc_store_row End output_y 0+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)1)(hc_store_row End output_y 0)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)2+Hs*hc_store_row End output_y 0+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)2)(hc_store_row End output_y 0)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)3+Hs*hc_store_row End output_y 0+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)3)(hc_store_row End output_y 0)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)0+Hs*hc_store_row End output_y 1+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)0)(hc_store_row End output_y 1)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)1+Hs*hc_store_row End output_y 1+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)1)(hc_store_row End output_y 1)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)2+Hs*hc_store_row End output_y 1+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)2)(hc_store_row End output_y 1)((N-iw)/2))by(unfold hc_output_address;ring).
 replace(Output+Cs*hc_store_channel Cn(Cn-c)3+Hs*hc_store_row End output_y 1+4*((N-iw)/2))with(hc_output_address Output Hs Cs(hc_store_channel Cn(Cn-c)3)(hc_store_row End output_y 1)((N-iw)/2))by(unfold hc_output_address;ring).

 rewrite(hcm_lane_tile_one(hc_neon_raw F Input Zero Weights H N Top Lo Hi)
 (hc_progress(hc_visible(hc_neon_raw F Input Zero Weights H N Top Lo Hi)Cn)O Output Hs Cs Cn Start End((N+1)/2)output_y(Cn-c)((N-iw)/2))
 Output Hs Cs Cn End output_y(Cn-c)((N-iw)/2)R_9 R_10 HK0 HK2).
 apply hc_tile_progress_step;try assumption;try lia;try solve[rewrite <-Z.rem_mod_nonneg by lia;assumption].
 all:try solve[apply Z.div_pos;lia|apply Z.div_str_pos;lia].
 all:match goal with|-?G=>idtac "TILE_STEP_REMAINING" G end.
 }
 rewrite HTail in HState;rewrite hcm_progress_channel_complete in HState by lia;rewrite HState.
 unfold SupportModel.hc_doz_model in *.
 destruct(Z_le_dec c 4)as[HCsmall|HClarge].
 - rewrite Z.max_l in * by lia;hct_first;Exists LMax_2 LMin_2.
   hct_dispatch.
   all:try assumption;try lia;try tauto.
   all:try solve[hct_outer N iw].
   all:try solve[hct_pending_tail].
   all:match goal with|-?G=>idtac "TAIL_SMALL_iwAINING" G end.
 - rewrite Z.max_r in * by lia;hct_large_context;hct_last;Exists LMax_2 LMin_2.
   hct_dispatch.
   all:try assumption;try lia;try tauto.
   all:try solve[hct_outer N iw].
   all:try solve[hct_pending_tail].
   all:try solve[hct_large_finish].
   all:match goal with|-?G=>idtac "TAIL_LARGE_iwAINING" G end.
Qed.
End Checked.
Definition Second : HwcConv.neon_unit_goal.test_neon_entail_wit_5_2:=Checked.proof_of_test_neon_entail_wit_5_2.
Print Assumptions Checked.proof_of_test_neon_entail_wit_5_2.
Print Assumptions Second.
