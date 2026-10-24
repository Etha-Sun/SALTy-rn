From QC4CheckedNeonpure01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_264_pure:test_neon_partial_solve_wit_264_pure.
Proof. unfold test_neon_partial_solve_wit_264_pure;try left;intros;qc_subst;qc_normalize. timeout 120 qc_neon_pure.
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_264_pure.
