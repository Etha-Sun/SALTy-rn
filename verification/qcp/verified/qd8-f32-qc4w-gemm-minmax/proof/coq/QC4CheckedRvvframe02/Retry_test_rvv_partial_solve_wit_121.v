From QC4CheckedRvvframe02 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_121:test_rvv_partial_solve_wit_121.
Proof. unfold test_rvv_partial_solve_wit_121;try left;intros;qc_subst;qc_normalize.
timeout 120(first[solve[qc_pure3]|solve[qc_frame3]|solve[entailer!;qc_arith3]]).
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_121.
