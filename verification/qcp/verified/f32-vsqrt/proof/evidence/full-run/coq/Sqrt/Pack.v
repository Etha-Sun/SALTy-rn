From Coq Require Import List ZArith.
From Sqrt Require Export Model.
From QcpRvv32 Require Import RvvLoopModel.
Import ListNotations. Local Open Scope Z_scope.
Definition sqrt_pack1 (x0:fp32):list fp32 := [x0].
Definition sqrt_pack2 (x0:fp32)(x1:fp32):list fp32 := [x0;x1].
Definition sqrt_pack4 (x0:fp32)(x1:fp32)(x2:fp32)(x3:fp32):list fp32 := [x0;x1;x2;x3].
Definition sqrt_pack32 (x0:fp32)(x1:fp32)(x2:fp32)(x3:fp32)(x4:fp32)(x5:fp32)(x6:fp32)(x7:fp32)(x8:fp32)(x9:fp32)(x10:fp32)(x11:fp32)(x12:fp32)(x13:fp32)(x14:fp32)(x15:fp32)(x16:fp32)(x17:fp32)(x18:fp32)(x19:fp32)(x20:fp32)(x21:fp32)(x22:fp32)(x23:fp32)(x24:fp32)(x25:fp32)(x26:fp32)(x27:fp32)(x28:fp32)(x29:fp32)(x30:fp32)(x31:fp32):list fp32 := [x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15;x16;x17;x18;x19;x20;x21;x22;x23;x24;x25;x26;x27;x28;x29;x30;x31].
Definition sqrt_lane(i:Z)(a:list fp32):fp32:=Znth i a fp32_zero.
Definition sqrt_active(i vl:Z)(x tail:fp32):fp32:=if Z.ltb i vl then sqrt_rvv x else tail.
Definition sqrt_read_active(i vl:Z)(a:list fp32)(tail:fp32):fp32:=if Z.ltb i vl then sqrt_lane i a else tail.
Definition sqrt_vl(n:Z):Z:=Z.min n 32.
Definition sqrt_take(n:Z)(a:list fp32):list fp32:=firstn (Z.to_nat n) a.
Definition sqrt_vl_allowed(n vl:Z):Prop:=0<=vl<=32 /\ (n<=32 ->vl=n) /\ (32<n<64 -> (n+1)/2<=vl) /\ (64<=n ->vl=32).
