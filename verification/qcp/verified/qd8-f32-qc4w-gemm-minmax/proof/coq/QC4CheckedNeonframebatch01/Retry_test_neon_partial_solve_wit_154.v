From QC4CheckedNeonframebatch01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_154:test_neon_partial_solve_wit_154.
Proof. unfold test_neon_partial_solve_wit_154,test_neon_partial_solve_wit_154_aux;try right;intros.
 timeout 240(first[solve[qc_frame_reflected]|solve[qc_normalize;qc_frame_reflected]]).
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_154.
