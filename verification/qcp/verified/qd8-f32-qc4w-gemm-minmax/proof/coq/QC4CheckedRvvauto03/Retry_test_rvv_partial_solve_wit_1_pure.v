From QC4CheckedRvvauto03 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_1_pure:test_rvv_partial_solve_wit_1_pure.
Proof. unfold test_rvv_partial_solve_wit_1_pure;try left;intros;qc_subst;qc_normalize.
timeout 30(first[solve[lia]|solve[qc_pure]|solve[qc_frame]|solve[entailer!;lia]]).
Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_1_pure.
