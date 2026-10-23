#include "vector_primitives.h"
#include "load.h"
#include "vl.h"
#include "control.h"
#include "program_model.h"
#define NULL 0
#define XNN_OOB_READS
#define assert(c) qcp_assert(c)
#define __riscv_vle8_v_u8m2(p,vl) rsum_rvv_load32(p,vl)
#define __riscv_vadd_vv_u32m8_tu(p,a,b,vl) rsum_alias_vadd_u32m8(a,b,vl)

#define XNN_ALIGN(x)
#define XNN_UNLIKELY(x) (x)
#define XNN_ARCH_ARM64 1

#include "neon_program_model.h"
