From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import LoopMemory TailMemory neon_init_lemmas neon_tail_models InvariantFacts NeonLoopBridge.
From QcpRvv32 Require Import RvvLayout FastFrame.
From ByValue Require Import neon_copy_checked.
From VLRelu Require Import Model Bits RvvFastFrame NeonSelect NeonResult neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Ltac neon_forget_fields :=
 repeat match goal with |- ?P |-- ?Q =>
  first [multimatch Q with context[undef_store_float ?p] =>
          multimatch P with context[store_float p ?v] => sep_apply (store_float_undef_store_float p v) end end
        |multimatch Q with context[undef_store_int ?p] =>
          multimatch P with context[store_int p ?v] => sep_apply (store_int_undef_store_int p v) end end
        |multimatch Q with context[undef_store_uint ?p] =>
          multimatch P with context[store_uint p ?v] => sep_apply (store_uint_undef_store_uint p v) end end]
 end.

Ltac generic_copy :=
 unfold VLRelu.Model.UndefStructPredfloat32x4_t,
  QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,
  UndefStructPredfloat32x2_t, UndefStructPredint32x4_t, UndefStructPreduint32x4_t;
 rewrite ?local_field_address; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size];
 rewrite ?sizeof_float in *;
 repeat rewrite vlrelu_neon_scalar;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1, andp, coq_prop; intros; repeat first [assumption|split|reflexivity];lia
 |neon_forget_fields; opaque_leaves; sepcon_assoc_change; fast_cancel]
 |neon_forget_fields; opaque_leaves; sepcon_assoc_change; fast_cancel].

Ltac neon_solve :=
 first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
   unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop;
   intros; repeat first [assumption|split|reflexivity];lia]
 |solve [intros; generic_copy]
 |solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
   subst; repeat match goal with H: context[Z.land] |- _ => progress (vm_compute in H) end;
   exfalso; congruence]
 ].

Ltac choose_initial_case :=
 first [solve [Exists 0; unfold FloatArray.full, store_array;
 cbn [store_array_rec]; entailer!;
 cbn [vlrelu_values List.firstn Z.to_nat store_array_rec]; try entailer!;
 subst; try reflexivity; try lia]
 | rewrite <- derivable1_orp_intros1; choose_initial_case
 | rewrite <- derivable1_orp_intros2; choose_initial_case].
Ltac choose_step_case k :=
 first [solve [Exists (k+4); entailer!; lia]
 | rewrite <- derivable1_orp_intros1; choose_step_case k
 | rewrite <- derivable1_orp_intros2; choose_step_case k].

Lemma proof_of_test_neon_return_wit_1 : test_neon_return_wit_1.
Proof.
 unfold test_neon_return_wit_1; left; intros. repeat rewrite vlrelu_neon_scalar.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 assert (Htot: batch_pre ÷ 4 = k + 3).
 { replace batch_pre with ((k+3)*4) by lia. rewrite Z.quot_mul by lia. reflexivity. }
 subst input output.
 pose proof (float_input_restore input_pre k (batch_pre ÷ 4+3) A __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HA.
 unfold LoopMemory.float_cells4 in HA.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA.
 replace (batch_pre ÷ 4+3-k) with (batch ÷ 4+3) in HA by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HA.
 sep_apply HA.
 pose proof (float_prefix_append3 output_pre k (vlrelu_values k A c) (vlrelu_scalar (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) c) (vlrelu_scalar (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) c) (vlrelu_scalar (Znth 2 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) c) ltac:(lia)) as HO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 replace (output_pre+k*4+0*4) with (output_pre+k*4) in * by lia.
 sep_apply HO.
 pose proof (vlrelu_tail_four k 3 A c __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HM.
 replace (Zlength A) with (batch_pre ÷ 4+3) in HM by lia.
 replace (Z.to_nat 3) with 3%nat in HM by reflexivity. cbn [firstn] in HM.
 rewrite <- HM.
 rewrite Htot.
 replace (batch ÷ 4) with 3 by lia.
 replace (2+1) with 3 by lia. rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.
