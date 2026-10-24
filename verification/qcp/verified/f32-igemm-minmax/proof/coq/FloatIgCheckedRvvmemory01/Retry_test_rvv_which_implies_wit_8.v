From Coq Require Import ZArith List Lia.
From FloatIgRvv Require Import rvv_goal.
From FloatIgCheckedRvvmemory01 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_which_implies_wit_8:rvv_goal.test_rvv_which_implies_wit_8.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_8;left;intros.
 sep_apply(close_mapped_input (kc_pre÷4) zero_pre a_offset_pre Entries Refs Blocks ((ks_pre-p)÷8) PreH1 ltac:(lia));entailer!.

Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_8.
