From Coq Require Import ZArith List Lia Strings.String.
From SpmmSpec Require Export Model Vectors ShapeFacts MemoryStore.
From SpmmProof Require Export FastFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac spmm_normalize :=
 rewrite ?sizeof_char,?sizeof_float,?sizeof_int,?sizeof_short in *;
 rewrite ?Z.sub_diag,?Z.quot_0_l,?Z.rem_0_l,?Z.mul_0_l,?Z.mul_0_r,
 ?Z.mul_1_l,?Z.mul_1_r,?Z.add_0_l,?Z.add_0_r,?Z.sub_0_r,
 ?replace_Znth_Znth in *.
Ltac spmm_pure :=
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 unfold spmm_shape,spmm_capacity,modulus64 in *;
 intuition lia.
Ltac spmm_frame :=
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
   [spmm_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
