From Coq Require Import ZArith.
From Qu8Rsum Require Export Model.
Local Open Scope Z_scope.
Definition rs_active_u32(a b i vl:Z):Z := if Z.ltb i vl then rs_add_u32 a b else a.
Definition rs_splat_u32(x i vl:Z):Z := if Z.ltb i vl then x else 0.
Definition rs_mul_u8(a b:Z):Z := unsigned_last_nbits(a*b)8.
