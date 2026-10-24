From QC4CheckedNeonfinish01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_which_implies_wit_2:test_neon_which_implies_wit_2.
Proof. unfold test_neon_which_implies_wit_2;right;intros;rewrite sizeof_char,Z.rem_1_r;entailer!.
Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_2.
