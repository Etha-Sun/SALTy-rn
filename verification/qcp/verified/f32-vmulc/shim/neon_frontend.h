#include "/zp_vegeta/scratch_sb/ycsun/verus/build/qcp-kernel-framework/verification/qcp/verified/f32-vmul/shim/proof/ByValue/frontend.h"
#include "model_def.h"
/*@ Extern Coq (vmulc_values : Z -> list fp32 -> fp32 -> list fp32) */
/*@ include strategies "neon_vmulc.strategies" */
float32x4_t vld1q_dup_f32(const float *p)
/*@ With (c:fp32)
 Require store(p,float,c)
 Ensure store(p,float,c) * store(&(__return.s0),float,c) * store(&(__return.s1),float,c) * store(&(__return.s2),float,c) * store(&(__return.s3),float,c) */;
