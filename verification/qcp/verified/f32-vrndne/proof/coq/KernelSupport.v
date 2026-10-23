From Coq Require Import ZArith Lia List Strings.String.
From Rndne Require Export VectorSupport ProgramModel.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import LoopMemory TailMemory neon_init_lemmas neon_tail_models InvariantFacts NeonLoopBridge.
From ByValue Require Import neon_copy_checked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rndne_forget_fields :=
 repeat match goal with |- ?P |-- ?Q =>
  first [multimatch Q with context[undef_store_float ?p] =>
          multimatch P with context[store_float p ?v] => sep_apply (store_float_undef_store_float p v) end end
        |multimatch Q with context[undef_store_int ?p] =>
          multimatch P with context[store_int p ?v] => sep_apply (store_int_undef_store_int p v) end end
        |multimatch Q with context[undef_store_uint ?p] =>
          multimatch P with context[store_uint p ?v] => sep_apply (store_uint_undef_store_uint p v) end end]
 end.
Ltac rndne_kernel_frame :=
 unfold Rndne.Types.UndefStructPredfloat32x4_t,
   QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,
   Rndne.Types.UndefStructPredfloat32x2_t,
   Rndne.Types.UndefStructPreduint32x4_t;
 rewrite ?rndne_local_field_address;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 rewrite ?sizeof_float in *;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first [assumption|split|reflexivity];lia
  |rndne_forget_fields;opaque_leaves;sepcon_assoc_change;fast_cancel]
 |rndne_forget_fields;opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac rndne_kernel_finish :=
 try left;intros;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold rndne_same_bits,same_bits in *;subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 first [solve [unfold derivable1,andp,coq_prop,truep;intros;
 repeat first [assumption|split|reflexivity];lia]
 |solve [rndne_kernel_frame]
 |solve [repeat match goal with H:context[Z.land] |- _ => progress(vm_compute in H) end;exfalso;congruence]].
