From Coq Require Import ZArith.
From Qs8Lrelu Require Export LreluModel RvvModel.
Local Open Scope Z_scope.
Definition qlr_active_mask(a b k vl:Z):Z := if Z.ltb k vl then qlr_rvv_mask a b else 0.
Definition qlr_active_splat(b k vl:Z):Z := if Z.ltb k vl then b else 0.
Definition qlr_active_merge(a b m k vl:Z):Z := if Z.ltb k vl then qlr_choose_rvv m b a else 0.
