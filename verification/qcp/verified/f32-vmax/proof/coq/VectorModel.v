From Coq Require Import ZArith.
From FMax Require Export Types.
Local Open Scope Z_scope.
Definition mm_active_max (i vl:Z) (a b:fp32) : fp32 :=
 if Z.ltb i vl then mm_rvv a b else fp32_zero.
Definition mm_active_add (i vl:Z) (a b:fp32) : fp32 :=
 if Z.ltb i vl then mm_rvv_add a b else fp32_zero.
Definition mm_active_ne (i vl:Z) (a b:fp32) : Z :=
 if Z.ltb i vl then mm_rvv_ne a b else 0.
Definition mm_active_merge (i vl:Z) (a b:fp32) (m:Z) : fp32 :=
 if Z.ltb i vl then if Z.eqb m 0 then a else b else fp32_zero.
