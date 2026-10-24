From Coq Require Import ZArith List Lia.
From FloatIgRvv Require Import rvv_goal.
From FloatIgCheckedRvvmemory01 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_which_implies_wit_2:rvv_goal.test_rvv_which_implies_wit_2.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_2;left;intros.
 subst a;rewrite ?sizeof_ptr;igemm_borrow;igemm_restore;entailer!.

Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_2.
