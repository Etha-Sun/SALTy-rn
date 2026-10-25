From MaxPool Require Import NeonMemoryFacts PassFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma mpm_more_start:forall F PT old table offset output K channels group lo hi,
 0<=group->
 mp_pass_partial F PT old table offset output K channels(group+1)0 lo hi=
 mp_pass_complete F PT old table offset output K channels group lo hi.
Proof.
 intros;unfold mp_pass_partial.
 assert(Hg:Z.eqb(group+1)0=false)by(apply Z.eqb_neq;lia).
 rewrite Hg,mp_write_zero.
 replace(group+1-1)with group by ring;reflexivity.
Qed.
Print Assumptions mpm_more_start.
Module CheckedNeonLoopControls.
Lemma proof_of_test_neon_entail_wit_25:MaxPool.neon_unit_goal.test_neon_entail_wit_25.
Proof.
 unfold test_neon_entail_wit_25;left;mpm_prepare.
 Exists g_2.
 rewrite ?Z.sub_diag,?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_l,?Z.add_0_r.
 rewrite mpm_more_start by lia.
 unfold mp_output_cursor;rewrite ?Z.mul_0_r,?Z.add_0_r.
 mp_call_frame.
Qed.
Lemma proof_of_test_neon_entail_wit_28:MaxPool.neon_unit_goal.test_neon_entail_wit_28.
Proof.
 unfold test_neon_entail_wit_28;right;mpm_prepare.
 unfold mp_row_pointer;rewrite mpm_row_index_zero,Z.mul_0_r,Z.add_0_r.
 rewrite mpm_table_first.
 unfold derivable1,andp,coq_prop;intros m [_ Hemp].
 repeat first[solve[assumption|reflexivity|lia]|split].
Qed.
Lemma proof_of_test_neon_entail_wit_29:MaxPool.neon_unit_goal.test_neon_entail_wit_29.
Proof.
 unfold test_neon_entail_wit_29;right;mpm_prepare.
 assert(Hfinished:mp_k_after kernel_elements_pre g=0)by lia.
 pose proof(proj1(mp_k_after_finished kernel_elements_pre g ltac:(lia)ltac:(lia))Hfinished)as Hlower.
 assert(Hgroup:g=mp_extra_groups kernel_elements_pre)by lia;subst g.
 replace(output_pixels_pre-(output_pixels-1))with(output_pixels_pre-output_pixels+1)by ring.
 rewrite mp_pixel_pass_step by lia.
 rewrite !unsigned_unsigned_add_l by lia.
 pose proof(mp_table_at_step input_pre input_increment_pre(output_pixels_pre-output_pixels))as Htable.
 pose proof(mp_offset_at_step input_offset_pre input_pixel_stride_pre(output_pixels_pre-output_pixels))as Hoffset.
 pose proof(mp_output_at_step output_pre output_increment_pre(output_pixels_pre-output_pixels))as Houtput.
 mp_call_frame.
Qed.
End CheckedNeonLoopControls.
Print Assumptions CheckedNeonLoopControls.proof_of_test_neon_entail_wit_25.
Print Assumptions CheckedNeonLoopControls.proof_of_test_neon_entail_wit_28.
Print Assumptions CheckedNeonLoopControls.proof_of_test_neon_entail_wit_29.
