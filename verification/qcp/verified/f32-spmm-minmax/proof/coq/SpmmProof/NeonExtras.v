From Coq Require Import ZArith List Lia.
From SpmmProof Require Export EntryFrame.
From SpmmSpec Require Export GeometryFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac spmm_extra_normalize :=
 spmm_entry_normalize;
 try match goal with H:spmm_capacity ?rows ?cols ?stride ?a ?w ?d ?n ?out ?NN ?D ?A ?W |- _ =>
 let Hb:=fresh "Hout_bound" in pose proof(spmm_capacity_out_bound rows cols stride a w d n out NN D A W H)as Hb end;
 try rewrite spmm_output_cursor_start by lia.
Ltac spmm_fast_frame_neon :=
 spmm_layout;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[spmm_pure2|spmm_cancel2]|spmm_cancel2].
Ltac spmm_index_pure := spmm_remaining_facts;spmm_index_facts;spmm_frame2.
Ltac spmm_loan3 :=
 spmm_remaining_facts;
 spmm_index_facts;
 first[
 multimatch goal with |- ?P |-- ?Q =>
  multimatch P with context[FloatArray.full ?base ?len ?xs] =>
   multimatch Q with context[FloatArray.missing_i base ?i 0 len xs] =>
    sep_apply(spmm_float_loan base i len xs ltac:(lia))end end end
 |multimatch goal with |- ?P |-- ?Q =>
  multimatch P with context[IntArray.full ?base ?len ?xs] =>
   multimatch Q with context[IntArray.missing_i base ?i 0 len xs] =>
    sep_apply(spmm_int_loan base i len xs ltac:(lia))end end end
 |multimatch goal with |- ?P |-- ?Q =>
  multimatch P with context[UIntArray.full ?base ?len ?xs] =>
   multimatch Q with context[UIntArray.missing_i base ?i 0 len xs] =>
    sep_apply(spmm_uint_loan base i len xs ltac:(lia))end end end];
 unfold fp_at,z_at,Znth,spmm_get in *;rewrite ?sizeof_uint in *;spmm_normalize;spmm_frame2.
