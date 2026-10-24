From QC4CheckedRvvframe02 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_which_implies_wit_1:test_rvv_which_implies_wit_1.
Proof. unfold test_rvv_which_implies_wit_1;left;intros;unfold qc4_domain_shape in *;unfold qc4_matrix_wf;decompose[and]PreH1;entailer!.
Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_1.
