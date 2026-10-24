#ifndef RDSUM_RVV_FRONTEND_H
#define RDSUM_RVV_FRONTEND_H
#include "frontend_common.h"
#include "rvv_loop_model.h"
/* Read-only vector borrow; source guard requires a side-effect-free vector lvalue. */
#define __riscv_vse32_v_i32m8(p,a,vl) __riscv_vse32_v_i32m8((p),&(a),(vl))
#endif
