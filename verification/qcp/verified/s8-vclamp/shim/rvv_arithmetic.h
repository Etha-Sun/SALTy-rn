#ifndef QCP_S8_RVV_ARITHMETIC_H
#define QCP_S8_RVV_ARITHMETIC_H
#include "rvv_model.h"
#include "scalar_primitives.h"
#define __riscv_vmin_vx_i8m8(a,b,vl) qcp_s8_rvv_vmin_borrow(&(a),(b),(vl))
#define __riscv_vmax_vx_i8m8(a,b,vl) qcp_s8_rvv_vmax_borrow(&(a),(b),(vl))
#endif
