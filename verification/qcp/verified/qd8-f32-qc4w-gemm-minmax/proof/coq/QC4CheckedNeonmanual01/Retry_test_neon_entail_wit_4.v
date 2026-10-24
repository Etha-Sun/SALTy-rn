From QC4CheckedNeonmanual01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_4:test_neon_entail_wit_4.
Proof. unfold test_neon_entail_wit_4;right;intros;qc_subst;qc_normalize;rewrite ?qc4_literal_mask in *.
qc_initial_context. rewrite ?qc_acc_initial.
timeout 180(first[solve[qc_initial_frame]|solve[entailer!;lia]]).
Qed.
Print Assumptions proof_of_test_neon_entail_wit_4.
