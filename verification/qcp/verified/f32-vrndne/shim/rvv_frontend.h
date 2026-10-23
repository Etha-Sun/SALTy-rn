#include "vector_ops.h"
#include "memory_neon.h"
#include "memory_rvv.h"
#define assert(x) qcp_assert(x)
#define __riscv_vle32_v_f32m8 qcp_byvalue_load
#define __riscv_vse32_v_f32m8(p,a,vl) __riscv_vse32_v_f32m8((p),&(a),(vl))
#include "program_model.h"
