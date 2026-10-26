From Coq Require Import List.
From HwcConv Require Export NeonViewsModel HwcProgramModel.
Import ListNotations. Local Open Scope Z_scope.
Definition hc_neon_row_input(F:HwcROMap)(p col ci:Z):fp32:=
 if col<?0 then fp32_zero else hc_get F(p+4*(3*col+ci)).
Definition hc_neon_row_group(acc:fp32)(F:HwcROMap)(p0 p1 p2 w width x dx ci lane:Z):fp32:=
 let col:=2*x+dx-1 in if width<=?col then acc else
 dw_arm_fma(dw_arm_fma(dw_arm_fma acc
 (hc_get F(w+4*(4+(dx*9+ci*3)*4+lane)))(hc_neon_row_input F p0 col ci))
 (hc_get F(w+4*(4+(dx*9+ci*3+1)*4+lane)))(hc_neon_row_input F p1 col ci))
 (hc_get F(w+4*(4+(dx*9+ci*3+2)*4+lane)))(hc_neon_row_input F p2 col ci).
Definition hc_neon_groups:list(Z*Z):=
 [(0,0);(0,1);(0,2);(1,0);(1,1);(1,2);(2,0);(2,1);(2,2)].
Definition hc_neon_rows_fold(F:HwcROMap)(p0 p1 p2 w width x lane step:Z):fp32:=
 fold_left(fun a g=>hc_neon_row_group a F p0 p1 p2 w width x(fst g)(snd g)lane)
 (firstn(Z.to_nat step)hc_neon_groups)(hc_get F(w+4*lane)).
Definition hc_neon_rows_acc(R:Recordfloat32x4_t)(F:HwcROMap)(p0 p1 p2 w width x step:Z):Prop:=
 forall lane,0<=lane<4->hc_fget R lane=hc_neon_rows_fold F p0 p1 p2 w width x lane step.
(* An ordinary nine-stage C body, not an ISA terminal. Original27 FMA order
   is dx,ci,ky. Missing odd-right groups skip all three FMA operations;
   horizontal left missing inputs still evaluate0*weight. No FP algebra. *)
