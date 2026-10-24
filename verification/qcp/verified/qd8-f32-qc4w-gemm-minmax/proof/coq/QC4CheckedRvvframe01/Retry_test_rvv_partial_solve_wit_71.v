From QC4CheckedRvvframe01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_71:test_rvv_partial_solve_wit_71.
Proof. unfold test_rvv_partial_solve_wit_71;try left;intros;qc_subst;qc_normalize.
timeout 45(first[solve[qc_pure2]|solve[qc_frame2]|solve[entailer!;qc_arith]]).
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_71.
