From Coq Require Import ZArith List.
From SimpleC.SL Require Import ArrayLib.
From X32Transpose Require Export OutputMemory Types.
Import ListNotations. Local Open Scope Z_scope.
Definition xt_stride_valid(W:list Z)(p s vl:Z):Prop:=NoDup W /\ 0<=vl<=32 /\ forall j,0<=j<vl->In(xt_addr p s j)W.
Definition xt_stride_distinct(p s vl:Z):Prop:=forall i j,0<=i<vl->0<=j<vl->xt_addr p s i=xt_addr p s j->i=j.
Definition xt_strided_write(O:XTOutput)(p s vl:Z)(V:list Z):XTOutput:=
 fold_left(fun state i=>xt_output_put state(xt_addr p s(Z.of_nat i))(Znth(Z.of_nat i)V 0))(seq 0(Z.to_nat vl))O.
Definition xt_vec32
(x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z):list Z:= [x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15;x16;x17;x18;x19;x20;x21;x22;x23;x24;x25;x26;x27;x28;x29;x30;x31].
