From Coq Require Import ZArith List Lia.
From FloatIgNeon Require Import neon_goal.
From FloatIgCheckedNeonmemory01 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_which_implies_wit_5:neon_goal.test_neon_which_implies_wit_5.
Proof. unfold neon_goal.test_neon_which_implies_wit_5;left;intros.
 assert(Haddr:a0=input_address Blocks Refs ((ks_pre-p)÷8)).
 { rewrite PreH4;eapply mapped_input_address;eauto;lia. }
 sep_apply(open_mapped_input (kc_pre÷4) zero_pre a_offset_pre Entries Refs Blocks ((ks_pre-p)÷8) PreH1 ltac:(lia)).
 entailer!.

Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_5.
