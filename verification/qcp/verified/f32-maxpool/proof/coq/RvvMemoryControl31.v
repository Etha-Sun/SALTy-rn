From MaxPool Require Import RvvMemoryControlSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_31:MaxPool.rvv_unit_goal.test_rvv_entail_wit_31.
Proof. unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_31;
 right;mpm_prepare.
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
Print Assumptions proof_of_test_rvv_entail_wit_31.
