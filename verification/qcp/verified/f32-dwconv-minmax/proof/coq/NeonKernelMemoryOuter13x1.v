From Coq Require Import ZArith Lia.
From Dwconv Require Import NeonKernelMemoryPutFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_arm_add dw_arm_mul dw_arm_fma dw_arm_min dw_arm_max.
Lemma proof_of_test_neon_entail_wit_13_1:Dwconv.neon_unit_goal.test_neon_entail_wit_13_1.
Proof.
 unfold test_neon_entail_wit_13_1;left;dwm_prepare;dwm_subst_float.
 replace((dw_channels D-3)+2)with(dw_channels D-1)in * by ring.
 lazymatch goal with |- context[dw_output_put
  (dw_neon_progress ?F ?P ?D ?pixel (dw_channels ?D-1) ?lo ?hi ?O) ?out ?v]=>
  pose proof(dwm_neon_put1 F P D pixel(dw_channels D-1)lo hi O ltac:(lia))as Hput
 end.
 replace(dw_channels D-1+1)with(dw_channels D)in Hput by ring.
 rewrite <-Hput.
 change(1*4)with 4 in *.
 try replace(dw_output_at D(dw_width D-output_width)+4*(dw_channels D-1)+4)
  with(dw_output_at D(dw_width D-output_width)+4*dw_channels D)by ring.
 replace(dw_width D-(output_width-1))with(dw_width D-output_width+1)by ring.
 unfold dw_neon_progress;rewrite dw_progress_complete by lia;rewrite dw_progress_start.
 rewrite !dwm_unsigned64_word,dw_word_add_l.
 pose proof(dw_offset_step D(dw_width D-output_width)ltac:(lia))as Hoff.
 pose proof(dw_output_step D(dw_width D-output_width)ltac:(lia))as Hout.
 dwm_fast_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_13_1.
