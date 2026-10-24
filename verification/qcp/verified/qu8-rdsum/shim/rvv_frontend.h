#ifndef RDSUM_UNSIGNED_RVV_FRONTEND_H
#define RDSUM_UNSIGNED_RVV_FRONTEND_H
#include "frontend_common.h"
#include "rvv_loop_model.h"
/* Source-guarded single-evaluation read-only vector borrow. */
#define __riscv_vse32_v_u32m8(p,a,vl) __riscv_vse32_v_u32m8((p),&(a),(vl))
#endif
