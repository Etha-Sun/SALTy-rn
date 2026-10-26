From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Export NeonKernelModel.
Local Open Scope Z_scope.

(* A store appends exactly the four active lanes to the existing partial state.
   The state outside those writes keeps its own option value, including None. *)
Lemma app_block4_output:forall F P D pixel group done O I value,
 0<=done ->
 (forall lane,0<=lane<4 ->
  value lane=fst(app_lane_value true F P D pixel(group+1)(done+lane))) ->
 ap_output_write(app_neon_partial_output F P D pixel group done O I)
 (app_output_cursor(app_output_at D pixel)done)4 value=
 app_neon_partial_output F P D pixel group(done+4)O I.
Proof.
 intros F P D pixel group done O I value Hd Hv.
 rewrite(app_output_write_active_ext _ _ 4 value
 (fun lane=>fst(app_lane_value true F P D pixel(group+1)(done+lane)))ltac:(lia)Hv).
 exact(f_equal fst(app_pass_partial_append true F P D pixel group done 4
 (app_pixel_before true F P D pixel(O,I))Hd ltac:(lia))).
Qed.
Lemma app_block4_index:forall F P D pixel group done O I value,
 0<=done ->
 (forall lane,0<=lane<4 ->
  value lane=snd(app_lane_value true F P D pixel(group+1)(done+lane))) ->
 ap_index_write(app_neon_partial_index F P D pixel group done O I)
 (app_output_cursor(app_index_at D pixel)done)4 value=
 app_neon_partial_index F P D pixel group(done+4)O I.
Proof.
 intros F P D pixel group done O I value Hd Hv.
 rewrite(app_index_write_active_ext _ _ 4 value
 (fun lane=>snd(app_lane_value true F P D pixel(group+1)(done+lane)))ltac:(lia)Hv).
 exact(f_equal snd(app_pass_partial_append true F P D pixel group done 4
 (app_pixel_before true F P D pixel(O,I))Hd ltac:(lia))).
Qed.
Lemma app_block4_row_cursor:forall P table off rows group row done,
 app_row_cursor P table off rows group row done+16=
 app_row_cursor P table off rows group row(done+4).
Proof. intros;unfold app_row_cursor;ring. Qed.
Lemma app_block4_output_cursor:forall base done,
 app_output_cursor base done+16=app_output_cursor base(done+4).
Proof. intros;unfold app_output_cursor;ring. Qed.
Lemma app_block4_previous_cursor:forall group base done,
 0<group ->app_previous_cursor group base done+16=
 app_previous_cursor group base(done+4).
Proof. intros;unfold app_previous_cursor;destruct(Z.eqb_spec group 0);[lia|ring]. Qed.
Lemma app_block4_mod:forall done,done mod 4=0->(done+4)mod 4=0.
Proof. intros;rewrite Z.add_mod by lia;rewrite H;reflexivity. Qed.
Print Assumptions app_block4_output.
Print Assumptions app_block4_index.
Print Assumptions app_block4_row_cursor.
Print Assumptions app_block4_output_cursor.
Print Assumptions app_block4_previous_cursor.
Print Assumptions app_block4_mod.

Lemma app_block_previous_float:forall F P D pixel group done O I base p lane value,
 0<group ->base=app_output_at D pixel ->
 p=app_previous_cursor group base done ->
 0<=done ->0<=lane ->done+lane<app_channels D ->
 ap_output_loaded_lane(app_neon_partial_output F P D pixel group done O I)p lane value ->
 value=fst(app_lane_value true F P D pixel group(done+lane)).
Proof.
 intros F P D pixel group done O I base p lane value Hg Hb Hp Hd Hl Hc Hload.
 assert(Hi:=app_previous_float_initialized F P D pixel group done lane O I Hg Hd Hl Hc).
 unfold ap_float_initialized,app_previous_float_value in Hi.
 unfold app_previous_cursor in Hp;destruct(Z.eqb_spec group 0);[lia|].
 unfold ap_output_loaded_lane,ap_output_loaded in Hload.
 rewrite Hp,Hb in Hload;unfold app_output_cursor in Hi;rewrite Hi in Hload;exact Hload.
Qed.
Lemma app_block_previous_index:forall F P D pixel group done O I base p lane value,
 0<group ->base=app_index_at D pixel ->
 p=app_previous_cursor group base done ->
 0<=done ->0<=lane ->done+lane<app_channels D ->
 ap_index_loaded_lane(app_neon_partial_index F P D pixel group done O I)p lane value ->
 value=snd(app_lane_value true F P D pixel group(done+lane)).
Proof.
 intros F P D pixel group done O I base p lane value Hg Hb Hp Hd Hl Hc Hload.
 assert(Hi:=app_previous_index_initialized F P D pixel group done lane O I Hg Hd Hl Hc).
 unfold ap_uint_initialized,app_previous_index_value in Hi.
 unfold app_previous_cursor in Hp;destruct(Z.eqb_spec group 0);[lia|].
 unfold ap_index_loaded_lane,ap_index_loaded in Hload.
 rewrite Hp,Hb in Hload;unfold app_output_cursor in Hi;rewrite Hi in Hload;exact Hload.
Qed.
Lemma app_block_u32_idem:forall x,ap_u32(ap_u32 x)=ap_u32 x.
Proof. intros;unfold ap_u32.
 replace(unsigned_last_nbits(unsigned_last_nbits x 32)32)with
 (unsigned_last_nbits(unsigned_last_nbits x 32+0)32)by now rewrite Z.add_0_r.
 rewrite unsigned_unsigned_add_l by lia;now rewrite Z.add_0_r. Qed.
Print Assumptions app_block_previous_float.
Print Assumptions app_block_previous_index.
Print Assumptions app_block_u32_idem.

Lemma app_block_candidate_pair:forall F P D pixel group row done lane,
 ap_candidate F P(app_table D pixel)(app_offset_at D pixel)(done+lane)
 (9*group)(app_remaining(app_rows D)group)row=
 (ap_load_lane F(app_row_cursor P(app_table D pixel)(app_offset_at D pixel)
 (app_rows D)group row done)lane,ap_u32(9*group+row)).
Proof.
 intros;rewrite (surjective_pairing(ap_candidate F P(app_table D pixel)
 (app_offset_at D pixel)(done+lane)(9*group)(app_remaining(app_rows D)group)row)).
 rewrite <-app_row_load_value,app_candidate_index_value.
 unfold app_index_base_at,ap_u32;rewrite unsigned_unsigned_add_l by lia;reflexivity.
Qed.
Print Assumptions app_block_candidate_pair.

Lemma app_block_update_pair:forall old oi candidate ci value,
 ap_same_bits value(ap_select_f32(ap_gt_mask candidate old)candidate old) ->
 ap_neon_update(old,oi)(candidate,ci)=
 (value,ap_select_u32(ap_gt_mask candidate old)(ap_u32 ci)oi).
Proof. intros;unfold ap_neon_update;cbn[fst snd];unfold ap_same_bits in H;now rewrite H. Qed.
Lemma app_block_add_assoc:forall a b c,
 ap_add_u32(ap_add_u32 a b)c=ap_add_u32 a(b+c).
Proof. intros;unfold ap_add_u32,ap_u32;rewrite unsigned_unsigned_add_l by lia;f_equal;ring. Qed.
Lemma app_block_index_add:forall group row,
 ap_add_u32(app_index_base_at group)row=ap_u32(9*group+row).
Proof. intros;unfold ap_add_u32,app_index_base_at,ap_u32;rewrite unsigned_unsigned_add_l by lia;reflexivity. Qed.
Print Assumptions app_block_update_pair.
Print Assumptions app_block_add_assoc.
Print Assumptions app_block_index_add.
Lemma app_block_base_positive:forall F P W WI D pixel,
 app_valid F P W WI D->0<=pixel<app_pixels D->
 0<app_output_at D pixel /\ 0<app_index_at D pixel.
Proof.
 intros F P W WI D pixel [[HP[HR[HC HG]]]HN]Hpixel.
 destruct(HG pixel Hpixel)as[HT[HF[HO HI]]];
 destruct HO as[HO _];destruct HI as[HI _];auto.
Qed.
Lemma app_block_previous_zero:forall group base done,
 0<base ->0<=done ->app_previous_cursor group base done=0 ->group=0.
Proof. intros;unfold app_previous_cursor in H1;destruct(Z.eqb_spec group 0);[assumption|lia]. Qed.
Print Assumptions app_block_base_positive.
Print Assumptions app_block_previous_zero.
Lemma app_block4_rem:forall done,0<=done->Z.rem done 4=0->Z.rem(done+4)4=0.
Proof. intros;rewrite Z.rem_mod_nonneg in * by lia;now apply app_block4_mod. Qed.
Print Assumptions app_block4_rem.
