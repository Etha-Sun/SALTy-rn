From Coq Require Import ZArith List Lia.
From FloatIgNeon Require Import neon_goal.
From FloatIgCheckedNeonbias04 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_2:test_neon_entail_wit_2.
Proof. unfold test_neon_entail_wit_2;left;intros params_pre zero_pre a_offset_pre c_pre w_pre a_pre ks_pre kc_pre nc_pre mr_pre hi lo W Blocks Refs Entries cp wp ap nc cn_stride PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27.

Exists ((gget (((((8 * ((total_depth ((kc_pre ÷ 4 )) (Refs)) + 1 ) ) * ((nc_pre - nc ) ÷ 8 ) ) + 4 ) + 3 )) (W))) ((gget (((((8 * ((total_depth ((kc_pre ÷ 4 )) (Refs)) + 1 ) ) * ((nc_pre - nc ) ÷ 8 ) ) + 4 ) + 2 )) (W))) ((gget (((((8 * ((total_depth ((kc_pre ÷ 4 )) (Refs)) + 1 ) ) * ((nc_pre - nc ) ÷ 8 ) ) + 4 ) + 1 )) (W))) ((gget (((((8 * ((total_depth ((kc_pre ÷ 4 )) (Refs)) + 1 ) ) * ((nc_pre - nc ) ÷ 8 ) ) + 4 ) + 0 )) (W))) ((gget (((((8 * ((total_depth ((kc_pre ÷ 4 )) (Refs)) + 1 ) ) * ((nc_pre - nc ) ÷ 8 ) ) + 0 ) + 3 )) (W))) ((gget (((((8 * ((total_depth ((kc_pre ÷ 4 )) (Refs)) + 1 ) ) * ((nc_pre - nc ) ÷ 8 ) ) + 0 ) + 2 )) (W))) ((gget (((((8 * ((total_depth ((kc_pre ÷ 4 )) (Refs)) + 1 ) ) * ((nc_pre - nc ) ÷ 8 ) ) + 0 ) + 1 )) (W))) ((gget (((((8 * ((total_depth ((kc_pre ÷ 4 )) (Refs)) + 1 ) ) * ((nc_pre - nc ) ÷ 8 ) ) + 0 ) + 0 )) (W))).
all: ig_loop_context.
all: timeout 180 ig_bias_frame.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_2.
