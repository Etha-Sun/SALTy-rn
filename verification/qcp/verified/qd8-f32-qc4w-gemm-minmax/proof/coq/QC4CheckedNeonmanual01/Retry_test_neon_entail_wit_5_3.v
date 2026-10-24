From QC4CheckedNeonmanual01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_5_3:test_neon_entail_wit_5_3.
Proof. unfold test_neon_entail_wit_5_3;right;intros;qc_subst;qc_normalize.
pose proof(qc_column_tail_bits nc ltac:(lia))as Hb;decompose[and]Hb;clear Hb.
qc_neon_constants. timeout 180 qc_neon_outputs.
timeout 180 qc_neon_appends.
qc_neon_final_indices nc_pre.
unfold qc4_output_prefix;qc_normalize.
timeout 180(first[solve[qc_frame5]|solve[entailer!;lia]]).
Qed.
Print Assumptions proof_of_test_neon_entail_wit_5_3.
