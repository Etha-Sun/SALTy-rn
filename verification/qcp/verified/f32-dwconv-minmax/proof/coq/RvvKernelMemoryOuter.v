From Coq Require Import ZArith Lia.
From Dwconv Require Import RvvKernelMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_7:Dwconv.rvv_unit_goal.test_rvv_entail_wit_7.
Proof.
 unfold Dwconv.rvv_unit_goal.test_rvv_entail_wit_7;left;dw_prepare.
 assert(c=0)by lia;subst c;rewrite Z.sub_0_r in *.
 replace(dw_width D-(output_width-1))with(dw_width D-output_width+1)by ring.
 unfold dw_rvv_progress;rewrite dw_progress_complete by lia;rewrite dw_progress_start.
 rewrite !dwrm_unsigned64_word,dw_word_add_l.
 pose proof(dw_offset_step D(dw_width D-output_width)ltac:(lia))as Hoff.
 pose proof(dw_output_step D(dw_width D-output_width)ltac:(lia))as Hout.
 dw_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_7.
