From Coq Require Import ZArith Lia List.
From Dwconv Require Export NeonKernelMemoryExpression NeonKernelMemoryWord.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque dw_arm_add dw_arm_mul dw_arm_fma dw_arm_min dw_arm_max.
Ltac dwm_simple_frame := dwm_prepare;dwm_subst_float;
 change Arch64.ptr_size_Z with 8 in *;
 rewrite ?Z.mul_0_l,?Z.mul_0_r,?Z.add_0_l,?Z.add_0_r in *;
 try change(Z.land 1 1)with 1 in *;try change(Z.land 1 2)with 0 in *;
 try change(Z.land 2 1)with 0 in *;try change(Z.land 2 2)with 2 in *;
 try change(Z.land 3 1)with 1 in *;try change(Z.land 3 2)with 2 in *;
 dwm_frame.
