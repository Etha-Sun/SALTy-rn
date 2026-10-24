From Coq Require Import ZArith Lia List.
From Qs8Add Require Import neon_unit_goal NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qa_neon_lane qa_neon_mul qa_neon_mla qa_neon_shift qa_neon_add16 qa_s16 qa_sat16 qa_sat8 qa_min qa_max qa_ctrl qa_values qa_window.
Module CheckedNeonKernelMemoryPart04.
Lemma proof_of_test_neon_entail_wit_3 : Qs8Add.neon_unit_goal.test_neon_entail_wit_3.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_3, Qs8Add.neon_unit_goal_chunk12.test_neon_entail_wit_3.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output input_b input_a batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37.
qa_kernel_memory_prepare.
rewrite !qa_kernel_lane_expression.
replace (((batch_pre-batch)+8)+0) with ((batch_pre-batch)+8) by lia.
replace (((batch_pre-batch)+8)+1) with ((batch_pre-batch)+9) by lia.
replace (((batch_pre-batch)+8)+2) with ((batch_pre-batch)+10) by lia.
replace (((batch_pre-batch)+8)+3) with ((batch_pre-batch)+11) by lia.
replace (((batch_pre-batch)+8)+4) with ((batch_pre-batch)+12) by lia.
replace (((batch_pre-batch)+8)+5) with ((batch_pre-batch)+13) by lia.
replace (((batch_pre-batch)+8)+6) with ((batch_pre-batch)+14) by lia.
replace (((batch_pre-batch)+8)+7) with ((batch_pre-batch)+15) by lia.
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+0)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+1)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+2)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+3)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+4)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+5)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+6)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+7)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+8)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+9)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+10)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+11)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+12)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+13)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+14)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-batch)+15)).
replace output with (output_pre+(batch_pre-batch)) by lia.
rewrite ?Z.mul_1_r in *.
pose proof (qa_kernel_output_16 output_pre (batch_pre-batch) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge.
qa_memory_apply_pair Hmerge.
replace (batch_pre-(batch-16)) with (batch_pre-batch+16) by lia.
destruct (Z.eq_dec batch 16) as [Hdone|Hmore].
- rewrite <-derivable1_orp_intros1;qa_memory_clean_emp;qa_kernel_frame.
- rewrite <-derivable1_orp_intros2;qa_memory_clean_emp;qa_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_7_1 : Qs8Add.neon_unit_goal.test_neon_entail_wit_7_1.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_7_1, Qs8Add.neon_unit_goal_chunk03.test_neon_entail_wit_7_1.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a_4 input_b_4 output_4 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44.
qa_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_9_3 : Qs8Add.neon_unit_goal.test_neon_entail_wit_9_3.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_9_3, Qs8Add.neon_unit_goal_chunk11.test_neon_entail_wit_9_3.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a_2 input_b_2 output_2 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_entail_wit_11_5 : Qs8Add.neon_unit_goal.test_neon_entail_wit_11_5.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_11_5, Qs8Add.neon_unit_goal_chunk05.test_neon_entail_wit_11_5.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output input_b input_a batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47.
qa_kernel_memory_prepare.
assert (Hcase:batch=2) by lia;subst batch.
rewrite !qa_kernel_lane_expression.
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-2)+0)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-2)+1)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-2)+2)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-2)+3)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-2)+4)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-2)+5)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-2)+6)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-2)+7)).
replace output with (output_pre+(batch_pre-2)) by lia.
rewrite ?Z.mul_1_r in *.
pose proof (qa_kernel_output_2 output_pre (batch_pre-2) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge0.
qa_memory_apply_pair Hmerge0.
replace ((batch_pre-2)+2) with ((batch_pre-2)+2) by lia.
replace ((batch_pre-2)+2) with batch_pre by lia.
rewrite ?Z.sub_0_r.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
qa_memory_clean_emp;qa_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_12_14 : Qs8Add.neon_unit_goal.test_neon_entail_wit_12_14.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_12_14, Qs8Add.neon_unit_goal_chunk05.test_neon_entail_wit_12_14.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45.
qa_kernel_memory_prepare.
assert (Hcase:batch=6) by lia;subst batch.
rewrite !qa_kernel_lane_expression.
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+0)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+1)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+2)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+3)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+4)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+5)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+6)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+7)).
replace output with (output_pre+(batch_pre-6)) by lia.
rewrite ?Z.mul_1_r in *.
pose proof (qa_kernel_output_4 output_pre (batch_pre-6) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge0.
qa_memory_apply_pair Hmerge0.
replace ((batch_pre-6)+4) with ((batch_pre-6)+4) by lia.
replace (output_pre+(batch_pre-6)+4) with (output_pre+((batch_pre-6)+4)) by lia.
pose proof (qa_kernel_output_2 output_pre ((batch_pre-6)+4) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge4.
replace (((batch_pre-6)+4)+0) with ((batch_pre-6)+4) in Hmerge4 by lia.
replace (((batch_pre-6)+4)+1) with ((batch_pre-6)+5) in Hmerge4 by lia.
qa_memory_apply_pair Hmerge4.
replace (((batch_pre-6)+4)+2) with ((batch_pre-6)+6) by lia.
replace ((batch_pre-6)+6) with batch_pre by lia.
rewrite ?Z.sub_0_r.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
qa_memory_clean_emp;qa_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_15_1 : Qs8Add.neon_unit_goal.test_neon_entail_wit_15_1.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_15_1, Qs8Add.neon_unit_goal_chunk14.test_neon_entail_wit_15_1.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output input_b input_a batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_entail_wit_17_3 : Qs8Add.neon_unit_goal.test_neon_entail_wit_17_3.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_17_3, Qs8Add.neon_unit_goal_chunk06.test_neon_entail_wit_17_3.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output_4 input_b_4 input_a_4 batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47.
qa_kernel_memory_frame.
Qed.

End CheckedNeonKernelMemoryPart04.
