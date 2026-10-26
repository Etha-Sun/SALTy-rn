From Coq Require Import ZArith.
From ExpMinusMax Require Export KernelModel RvvIntrinsicModel.
Local Open Scope Z_scope.
Definition em_rvv_acc_record(F:EMMap)(p m g:Z):Recordfloat32x4_t:=
 em_acc_record(em_rvv_accumulate(Z.to_nat g)(em_input F p)(em_get F m)em_acc_zero 0).
Definition em_rvv_acc_prefix(F:EMMap)(p m g:Z)(a:Recordvfloat32m4_t):Prop:=
 em_rvv_active_float 4 a(em_get_float32x4_t(em_rvv_acc_record F p m g)).
