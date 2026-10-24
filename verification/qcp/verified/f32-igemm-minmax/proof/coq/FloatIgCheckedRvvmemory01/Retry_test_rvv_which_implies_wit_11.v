From Coq Require Import ZArith List Lia.
From FloatIgRvv Require Import rvv_goal.
From FloatIgCheckedRvvmemory01 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_which_implies_wit_11:rvv_goal.test_rvv_which_implies_wit_11.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_11;left;intros.
 destruct(ig_entry_nonzero mr_pre nc_pre (kc_pre÷4) ks_pre Entries Refs Blocks zero_pre a_offset_pre W ((ks_pre-p)÷8) PreH1 ltac:(lia))as[HM Hne].
 entailer!.

Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_11.
