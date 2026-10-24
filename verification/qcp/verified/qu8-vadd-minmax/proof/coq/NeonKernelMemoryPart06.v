From Coq Require Import ZArith Lia List.
From Qu8Add Require Import neon_unit_goal NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qu_neon_lane qu_neon_mul qu_neon_mla qu_neon_shift qu_neon_add16 qu_s16 qu_udiff qu_sat16 qu_usat8 qu_umin qu_umax qu_ctrl qu_values qu_window.
Module CheckedNeonKernelMemoryPart06.
Lemma proof_of_test_neon_entail_wit_5_1 : Qu8Add.neon_unit_goal.test_neon_entail_wit_5_1.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_entail_wit_5_1.
left;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42.
qu_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_7_3 : Qu8Add.neon_unit_goal.test_neon_entail_wit_7_3.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_entail_wit_7_3.
left;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43.
qu_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_9_5 : Qu8Add.neon_unit_goal.test_neon_entail_wit_9_5.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_entail_wit_9_5.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output_4 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44.
qu_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_return_wit_7 : Qu8Add.neon_unit_goal.test_neon_return_wit_7.
Proof. unfold Qu8Add.neon_unit_goal.test_neon_return_wit_7.
left;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44.
qu_kernel_memory_prepare.
assert (Hcase:batch=4) by lia;subst batch.
rewrite !qu_kernel_lane_expression.
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+0)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+1)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+2)).
fold (qu_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+3)).
replace output with (output_pre+(batch_pre-4)) by lia.
rewrite ?Z.mul_1_r in *.
replace ((batch_pre-4)+0) with ((batch_pre-4)+0) by lia.
replace ((batch_pre-4)+1) with ((batch_pre-4)+1) by lia.
replace ((batch_pre-4)+2) with ((batch_pre-4)+2) by lia.
replace ((batch_pre-4)+3) with ((batch_pre-4)+3) by lia.
pose proof (qu_kernel_output_4 output_pre (batch_pre-4) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge0.
qu_memory_apply_pair Hmerge0.
replace ((batch_pre-4)+4) with batch_pre by lia.
repeat match goal with |-context[UCharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite UCharArray.undef_full_empty end.
qu_memory_clean_emp;qu_kernel_frame.
Qed.

End CheckedNeonKernelMemoryPart06.
