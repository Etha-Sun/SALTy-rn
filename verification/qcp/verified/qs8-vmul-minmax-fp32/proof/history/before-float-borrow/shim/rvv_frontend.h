#include "scalar_nan.h"
#include "vector_values.h"
#include "rvv_store.h"
#include "adapters.h"
#include "program_model.h"
#include "control.h"
#define __riscv_vsub_vx_i16m4(a,x,vl) QM_SEXT_SUB_##a x,vl)
#define QM_SEXT_SUB___riscv_vsext_vf2_i16m4(a,vl) qm_sext_sub(a,

#define __riscv_vse8_v_i8m2(p,a,vl) qm_store32((p),&(a),(vl))
