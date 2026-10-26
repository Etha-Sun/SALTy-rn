From Coq Require Import ZArith Lia Ring List.
From ArgmaxPool Require Import APBlockMainControlCompleteFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_18:ArgmaxPool.annotated_goal.test_rvv_entail_wit_18.
Proof. 
 unfold ArgmaxPool.annotated_goal.test_rvv_entail_wit_18;apb_intro.
 assert(Hk:k=0)by lia;subst k;rewrite app_group_cursor_zero.
 assert(Hpixel:0<=app_pixels D-output_pixels)by lia.
 replace(app_pixels D-(output_pixels-1))with(app_pixels D-output_pixels+1)by ring.
 rewrite apbmc_pixel_output,apbmc_pixel_index by exact Hpixel.
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
 try Right;apbmc_frame.
 Qed.
Print Assumptions proof_of_test_rvv_entail_wit_18.
