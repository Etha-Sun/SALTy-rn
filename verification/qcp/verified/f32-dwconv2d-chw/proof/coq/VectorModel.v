From Coq Require Import ZArith List Bool.
From DwChw Require Export Model.
Import ListNotations. Local Open Scope Z_scope.
Definition dw_fp_match(i vl:Z)(x y:fp32):Prop:=vl<=i \/ x=y.
Definition dw_vl_allowed(avl vl:Z):Prop:=
 (0<=avl<=8 /\ vl=avl) \/
 (8<avl<16 /\ (avl+1)/2<=vl<=8) \/
 (16<=avl /\ vl=8).
Definition dw_fp8(x0 x1 x2 x3 x4 x5 x6 x7:fp32)(i:Z):fp32:=
 nth(Z.to_nat i)[x0;x1;x2;x3;x4;x5;x6;x7]fp32_zero.
Definition dw_mask_bit(m i:Z):Z:=if Z.testbit m i then 1 else 0.
Definition dw_ne_value(a b:fp32):Z:=
 match fp32_compare a b with Some Datatypes.Eq=>0|_=>1 end.
Definition dw_mask_matches(vl m:Z)(A B:Z->fp32):Prop:=
 forall i,0<=i<vl -> dw_mask_bit m i=dw_ne_value(A i)(B i).
