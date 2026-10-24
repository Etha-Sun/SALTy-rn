From Coq Require Import ZArith Lia List.
From Qs8Add Require Import neon_unit_goal NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qa_neon_lane qa_neon_mul qa_neon_mla qa_neon_shift qa_neon_add16 qa_s16 qa_sat16 qa_sat8 qa_min qa_max qa_ctrl qa_values qa_window.
Module CheckedNeonKernelMemoryPart15.
Lemma proof_of_test_neon_entail_wit_6_3 : Qs8Add.neon_unit_goal.test_neon_entail_wit_6_3.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_6_3, Qs8Add.neon_unit_goal_chunk10.test_neon_entail_wit_6_3.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a_5 input_b_5 output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43.
qa_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_8_5 : Qs8Add.neon_unit_goal.test_neon_entail_wit_8_5.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_8_5, Qs8Add.neon_unit_goal_chunk03.test_neon_entail_wit_8_5.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a_5 input_b_5 output_5 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44.
qa_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_10_7 : Qs8Add.neon_unit_goal.test_neon_entail_wit_10_7.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_10_7, Qs8Add.neon_unit_goal_chunk11.test_neon_entail_wit_10_7.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a_4 input_b_4 output_4 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_entail_wit_12_9 : Qs8Add.neon_unit_goal.test_neon_entail_wit_12_9.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_12_9, Qs8Add.neon_unit_goal_chunk11.test_neon_entail_wit_12_9.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45.
qa_kernel_memory_prepare.
assert (Hcase:batch=3) by lia;subst batch.
rewrite !qa_kernel_lane_expression.
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-3)+0)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-3)+1)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-3)+2)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-3)+3)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-3)+4)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-3)+5)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-3)+6)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-3)+7)).
replace output with (output_pre+(batch_pre-3)) by lia.
rewrite ?Z.mul_1_r in *.
pose proof (qa_kernel_output_2 output_pre (batch_pre-3) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge0.
qa_memory_apply_pair Hmerge0.
replace ((batch_pre-3)+2) with ((batch_pre-3)+2) by lia.
replace (output_pre+(batch_pre-3)+2) with (output_pre+((batch_pre-3)+2)) by lia.
pose proof (qa_kernel_output_1 output_pre ((batch_pre-3)+2) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge2.
replace (((batch_pre-3)+2)+0) with ((batch_pre-3)+2) in Hmerge2 by lia.
qa_memory_apply_pair Hmerge2.
replace (((batch_pre-3)+2)+1) with ((batch_pre-3)+3) by lia.
replace ((batch_pre-3)+3) with batch_pre by lia.
rewrite ?Z.sub_0_r.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
qa_memory_clean_emp;qa_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_14_3 : Qs8Add.neon_unit_goal.test_neon_entail_wit_14_3.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_14_3, Qs8Add.neon_unit_goal_chunk07.test_neon_entail_wit_14_3.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output input_b_3 input_a_3 batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_entail_wit_16_5 : Qs8Add.neon_unit_goal.test_neon_entail_wit_16_5.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_16_5, Qs8Add.neon_unit_goal_chunk14.test_neon_entail_wit_16_5.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output_3 input_b_3 input_a_3 batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_entail_wit_18_7 : Qs8Add.neon_unit_goal.test_neon_entail_wit_18_7.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_18_7, Qs8Add.neon_unit_goal_chunk06.test_neon_entail_wit_18_7.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output_4 input_b_4 input_a_4 batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

End CheckedNeonKernelMemoryPart15.
