From HwcConv Require Export VectorRecords.
Local Open Scope Z_scope.
Definition hc_fget(a:Recordfloat32x4_t)(i:Z):fp32:=
 if Z.eqb i 0 then a.(float32x4_t_s0)else if Z.eqb i 1 then a.(float32x4_t_s1)
 else if Z.eqb i 2 then a.(float32x4_t_s2)else a.(float32x4_t_s3).
Definition hc_neon_fma4(r a w x:Recordfloat32x4_t)(lane:Z):Prop:=
 forall i,0<=i<4->hc_fget r i=dw_arm_fma(hc_fget a i)(hc_fget w i)(hc_fget x lane).
Definition hc_neon3(r a w0 w1 w2 x0 x1 x2:Recordfloat32x4_t)(lane:Z):Prop:=
 forall i,0<=i<4->hc_fget r i=
 dw_arm_fma(dw_arm_fma(dw_arm_fma(hc_fget a i)(hc_fget w0 i)(hc_fget x0 lane))
 (hc_fget w1 i)(hc_fget x1 lane))(hc_fget w2 i)(hc_fget x2 lane).
