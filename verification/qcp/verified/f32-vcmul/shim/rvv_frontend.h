#include "types.h"
#include "primitives.h"
#include "rvv_memory.h"
#include "rvv_store.h"
#include "model_def.h"
#include "../../../shared/c-shim/f32/QcpNeonLoop/invariant_def.h"
/*@ include strategies "neon_vcmul.strategies" */
#define NULL ((void *)0)
#define XNN_OOB_READS
#define assert(x) qcp_assert(x)
void qcp_assert(int condition)
/*@ Require condition!=0 && emp Ensure emp */;
#define __riscv_vle32_v_f32m4(p,vl) qcp_vcmul_load16((p),(vl))
#define __riscv_vse32_v_f32m4(p,a,vl) __riscv_vse32_v_f32m4((p),&(a),(vl))
