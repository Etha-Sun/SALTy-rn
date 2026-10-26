From HwcConv Require Export NeonRowsPixelModel RvvViewsModel.
Local Open Scope Z_scope.
Definition hc_rvv_row_group_value(acc:fp32)(F:HwcROMap)(p0 p1 p2 w width x dx ci lane i:Z):fp32:=
 let col:=2*(x+i)+dx-1 in if width<=?col then acc else
 dw_rvv_fma(dw_rvv_fma(dw_rvv_fma acc
 (hc_get F(w+4*(4+(dx*9+ci*3)*4+lane)))(hc_neon_row_input F p0 col ci))
 (hc_get F(w+4*(4+(dx*9+ci*3+1)*4+lane)))(hc_neon_row_input F p1 col ci))
 (hc_get F(w+4*(4+(dx*9+ci*3+2)*4+lane)))(hc_neon_row_input F p2 col ci).
Definition hc_rvv_rows_group(R A:Recordvfloat32m1_t)(F:HwcROMap)
 (p0 p1 p2 w width x dx ci lane vl:Z):Prop:=forall i,0<=i<vl->
 hc_vget R i=hc_rvv_row_group_value(hc_vget A i)F p0 p1 p2 w width x dx ci lane i.
