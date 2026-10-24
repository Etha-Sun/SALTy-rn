#ifndef QCP_F32F16_RVV_FRONTEND_H
#define QCP_F32F16_RVV_FRONTEND_H
#include "vector_ops.h"
#include "memory_rvv.h"
#include "memory_neon.h"
#define __riscv_vle32_v_f32m8(p,vl) qcp_byvalue_load((p),(vl))
#define __riscv_vse16_v_u16m4(p,a,vl) qcp_f16_vse16((p),&(a),(vl))
#endif
