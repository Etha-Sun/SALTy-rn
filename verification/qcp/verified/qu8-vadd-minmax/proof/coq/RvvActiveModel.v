From Coq Require Import ZArith Lia.
From Qu8Add Require Export VectorModel RvvModel.
Local Open Scope Z_scope.
Definition qu_uclip8(a:Z):Z:=Z.min a 255.
Definition qu_active_subu (i vl a b:Z):Z := if Z.ltb i vl then (qu_udiff (a) (b)) else 0.
Definition qu_active_sext (i vl a:Z):Z := if Z.ltb i vl then a else 0.
Definition qu_active_mul (i vl a b:Z):Z := if Z.ltb i vl then (qu_rvv_mul (a) (b)) else 0.
Definition qu_active_macc (i vl a c b:Z):Z := if Z.ltb i vl then (qu_rvv_macc (a) (b) (c)) else 0.
Definition qu_active_mov (i vl b:Z):Z := if Z.ltb i vl then b else 0.
Definition qu_active_rnu (i vl a d:Z):Z := if Z.ltb i vl then (qu_rvv_rnu (a) (d)) else 0.
Definition qu_active_sll (i vl a d:Z):Z := if Z.ltb i vl then (qu_rvv_sll (a) (d)) else 0.
Definition qu_active_clip16 (i vl a:Z):Z := if Z.ltb i vl then (qu_sat16 (a)) else 0.
Definition qu_active_add (i vl a b:Z):Z := if Z.ltb i vl then (qu_rvv_add16 (a) (b)) else 0.
Definition qu_active_max16 (i vl a:Z):Z := if Z.ltb i vl then (qu_max16zero (a)) else 0.
Definition qu_active_clipu8 (i vl a:Z):Z := if Z.ltb i vl then (qu_uclip8 (a)) else 0.
Definition qu_active_max (i vl a b:Z):Z := if Z.ltb i vl then (qu_umax (a) (b)) else 0.
Definition qu_active_min (i vl a b:Z):Z := if Z.ltb i vl then (qu_umin (a) (b)) else 0.
