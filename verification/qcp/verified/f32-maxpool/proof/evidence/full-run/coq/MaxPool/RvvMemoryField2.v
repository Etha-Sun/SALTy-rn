(* Proof pattern adapted from NeonMemoryInitial.v SHA256 153c4570412a65995f577d3d506eab5a4b28ad56e6b1a417aee2b05a1c0bbf67; this exact RVV goal is independently compiled. *)
From MaxPool Require Import RvvMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_2:MaxPool.rvv_unit_goal.test_rvv_entail_wit_2.
Proof.
 unfold MaxPool.rvv_unit_goal.test_rvv_entail_wit_2;left;mpm_prepare.
 rewrite ?mp_table_at_zero,?mp_offset_at_zero,?mp_output_at_zero by(unfold mp_word64;lia).
 rewrite ?mpm_pixel_zero,?mpm_table_first.
 unfold mp_row_pointer;rewrite ?mpm_row_index_zero,?Z.add_0_r.
 mp_call_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_2.
