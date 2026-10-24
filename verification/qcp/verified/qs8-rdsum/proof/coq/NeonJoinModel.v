From Coq Require Import ZArith.
From Qs8Rdsum Require Export JoinModel StoreModel.
Local Open Scope Z_scope.
Definition rd_tail_lane(i channels:Z):Z := (i+rd_bit2 channels)mod 4.
