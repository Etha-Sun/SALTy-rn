From HwcConv Require Export Neon3Model StoreViewsModel.
Local Open Scope Z_scope.
Definition hc_neon_load4(R:Recordfloat32x4_t)(F:HwcROMap)(p:Z):Prop:=
 forall i,0<=i<4->hc_fget R i=hc_get F(p+4*i).
Definition hc_neon_dup4(R:Recordfloat32x4_t)(x:fp32):Prop:=forall i,0<=i<4->hc_fget R i=x.
Definition hc_neon_lane_load(R A:Recordfloat32x4_t)(F:HwcROMap)(p k:Z):Prop:=
 forall i,0<=i<4->hc_fget R i=if Z.eqb i k then hc_get F p else hc_fget A i.
Definition hc_neon_min4(R A B:Recordfloat32x4_t):Prop:=
 forall i,0<=i<4->hc_fget R i=dw_arm_min(hc_fget A i)(hc_fget B i).
Definition hc_neon_max4(R A B:Recordfloat32x4_t):Prop:=
 forall i,0<=i<4->hc_fget R i=dw_arm_max(hc_fget A i)(hc_fget B i).
Definition hc_neon_zip1(R A B:Recordfloat32x4_t):Prop:=
 R=make_record_float32x4_t A.(float32x4_t_s0) B.(float32x4_t_s0) A.(float32x4_t_s1) B.(float32x4_t_s1).
Definition hc_neon_zip2(R A B:Recordfloat32x4_t):Prop:=
 R=make_record_float32x4_t A.(float32x4_t_s2) B.(float32x4_t_s2) A.(float32x4_t_s3) B.(float32x4_t_s3).
Definition hc_neon_store_lane(O:HwcOutput)(p:Z)(A:Recordfloat32x4_t)(k:Z):HwcOutput:=
 hc_output_put O p(hc_fget A k).
