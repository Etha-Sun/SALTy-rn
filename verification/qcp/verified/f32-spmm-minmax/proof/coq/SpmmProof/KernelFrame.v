From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export LoopFacts CursorFacts.
From SpmmProof Require Export Automation.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Ltac spmm_normalize2 :=
 unfold bit_same in *;subst;spmm_normalize;
 rewrite ?spmm_mc_rem,?spmm_mc_quot,?spmm_bias_zero,?spmm_nnz_zero,
 ?spmm_input_zero in *;
 repeat progress rewrite spmm_output_start_width in *;
 cbn [tuple_at tuple_values f0 f1 f2 f3 nth Z.to_nat] in *;
 spmm_normalize.
Ltac spmm_shape_facts :=
 try match goal with H:spmm_shape _ _ _ _ _ _ _ |- _ =>
  let HC:=fresh "Hshape" in pose proof H as HC;unfold spmm_shape in HC;
  decompose [and] HC;clear HC end;
 try match goal with H:spmm_capacity _ _ _ _ _ _ _ _ _ _ _ _ |- _ =>
  let HC:=fresh "Hcapacity" in pose proof H as HC;unfold spmm_capacity in HC;
  decompose [and] HC;clear HC end;
 try match goal with H:spmm_vl_allowed ?n ?vl |- _ =>
  let HV:=fresh "Hvl" in pose proof(spmm_vl_progress n vl ltac:(lia) H)as HV end.
Ltac spmm_nnz_facts :=
 try match goal with H:Forall (fun n:Z=>0<=n<=4294967295) ?NN |- context[Znth ?i ?NN 0] =>
  let Hr:=fresh "Hnnz" in pose proof(z_at_nnz_range NN i H ltac:(lia))as Hr;
  change (0<=Znth i NN 0<=4294967295) in Hr end;
 try match goal with H:Forall (fun n:Z=>0<=n<=4294967295) ?NN |- context[z_at ?NN ?i] =>
  let Hr:=fresh "Hnnz" in pose proof(z_at_nnz_range NN i H ltac:(lia))as Hr end.
Ltac spmm_pure_assertion A :=
 lazymatch A with
 | coq_prop _ => idtac
 | andp ?P ?Q => spmm_pure_assertion P;spmm_pure_assertion Q
 | _ => fail 0 "not a pure assertion"
 end.
Ltac spmm_pure2 :=
 lazymatch goal with |- _ |-- ?Q => spmm_pure_assertion Q | _ => idtac end;
 spmm_shape_facts;spmm_nnz_facts;
 unfold derivable1,andp,coq_prop;intros;
 repeat first[assumption|reflexivity|apply conj];
 unfold modulus64 in *;lia.
Ltac spmm_layout :=
 unfold UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t,
 UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?tuple_local_field_address.
Ltac spmm_forget :=
 repeat first [
 multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[undef_store_float ?p] =>
   multimatch P with context[store_float p ?v] =>sep_apply(store_float_undef_store_float p v)end end end
 |multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[undef_store_int ?p] =>
   multimatch P with context[store_int p ?v] =>sep_apply(store_int_undef_store_int p v)end end end
 |multimatch goal with |- ?P |-- ?Q =>
  multimatch Q with context[undef_store_ptr ?p] =>
   multimatch P with context[store_ptr p ?v] =>sep_apply(store_ptr_undef_store_ptr p v)end end end].
Ltac spmm_cancel2 := spmm_forget;opaque_leaves;sepcon_assoc_change;fast_cancel.
Ltac spmm_frame2 :=
 spmm_layout;Intros;repeat progress rewrite <-logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;[spmm_pure2|spmm_cancel2]|spmm_cancel2].

Ltac spmm_index_facts :=
 spmm_shape_facts;
 try match goal with H:Forall (fun n:Z=>0<=n<=4294967295) ?NN |- context[bias_index ?NN ?c] =>
  let HB:=fresh "Hbias" in pose proof(bias_index_range NN c H ltac:(lia))as HB end;
 try match goal with H:Forall (fun n:Z=>0<=n<=4294967295) ?NN |- context[nnz_before ?NN ?c+?depth] =>
  let HD:=fresh "Hcursor" in pose proof(sparse_cursor_range NN c depth H ltac:(lia) ltac:(lia))as HD end;
 try match goal with H:Forall (fun n:Z=>0<=n<=4294967295) ?NN |- context[bias_index ?NN ?c+1+?depth] =>
  let HW:=fresh "Hweight" in pose proof(weight_index_range NN c depth H ltac:(lia) ltac:(lia))as HW end.
Ltac spmm_loan :=
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
 spmm_normalize;spmm_frame2.
Ltac spmm_restore :=
 multimatch goal with |- ?P |-- ?Q =>
  multimatch P with context[FloatArray.missing_i ?base ?i 0 ?len ?xs] =>
   multimatch Q with context[FloatArray.full base len xs] =>
    sep_apply(spmm_float_restore base i len xs ltac:(lia))end end end;
 spmm_normalize;spmm_frame2.
