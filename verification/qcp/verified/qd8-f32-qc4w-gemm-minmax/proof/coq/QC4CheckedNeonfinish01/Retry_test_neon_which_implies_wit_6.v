From QC4CheckedNeonfinish01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_which_implies_wit_6:test_neon_which_implies_wit_6.
Proof. unfold test_neon_which_implies_wit_6;left;intros;qc_normalize.
pose proof(qc_column_tail_bits nc ltac:(lia))as Hb;decompose[and]Hb;clear Hb;entailer!;lia.
Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_6.
