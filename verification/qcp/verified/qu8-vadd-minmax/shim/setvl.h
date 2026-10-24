#ifndef QCP_QU_SETVL_H
#define QCP_QU_SETVL_H
#include "types_def.h"
/*@ Import Coq Require Import Qu8Add.RvvModel */
/*@ Extern Coq (qu_vl:Z -> Z) */
size_t __riscv_vsetvl_e8m2(size_t n)
/*@ Require 0<=n && emp
 Ensure __return==qu_vl(n) && 0<=__return && __return<=32 && __return<=n && (n==0 || 0<__return) && emp */;
#endif
