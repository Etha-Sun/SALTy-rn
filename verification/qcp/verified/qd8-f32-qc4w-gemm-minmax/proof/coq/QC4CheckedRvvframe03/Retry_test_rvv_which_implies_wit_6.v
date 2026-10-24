From QC4CheckedRvvframe03 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_which_implies_wit_6:test_rvv_which_implies_wit_6.
Proof. unfold test_rvv_which_implies_wit_6;try left;intros;qc_subst;qc_normalize.
timeout 120 qc_frame4.
Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_6.
