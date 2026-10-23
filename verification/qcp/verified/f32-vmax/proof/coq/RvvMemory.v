From FMax Require Import rvv_unit_goal ProgramModel RvvListSupport RvvResult.
From Coq Require Import ZArith List Lia.
From QcpRvv32 Require Import RvvLoopMemory RvvLoopResult RvvResultBridge.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
From QcpVadd Require Import VaddBits.
From QcpRvv32 Require Import RvvLogic RvvStoreModel RvvLoopModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Module CheckedRvvLoopMemory.
Lemma proof_of_test_rvv_entail_wit_1 : FMax.rvv_unit_goal.test_rvv_entail_wit_1.
Proof.
 unfold FMax.rvv_unit_goal.test_rvv_entail_wit_1; left; intros.
 prop_apply (FloatArray.full_Zlength input_a_pre (batch_pre ÷ 4 + 3) A). Intros_p HA.
 prop_apply (FloatArray.full_Zlength input_b_pre (batch_pre ÷ 4 + 3) B). Intros_p HB.
 unfold rvv_length.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqr.
 entailer!; lia.
Qed.

Lemma proof_of_test_rvv_entail_wit_2 : FMax.rvv_unit_goal.test_rvv_entail_wit_2.
Proof.
 unfold FMax.rvv_unit_goal.test_rvv_entail_wit_2; intros.
 subst n. rewrite Z.sub_diag.
 cbn [mm_rvv_values Z.to_nat firstn].
 rewrite FloatArray.seg_empty.
 sep_apply (FloatArray.undef_full_to_undef_seg output_pre (batch_pre ÷ 4)).
 entailer!; lia.
Qed.


Lemma proof_of_test_rvv_return_wit_1 : FMax.rvv_unit_goal.test_rvv_return_wit_1.
Proof.
 unfold FMax.rvv_unit_goal.test_rvv_return_wit_1; left; intros.
 assert (n_2=0) by lia. subst n_2.
 rewrite Z.sub_0_r.
 sep_apply (FloatArray.seg_to_full output_pre 0 (batch_pre ÷ 4) (mm_rvv_values (batch_pre ÷ 4) A B)).
 replace (output_pre + 0 * sizeof(FLOAT)) with output_pre by lia.
 rewrite Z.sub_0_r.
 rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.
Lemma proof_of_test_rvv_entail_wit_3 : FMax.rvv_unit_goal.test_rvv_entail_wit_3.
Proof.
 unfold FMax.rvv_unit_goal.test_rvv_entail_wit_3; left; intros.
 assert (Hvl : 0 < retval /\ retval <= 32 /\ retval <= n).
 { subst retval. unfold vadd_vl. split; [apply Z.min_glb_lt; lia|].
   split; [apply Z.le_min_r|apply Z.le_min_l]. }
 subst input_a input_b output.
 unfold rvv_slice.
 sep_apply (rvv_input_split input_a_pre (batch_pre ÷ 4-n) retval (batch_pre ÷ 4+3) A ltac:(lia) ltac:(lia) ltac:(lia)).
 sep_apply (rvv_input_split input_b_pre (batch_pre ÷ 4-n) retval (batch_pre ÷ 4+3) B ltac:(lia) ltac:(lia) ltac:(lia)).
 sep_apply (FloatArray.undef_seg_split_to_undef_seg output_pre (batch_pre ÷ 4-n) (batch_pre ÷ 4-n+retval) (batch_pre ÷ 4) ltac:(lia)).
 sep_apply (FloatArray.undef_seg_to_undef_full output_pre (batch_pre ÷ 4-n) (batch_pre ÷ 4-n+retval)).
 replace (batch_pre ÷ 4-n+retval-(batch_pre ÷ 4-n)) with retval by lia.
 entailer!; lia.
Qed.
Lemma proof_of_test_rvv_entail_wit_4 : FMax.rvv_unit_goal.test_rvv_entail_wit_4.
Proof.
 unfold FMax.rvv_unit_goal.test_rvv_entail_wit_4; left; intros.
 subst input_a input_b output.
 unfold rvv_slice, rvv_length in *.
 replace (batch_pre ÷ 4 - (n_2-vl)) with (batch_pre ÷ 4-n_2+vl) by lia.
 match goal with
 | |- context[rvv_take vl ?lanes] =>
   change (rvv_take vl lanes) with
     (rvv_take vl (mm_result_packed vl
       (sublist (batch_pre ÷ 4-n_2) (batch_pre ÷ 4-n_2+vl) A)
       (sublist (batch_pre ÷ 4-n_2) (batch_pre ÷ 4-n_2+vl) B)))
 end.
 prop_apply (FloatArray.full_Zlength (input_a_pre+(batch_pre ÷ 4-n_2)*sizeof(FLOAT)) vl
   (sublist (batch_pre ÷ 4-n_2) (batch_pre ÷ 4-n_2+vl) A)). Intros_p HAlen.
 prop_apply (FloatArray.full_Zlength (input_b_pre+(batch_pre ÷ 4-n_2)*sizeof(FLOAT)) vl
   (sublist (batch_pre ÷ 4-n_2) (batch_pre ÷ 4-n_2+vl) B)). Intros_p HBlen.
 rewrite mm_packed_result_prefix by lia.
 sep_apply (rvv_input_merge input_a_pre (batch_pre ÷ 4-n_2) vl (batch_pre ÷ 4+3) A ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)).
 sep_apply (rvv_input_merge input_b_pre (batch_pre ÷ 4-n_2) vl (batch_pre ÷ 4+3) B ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)).
 sep_apply (rvv_output_append output_pre (batch_pre ÷ 4-n_2) vl
   (mm_rvv_values (batch_pre ÷ 4-n_2) A B)
   (mm_rvv_values vl (sublist (batch_pre ÷ 4-n_2) (batch_pre ÷ 4-n_2+vl) A)
     (sublist (batch_pre ÷ 4-n_2) (batch_pre ÷ 4-n_2+vl) B)) ltac:(lia) ltac:(lia)).
 rewrite <- mm_rvv_append by lia.
 Exists (batch_pre ÷ 4).
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 entailer!; lia.
Qed.
End CheckedRvvLoopMemory.
Print Assumptions CheckedRvvLoopMemory.proof_of_test_rvv_return_wit_1.
Print Assumptions CheckedRvvLoopMemory.proof_of_test_rvv_entail_wit_3.
Print Assumptions CheckedRvvLoopMemory.proof_of_test_rvv_entail_wit_4.
Print Assumptions CheckedRvvLoopMemory.proof_of_test_rvv_entail_wit_1.
Print Assumptions CheckedRvvLoopMemory.proof_of_test_rvv_entail_wit_2.
