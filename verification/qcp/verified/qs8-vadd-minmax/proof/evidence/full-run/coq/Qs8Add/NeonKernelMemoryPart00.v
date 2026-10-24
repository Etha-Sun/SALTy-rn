From Coq Require Import ZArith Lia List.
From Qs8Add Require Import neon_unit_goal NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qa_neon_lane qa_neon_mul qa_neon_mla qa_neon_shift qa_neon_add16 qa_s16 qa_sat16 qa_sat8 qa_min qa_max qa_ctrl qa_values qa_window.
Module CheckedNeonKernelMemoryPart00.
Lemma proof_of_test_neon_entail_wit_1 : Qs8Add.neon_unit_goal.test_neon_entail_wit_1.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_1, Qs8Add.neon_unit_goal_chunk08.test_neon_entail_wit_1.
left;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24.
qa_kernel_memory_prepare.
prop_apply (CharArray.full_Zlength input_a_pre (batch_pre+7) A). Intros_p HA.
prop_apply (CharArray.full_Zlength input_b_pre (batch_pre+7) B). Intros_p HB.
rewrite Z.rem_1_r.
qa_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_6_4 : Qs8Add.neon_unit_goal.test_neon_entail_wit_6_4.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_6_4, Qs8Add.neon_unit_goal_chunk11.test_neon_entail_wit_6_4.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_entail_wit_8_6 : Qs8Add.neon_unit_goal.test_neon_entail_wit_8_6.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_8_6, Qs8Add.neon_unit_goal_chunk04.test_neon_entail_wit_8_6.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a_3 input_b_3 output_3 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_entail_wit_11_1 : Qs8Add.neon_unit_goal.test_neon_entail_wit_11_1.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_11_1, Qs8Add.neon_unit_goal_chunk13.test_neon_entail_wit_11_1.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output input_b input_a batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47.
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

Lemma proof_of_test_neon_entail_wit_12_10 : Qs8Add.neon_unit_goal.test_neon_entail_wit_12_10.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_12_10, Qs8Add.neon_unit_goal_chunk13.test_neon_entail_wit_12_10.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45.
qa_kernel_memory_prepare.
assert (Hcase:batch=7) by lia;subst batch.
rewrite !qa_kernel_lane_expression.
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+0)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+1)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+2)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+3)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+4)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+5)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+6)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+7)).
replace output with (output_pre+(batch_pre-7)) by lia.
rewrite ?Z.mul_1_r in *.
pose proof (qa_kernel_output_4 output_pre (batch_pre-7) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge0.
qa_memory_apply_pair Hmerge0.
replace ((batch_pre-7)+4) with ((batch_pre-7)+4) by lia.
replace (output_pre+(batch_pre-7)+4) with (output_pre+((batch_pre-7)+4)) by lia.
pose proof (qa_kernel_output_2 output_pre ((batch_pre-7)+4) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge4.
replace (((batch_pre-7)+4)+0) with ((batch_pre-7)+4) in Hmerge4 by lia.
replace (((batch_pre-7)+4)+1) with ((batch_pre-7)+5) in Hmerge4 by lia.
qa_memory_apply_pair Hmerge4.
replace (((batch_pre-7)+4)+2) with ((batch_pre-7)+6) by lia.
replace (output_pre+(batch_pre-7)+6) with (output_pre+((batch_pre-7)+6)) by lia.
replace (output_pre+(batch_pre-7)+(4+2)) with (output_pre+((batch_pre-7)+6)) by lia.
pose proof (qa_kernel_output_1 output_pre ((batch_pre-7)+6) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge6.
replace (((batch_pre-7)+6)+0) with ((batch_pre-7)+6) in Hmerge6 by lia.
qa_memory_apply_pair Hmerge6.
replace (((batch_pre-7)+6)+1) with ((batch_pre-7)+7) by lia.
replace ((batch_pre-7)+7) with batch_pre by lia.
rewrite ?Z.sub_0_r.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
qa_memory_clean_emp;qa_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_14_4 : Qs8Add.neon_unit_goal.test_neon_entail_wit_14_4.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_14_4, Qs8Add.neon_unit_goal_chunk09.test_neon_entail_wit_14_4.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output input_b_4 input_a_4 batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_entail_wit_16_6 : Qs8Add.neon_unit_goal.test_neon_entail_wit_16_6.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_16_6, Qs8Add.neon_unit_goal_chunk00.test_neon_entail_wit_16_6.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output_4 input_b_4 input_a_4 batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_return_wit_1 : Qs8Add.neon_unit_goal.test_neon_return_wit_1.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_return_wit_1, Qs8Add.neon_unit_goal_chunk08.test_neon_return_wit_1.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A output input_b input_a right_shift batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40.
qa_kernel_memory_prepare.
assert (Hz:batch=0) by lia;subst batch.
rewrite Z.sub_0_r,CharArray.undef_full_empty.
asrt_simpl;qa_kernel_frame.
Qed.

End CheckedNeonKernelMemoryPart00.
