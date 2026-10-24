From Coq Require Import ZArith Lia List.
From F32F16 Require Export KernelSupport VectorForget ArrayMemory.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
(* Callers introduce only the explicit C/ghost binders.  These tactics never
   introduce a semantic heap model or choose a disjunct of an SL postcondition. *)
Ltac f16_rvv_prepare :=
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?f16_scale_hi_decimal,?f16_scale_lo_decimal,?sizeof_float,?sizeof_ushort in *;
 unfold f16_same_bits,same_bits in *;subst;
 rewrite ?f16_local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with(-2147483648)in *;
 try change Int64.max_unsigned with 18446744073709551615 in *.
Ltac f16_rvv_pure :=
 unfold derivable1,andp,coq_prop,truep;intros;
 repeat first[assumption|split|reflexivity];lia.
Ltac f16_rvv_frame :=
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [f16_rvv_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac f16_rvv_which :=
 f16_rvv_prepare;
 first[solve[apply f16_forget_vfloat32m8_t]
 |solve[apply f16_forget_vuint32m8_t]
 |solve[apply f16_forget_vuint16m4_t]
 |solve[apply f16_forget_vbool4_t]].
Ltac f16_rvv_finish :=
 f16_rvv_prepare;
 first[solve[f16_rvv_pure]|solve[f16_rvv_frame]|solve[f16_kernel_frame]].
