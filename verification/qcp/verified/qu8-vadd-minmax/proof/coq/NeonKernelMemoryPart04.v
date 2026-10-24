From Coq Require Import ZArith Lia List.
From Qu8Add Require Import neon_unit_goal NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qu_neon_lane qu_neon_mul qu_neon_mla qu_neon_shift qu_neon_add16 qu_s16 qu_udiff qu_sat16 qu_usat8 qu_umin qu_umax qu_ctrl qu_values qu_window.
Module CheckedNeonKernelMemoryPart04.
Lemma proof_of_test_neon_entail_wit_3 : Qu8Add.neon_unit_goal.test_neon_entail_wit_3.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_entail_wit_3.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output input_b input_a batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37.
qu_kernel_memory_prepare.
rewrite !qu_kernel_lane_expression.
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+0)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+1)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+2)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+3)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+4)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+5)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+6)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+7)).
replace output with (output_pre+(batch_pre-batch)) by lia.
rewrite ?Z.mul_1_r in *.
pose proof (qu_kernel_output_8 output_pre (batch_pre-batch) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge.
qu_memory_apply_pair Hmerge.
replace (batch_pre-(batch-8)) with (batch_pre-batch+8) by lia.
destruct (Z.eq_dec batch 8) as [Hdone|Hmore].
- rewrite <-derivable1_orp_intros1;qu_memory_clean_emp;qu_kernel_frame.
- rewrite <-derivable1_orp_intros2;qu_memory_clean_emp;qu_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_7_1 : Qu8Add.neon_unit_goal.test_neon_entail_wit_7_1.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_entail_wit_7_1.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output_4 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43.
qu_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_9_3 : Qu8Add.neon_unit_goal.test_neon_entail_wit_9_3.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_entail_wit_9_3.
left;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output_2 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44.
qu_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_return_wit_5 : Qu8Add.neon_unit_goal.test_neon_return_wit_5.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_return_wit_5.
left;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44.
qu_kernel_memory_prepare.
assert (Hcase:batch=2) by lia;subst batch.
rewrite !qu_kernel_lane_expression.
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-2)+0)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-2)+1)).
replace output with (output_pre+(batch_pre-2)) by lia.
rewrite ?Z.mul_1_r in *.
replace ((batch_pre-2)+0) with ((batch_pre-2)+0) by lia.
replace ((batch_pre-2)+1) with ((batch_pre-2)+1) by lia.
pose proof (qu_kernel_output_2 output_pre (batch_pre-2) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge0.
qu_memory_apply_pair Hmerge0.
replace ((batch_pre-2)+2) with batch_pre by lia.
repeat match goal with |-context[UCharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite UCharArray.undef_full_empty end.
qu_memory_clean_emp;qu_kernel_frame.
Qed.

End CheckedNeonKernelMemoryPart04.
