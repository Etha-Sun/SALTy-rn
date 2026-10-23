From Coq Require Import ZArith Lia List.
From Qu8Cvt Require Export Types MemoryModel ProgramFacts CharFrame.
From QcpVadd Require Import VaddBits.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac cvt_unroll :=
 unfold Qu8Cvt.Types.UndefStructPreduint8x8_t,
 Qu8Cvt.Types.UndefStructPredint16x8_t,Qu8Cvt.Types.UndefStructPredint16x4_t,
 Qu8Cvt.Types.UndefStructPredint32x4_t,Qu8Cvt.Types.UndefStructPredfloat32x4_t,
 Qu8Cvt.Types.UndefStructPredfloat32x2_t,Qu8Cvt.Types.UndefStructPredvuint8m2_t,
 Qu8Cvt.Types.UndefStructPredvint16m4_t,Qu8Cvt.Types.UndefStructPredvint32m8_t,
 Qu8Cvt.Types.UndefStructPredvfloat32m8_t;
 rewrite ?Qu8Cvt.Types.local_field_address.
Ltac cvt_pure :=
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 unfold cvt_same,fp32_bits_equal in *;subst;
 unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Ltac cvt_frame :=
 cvt_unroll;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [cvt_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac cvt_simple :=
 first[solve[intros;cvt_pure]
 |solve[intros;unfold cvt_same,fp32_bits_equal in *;subst;cvt_frame]
 |solve[pre_process;subst;try csimpl;entailer!]
 |solve[intros;cvt_unroll;try csimpl;entailer!]].
