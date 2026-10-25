From Coq Require Import ZArith List Lia Strings.String.
From Qs8Rvv Require Import rvv_goal.
From Qs8Gemm Require Import RvvSupport NaNRepair.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_which_implies_wit_3:rvv_goal.test_rvv_which_implies_wit_3.
Proof.
 unfold test_rvv_which_implies_wit_3;try left;intros;qs8_normalize2;qs8_domain_facts.
 sep_apply(CharArray.full_split_to_missing_i a_pre (kc_pre-k) (a_read_extent kc_pre) A 0);[|lia].
 unfold StoreCharAsElement.storeA;qs8_normalize;qs8_frame2.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_which_implies_wit_3.
