From QC4CheckedRvvframe02 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_which_implies_wit_3:test_rvv_which_implies_wit_3.
Proof. unfold test_rvv_which_implies_wit_3;left;intros;qc_subst;qc_normalize.
sep_apply(CharArray.full_split_to_missing_i a_pre (rounded_depth kc_pre-k) (qc4_a_extent kc_pre) A 0);[|lia].
unfold StoreCharAsElement.storeA;qc_normalize;entailer!.
Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_3.
