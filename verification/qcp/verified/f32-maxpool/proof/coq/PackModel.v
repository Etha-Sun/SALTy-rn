From Coq Require Import ZArith.
From MaxPool Require Export MemoryModel.
Local Open Scope Z_scope.
Definition mp_pack2 (x0:fp32) (x1:fp32)(j:Z):fp32:=
 if Z.eqb j 0 then x0 else if Z.eqb j 1 then x1 else mp_zero.
Definition mp_pack4 (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)(j:Z):fp32:=
 if Z.eqb j 0 then x0 else if Z.eqb j 1 then x1 else if Z.eqb j 2 then x2 else if Z.eqb j 3 then x3 else mp_zero.
Definition mp_pack32 (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (x16:fp32) (x17:fp32) (x18:fp32) (x19:fp32) (x20:fp32) (x21:fp32) (x22:fp32) (x23:fp32) (x24:fp32) (x25:fp32) (x26:fp32) (x27:fp32) (x28:fp32) (x29:fp32) (x30:fp32) (x31:fp32)(j:Z):fp32:=
 if Z.eqb j 0 then x0 else if Z.eqb j 1 then x1 else if Z.eqb j 2 then x2 else if Z.eqb j 3 then x3 else if Z.eqb j 4 then x4 else if Z.eqb j 5 then x5 else if Z.eqb j 6 then x6 else if Z.eqb j 7 then x7 else if Z.eqb j 8 then x8 else if Z.eqb j 9 then x9 else if Z.eqb j 10 then x10 else if Z.eqb j 11 then x11 else if Z.eqb j 12 then x12 else if Z.eqb j 13 then x13 else if Z.eqb j 14 then x14 else if Z.eqb j 15 then x15 else if Z.eqb j 16 then x16 else if Z.eqb j 17 then x17 else if Z.eqb j 18 then x18 else if Z.eqb j 19 then x19 else if Z.eqb j 20 then x20 else if Z.eqb j 21 then x21 else if Z.eqb j 22 then x22 else if Z.eqb j 23 then x23 else if Z.eqb j 24 then x24 else if Z.eqb j 25 then x25 else if Z.eqb j 26 then x26 else if Z.eqb j 27 then x27 else if Z.eqb j 28 then x28 else if Z.eqb j 29 then x29 else if Z.eqb j 30 then x30 else if Z.eqb j 31 then x31 else mp_zero.
