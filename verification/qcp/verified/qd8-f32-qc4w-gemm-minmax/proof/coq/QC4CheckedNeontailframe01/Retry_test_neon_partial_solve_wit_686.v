From QC4CheckedNeontailframe01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_686:test_neon_partial_solve_wit_686.
Proof. unfold test_neon_partial_solve_wit_686,test_neon_partial_solve_wit_686_aux;intros;qc_initial_normalize.
 qc_bounds;qc_unwrap;qc_normalize;qc_align_write_state.
 timeout 240(qc_frame_combined).
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_686.
