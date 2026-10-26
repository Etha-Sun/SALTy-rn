From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export NeonKernelMemoryOffsetFacts.
Local Open Scope Z_scope.
Lemma apmk_geometry_windows:forall F P W WI D pixel group done read_width write_width,
 app_valid F P W WI D->0<=pixel<app_pixels D->
 0<=group<app_groups(app_rows D)->0<=done->0<=read_width->0<=write_width->
 done+read_width<=app_channels D+3->done+write_width<=app_channels D->
 (forall row,0<=row<9->ap_window F
  (app_row_cursor P(app_table D pixel)(app_offset_at D pixel)(app_rows D)group row done)read_width) /\
 ap_write_window W(app_output_cursor(app_output_at D pixel)done)write_width /\
 ap_write_window WI(app_output_cursor(app_index_at D pixel)done)write_width.
Proof.
 intros F P W WI D pixel group done read_width write_width HV Hp Hg Hd Hr Hw Hread Hwrite.
 split.
 - intros row Hrow;eapply app_geometry_row;eassumption.
 - destruct HV as[[Hpixpos[Hrowpos[Hchannelpos HG]]]Hdup].
   destruct(HG _ Hp)as[Htable[Hinput[Houtput Hindex]]].
   unfold app_output_cursor;split;eapply apk_write_window_subrange;eassumption.
Qed.
Print Assumptions apmk_geometry_windows.
