From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export APBlock32StageSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_ap_rvv_block32_entail_wit_4:ap_rvv_block32_entail_wit_4.
Proof.
 unfold ap_rvv_block32_entail_wit_4;right;intros.
 assert(Hstage:ap_block32_acc R J_3 F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 3).
 { eapply(apbc_acc_step R J_3 A_2 J_2 (make_record_vfloat32m8_t r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31) F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre 2).
 - lia.
 - lia.
 - eassumption.
 - apbc_read_float.
 - eassumption. }
 entailer!.
Qed.
Print Assumptions proof_of_ap_rvv_block32_entail_wit_4.
