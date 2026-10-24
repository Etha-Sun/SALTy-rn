From QC4CheckedRvvframe02 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_which_implies_wit_2:test_rvv_which_implies_wit_2.
Proof. unfold test_rvv_which_implies_wit_2;left;intros;rewrite ?sizeof_char,?sizeof_int,?sizeof_float,?Z.rem_1_r;entailer!.
Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_2.
