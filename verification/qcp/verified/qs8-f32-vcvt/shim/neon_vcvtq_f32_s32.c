#include "neon_arithmetic.h"
#include "scalar_primitives.h"
float32x4_t vcvtq_f32_s32(int32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) Ensure store(&(__return.s0),float,Z_to_fp32(a0)) * store(&(__return.s1),float,Z_to_fp32(a1)) * store(&(__return.s2),float,Z_to_fp32(a2)) * store(&(__return.s3),float,Z_to_fp32(a3)) */
{ float32x4_t r;
 r.s0=qcp_cvt_to_f32(a.s0);
 r.s1=qcp_cvt_to_f32(a.s1);
 r.s2=qcp_cvt_to_f32(a.s2);
 r.s3=qcp_cvt_to_f32(a.s3);
 return r;
}
