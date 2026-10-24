#ifndef RDSUM_VL_MODEL_H
#define RDSUM_VL_MODEL_H
#include "formal_model.h"
/*@ Import Coq Require Import Qu8Rdsum.VlModel */
/*@ Extern Coq (rd_vl:Z -> Z) */
size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp
 Ensure __return==rd_vl(n) && 0<=__return && __return<=32 && emp */;
void qcp_assert(int c)
/*@ Require c!=0 && emp Ensure emp */;
#endif
