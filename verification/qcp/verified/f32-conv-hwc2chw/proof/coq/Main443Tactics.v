From HwcConv Require Export neon_unit_goal RvvKernelModel FastFrame AddressFacts NeonPixelBounds.
From Coq Require Import Lia.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque hc_data hc_output hc_get hc_present hc_neon_raw hc_neon_pixel
 hc_neon_rows_fold hc_neon_row_group dw_arm_fma dw_arm_max dw_arm_min.
Ltac hcm_constants :=
 try change(INT_MAX)with 2147483647 in *;
 try change(INT_MIN)with(-2147483648)in *;
 try change(UINT64_MAX)with 18446744073709551615 in *;
 try change(sizeof(FLOAT))with 4 in *;
 try change Arch64.ptr_size_Z with 8 in *.
Ltac hcm_domain :=
 unfold hc_input_domain,hc_output_layout,hc_footprint,hc_u64_limit in *;
 repeat match goal with H:_ /\ _|-_=>destruct H end.
Ltac hcm_pure :=
 intros;hcm_constants;subst;hcm_domain;
 first[entailer!;try lia;try nia|entailer!].
