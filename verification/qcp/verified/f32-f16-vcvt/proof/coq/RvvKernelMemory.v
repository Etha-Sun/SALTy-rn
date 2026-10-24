From Coq Require Import ZArith Lia List.
From F32F16 Require Import rvv_unit_goal RvvKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque f16_rvv_values f16_pipeline f16_rvv_named_core f16_rvv_after_named_core.
Module CheckedRvvKernelMemory.
Lemma proof_of_test_rvv_entail_wit_1 : F32F16.rvv_unit_goal.test_rvv_entail_wit_1.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_entail_wit_1.
left;intros output_pre input_pre batch_pre A PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9.
f16_rvv_memory_prepare.
prop_apply(FloatArray.full_Zlength input_pre (batch_pre ÷ 4+3) A);Intros_p Hlen.
pose proof(f16_rvv_memory_byte_count batch_pre ltac:(lia) ltac:(lia) ltac:(lia)).
f16_rvv_frame.
Qed.
Lemma proof_of_test_rvv_entail_wit_2 : F32F16.rvv_unit_goal.test_rvv_entail_wit_2.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_entail_wit_2.
right;intros output_pre input_pre batch_pre A n input o PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9.
f16_rvv_memory_prepare.
subst n;rewrite !Z.sub_diag,?Z.mul_0_l,?Z.add_0_r in *.
subst o.
apply UShortArray.undef_full_to_undef_seg.
Qed.
Lemma proof_of_test_rvv_entail_wit_3 : F32F16.rvv_unit_goal.test_rvv_entail_wit_3.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_entail_wit_3.
right;intros output_pre input_pre batch_pre A o input n f16_progress retval PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11.
f16_rvv_memory_prepare.
pose proof(f16_rvv_memory_vl n ltac:(lia))as Hvl.
subst retval input o.
sep_apply(rvv_input_split input_pre (batch_pre ÷ 4-n) (vadd_vl n) (batch_pre ÷ 4+3) A ltac:(lia) ltac:(lia) ltac:(lia)).
sep_apply(UShortArray.undef_seg_split_to_undef_seg output_pre (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vadd_vl n) (batch_pre ÷ 4) ltac:(lia)).
sep_apply(UShortArray.undef_seg_to_undef_full output_pre (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vadd_vl n)).
replace ((batch_pre ÷ 4-n+vadd_vl n)-(batch_pre ÷ 4-n)) with (vadd_vl n) by lia.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *.
unfold StoreUShortAsElement.sizeA.
rewrite ?sizeof_ushort.
unfold rvv_slice.
destruct Hvl as [[Hvpos Hvmax] Hvn].
f16_rvv_frame.
Qed.
Lemma proof_of_test_rvv_entail_wit_4 : F32F16.rvv_unit_goal.test_rvv_entail_wit_4.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_entail_wit_4.
right;intros output_pre input_pre batch_pre A f16_progress_2 n input o vl f16_core_31 f16_core_30 f16_core_29 f16_core_28 f16_core_27 f16_core_26 f16_core_25 f16_core_24 f16_core_23 f16_core_22 f16_core_21 f16_core_20 f16_core_19 f16_core_18 f16_core_17 f16_core_16 f16_core_15 f16_core_14 f16_core_13 f16_core_12 f16_core_11 f16_core_10 f16_core_9 f16_core_8 f16_core_7 f16_core_6 f16_core_5 f16_core_4 f16_core_3 f16_core_2 f16_core_1 f16_core_0 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46.
Local Transparent f16_rvv_after_named_core.
f16_rvv_memory_prepare.
unfold f16_same_bits in PreH1,PreH2,PreH3,PreH4,PreH5,PreH6,PreH7,PreH8,PreH9,PreH10,PreH11,PreH12,PreH13,PreH14,PreH15,PreH16,PreH17,PreH18,PreH19,PreH20,PreH21,PreH22,PreH23,PreH24,PreH25,PreH26,PreH27,PreH28,PreH29,PreH30,PreH31,PreH32.
subst f16_progress_2.
replace (batch_pre ÷ 4-(batch_pre ÷ 4-n)) with n in * by lia.
rewrite <-PreH46 in PreH1,PreH2,PreH3,PreH4,PreH5,PreH6,PreH7,PreH8,PreH9,PreH10,PreH11,PreH12,PreH13,PreH14,PreH15,PreH16,PreH17,PreH18,PreH19,PreH20,PreH21,PreH22,PreH23,PreH24,PreH25,PreH26,PreH27,PreH28,PreH29,PreH30,PreH31,PreH32.
fold (f16_rvv_after_named_core 0 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_0).
fold (f16_rvv_after_named_core 1 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_1).
fold (f16_rvv_after_named_core 2 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_2).
fold (f16_rvv_after_named_core 3 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_3).
fold (f16_rvv_after_named_core 4 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_4).
fold (f16_rvv_after_named_core 5 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_5).
fold (f16_rvv_after_named_core 6 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_6).
fold (f16_rvv_after_named_core 7 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_7).
fold (f16_rvv_after_named_core 8 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_8).
fold (f16_rvv_after_named_core 9 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_9).
fold (f16_rvv_after_named_core 10 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_10).
fold (f16_rvv_after_named_core 11 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_11).
fold (f16_rvv_after_named_core 12 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_12).
fold (f16_rvv_after_named_core 13 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_13).
fold (f16_rvv_after_named_core 14 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_14).
fold (f16_rvv_after_named_core 15 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_15).
fold (f16_rvv_after_named_core 16 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_16).
fold (f16_rvv_after_named_core 17 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_17).
fold (f16_rvv_after_named_core 18 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_18).
fold (f16_rvv_after_named_core 19 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_19).
fold (f16_rvv_after_named_core 20 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_20).
fold (f16_rvv_after_named_core 21 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_21).
fold (f16_rvv_after_named_core 22 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_22).
fold (f16_rvv_after_named_core 23 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_23).
fold (f16_rvv_after_named_core 24 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_24).
fold (f16_rvv_after_named_core 25 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_25).
fold (f16_rvv_after_named_core 26 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_26).
fold (f16_rvv_after_named_core 27 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_27).
fold (f16_rvv_after_named_core 28 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_28).
fold (f16_rvv_after_named_core 29 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_29).
fold (f16_rvv_after_named_core 30 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_30).
fold (f16_rvv_after_named_core 31 vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_31).
assert(Hslice:vl<=Zlength (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A)).
{unfold rvv_slice;rewrite Zlength_sublist by lia;lia. }
pose proof(f16_named_packet_prefix vl (rvv_slice (batch_pre ÷ 4-n) ((batch_pre ÷ 4-n)+vl) A) f16_core_0 f16_core_1 f16_core_2 f16_core_3 f16_core_4 f16_core_5 f16_core_6 f16_core_7 f16_core_8 f16_core_9 f16_core_10 f16_core_11 f16_core_12 f16_core_13 f16_core_14 f16_core_15 f16_core_16 f16_core_17 f16_core_18 f16_core_19 f16_core_20 f16_core_21 f16_core_22 f16_core_23 f16_core_24 f16_core_25 f16_core_26 f16_core_27 f16_core_28 f16_core_29 f16_core_30 f16_core_31 ltac:(lia) Hslice PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32)as Hpacket.
rewrite Hpacket.
rewrite Z.sub_diag,UShortArray.undef_full_empty,sepcon_emp_equiv.
subst input o.
pose proof(rvv_input_merge input_pre (batch_pre ÷ 4-n) vl (batch_pre ÷ 4+3) A ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge.
rewrite sizeof_float in Hmerge.
unfold rvv_slice in *.
lazymatch type of Hmerge with ?PreMem |-- ?PostMem =>
 eapply derivable1_trans with (y := PreMem ** (UShortArray.full (output_pre+(batch_pre ÷ 4-n)*2) vl (f16_rvv_values vl (sublist (batch_pre ÷ 4-n) (batch_pre ÷ 4-n+vl) A)) ** UShortArray.seg output_pre 0 (batch_pre ÷ 4-n) (f16_rvv_values (batch_pre ÷ 4-n) A)));
 [ solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 | eapply derivable1_trans with (y := PostMem ** (UShortArray.full (output_pre+(batch_pre ÷ 4-n)*2) vl (f16_rvv_values vl (sublist (batch_pre ÷ 4-n) (batch_pre ÷ 4-n+vl) A)) ** UShortArray.seg output_pre 0 (batch_pre ÷ 4-n) (f16_rvv_values (batch_pre ÷ 4-n) A)));
   [apply derivable1_sepcon_mono;[exact Hmerge|apply derivable1_refl]|] ] end.
pose proof(f16_rvv_memory_output_append output_pre (batch_pre ÷ 4-n) vl A ltac:(lia) ltac:(lia)) as Happend.
rewrite sizeof_ushort in Happend;unfold rvv_slice in Happend.
lazymatch type of Happend with ?PreMem |-- ?PostMem =>
 eapply derivable1_trans with (y := PreMem ** (FloatArray.full input_pre (batch_pre ÷ 4+3) A));
 [ solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 | eapply derivable1_trans with (y := PostMem ** (FloatArray.full input_pre (batch_pre ÷ 4+3) A));
   [apply derivable1_sepcon_mono;[exact Happend|apply derivable1_refl]|] ] end.
replace (batch_pre ÷ 4-(n-vl)) with ((batch_pre ÷ 4-n)+vl) by lia.
f16_rvv_frame.
Qed.
Lemma proof_of_test_rvv_return_wit_1 : F32F16.rvv_unit_goal.test_rvv_return_wit_1.
Proof. unfold F32F16.rvv_unit_goal.test_rvv_return_wit_1.
right;intros output_pre input_pre batch_pre A o input n f16_progress PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10.
f16_rvv_memory_prepare.
assert(Hz:n=0)by lia;subst n;rewrite Z.sub_0_r.
apply f16_ushort_prefix_finish.
Qed.
End CheckedRvvKernelMemory.
