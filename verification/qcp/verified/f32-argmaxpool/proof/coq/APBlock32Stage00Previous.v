From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export APBlock32StageSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_ap_rvv_block32_entail_wit_1_1:ap_rvv_block32_entail_wit_1_1.
Proof. unfold ap_rvv_block32_entail_wit_1_1;right;intros.
 assert(Hstage:ap_block32_acc R J_2 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 0).
 { eapply(apbc_initial_nonnull R J_2 (make_record_vfloat32m8_t r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31) (make_record_vuint32m8_t r0_2 r1_2 r2_2 r3_2 r4_2 r5_2 r6_2 r7_2 r8_2 r9_2 r10_2 r11_2 r12_2 r13_2 r14_2 r15_2 r16_2 r17_2 r18_2 r19_2 r20_2 r21_2 r22_2 r23_2 r24_2 r25_2 r26_2 r27_2 r28_2 r29_2 r30_2 r31_2) (make_record_vfloat32m8_t r0_3 r1_3 r2_3 r3_3 r4_3 r5_3 r6_3 r7_3 r8_3 r9_3 r10_3 r11_3 r12_3 r13_3 r14_3 r15_3 r16_3 r17_3 r18_3 r19_3 r20_3 r21_3 r22_3 r23_3 r24_3 r25_3 r26_3 r27_3 r28_3 r29_3 r30_3 r31_3) F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre).
 - lia.
 - assumption.
 - apbc_read_previous.
 - apbc_read_float.
 - eassumption. }
 entailer!.
Qed.
Print Assumptions proof_of_ap_rvv_block32_entail_wit_1_1.
