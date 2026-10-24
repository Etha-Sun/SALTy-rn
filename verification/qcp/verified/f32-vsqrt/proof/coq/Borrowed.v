From Coq Require Import ZArith.
From Sqrt Require Export Pack.
Local Open Scope Z_scope.
Definition sqrt_read_at(i vl k:Z)(a:list fp32)(tail:fp32):fp32 :=
 if Z.ltb i vl then sqrt_lane (k+i) a else tail.
