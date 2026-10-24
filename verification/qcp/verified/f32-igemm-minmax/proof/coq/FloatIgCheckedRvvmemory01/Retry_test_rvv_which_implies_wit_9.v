From Coq Require Import ZArith List Lia.
From FloatIgRvv Require Import rvv_goal.
From FloatIgCheckedRvvmemory01 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_which_implies_wit_9:rvv_goal.test_rvv_which_implies_wit_9.
Proof. unfold rvv_goal.test_rvv_which_implies_wit_9;left;intros.
 assert(Haddr:a0=input_address Blocks Refs ((ks_pre-p)÷8)).
 { rewrite PreH4;eapply mapped_input_address;eauto;lia. }
 sep_apply(open_mapped_input (kc_pre÷4) zero_pre a_offset_pre Entries Refs Blocks ((ks_pre-p)÷8) PreH1 ltac:(lia)).
 entailer!.

Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_9.
