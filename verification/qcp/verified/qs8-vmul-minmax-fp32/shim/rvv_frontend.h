#include "scalar_nan.h"
#include "vector_values.h"
#include "rvv_store.h"
#include "adapters.h"
#include "program_model.h"
#include "control.h"
#define __riscv_vsub_vx_i16m4(a,x,vl) QM_SEXT_SUB_##a x,vl)
#define QM_SEXT_SUB___riscv_vsext_vf2_i16m4(a,vl) qm_sext_sub(a,

#define __riscv_vse8_v_i8m2(p,a,vl) qm_store32((p),&(a),(vl))

/* Actual checked read-only pointer-copy adapters for Float32 consumers. */
#define QS8MUL_FORMAL 1
#include "float_borrow.h"
#undef __riscv_vfmul_vf_f32m8
#define __riscv_vfmul_vf_f32m8(a,x,vl) qm_borrow_vfmul_vf_f32m8(&(a),(x),(vl))
#undef __riscv_vfadd_vf_f32m8
#define __riscv_vfadd_vf_f32m8(a,x,vl) qm_borrow_vfadd_vf_f32m8(&(a),(x),(vl))
#undef __riscv_vfsgnj_vf_f32m8
#define __riscv_vfsgnj_vf_f32m8(a,x,vl) qm_borrow_vfsgnj_vf_f32m8(&(a),(x),(vl))
#undef __riscv_vreinterpret_v_f32m8_i32m8
#define __riscv_vreinterpret_v_f32m8_i32m8(a) qm_borrow_vreinterpret_v_f32m8_i32m8(&(a))
