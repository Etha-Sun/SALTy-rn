From Coq Require Import ZArith List.
From DwChw Require Export Types VectorModel.
Import ListNotations.
Definition dw_same(x y:fp32):Prop:=x=y.
Definition dw_values8(a0 a1 a2 a3 a4 a5 a6 a7:fp32)(n:Z):list fp32:=
 map(fun i=>dw_fp8 a0 a1 a2 a3 a4 a5 a6 a7(Z.of_nat i))(seq 0(Z.to_nat n)).
