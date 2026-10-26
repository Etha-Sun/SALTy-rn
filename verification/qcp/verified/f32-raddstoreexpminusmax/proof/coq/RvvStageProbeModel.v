From Coq Require Import ZArith.
From ExpMinusMax Require Export RvvIntrinsicModel.
Local Open Scope Z_scope.
Definition em_rvv_sub_self_p(x:fp32)(vl:Z)(r:Recordvfloat32m4_t):Prop:=em_rvv_active_float vl r(fun _=>em_rvv_sub x x).
