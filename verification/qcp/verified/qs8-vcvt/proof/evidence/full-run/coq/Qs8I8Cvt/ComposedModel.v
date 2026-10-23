From Coq Require Import ZArith List.
From Qs8I8Cvt Require Export Model Types MemoryModel.
Import ListNotations.
Definition qcv_pack1(x0:Z):list Z := [x0].
Definition qcv_pack2(x0 x1:Z):list Z := [x0;x1].
Definition qcv_pack4(x0 x1 x2 x3:Z):list Z := [x0;x1;x2;x3].
