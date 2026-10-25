From Coq Require Import ZArith List Lia Strings.String.
From SpmmProof Require Export MemoryFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope string_scope.
Local Open Scope Z_scope.
Local Open Scope sac.

Ltac spmm_tuple_layout :=
 unfold StructPredfloat32x4x2_t,UndefStructPredfloat32x4x2_t;
 rewrite ?tuple_local_field_address;
 cbn [tuple_values];spmm_normalize2.
Ltac spmm_tuple_expand :=
 unfold StructPredfloat32x4x2_t,UndefStructPredfloat32x4x2_t,
 Structfloat32x4_tArray.full,Structfloat32x4_tArray.undef_full;
 cbn [tuple_values Structfloat32x4_tArray.cells Structfloat32x4_tArray.undef_cells Z.to_nat];
 unfold StructPredfloat32x4_t;
 rewrite ?tuple_local_field_address;
 spmm_normalize2;
 cbv [Pos.to_nat Pos.iter_op nth f0 f1 f2 f3];
 rewrite ?Zlength_cons,?Zlength_nil.
Ltac spmm_tuple_frame :=
 first[spmm_tuple_layout;solve[spmm_frame2]
 |spmm_tuple_expand;spmm_layout;Intros;
  repeat progress rewrite <-logic_equiv_andp_assoc;
  first[apply _derivable1_andp_intros;[spmm_pure2|opaque_leaves;sepcon_assoc_change;fast_cancel]
       |opaque_leaves;sepcon_assoc_change;fast_cancel]].
