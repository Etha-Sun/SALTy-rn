#ifndef RSUM_VL_H
#define RSUM_VL_H
#include "formal_model.h"
/*@ Import Coq Require Import Qu8Rsum.VlModel */
/*@ Extern Coq (rs_vl : Z -> Z) */
size_t __riscv_vsetvl_e8m2(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp Ensure __return==rs_vl(n) && emp */;
size_t __riscv_vsetvlmax_e32m8(void)
/*@ Require emp Ensure __return==32 && emp */;
size_t __riscv_vsetvlmax_e32m1(void)
/*@ Require emp Ensure __return==4 && emp */;
#endif
