From QC4CheckedNeonframe06 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_104:test_neon_partial_solve_wit_104.
Proof. unfold test_neon_partial_solve_wit_104;intros. Time timeout 180 qc_frame_reflected.
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_104.
