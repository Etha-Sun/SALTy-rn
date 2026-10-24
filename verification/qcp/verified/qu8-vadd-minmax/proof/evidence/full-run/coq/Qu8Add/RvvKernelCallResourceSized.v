From Qu8Add Require Export RvvKernelCallResource.
Import Snaive_C_Rules64.
Local Open Scope sac.
(* CHAR and UCHAR have the same one-byte stride, while their permissions remain distinct. *)
Ltac qu_rvv_kernel_sized_frame :=
 rewrite ?sizeof_char,?sizeof_uchar;qu_rvv_kernel_arith_frame.
