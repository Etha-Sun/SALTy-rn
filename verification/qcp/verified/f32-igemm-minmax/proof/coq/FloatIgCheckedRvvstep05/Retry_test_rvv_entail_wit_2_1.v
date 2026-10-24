From Coq Require Import ZArith List Lia.
From FloatIgRvv Require Import rvv_goal.
From FloatIgCheckedRvvstep05 Require Import Facts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_2_1:test_rvv_entail_wit_2_1.
Proof. unfold test_rvv_entail_wit_2_1;intros params_pre zero_pre a_offset_pre c_pre w_pre a_pre ks_pre kc_pre nc_pre mr_pre hi lo W Blocks Refs Entries z7_2 z6_2 z5_2 z4_2 z3_2 z2_2 z1_2 z0_2 w a0 k a p vl c0 nc cn_stride z0_3 z1_3 z2_3 z3_3 z4_3 z5_3 z6_3 z7_3 z0_4 z1_4 z2_4 z3_4 z4_4 z5_4 z6_4 z7_4 __default_fp32 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47 PreH48 PreH49 PreH50 PreH51 PreH52 PreH53 PreH54.
Left.
Exists (z7_4) (z6_4) (z5_4) (z4_4) (z3_4) (z2_4) (z1_4) (z0_4).
all: ig_loop_context;ig_expand_active.
all: repeat rewrite ig_advance_div by lia.
all: repeat rewrite ig_decrement_mod by lia.
all: timeout 180 ig_step_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_2_1.
