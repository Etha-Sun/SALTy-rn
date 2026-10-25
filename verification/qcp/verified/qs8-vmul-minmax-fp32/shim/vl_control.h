#ifndef QS8MUL_VL_CONTROL_H
#define QS8MUL_VL_CONTROL_H
#include "intrinsics_rvv.h"
/*@ Import Coq Require Import Qs8Mul.KernelFacts */
size_t qm_setvl_positive(size_t n)
/*@ Require 0<n && emp
 Ensure qm_vl_allowed(n,__return) && 1<=__return && __return<=32 && __return<=n && emp */;
#endif
