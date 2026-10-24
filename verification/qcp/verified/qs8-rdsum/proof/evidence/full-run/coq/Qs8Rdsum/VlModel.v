From Coq Require Import ZArith.
From Qs8Rdsum Require Export Model.
Local Open Scope Z_scope.
Definition rd_vl(n:Z):Z := Z.min n 32.
