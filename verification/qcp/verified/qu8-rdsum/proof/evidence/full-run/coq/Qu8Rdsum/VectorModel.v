From Coq Require Import ZArith.
From Qu8Rdsum Require Export Model.
Local Open Scope Z_scope.
Definition rd_wadd16(a b:Z):Z := rs_u16(a+b).
Definition rd_active_wadd16(a b i vl:Z):Z := if Z.ltb i vl then rd_wadd16 a b else 0.
Definition rd_active_wadd32(a b i vl:Z):Z := if Z.ltb i vl then rs_add_u32 a b else 0.
Definition rd_splat(x i vl:Z):Z := if Z.ltb i vl then x else 0.
