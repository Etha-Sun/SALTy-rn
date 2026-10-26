From HwcConv Require Export RvvKernelModel.
Local Open Scope Z_scope.
Definition hc_pending_row(input zero H W row p:Z):Prop:=
 (0<=row<H->p=hc_row_base input zero H W row) /\ (row<0->p=zero).
Definition hc_rows_pending(input zero H W top y finish i0 i1 i2 i3 i4:Z):Prop:=
 y<finish->hc_pending_row input zero H W(2*y-top)i0 /\
 hc_pending_row input zero H W(2*y-top+1)i1 /\
 hc_pending_row input zero H W(2*y-top+2)i2 /\
 hc_pending_row input zero H W(2*y-top+3)i3 /\
 hc_pending_row input zero H W(2*y-top+4)i4.
Definition hc_pending_outputs(output hs y finish p q:Z):Prop:=y<finish->
 p=hc_addr64(output+y*hs) /\ q=hc_addr64(output+(y+1)*hs).
Definition hc_channel_pending(output hs cs C finish y ch p0 p1 p2 p3 q0 q1 q2 q3:Z):Prop:=ch<C->
 p0=hc_addr64(hc_output_address output hs cs ch(hc_store_row finish y 0)0) /\
 q0=hc_addr64(hc_output_address output hs cs ch(hc_store_row finish y 1)0) /\
 (ch+1<C->p1=hc_addr64(hc_output_address output hs cs(ch+1)(hc_store_row finish y 0)0) /\ q1=hc_addr64(hc_output_address output hs cs(ch+1)(hc_store_row finish y 1)0)) /\
 (ch+2<C->p2=hc_addr64(hc_output_address output hs cs(ch+2)(hc_store_row finish y 0)0) /\ q2=hc_addr64(hc_output_address output hs cs(ch+2)(hc_store_row finish y 1)0)) /\
 (ch+3<C->p3=hc_addr64(hc_output_address output hs cs(ch+3)(hc_store_row finish y 0)0) /\ q3=hc_addr64(hc_output_address output hs cs(ch+3)(hc_store_row finish y 1)0)).
