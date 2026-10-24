From Coq Require Import ZArith List.
From Qs8Rdsum Require Export Types.
Local Open Scope Z_scope.
Definition rd_out_lane(A:list Z)(idx i vl:Z):Z := if Z.ltb i vl then Znth(idx+i)A 0 else 0.
Definition rd_store_lane(A:list Z)(idx i value vl:Z):list Z := if Z.ltb i vl then replace_Znth(idx+i)value A else A.
