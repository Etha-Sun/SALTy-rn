From Coq Require Import ZArith Lia Ring.
From ArgmaxPool Require Import KernelOuterFacts NeonKernelPureFacts neon_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonMemoryOuter.
Lemma proof_of_test_neon_entail_wit_18:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_18.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_18;right;apb_intro.
 assert(Hgroup:app_group_cursor D pooling_elements=0)by(rewrite PreH2;apply app_group_cursor_initial;lia).
 pose proof(apmk_pixel_nonzero F P W WI D(app_pixels D-output_pixels)PreH11 ltac:(lia))as[Hout Hidx].
 rewrite <-PreH18 in Hout;rewrite <-PreH19 in Hidx.
 rewrite Hgroup;change(app_index_base_at 0)with 0.
 rewrite app_remaining_initial by lia;cbn[app_previous_cursor].
 unfold app_table_cursor,app_consumed.
 replace(Z.min pooling_elements(9*0))with 0 by(symmetry;apply Z.min_r;lia).
 replace(input+8*0)with input by ring.
 apkp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_19:ArgmaxPool.neon_unit_goal.test_neon_entail_wit_19.
Proof.
 unfold ArgmaxPool.neon_unit_goal.test_neon_entail_wit_19;right;apb_intro.
 assert(Hk:k=0)by lia;subst k;rewrite app_group_cursor_zero.
 assert(Hpixel:0<=app_pixels D-output_pixels)by lia.
 replace(app_pixels D-(output_pixels-1))with(app_pixels D-output_pixels+1)by ring.
 rewrite apmk_completed_output_pixel,apmk_completed_index_pixel by exact Hpixel.
 assert(HT:unsigned_last_nbits(unsigned_last_nbits input 64+input_increment)64=app_table D(app_pixels D-output_pixels+1)).
 { change(ap_u64(ap_u64 input+input_increment)=app_table D(app_pixels D-output_pixels+1));rewrite app_u64_add_l,PreH16,PreH5.
   unfold app_table;rewrite app_advance_step by exact Hpixel;reflexivity. }
 assert(HO:unsigned_last_nbits(unsigned_last_nbits output 64+output_increment)64=app_output_at D(app_pixels D-output_pixels+1)).
 { change(ap_u64(ap_u64 output+output_increment)=app_output_at D(app_pixels D-output_pixels+1));rewrite app_u64_add_l,PreH18,PreH6.
   unfold app_output_at;rewrite app_advance_step by exact Hpixel;reflexivity. }
 assert(HI:unsigned_last_nbits(unsigned_last_nbits index 64+index_increment)64=app_index_at D(app_pixels D-output_pixels+1)).
 { change(ap_u64(ap_u64 index+index_increment)=app_index_at D(app_pixels D-output_pixels+1));rewrite app_u64_add_l,PreH19,PreH7.
   unfold app_index_at;rewrite app_advance_step by exact Hpixel;reflexivity. }
 assert(HF:unsigned_last_nbits(input_offset+input_pixel_stride)64=app_offset_at D(app_pixels D-output_pixels+1)).
 { change(ap_u64(input_offset+input_pixel_stride)=app_offset_at D(app_pixels D-output_pixels+1));rewrite PreH17,PreH4.
   unfold app_offset_at;rewrite app_advance_step by exact Hpixel;reflexivity. }
 apkp_call_frame.
Qed.
End CheckedNeonMemoryOuter.
Print Assumptions CheckedNeonMemoryOuter.proof_of_test_neon_entail_wit_18.
Print Assumptions CheckedNeonMemoryOuter.proof_of_test_neon_entail_wit_19.
