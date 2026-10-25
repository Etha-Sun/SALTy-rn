From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export AccessFacts VectorFacts.
From SpmmProof Require Export KernelFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac spmm_remaining_facts :=
 try multimatch goal with H:spmm_shape ?rows ?cols ?start ?NN ?D ?A ?W |- context[nnz_before ?NN ?c+(Znth ?c ?NN 0-?rem)] =>
  let HD:=fresh "Hdelta" in pose proof(spmm_remaining_cursor_range rows cols start NN D A W c rem H ltac:(lia) ltac:(unfold z_at,Znth in *;lia))as HD end;
 try multimatch goal with H:spmm_shape ?rows ?cols ?start ?NN ?D ?A ?W |- context[bias_index ?NN ?c+1+(z_at ?NN ?c-?rem)] =>
  let HW:=fresh "Hweight" in pose proof(spmm_remaining_weight_range rows cols start NN D A W c rem H ltac:(lia) ltac:(unfold z_at,Znth in *;lia))as HW end.
Ltac spmm_loan2 :=
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
 unfold fp_at,z_at,Znth,spmm_get in *;spmm_normalize;spmm_frame2.

Ltac spmm_input_window :=
 match goal with H:spmm_shape ?rows ?cols ?start ?NN ?D ?A ?W |- context[input_index ?D ?start ?row (nnz_before ?NN ?c+(z_at ?NN ?c-?rem))+?width] =>
  let HA:=fresh "Hinput" in pose proof(spmm_remaining_input_range rows cols start NN D A W c rem row width H ltac:(lia) ltac:(unfold z_at,Znth in *;lia) ltac:(lia) ltac:(lia) ltac:(lia))as HA
 end;spmm_frame2.
Ltac spmm_output_loan :=
 spmm_shape_facts;
 multimatch goal with |- ?P |-- ?Q =>
  multimatch P with context[spmm_output ?out ?rows ?cols ?stride ?row ?col ?width ?start ?NN ?D ?A ?W ?lo ?hi] =>
   multimatch Q with context[spmm_output_hole out rows cols stride row col width start NN D A W lo hi] =>
    sep_apply(spmm_output_open_at_cursor out rows cols stride row col width start NN D A W lo hi ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia))
   end end end;spmm_frame2.
