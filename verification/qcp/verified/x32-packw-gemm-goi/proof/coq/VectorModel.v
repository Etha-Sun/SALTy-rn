From Coq Require Import ZArith List.
From X32Packw Require Export ProgramModel.
Local Open Scope Z_scope.
Definition pw_rvv_lanes(F:PWMap)(p vl:Z)(A:list Z):Prop:=
 Zlength A=16 /\ 0<=vl<=16 /\
 forall i,0<=i<vl->Znth i A 0=pw_get F(p+4*i).
