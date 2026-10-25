From Coq Require Import ZArith.
From DwChw Require Export VectorPixelModel.
Local Open Scope Z_scope.
(* The slide functions here are pure first/last-neighbour selectors. Their
   width4 instantiation describes the original NEON VEXT results; it does
   not treat a NEON instruction as a physical RVV instruction. *)
Definition dw_neon_vector_pixel(F:DwROMap)(weights:Z)(A0 A1 A2:Z->fp32)
 (prev0 prev1 prev2 next0 next1 next2 lo hi:fp32)(i:Z):fp32:=
 dw_chw_neon_pixel(dw_load F weights 0)
 (A0 i)(A1 i)(A2 i)
 (dw_rvv_slide_up A0 prev0 i)(dw_rvv_slide_up A1 prev1 i)(dw_rvv_slide_up A2 prev2 i)
 (dw_rvv_slide_down A0 next0 4 i)(dw_rvv_slide_down A1 next1 4 i)(dw_rvv_slide_down A2 next2 4 i)
 (dw_load F weights 1)(dw_load F weights 2)(dw_load F weights 3)
 (dw_load F weights 4)(dw_load F weights 5)(dw_load F weights 6)
 (dw_load F weights 7)(dw_load F weights 8)(dw_load F weights 9)lo hi.
Definition dw_neon_vector_match4(r0 r1 r2 r3:fp32)(G:Z->fp32):Prop:=
 forall i,0<=i<4->dw_fp4 r0 r1 r2 r3 i=G i.
