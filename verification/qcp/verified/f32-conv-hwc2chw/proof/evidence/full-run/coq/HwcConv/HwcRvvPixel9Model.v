(* Unchecked candidate definitions only; no theorem/proof/axiom is declared. *)
From Coq Require Import List ZArith.
From HwcConv Require Export RvvRowsFma3Model.
Import ListNotations. Local Open Scope Z_scope.
Definition hc_rvv_pixel9_groups:list(Z*Z):=
 [(0,0);(0,1);(0,2);(1,0);(1,1);(1,2);(2,0);(2,1);(2,2)].
Definition hc_rvv_pixel9_bias(F:HwcROMap)(w lane:Z):fp32:=hc_get F(w+4*lane).
Definition hc_rvv_pixel9_fold(F:HwcROMap)(p0 p1 p2 w width x lane step i:Z):fp32:=
 fold_left(fun a g=>hc_rvv_row_group_value a F p0 p1 p2 w width x(fst g)(snd g)lane i)
 (firstn(Z.to_nat step)hc_rvv_pixel9_groups)(hc_rvv_pixel9_bias F w lane).
Definition hc_rvv_pixel9_prefix(R:Recordvfloat32m1_t)(F:HwcROMap)
 (p0 p1 p2 w width x lane step vl:Z):Prop:=forall i,0<=i<vl->
 hc_vget R i=hc_rvv_pixel9_fold F p0 p1 p2 w width x lane step i.
(* Raw/unclamped postcondition. Do not replace by numerical float equality. *)
