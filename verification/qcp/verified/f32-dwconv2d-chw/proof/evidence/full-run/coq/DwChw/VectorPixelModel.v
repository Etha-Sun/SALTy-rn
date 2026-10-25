From Coq Require Import ZArith.
From DwChw Require Export PixelModel TerminalModel.
Local Open Scope Z_scope.
(* Generic one-output-row computation. Only active indices constrain results;
   input vector fields are retained in the C contract. This function grants
   no read permission and never substitutes out-of-range defaults for an
   active neighbour: the first/last active lanes use explicit prev/next. *)
Definition dw_vector_pixel(F:DwROMap)(weights:Z)(A0 A1 A2:Z->fp32)
 (prev0 prev1 prev2 next0 next1 next2 lo hi:fp32)(vl i:Z):fp32:=
 dw_chw_rvv_pixel(dw_load F weights 0)
 (A0 i)(A1 i)(A2 i)
 (dw_rvv_slide_up A0 prev0 i)(dw_rvv_slide_up A1 prev1 i)(dw_rvv_slide_up A2 prev2 i)
 (dw_rvv_slide_down A0 next0 vl i)(dw_rvv_slide_down A1 next1 vl i)(dw_rvv_slide_down A2 next2 vl i)
 (dw_load F weights 1)(dw_load F weights 2)(dw_load F weights 3)
 (dw_load F weights 4)(dw_load F weights 5)(dw_load F weights 6)
 (dw_load F weights 7)(dw_load F weights 8)(dw_load F weights 9)lo hi.
Definition dw_vector_match8(vl:Z)(r0 r1 r2 r3 r4 r5 r6 r7:fp32)(G:Z->fp32):Prop:=
 forall i,0<=i<vl->dw_fp8 r0 r1 r2 r3 r4 r5 r6 r7 i=G i.
