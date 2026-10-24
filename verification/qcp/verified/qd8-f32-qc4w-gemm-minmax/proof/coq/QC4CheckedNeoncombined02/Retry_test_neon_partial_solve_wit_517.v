From QC4CheckedNeoncombined02 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_517:test_neon_partial_solve_wit_517.
Proof. unfold test_neon_partial_solve_wit_517,test_neon_partial_solve_wit_517_aux;try right;intros;qc_initial_normalize.
 timeout 240(qc_frame_combined).
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_517.
