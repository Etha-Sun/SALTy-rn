From Coq Require Import List.
From HwcConv Require Export ClampModel MaskModel StoreViewsModel.
Import ListNotations. Local Open Scope Z_scope.
Definition hc_rvv_vl(avl vl:Z):Prop:=
 0<=vl<=4 /\ ((0<=avl<=4 /\ vl=avl) \/ (4<avl<8 /\ (avl+1)/2<=vl<=4) \/ (8<=avl /\ vl=4)).
Definition hc_rvv_splat(R:Recordvfloat32m1_t)(x:fp32)(vl:Z):Prop:=
 forall i,0<=i<vl->hc_vget R i=x.
Definition hc_rvv_id(R:Recordvuint32m1_t)(vl:Z):Prop:=forall i,0<=i<vl->hc_uget R i=i.
Definition hc_mask_ge(R:Recordvbool32_t)(A:Recordvuint32m1_t)(x vl:Z):Prop:=
 forall i,0<=i<vl->hc_mget R i=if Z.leb x(hc_uget A i)then 1 else 0.
Definition hc_mask_lt(R:Recordvbool32_t)(A:Recordvuint32m1_t)(x vl:Z):Prop:=
 forall i,0<=i<vl->hc_mget R i=if Z.ltb(hc_uget A i)x then 1 else 0.
Definition hc_mask_and(R A B:Recordvbool32_t)(vl:Z):Prop:=
 forall i,0<=i<vl->hc_mget R i=if andb(Z.eqb(hc_mget A i)1)(Z.eqb(hc_mget B i)1)then 1 else 0.
Definition hc_addr64(p:Z):Z:=p mod 18446744073709551616.
Definition hc_masked_window(F:HwcROMap)(p stride:Z)(M:Recordvbool32_t)(vl:Z):Prop:=
 forall i,0<=i<vl->hc_mget M i=1->hc_present F(hc_addr64(p+i*stride)).
Definition hc_masked_load(R:Recordvfloat32m1_t)(F:HwcROMap)(p stride:Z)(M:Recordvbool32_t)(vl:Z):Prop:=
 forall i,0<=i<vl->hc_mget M i=1->hc_vget R i=hc_get F(hc_addr64(p+i*stride)).
Definition hc_rvv_fma(R A X:Recordvfloat32m1_t)(w:fp32)(vl:Z):Prop:=
 forall i,0<=i<vl->hc_vget R i=dw_rvv_fma(hc_vget A i)w(hc_vget X i).
Definition hc_rvv_fma_mu(R A X:Recordvfloat32m1_t)(w:fp32)(M:Recordvbool32_t)(vl:Z):Prop:=
 forall i,0<=i<vl->hc_vget R i=if Z.eqb(hc_mget M i)1
 then dw_rvv_fma(hc_vget A i)w(hc_vget X i)else hc_vget A i.
Fixpoint hc_store_rvv_count(O:HwcOutput)(p:Z)(A:Recordvfloat32m1_t)(k:nat):HwcOutput:=
 match k with 0%nat=>O|S j=>hc_output_put(hc_store_rvv_count O p A j)(p+4*Z.of_nat j)(hc_vget A(Z.of_nat j))end.
Definition hc_store_rvv(O:HwcOutput)(p:Z)(A:Recordvfloat32m1_t)(vl:Z):HwcOutput:=
 hc_store_rvv_count O p A(Z.to_nat vl).
(* All vector result predicates constrain only i<vl. Unused mask and vector
   lanes remain arbitrary typed fields, matching tail/mask agnostic results. *)
