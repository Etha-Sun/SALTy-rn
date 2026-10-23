#include "memory_neon.h"
#include "memory_rvv.h"
#include "vector_primitives.h"
#include "self_compare.h"
#include "program_model.h"
/*@ include strategies "rvv_arrays.strategies" */
/*@ include strategies "rvv_store.strategies" */
/*@ include strategies "rvv_loop.strategies" */
/*@ include strategies "rvv_fmin.strategies" */
#define __riscv_vle32_v_f32m8 qcp_byvalue_load
#define __riscv_vse32_v_f32m8(p,a,vl) __riscv_vse32_v_f32m8((p),&(a),(vl))
