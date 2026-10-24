From Coq Require Import ZArith Lia List.
From Qu8Add Require Import rvv_unit_goal RvvKernelMemorySupport RvvKernelResourceFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qu_neon_lane qu_neon_mul qu_neon_mla qu_neon_shift qu_neon_add16 qu_s16 qu_sat16 qu_sat8 qu_umin qu_umax qu_ctrl qu_values qu_window.
Module CheckedRvvKernelMemoryPart01.
Lemma proof_of_test_rvv_entail_wit_2_1 : Qu8Add.rvv_unit_goal.test_rvv_entail_wit_2_1.
Proof. unfold Qu8Add.rvv_unit_goal.test_rvv_entail_wit_2_1, Qu8Add.rvv_unit_goal_chunk14.test_rvv_entail_wit_2_1.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38.
rewrite Z.sub_diag,qu_values_zero.
 rewrite <-qu_control_decode_correct;unfold qu_control_decode.
 repeat match goal with |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y)end;
 entailer!;reflexivity.
Qed.
End CheckedRvvKernelMemoryPart01.
