From HwcConv Require Export HwcRvv336MaskAutomation9 FastFrame AddressFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_get hc_present hc_rvv_rows_group hc_rvv_row_group_value dw_rvv_fma dw_arm_fma.
Ltac hrm_frame:=
 unfold StructPredvfloat32m1_t,UndefStructPredvfloat32m1_t,
 StructPredvbool32_t,UndefStructPredvbool32_t,
 StructPredvuint32m1_t,UndefStructPredvuint32m1_t in *;
 cbn[vfloat32m1_t_s0 vfloat32m1_t_s1 vfloat32m1_t_s2 vfloat32m1_t_s3
 vbool32_t_s0 vbool32_t_s1 vbool32_t_s2 vbool32_t_s3
 vuint32m1_t_s0 vuint32m1_t_s1 vuint32m1_t_s2 vuint32m1_t_s3];
 rewrite ?hc_local_field_address;entailer!.
Ltac hrm_rhs:=first[solve[hr_mask_pure]|lazymatch goal with
 | |-?P|--andp ?Q ?S=>apply _derivable1_andp_intros;[hrm_rhs|hrm_rhs]
 | |-?P|--?Q=>hrm_frame end].
Ltac hrm_solve:=hr_intro;hr_mask_prepare;hrm_rhs.
