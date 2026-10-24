From Coq Require Import ZArith List Lia.
From FloatIgRvv Require Import rvv_goal.
From FloatIgCheckedRvvoutput04 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_6_1:test_rvv_entail_wit_6_1.
Proof. unfold test_rvv_entail_wit_6_1;intros params_pre zero_pre a_offset_pre c_pre w_pre a_pre ks_pre kc_pre nc_pre mr_pre hi lo W Blocks Refs Entries z7 z6 z5 z4 z3 z2 z1 z0 w a p vl c0 nc cn_stride retval retval_2 retval_3 z0_2 z1_2 z2_2 z3_2 z4_2 z5_2 z6_2 z7_2 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47 PreH48.
ig_loop_context.
all:ig_activate;ig_rvv_output_block kc_pre Refs Blocks W lo hi.
all:replace(a_pre+Zlength Refs*8-8*Zlength Refs)with a_pre by ring.
replace(nc_pre-(nc-8))with(nc_pre-nc+8)by ring.
pose proof(panel_count_covers nc_pre ltac:(lia));ig_more_div.
destruct(Z.eq_dec(nc-8)0)as[HZ|HN].
- Left. ig_loop_frame.
- Right. ig_loop_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_6_1.
