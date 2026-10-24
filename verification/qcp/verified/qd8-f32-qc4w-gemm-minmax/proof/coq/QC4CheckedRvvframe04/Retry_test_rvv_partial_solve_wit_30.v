From QC4CheckedRvvframe04 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_30:test_rvv_partial_solve_wit_30.
Proof. unfold test_rvv_partial_solve_wit_30,test_rvv_partial_solve_wit_30_aux;try left;intros;qc_subst;qc_normalize.
timeout 120 qc_frame5.
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_30.
