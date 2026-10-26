From Coq Require Import ZArith List Lia.
From ExpMinusMax Require Export OutputMemory AccumulatorModel.
Import ListNotations.
Local Open Scope Z_scope.
Fixpoint em_write_nat(O:EMOutput)(p:Z)(n:nat)(f:Z->fp32):EMOutput:=
 match n with Datatypes.O=>O|S k=>em_output_put(em_write_nat O p k f)(p+4*Z.of_nat k)(f(Z.of_nat k))end.
Definition em_output_write(O:EMOutput)(p count:Z)(f:Z->fp32):EMOutput:=em_write_nat O p(Z.to_nat count)f.
Definition em_input(F:EMMap)(p:Z):Z->fp32:=fun j=>em_get F(p+4*j).
Definition em_arm_result(F:EMMap)(input maximum output sum n:Z)(O:EMOutput):EMOutput:=
 let get:=em_input F input in let m:=em_get F maximum in
 em_output_put(em_output_write O output n(fun j=>em_arm_value(get j)m))sum(em_arm_sum n get m).
Definition em_rvv_result(F:EMMap)(input maximum output sum n:Z)(O:EMOutput):EMOutput:=
 let get:=em_input F input in let m:=em_get F maximum in
 em_output_put(em_output_write O output n(fun j=>em_rvv_value(get j)m))sum(em_rvv_sum n get m).
Definition em_valid(F:EMMap)(W:list Z)(input maximum output sum n:Z):Prop:=
 0<n /\ n<=4611686018427387903 /\
 em_window F input(n+3) /\ em_present F maximum /\ 0<maximum /\
 em_write_window W output n /\ In sum W /\ 0<sum /\ NoDup W.
(* RO/output separation is represented by SEP at the public C interface.  The
   original prototype has no restrict; arbitrary writable/read overlap and
   in-place input==output are outside this explicit footprint contract. *)
Definition em_written(output sum n p:Z):Prop:=p=sum\/exists j,0<=j<n/\p=output+4*j.
