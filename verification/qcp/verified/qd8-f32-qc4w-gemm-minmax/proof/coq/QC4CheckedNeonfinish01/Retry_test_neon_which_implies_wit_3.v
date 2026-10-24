From QC4CheckedNeonfinish01 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_which_implies_wit_3:test_neon_which_implies_wit_3.
Proof. unfold test_neon_which_implies_wit_3;intros;qc_normalize.
destruct(qc_tail_even_cases k ltac:(lia) ltac:(lia))as[Hk|[Hk|[Hk|Hk]]];subst k.
- Left;Left;Left;entailer!.
- Left;Left;Right;entailer!.
- Left;Right;entailer!.
- Right;entailer!.
Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_3.
