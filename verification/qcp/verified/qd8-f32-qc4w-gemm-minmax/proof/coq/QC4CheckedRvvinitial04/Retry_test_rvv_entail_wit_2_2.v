From QC4CheckedRvvinitial04 Require Import Facts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_2_2:test_rvv_entail_wit_2_2.
Proof. unfold test_rvv_entail_wit_2_2;intros quantization_params_pre params_pre c_pre w_pre a_pre kc_pre nc_pre mr_pre hi lo inv zp Ps A cp wp nc kc cn_stride retval r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r0_2 r1_2 r2_2 r3_2 r4_2 r5_2 r6_2 r7_2 r8_2 r9_2 r10_2 r11_2 r12_2 r13_2 r14_2 r15_2 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27.
Left.
Exists (r15) (r14) (r13) (r12) (r11) (r10) (r9) (r8) (r7) (r6) (r5) (r4) (r3) (r2) (r1) (r0).
Exists (r15_2) (r14_2) (r13_2) (r12_2) (r11_2) (r10_2) (r9_2) (r8_2) (r7_2) (r6_2) (r5_2) (r4_2) (r3_2) (r2_2) (r1_2) (r0_2).
qc_initial_context.
timeout 180 qc_initial_frame.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_2_2.
