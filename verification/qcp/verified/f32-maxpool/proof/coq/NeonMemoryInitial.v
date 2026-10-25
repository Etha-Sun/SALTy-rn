From MaxPool Require Import NeonMemoryFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_2:MaxPool.neon_unit_goal.test_neon_entail_wit_2.
Proof.
 unfold test_neon_entail_wit_2;left;mpm_prepare.
 rewrite ?mp_table_at_zero,?mp_offset_at_zero,?mp_output_at_zero by(unfold mp_word64;lia).
 rewrite ?mpm_pixel_zero,?mpm_table_first.
 unfold mp_row_pointer;rewrite ?mpm_row_index_zero,?Z.add_0_r.
 mp_call_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_2.
