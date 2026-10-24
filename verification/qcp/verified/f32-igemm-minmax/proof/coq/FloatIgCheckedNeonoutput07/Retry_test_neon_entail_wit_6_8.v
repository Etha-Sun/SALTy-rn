From Coq Require Import ZArith List Lia.
From FloatIgNeon Require Import neon_goal.
From FloatIgCheckedNeonoutput07 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_6_8:test_neon_entail_wit_6_8.
Proof. unfold test_neon_entail_wit_6_8;left;intros params_pre zero_pre a_offset_pre c_pre w_pre a_pre ks_pre kc_pre nc_pre mr_pre hi lo W Blocks Refs Entries z7 z6 z5 z4 z3 z2 z1 z0 w a p c0 nc cn_stride PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42.
ig_tail_split nc;vm_compute in PreH40,PreH41,PreH42;try congruence.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_6_8.
