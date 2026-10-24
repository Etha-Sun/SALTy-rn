From Coq Require Import ZArith List.
From Qu8Add Require Export Model Types MemoryModel.
Import ListNotations.
Definition qu_pack1(x0:Z):list Z := [x0].
Definition qu_pack2(x0 x1:Z):list Z := [x0;x1].
Definition qu_pack4(x0 x1 x2 x3:Z):list Z := [x0;x1;x2;x3].
