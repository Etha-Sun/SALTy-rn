From Coq Require Import ZArith.
From Qs8Rdsum Require Export MemoryModel.
Local Open Scope Z_scope.
Definition rd_read_lane(M:RDMap)(p i vl:Z):Z :=
 if Z.ltb i vl then rd_get M(p+i) else 0.
