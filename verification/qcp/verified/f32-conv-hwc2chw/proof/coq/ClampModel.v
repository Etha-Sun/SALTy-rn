From HwcConv Require Export VectorRecords FloatCopyModel.
Import Snaive_C_Rules64. Local Open Scope Z_scope.
Definition hc_vget(a:Recordvfloat32m1_t)(i:Z):fp32:=
 if Z.eqb i 0 then a.(vfloat32m1_t_s0)else if Z.eqb i 1 then a.(vfloat32m1_t_s1)
 else if Z.eqb i 2 then a.(vfloat32m1_t_s2)else a.(vfloat32m1_t_s3).
Definition hc_uget(a:Recordvuint32m1_t)(i:Z):Z:=
 if Z.eqb i 0 then a.(vuint32m1_t_s0)else if Z.eqb i 1 then a.(vuint32m1_t_s1)
 else if Z.eqb i 2 then a.(vuint32m1_t_s2)else a.(vuint32m1_t_s3).
Definition hc_mget(a:Recordvbool32_t)(i:Z):Z:=
 if Z.eqb i 0 then a.(vbool32_t_s0)else if Z.eqb i 1 then a.(vbool32_t_s1)
 else if Z.eqb i 2 then a.(vbool32_t_s2)else a.(vbool32_t_s3).
Definition hc_vactive(r a:Recordvfloat32m1_t)(vl:Z):Prop:=forall i,0<=i<vl->hc_vget r i=hc_vget a i.
Definition hc_uconstant(r:Recordvuint32m1_t)(x vl:Z):Prop:=forall i,0<=i<vl->hc_uget r i=x.
Definition hc_reinterpret(r:Recordvfloat32m1_t)(a:Recordvuint32m1_t):Prop:=forall i,0<=i<4->hc_vget r i=fp32_of_bits(hc_uget a i).
Definition hc_selfmask(r:Recordvbool32_t)(a:Recordvfloat32m1_t)(vl:Z):Prop:=forall i,0<=i<vl->hc_mget r i=if dw_nan(hc_vget a i)then 1 else 0.
Definition hc_isa_min(r a:Recordvfloat32m1_t)(b:fp32)(vl:Z):Prop:=forall i,0<=i<vl->hc_vget r i=fp32_min_number(hc_vget a i)b.
Definition hc_isa_max(r a:Recordvfloat32m1_t)(b:fp32)(vl:Z):Prop:=forall i,0<=i<vl->hc_vget r i=fp32_max_number(hc_vget a i)b.
Definition hc_isa_merge(r a b:Recordvfloat32m1_t)(m:Recordvbool32_t)(vl:Z):Prop:=forall i,0<=i<vl->hc_vget r i=if Z.eqb(hc_mget m i)0 then hc_vget a i else hc_vget b i.
Definition hc_canonical_min(a b:fp32):fp32:=if orb(dw_nan a)(dw_nan b)then canonical_qnan else fp32_min_number a b.
Definition hc_canonical_max(a b:fp32):fp32:=if orb(dw_nan a)(dw_nan b)then canonical_qnan else fp32_max_number a b.
Definition hc_clamp_min(r a:Recordvfloat32m1_t)(b:fp32)(vl:Z):Prop:=forall i,0<=i<vl->hc_vget r i=hc_canonical_min(hc_vget a i)b.
Definition hc_clamp_max(r a:Recordvfloat32m1_t)(b:fp32)(vl:Z):Prop:=forall i,0<=i<vl->hc_vget r i=hc_canonical_max(hc_vget a i)b.
