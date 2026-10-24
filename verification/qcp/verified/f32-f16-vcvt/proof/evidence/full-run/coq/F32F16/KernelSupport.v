From Coq Require Import ZArith Lia List Strings.String.
From F32F16 Require Export VectorSupport ProgramModel Literal WordView.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import LoopMemory TailMemory neon_init_lemmas neon_tail_models InvariantFacts NeonLoopBridge.
From ByValue Require Import neon_copy_checked.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Ltac f16_forget_fields :=
 repeat match goal with |- ?P |-- ?Q =>
 first[multimatch Q with context[undef_store_float ?p]=>multimatch P with context[store_float p ?v]=>sep_apply(store_float_undef_store_float p v)end end
 |multimatch Q with context[undef_store_uint ?p]=>multimatch P with context[store_uint p ?v]=>sep_apply(store_uint_undef_store_uint p v)end end
 |multimatch Q with context[undef_store_ushort ?p]=>multimatch P with context[store_ushort p ?v]=>sep_apply(store_ushort_undef_store_ushort p v)end end
 |multimatch Q with context[undef_store_int ?p]=>multimatch P with context[store_int p ?v]=>sep_apply(store_int_undef_store_int p v)end end]
 end.
Ltac f16_kernel_frame :=
 unfold F32F16.Types.UndefStructPredfloat32x4_t,QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,
 F32F16.Types.UndefStructPredfloat32x2_t,QcpNeon.NeonBridge.UndefStructPredfloat32x2_t,
 F32F16.Types.UndefStructPreduint32x4_t,F32F16.Types.UndefStructPreduint16x4_t,F32F16.Types.UndefStructPreduint16x8_t,
 F32F16.Types.UndefStructPredvfloat32m8_t,QcpRvv32.RvvLayout.UndefStructPredvfloat32m8_t,
 F32F16.Types.UndefStructPredvuint32m8_t,F32F16.Types.UndefStructPredvuint16m4_t,F32F16.Types.UndefStructPredvbool4_t;
 rewrite ?f16_local_field_address;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?sizeof_float,?sizeof_ushort in *;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |f16_forget_fields;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |f16_forget_fields;opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac f16_kernel_finish :=
 try left;intros;
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?f16_scale_hi_decimal,?f16_scale_lo_decimal in *;
 unfold f16_same_bits,same_bits in *;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with(-2147483648)in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 first[solve[unfold derivable1,andp,coq_prop,truep;intros;repeat first[assumption|split|reflexivity];lia]
 |solve[f16_kernel_frame]
 |solve[repeat match goal with H:context[Z.land] |- _=>progress(vm_compute in H)end;exfalso;congruence]].
Lemma f16_byte_tail_cases8 : forall b,0<=b -> Z.rem b 4=0 ->
 b=0 \/ b=4 \/ b=8 \/ b=12 \/ b=16 \/ b=20 \/ b=24 \/ b=28 \/ 32<=b.
Proof. intros b Hb Hr;pose proof(Z.quot_rem b 4 ltac:(lia));lia. Qed.
Print Assumptions f16_byte_tail_cases8.
