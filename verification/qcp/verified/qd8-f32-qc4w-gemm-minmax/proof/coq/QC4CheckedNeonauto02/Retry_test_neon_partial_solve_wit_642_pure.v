From QC4CheckedNeonauto02 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_642_pure:test_neon_partial_solve_wit_642_pure.
Proof. unfold test_neon_partial_solve_wit_642_pure;try left;intros;qc_subst;qc_normalize;rewrite ?qc4_literal_mask in *.
timeout 40(first[solve[lia]|solve[qc_pure3]|solve[qc_frame5]|solve[entailer!;lia]]).
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_642_pure.
