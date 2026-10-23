#include "neon_arithmetic.h"
#include "scalar_primitives.h"
int32x4_t vmovl_s16(int16x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) Ensure store(&(__return.s0),int,a0) * store(&(__return.s1),int,a1) * store(&(__return.s2),int,a2) * store(&(__return.s3),int,a3) */
{ int32x4_t r;
 r.s0=qcp_cvt_sext16(a.s0);
 r.s1=qcp_cvt_sext16(a.s1);
 r.s2=qcp_cvt_sext16(a.s2);
 r.s3=qcp_cvt_sext16(a.s3);
 return r;
}
