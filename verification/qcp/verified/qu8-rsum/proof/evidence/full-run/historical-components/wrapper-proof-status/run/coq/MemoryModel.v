From Coq Require Import ZArith List Lia.
From Qu8Rsum Require Export Types.
Local Open Scope Z_scope.
Definition rs_read_lane (i vl idx:Z) (L:list Z) : Z :=
 if Z.ltb i vl then Znth (idx+i) L 0 else 0.
