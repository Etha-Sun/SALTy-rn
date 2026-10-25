From Qs8Mul Require Import AdapterTactics float_borrow_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qm_lane_match qm_fp_lane_match qm_rvv_mul qm_rvv_add qm_sign bits_of_fp32 qm_signed_bits.
Lemma proof_of_qm_borrow_vreinterpret_v_f32m8_i32m8_return_wit_1 : Qs8Mul.float_borrow_unit_goal.qm_borrow_vreinterpret_v_f32m8_i32m8_return_wit_1.
Proof. unfold Qs8Mul.float_borrow_unit_goal.qm_borrow_vreinterpret_v_f32m8_i32m8_return_wit_1;try left;qm_adapter_start;Exists r31_2 r30_2 r29_2 r28_2 r27_2 r26_2 r25_2 r24_2 r23_2 r22_2 r21_2 r20_2 r19_2 r18_2 r17_2 r16_2;Exists r15_2 r14_2 r13_2 r12_2 r11_2 r10_2 r9_2 r8_2 r7_2 r6_2 r5_2 r4_2 r3_2 r2_2 r1_2 r0_2;qm_adapter_finish. Qed.
Print Assumptions proof_of_qm_borrow_vreinterpret_v_f32m8_i32m8_return_wit_1.
