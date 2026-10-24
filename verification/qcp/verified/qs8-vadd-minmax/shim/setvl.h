#ifndef QCP_QA_SETVL_H
#define QCP_QA_SETVL_H
#include "types_def.h"
/*@ Import Coq Require Import Qs8Add.RvvModel */
/*@ Extern Coq (qa_vl:Z -> Z) */
size_t __riscv_vsetvl_e8m2(size_t n)
/*@ Require 0<=n && emp
 Ensure __return==qa_vl(n) && 0<=__return && __return<=32 && __return<=n && (n==0 || 0<__return) && emp */;
#endif
