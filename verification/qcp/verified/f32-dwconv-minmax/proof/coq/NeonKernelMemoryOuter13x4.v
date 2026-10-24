From Coq Require Import ZArith Lia.
From Dwconv Require Import NeonKernelMemorySimpleFrames.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_13_4:Dwconv.neon_unit_goal.test_neon_entail_wit_13_4.
Proof.
 unfold test_neon_entail_wit_13_4;left;dwm_prepare;dwm_subst_float.
 rewrite ?Z.sub_0_r.
 replace(dw_width D-(output_width-1))with(dw_width D-output_width+1)by ring.
 unfold dw_neon_progress;rewrite dw_progress_complete by lia;rewrite dw_progress_start.
 rewrite !dwm_unsigned64_word,dw_word_add_l.
 pose proof(dw_offset_step D(dw_width D-output_width)ltac:(lia))as Hoff.
 pose proof(dw_output_step D(dw_width D-output_width)ltac:(lia))as Hout.
 dwm_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_13_4.
