#include "vector_primitives.h"
#include "load.h"
#include "vl.h"
#include "control.h"
#include "program_model.h"
#define NULL 0
#define XNN_OOB_READS
#define assert(c) qcp_assert(c)
#define __riscv_vle8_v_i8m2(p,vl) rsum_rvv_load32(p,vl)
#define __riscv_vadd_vv_i32m8_tu(p,a,b,vl) rsum_alias_vadd_s32m8(a,b,vl)

#define __riscv_vmv_v_x_i32m8 __riscv_vmv_v_x_s32m8
#define __riscv_vmv_v_x_i32m1 __riscv_vmv_v_x_s32m1
#define __riscv_vsext_vf4_i32m8 __riscv_vsext_vf4_s32m8
#define __riscv_vredsum_vs_i32m8_i32m1 __riscv_vredsum_vs_s32m8_s32m1
#define __riscv_vmv_x_s_i32m1_i32 __riscv_vmv_x_s_s32m1_s32
