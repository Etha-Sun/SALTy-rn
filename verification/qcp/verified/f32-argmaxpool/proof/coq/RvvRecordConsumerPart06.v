From ArgmaxPool Require Import RvvRecordConsumerSupport rvv_record_consumers_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedRvvRecordConsumerPart06.
Lemma proof_of_ap_record_rvv_merge32_return_wit_1:ArgmaxPool.rvv_record_consumers_goal.ap_record_rvv_merge32_return_wit_1.
Proof. unfold ArgmaxPool.rvv_record_consumers_goal.ap_record_rvv_merge32_return_wit_1;apb_intro;
Exists (make_record_vfloat32m8_t r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31);
aprr_frame. Qed.
End CheckedRvvRecordConsumerPart06.
Print Assumptions CheckedRvvRecordConsumerPart06.proof_of_ap_record_rvv_merge32_return_wit_1.
