From QC4CheckedNeonframebatch01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_130:test_neon_partial_solve_wit_130.
Proof. unfold test_neon_partial_solve_wit_130,test_neon_partial_solve_wit_130_aux;try right;intros.
 timeout 240(first[solve[qc_frame_reflected]|solve[qc_normalize;qc_frame_reflected]]).
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_130.
