From Coq Require Import ZArith List.
From SimpleC.SL Require Export ArrayLib.
From MaxPool Require Export VectorModel.
Import ListNotations. Local Open Scope Z_scope.
Definition mp_zero32:list Z:=repeat 0%Z 32.
Definition mp_u32_vec (u0:Z) (u1:Z) (u2:Z) (u3:Z) (u4:Z) (u5:Z) (u6:Z) (u7:Z) (u8:Z) (u9:Z) (u10:Z) (u11:Z) (u12:Z) (u13:Z) (u14:Z) (u15:Z) (u16:Z) (u17:Z) (u18:Z) (u19:Z) (u20:Z) (u21:Z) (u22:Z) (u23:Z) (u24:Z) (u25:Z) (u26:Z) (u27:Z) (u28:Z) (u29:Z) (u30:Z) (u31:Z):list Z:=[u0;u1;u2;u3;u4;u5;u6;u7;u8;u9;u10;u11;u12;u13;u14;u15;u16;u17;u18;u19;u20;u21;u22;u23;u24;u25;u26;u27;u28;u29;u30;u31].
Definition mp_u32_prefix(L V:list Z)(vl:Z):list Z:=firstn(Z.to_nat vl)V++skipn(Z.to_nat vl)L.
Definition mp_restore_prefix(A B N:list Z)(done:Z):list Z:=
 map(fun i=>if Z.ltb(Z.of_nat i)done then mp_restore_bits(Znth(Z.of_nat i)A 0)(Znth(Z.of_nat i)B 0)(Znth(Z.of_nat i)N 0)else Znth(Z.of_nat i)N 0)(seq 0 32).
