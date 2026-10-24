From Coq Require Import ZArith Lia List.
From Qu8Add Require Import neon_unit_goal NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qu_neon_lane qu_neon_mul qu_neon_mla qu_neon_shift qu_neon_add16 qu_s16 qu_udiff qu_sat16 qu_usat8 qu_umin qu_umax qu_ctrl qu_values qu_window.
Module CheckedNeonKernelMemoryPart02.
Lemma proof_of_test_neon_entail_wit_2_2 : Qu8Add.neon_unit_goal.test_neon_entail_wit_2_2.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_entail_wit_2_2.
left;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38.
qu_kernel_memory_prepare.
rewrite <- qu_control_decode_correct.
unfold qu_control_decode.
destruct (Z.ltb_spec 127 (-(Z.rem RawShift 256)));cbn zeta;
repeat match goal with |-context[Z.ltb ?x (-128)]=>destruct (Z.ltb_spec x (-128)) end;
try (exfalso;lia).
replace (batch_pre-batch_pre) with 0 by lia.
rewrite qu_values_zero,UCharArray.full_empty.
rewrite ?Z.mul_0_l, ?Z.add_0_r.
remember (UCharArray.full input_a_pre (batch_pre+7) A) as heapA eqn:HA;clear HA.
remember (UCharArray.full input_b_pre (batch_pre+7) B) as heapB eqn:HB;clear HB.
remember (UCharArray.undef_full output_pre batch_pre) as heapOut eqn:HO;clear HO.
rewrite qu_memory_true_emp.
qu_memory_clean_emp;qu_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_6_6 : Qu8Add.neon_unit_goal.test_neon_entail_wit_6_6.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_entail_wit_6_6.
left;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42.
qu_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_9_1 : Qu8Add.neon_unit_goal.test_neon_entail_wit_9_1.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_entail_wit_9_1.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output_4 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44.
qu_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_return_wit_3 : Qu8Add.neon_unit_goal.test_neon_return_wit_3.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_return_wit_3.
left;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44.
qu_kernel_memory_prepare.
assert (Hcase:batch=5) by lia;subst batch.
rewrite !qu_kernel_lane_expression.
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+0)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+1)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+2)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+3)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+4)).
replace output with (output_pre+(batch_pre-5)) by lia.
rewrite ?Z.mul_1_r in *.
pose proof (qu_kernel_output_4 output_pre (batch_pre-5) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge0.
qu_memory_apply_pair Hmerge0.
replace ((batch_pre-5)+4) with ((batch_pre-5)+4) by lia.
replace (output_pre+(batch_pre-5)+4) with (output_pre+((batch_pre-5)+4)) by lia.
pose proof (qu_kernel_output_1 output_pre ((batch_pre-5)+4) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge4.
replace (((batch_pre-5)+4)+0) with ((batch_pre-5)+4) in Hmerge4 by lia.
qu_memory_apply_pair Hmerge4.
replace (((batch_pre-5)+4)+1) with ((batch_pre-5)+5) by lia.
replace ((batch_pre-5)+5) with batch_pre by lia.
repeat match goal with |-context[UCharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite UCharArray.undef_full_empty end.
qu_memory_clean_emp;qu_kernel_frame.
Qed.

End CheckedNeonKernelMemoryPart02.
