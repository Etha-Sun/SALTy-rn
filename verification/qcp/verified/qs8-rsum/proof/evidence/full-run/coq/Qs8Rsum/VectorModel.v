From Coq Require Import ZArith.
From Qs8Rsum Require Export Model.
Local Open Scope Z_scope.
Definition rs_active_s32(a b i vl:Z):Z := if Z.ltb i vl then rs_add_s32 a b else a.
Definition rs_splat_s32(x i vl:Z):Z := if Z.ltb i vl then x else 0.
Definition rs_mul_s8(a b:Z):Z := signed_last_nbits(a*b)8.
