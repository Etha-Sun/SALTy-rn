From Coq Require Import ZArith List Lia.
From FloatIgNeon Require Import neon_goal.
From FloatIgCheckedNeonmemory01 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_which_implies_wit_2:neon_goal.test_neon_which_implies_wit_2.
Proof. unfold neon_goal.test_neon_which_implies_wit_2;left;intros.
 subst a;rewrite ?sizeof_ptr;igemm_borrow;igemm_restore;entailer!.

Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_2.
