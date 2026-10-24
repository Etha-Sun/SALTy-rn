From QC4CheckedRvvinitial06 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_2_1:test_rvv_entail_wit_2_1.
Proof. unfold test_rvv_entail_wit_2_1;left;intros quantization_params_pre params_pre c_pre w_pre a_pre kc_pre nc_pre mr_pre hi lo inv zp Ps A cp wp nc kc cn_stride retval r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r0_2 r1_2 r2_2 r3_2 r4_2 r5_2 r6_2 r7_2 r8_2 r9_2 r10_2 r11_2 r12_2 r13_2 r14_2 r15_2 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27.
rexists (r15).
rexists (r14).
rexists (r13).
rexists (r12).
rexists (r11).
rexists (r10).
rexists (r9).
rexists (r8).
rexists (r7).
rexists (r6).
rexists (r5).
rexists (r4).
rexists (r3).
rexists (r2).
rexists (r1).
rexists (r0).
rexists (r15_2).
rexists (r14_2).
rexists (r13_2).
rexists (r12_2).
rexists (r11_2).
rexists (r10_2).
rexists (r9_2).
rexists (r8_2).
rexists (r7_2).
rexists (r6_2).
rexists (r5_2).
rexists (r4_2).
rexists (r3_2).
rexists (r2_2).
rexists (r1_2).
rexists (r0_2).
qc_initial_context.
timeout 90 qc_initial_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_2_1.
