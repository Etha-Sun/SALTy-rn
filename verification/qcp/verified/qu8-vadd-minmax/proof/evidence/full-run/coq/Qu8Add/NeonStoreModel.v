From Coq Require Import ZArith List.
From Qu8Add Require Export Types.
Import ListNotations.
Definition u8_pack8 (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) : list Z := [x0;x1;x2;x3;x4;x5;x6;x7].
Definition u8_pack16 (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) : list Z := [x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15].
