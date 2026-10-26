From Coq Require Import ZArith List Bool.
From HwcConv Require Export RvvViewsModel HwcSourcePixelFacts HwcProgressModel.
Import ListNotations. Local Open Scope Z_scope.
Definition hc_rvv_raw(F:HwcROMap)(input zero weights H W top:Z)(lo hi:fp32):HwcRawPixels:=
 fun ch lane y x=>hc_rvv_source_result
 (hc_terms F input zero weights H W top y x(ch/4)lane)
 (hc_get F(weights+4*(112*(ch/4)+lane)))lo hi.
Definition hc_neon_raw(F:HwcROMap)(input zero weights H W top:Z)(lo hi:fp32):HwcRawPixels:=
 fun ch lane y x=>hc_neon_pixel F input zero weights H W top y x(ch/4)lane lo hi.
Definition hc_acc_prefix(A:Recordvfloat32m1_t)(F:HwcROMap)
 (input zero weights H W top y x ch lane step vl:Z):Prop:=
 forall i,0<=i<vl->hc_vget A i=
 hc_rvv_source_fold(firstn(Z.to_nat step)(hc_terms F input zero weights H W top y(x+i)(ch/4)lane))
 (hc_get F(weights+4*(112*(ch/4)+lane))).
Definition hc_source_mask(M:Recordvbool32_t)(W x dx vl:Z):Prop:=
 forall i,0<=i<vl->hc_mget M i=
 if andb(0<=?2*(x+i)+dx-1)(2*(x+i)+dx-1<?W)then 1 else 0.
Definition hc_source_input(A:Recordvfloat32m1_t)(F:HwcROMap)
 (input zero H W top y x row dx ci vl:Z):Prop:=forall i,0<=i<vl->
 hc_vget A i=if orb(2*(x+i)+dx-1<?0)(W<=?2*(x+i)+dx-1)
 then fp32_zero else hc_image F input zero H W(2*y-top+row)(2*(x+i)+dx-1)ci.
Definition hc_output_owned(W:list Z)(output hs cs channels start finish ow:Z):Prop:=
 NoDup W /\ forall c y x,0<=c<channels->start<=y<finish->0<=x<ow->
 In(hc_output_address output hs cs c y x)W.
(* Current pointers are represented with the actual uint64 modular C address
   calculation. Only future reads, through hc_row_base/windows, need footprint
   bounds. Unused final cursors may wrap. *)
Definition hc_outer_input(input zero H W top y i0 i1 i2 i3 i4:Z):Prop:=
 i0=hc_row_base input zero H W(2*y-top) /\
 i1=hc_row_base input zero H W(2*y-top+1) /\
 i2=hc_row_base input zero H W(2*y-top+2) /\
 i3=hc_row_base input zero H W(2*y-top+3) /\
 i4=hc_row_base input zero H W(2*y-top+4).
Definition hc_channel_output(output hs cs C finish y ch p0 p1 p2 p3 q0 q1 q2 q3:Z):Prop:=
 p0=hc_addr64(hc_output_address output hs cs(hc_store_channel C ch 0)(hc_store_row finish y 0)0) /\
 p1=hc_addr64(hc_output_address output hs cs(hc_store_channel C ch 1)(hc_store_row finish y 0)0) /\
 p2=hc_addr64(hc_output_address output hs cs(hc_store_channel C ch 2)(hc_store_row finish y 0)0) /\
 p3=hc_addr64(hc_output_address output hs cs(hc_store_channel C ch 3)(hc_store_row finish y 0)0) /\
 q0=hc_addr64(hc_output_address output hs cs(hc_store_channel C ch 0)(hc_store_row finish y 1)0) /\
 q1=hc_addr64(hc_output_address output hs cs(hc_store_channel C ch 1)(hc_store_row finish y 1)0) /\
 q2=hc_addr64(hc_output_address output hs cs(hc_store_channel C ch 2)(hc_store_row finish y 1)0) /\
 q3=hc_addr64(hc_output_address output hs cs(hc_store_channel C ch 3)(hc_store_row finish y 1)0).
