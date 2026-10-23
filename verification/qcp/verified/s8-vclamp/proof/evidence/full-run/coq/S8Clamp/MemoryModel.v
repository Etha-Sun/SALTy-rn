From Coq Require Import ZArith List Lia.
From S8Clamp Require Export Types.
Local Open Scope Z_scope.
Definition s8_read_lane (i vl idx:Z) (L:list Z) : Z :=
 if Z.ltb i vl then Znth (idx+i) L 0 else 0.
