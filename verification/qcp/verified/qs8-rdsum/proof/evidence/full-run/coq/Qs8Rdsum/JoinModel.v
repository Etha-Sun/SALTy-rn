From Coq Require Import ZArith.
From Qs8Rdsum Require Export RvvModel.
Local Open Scope Z_scope.
Definition rd_select_ptr(live lane normal zero:Z):Z := if Z.ltb lane live then normal else zero.
