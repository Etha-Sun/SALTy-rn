From Coq Require Import ZArith List.
From Qs8Lrelu Require Export Model.
Local Open Scope Z_scope.
Definition qlr_neon_mask(a b:Z):Z := if Z.ltb a b then 65535 else 0.
Definition qlr_rvv_mask(a b:Z):Z := if Z.ltb a b then 1 else 0.
Definition qlr_choose_neon(m a b:Z):Z := if Z.eqb m 65535 then a else b.
Definition qlr_choose_rvv(m a b:Z):Z := if Z.eqb m 1 then a else b.
Definition qlr_selected_raw(x z pm nm:Z):Z :=
 if Z.ltb(qcv_subw(qcv_s16 z)x)0 then pm else nm.
Definition qlr_neon_lane(x z pm nm o:Z):Z :=
 qcv_neon_lane x(qcv_s16 z)(qlr_selected_raw x z pm nm)(qcv_s16 o).
Definition qlr_rvv_lane(x z pm nm o:Z):Z :=
 qcv_rvv_lane x(qcv_s16 z)(qlr_selected_raw x z pm nm)(qcv_s16 o).
Definition qlr_neon_expression(x z pm nm o:Z):Z :=
 qcv_sat8(qcv_neon_add(qcv_neon_qrdmulh(qcv_shl7(qcv_subw(qcv_s16 z)x))
 (qlr_choose_neon(qlr_neon_mask(qcv_subw(qcv_s16 z)x)0)(qcv_seed pm)(qcv_seed nm)))(qcv_s16 o)).
Definition qlr_rvv_expression(x z pm nm o:Z):Z :=
 qcv_sat8(qcv_rvv_add(qcv_rvv_clip15(qcv_rvv_mul(qcv_shl7(qcv_s16(qcv_s16 z-x)))
 (qlr_choose_rvv(qlr_rvv_mask(qcv_s16(qcv_s16 z-x))0)(qcv_seed pm)(qcv_seed nm))))(qcv_s16 o)).
Definition qlr_values(n z pm nm o:Z)(A:list Z):list Z :=
 map(fun x=>qlr_neon_lane x z pm nm o)(firstn(Z.to_nat n)A).
