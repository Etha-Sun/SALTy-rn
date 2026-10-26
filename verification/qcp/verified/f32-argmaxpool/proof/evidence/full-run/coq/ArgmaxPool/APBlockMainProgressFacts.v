From Coq Require Import ZArith List Lia FunctionalExtensionality Classical_Prop.
From ArgmaxPool Require Export APBlockMainFacts.
From ArgmaxPool Require Import APProgramMemoryFacts KernelLaneFacts.
Local Open Scope Z_scope.
Lemma apbm_written_maps:forall F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl output index O2 I2,
 0<=vl ->
 ap_block32_written F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl output index O2 I2 ->
 ap_block32_frames O I O2 I2 vl output index ->
 O2=ap_output_write O output vl(fun lane=>fst(ap_block32_value F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane))/\
 I2=ap_index_write I index vl(fun lane=>snd(ap_block32_value F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx lane)).
Proof.
 intros F O I ab ib p0 p1 p2 p3 p4 p5 p6 p7 p8 idx vl output index O2 I2 HV HW[HFO HFI].
 split;apply functional_extensionality;intro q.
 - destruct(classic(exists lane,0<=lane<vl/\q=output+4*lane))as[[lane[HL HQ]]|HA].
   + subst q;rewrite(proj1(HW lane HL));unfold ap_output_write.
     rewrite app_write_inside by(rewrite Z2Nat.id by lia;exact HL);reflexivity.
   + rewrite(HFO q HA);unfold ap_output_write;rewrite app_write_outside;[reflexivity|].
     intros lane HL HQ;apply HA;exists lane;split;[rewrite Z2Nat.id in HL by lia;exact HL|exact HQ].
 - destruct(classic(exists lane,0<=lane<vl/\q=index+4*lane))as[[lane[HL HQ]]|HA].
   + subst q;rewrite(proj2(HW lane HL));unfold ap_index_write.
     rewrite app_write_inside by(rewrite Z2Nat.id by lia;exact HL);reflexivity.
   + rewrite(HFI q HA);unfold ap_index_write;rewrite app_write_outside;[reflexivity|].
     intros lane HL HQ;apply HA;exists lane;split;[rewrite Z2Nat.id in HL by lia;exact HL|exact HQ].
Qed.
Lemma apbm_progress_after_block:forall F P D pixel group done O I vl O2 I2,
 0<=group ->0<=app_rows D ->0<=done ->0<=vl ->done+vl<=app_channels D ->
 0<app_output_at D pixel ->0<app_index_at D pixel ->
 ap_block32_written F
 (app_rvv_partial_output F P D pixel group done O I)
 (app_rvv_partial_index F P D pixel group done O I)
 (app_previous_cursor group(app_output_at D pixel)done)
 (app_previous_cursor group(app_index_at D pixel)done)
 (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 0 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 1 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 2 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 3 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 4 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 5 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 6 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 7 done) (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group 8 done) (app_index_base_at group)vl
 (app_output_cursor(app_output_at D pixel)done)
 (app_output_cursor(app_index_at D pixel)done)O2 I2 ->
 ap_block32_frames
 (app_rvv_partial_output F P D pixel group done O I)
 (app_rvv_partial_index F P D pixel group done O I)O2 I2 vl
 (app_output_cursor(app_output_at D pixel)done)
 (app_output_cursor(app_index_at D pixel)done) ->
 O2=app_rvv_partial_output F P D pixel group(done+vl)O I /\
 I2=app_rvv_partial_index F P D pixel group(done+vl)O I.
Proof.
 intros F P D pixel group done O I vl O2 I2 HG HR HD HV HC HO HI HW HF.
 destruct(apbm_written_maps _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ HV HW HF)as[EO EI].
 pose proof(app_pass_partial_append false F P D pixel group done vl
 (app_pixel_before false F P D pixel(O,I))HD HV)as Eappend.
 split.
 - rewrite EO.
   transitivity(ap_output_write(app_rvv_partial_output F P D pixel group done O I)
    (app_output_cursor(app_output_at D pixel)done)vl
    (fun lane=>fst(app_lane_value false F P D pixel(group+1)(done+lane)))).
   + apply app_output_write_active_ext;[exact HV|]. intros lane HL.
     rewrite apbm_current_value by lia;reflexivity.
   + exact(f_equal fst Eappend).
 - rewrite EI.
   transitivity(ap_index_write(app_rvv_partial_index F P D pixel group done O I)
    (app_output_cursor(app_index_at D pixel)done)vl
    (fun lane=>snd(app_lane_value false F P D pixel(group+1)(done+lane)))).
   + apply app_index_write_active_ext;[exact HV|]. intros lane HL.
     rewrite apbm_current_value by lia;reflexivity.
   + exact(f_equal snd Eappend).
Qed.
Print Assumptions apbm_written_maps.
Print Assumptions apbm_progress_after_block.
