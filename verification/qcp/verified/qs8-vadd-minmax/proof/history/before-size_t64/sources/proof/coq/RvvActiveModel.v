From Coq Require Import ZArith Lia.
From Qs8Add Require Export VectorModel RvvModel.
Local Open Scope Z_scope.
Definition qa_active_sub (i vl a b:Z):Z := if Z.ltb i vl then (qa_s16 (a-b)) else 0.
Definition qa_active_sext (i vl a:Z):Z := if Z.ltb i vl then a else 0.
Definition qa_active_mul (i vl a b:Z):Z := if Z.ltb i vl then (qa_rvv_mul (a) (b)) else 0.
Definition qa_active_macc (i vl a c b:Z):Z := if Z.ltb i vl then (qa_rvv_macc (a) (b) (c)) else 0.
Definition qa_active_mov (i vl b:Z):Z := if Z.ltb i vl then b else 0.
Definition qa_active_rnu (i vl a d:Z):Z := if Z.ltb i vl then (qa_rvv_rnu (a) (d)) else 0.
Definition qa_active_sll (i vl a d:Z):Z := if Z.ltb i vl then (qa_rvv_sll (a) (d)) else 0.
Definition qa_active_clip16 (i vl a:Z):Z := if Z.ltb i vl then (qa_sat16 (a)) else 0.
Definition qa_active_add (i vl a b:Z):Z := if Z.ltb i vl then (qa_rvv_add16 (a) (b)) else 0.
Definition qa_active_clip8 (i vl a:Z):Z := if Z.ltb i vl then (qa_sat8 (a)) else 0.
Definition qa_active_max (i vl a b:Z):Z := if Z.ltb i vl then (qa_max (a) (b)) else 0.
Definition qa_active_min (i vl a b:Z):Z := if Z.ltb i vl then (qa_min (a) (b)) else 0.
