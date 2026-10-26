From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import BorrowedConsumerSupport borrowed_consumers_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedBorrowedConsumerPart06.
Lemma proof_of_ap_borrow_rvv_merge32_return_wit_1:ArgmaxPool.borrowed_consumers_goal.ap_borrow_rvv_merge32_return_wit_1.
Proof. unfold ArgmaxPool.borrowed_consumers_goal.ap_borrow_rvv_merge32_return_wit_1;apb_intro;
Exists r31_2 r30_2 r29_2 r28_2 r27_2 r26_2 r25_2 r24_2 r23_2 r22_2 r21_2 r20_2 r19_2 r18_2 r17_2 r16_2;Exists r15_2 r14_2 r13_2 r12_2 r11_2 r10_2 r9_2 r8_2 r7_2 r6_2 r5_2 r4_2 r3_2 r2_2 r1_2 r0_2;
unfold ap_same_bits in *;apb_frame. Qed.
End CheckedBorrowedConsumerPart06.
Print Assumptions CheckedBorrowedConsumerPart06.proof_of_ap_borrow_rvv_merge32_return_wit_1.
