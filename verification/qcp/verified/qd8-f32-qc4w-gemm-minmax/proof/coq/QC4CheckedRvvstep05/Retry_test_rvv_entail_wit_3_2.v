From QC4CheckedRvvstep05 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_3_2:test_rvv_entail_wit_3_2.
Proof. unfold test_rvv_entail_wit_3_2;intros quantization_params_pre params_pre c_pre w_pre a_pre kc_pre nc_pre mr_pre hi lo inv zp Ps A s15_2 s14_2 s13_2 s12_2 s11_2 s10_2 s9_2 s8_2 s7_2 s6_2 s5_2 s4_2 s3_2 s2_2 s1_2 s0_2 z15_2 z14_2 z13_2 z12_2 z11_2 z10_2 z9_2 z8_2 z7_2 z6_2 z5_2 z4_2 z3_2 z2_2 z1_2 z0_2 w a0 k vl c0 nc kc cn_stride r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r0_2 r1_2 r2_2 r3_2 r4_2 r5_2 r6_2 r7_2 r8_2 r9_2 r10_2 r11_2 r12_2 r13_2 r14_2 r15_2 r0_3 r1_3 r2_3 r3_3 r4_3 r5_3 r6_3 r7_3 r8_3 r9_3 r10_3 r11_3 r12_3 r13_3 r14_3 r15_3 r0_4 r1_4 r2_4 r3_4 r4_4 r5_4 r6_4 r7_4 r8_4 r9_4 r10_4 r11_4 r12_4 r13_4 r14_4 r15_4 r0_5 r1_5 r2_5 r3_5 r4_5 r5_5 r6_5 r7_5 r8_5 r9_5 r10_5 r11_5 r12_5 r13_5 r14_5 r15_5 r0_6 r1_6 r2_6 r3_6 r4_6 r5_6 r6_6 r7_6 r8_6 r9_6 r10_6 r11_6 r12_6 r13_6 r14_6 r15_6 r0_7 r1_7 r2_7 r3_7 r4_7 r5_7 r6_7 r7_7 r8_7 r9_7 r10_7 r11_7 r12_7 r13_7 r14_7 r15_7 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47 PreH48 PreH49 PreH50 PreH51 PreH52 PreH53 PreH54 PreH55 PreH56 PreH57 PreH58 PreH59 PreH60 PreH61 PreH62.
Left.
rexists (s15_2).
rexists (s14_2).
rexists (s13_2).
rexists (s12_2).
rexists (s11_2).
rexists (s10_2).
rexists (s9_2).
rexists (s8_2).
rexists (s7_2).
rexists (s6_2).
rexists (s5_2).
rexists (s4_2).
rexists (s3_2).
rexists (s2_2).
rexists (s1_2).
rexists (s0_2).
rexists (r15_7).
rexists (r14_7).
rexists (r13_7).
rexists (r12_7).
rexists (r11_7).
rexists (r10_7).
rexists (r9_7).
rexists (r8_7).
rexists (r7_7).
rexists (r6_7).
rexists (r5_7).
rexists (r4_7).
rexists (r3_7).
rexists (r2_7).
rexists (r1_7).
rexists (r0_7).
qc_subst;qc_normalize;qc_bounds;qc_parity.
qc_unwrap;qc_normalize.
assert(Hpar:(rounded_depth kc_pre-k)mod 2=0)by(rewrite Zminus_mod;repeat match goal with H:?x mod 2=0 |-context[?x mod 2]=>rewrite H end;reflexivity).
unfold qc4_active16_z in *;repeat match goal with H:_ /\ _ |- _=>destruct H end.
timeout 180(qc_step_frame kc_pre k).
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_3_2.
