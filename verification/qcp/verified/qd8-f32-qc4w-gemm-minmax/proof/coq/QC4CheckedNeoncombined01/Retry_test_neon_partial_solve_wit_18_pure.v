From QC4CheckedNeoncombined01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_partial_solve_wit_18_pure:test_neon_partial_solve_wit_18_pure.
Proof. unfold test_neon_partial_solve_wit_18_pure;right;intros;qc_initial_normalize.
 timeout 240(entailer!;lia).
Qed.
Print Assumptions proof_of_test_neon_partial_solve_wit_18_pure.
