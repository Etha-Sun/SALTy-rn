From HwcConv Require Export NeonViewsModel KernelPointers.
Local Open Scope Z_scope.
Definition hc_neon_previous(A:Recordfloat32x4_t)(F:HwcROMap)
 (input zero H W top y row consumed:Z):Prop:=forall i,0<=i<4->
 hc_fget A i=if Z.eqb consumed 0 then fp32_zero else
 hc_get F(hc_row_base input zero H W(2*y-top+row)+12*consumed-16+4*i).
