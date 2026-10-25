From X32Transpose Require Export ProgressModel StrideModel.
From Coq Require Import ZArith.
Local Open Scope Z_scope.
Definition xt_total(G:XTLayout):Z:=xt_effective_width(xt_width G)(xt_height G).
Definition xt_rvv_lane(F:XTMap)(p vl j x:Z):Prop:=
 (0<=j<vl->x=xt_load_lane F p j) /\ xt_u32 x.
Definition xt_current_input(G:XTLayout)(k row:Z):Z:=
 if andb(Z.eqb k 0)(Z.eqb row 0) then xt_input G else xt_mod64(xt_input G+4*k+row*xt_input_stride G).
Definition xt_current_output(G:XTLayout)(k row:Z):Z:=
 if andb(Z.eqb k 0)(Z.eqb row 0) then xt_output_base G else xt_mod64(xt_output_base G+k*xt_output_stride G+4*row).
