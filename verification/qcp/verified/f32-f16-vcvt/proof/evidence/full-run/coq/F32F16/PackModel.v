From Coq Require Import ZArith List.
From F32F16 Require Export UShortStoreModel.
Import ListNotations. Local Open Scope Z_scope.
Definition f16_pack1 (x0:Z) : list Z := [x0].
Definition f16_pack2 (x0:Z) (x1:Z) : list Z := [x0;x1].
Definition f16_pack4 (x0:Z) (x1:Z) (x2:Z) (x3:Z) : list Z := [x0;x1;x2;x3].
Definition f16_pack8 (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) : list Z := [x0;x1;x2;x3;x4;x5;x6;x7].
