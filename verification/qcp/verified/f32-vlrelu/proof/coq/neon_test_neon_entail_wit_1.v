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

Lemma proof_of_test_neon_entail_wit_1 : test_neon_entail_wit_1.
Proof.
 unfold test_neon_entail_wit_1; intros. repeat rewrite vlrelu_neon_scalar.
 prop_apply (FloatArray.full_Zlength input_pre (batch_pre ÷ 4 + 3) A). Intros_p HA.
 unfold fp32_length.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqr.
 pose proof (byte_batch_tail_cases batch_pre ltac:(lia) PreH7) as Hcases.
 destruct Hcases as [H0|[H4|[H8|[H12|Hbig]]]]; try lia.
 all: sep_apply (float_initial_split input_pre (batch_pre ÷ 4 + 3) A).
 all: choose_initial_case.
Qed.
