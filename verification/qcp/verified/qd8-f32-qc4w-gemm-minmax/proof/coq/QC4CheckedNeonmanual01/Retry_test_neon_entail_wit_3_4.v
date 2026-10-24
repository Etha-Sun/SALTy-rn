From QC4CheckedNeonmanual01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_3_4:test_neon_entail_wit_3_4.
Proof. unfold test_neon_entail_wit_3_4;right;intros;qc_subst;qc_normalize;rewrite ?qc4_literal_mask in *.
qc_neon_constants. timeout 180 qc_neon_macs.
qc_normalize.
timeout 180(first[solve[qc_frame5]|solve[entailer!;lia]]).
Qed.
Print Assumptions proof_of_test_neon_entail_wit_3_4.
