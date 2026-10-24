From Coq Require Import ZArith List Lia.
From FloatIgNeon Require Import neon_goal.
From FloatIgCheckedNeonmemory01 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_which_implies_wit_6:neon_goal.test_neon_which_implies_wit_6.
Proof. unfold neon_goal.test_neon_which_implies_wit_6;left;intros.
 sep_apply(close_mapped_input (kc_pre÷4) zero_pre a_offset_pre Entries Refs Blocks ((ks_pre-p)÷8) PreH1 ltac:(lia));entailer!.

Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_6.
