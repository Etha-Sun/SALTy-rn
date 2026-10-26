From HwcConv Require Export Main443WindowPureTacticsFast StoreHalfFacts Main443NonSpatialChecked.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_neon_rows_acc hc_neon_rows_fold hc_neon_row_group
 dw_arm_fma dw_arm_max dw_arm_min hc_neon_min4 hc_neon_max4 hc_neon_zip1 hc_neon_zip2.
Ltac hcc_prepare := intros;hcm_constants;rewrite ?hc_store_f4_eta,?hc_store_f2_eta in *;subst.
Ltac hcc_frame :=
 unfold StructPredfloat32x4_t,UndefStructPredfloat32x4_t,
 StructPredfloat32x2_t,UndefStructPredfloat32x2_t in *;
 cbn[float32x4_t_s0 float32x4_t_s1 float32x4_t_s2 float32x4_t_s3
 float32x2_t_s0 float32x2_t_s1]in *;
 rewrite ?hc_local_field_address in *;
 entailer!;try lia.
Ltac hcc_solve := hcc_prepare;hcc_frame.
