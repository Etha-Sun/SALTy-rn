From Qs8Mul Require Import AdapterTactics qm_sext_sub_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_qm_sext_sub_return_wit_1 : Qs8Mul.qm_sext_sub_goal.qm_sext_sub_return_wit_1.
Proof. unfold Qs8Mul.qm_sext_sub_goal.qm_sext_sub_return_wit_1;try left;qm_adapter_start;Exists r31_3 r30_3 r29_3 r28_3 r27_3 r26_3 r25_3 r24_3 r23_3 r22_3 r21_3 r20_3 r19_3 r18_3 r17_3 r16_3;Exists r15_3 r14_3 r13_3 r12_3 r11_3 r10_3 r9_3 r8_3 r7_3 r6_3 r5_3 r4_3 r3_3 r2_3 r1_3 r0_3;qm_adapter_finish. Qed.
Print Assumptions proof_of_qm_sext_sub_return_wit_1.
