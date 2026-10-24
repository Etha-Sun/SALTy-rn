From Coq Require Import ZArith List Lia.
From FloatIgNeon Require Import neon_goal.
From FloatIgCheckedNeonmemory01 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_which_implies_wit_3:neon_goal.test_neon_which_implies_wit_3.
Proof. unfold neon_goal.test_neon_which_implies_wit_3;left;intros.
 destruct(ig_entry_nonzero mr_pre nc_pre (kc_pre÷4) ks_pre Entries Refs Blocks zero_pre a_offset_pre W ((ks_pre-p)÷8) PreH1 ltac:(lia))as[HM Hne].
 entailer!.

Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_3.
