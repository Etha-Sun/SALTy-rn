#include "vector_ops.h"
uint16x4_t vmovn_u32(uint32x4_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a.s0),unsigned int,x0) * store(&(a.s1),unsigned int,x1) * store(&(a.s2),unsigned int,x2) * store(&(a.s3),unsigned int,x3)
 Ensure store(&(__return.s0),unsigned short,f16_narrow16(x0)) * store(&(__return.s1),unsigned short,f16_narrow16(x1)) * store(&(__return.s2),unsigned short,f16_narrow16(x2)) * store(&(__return.s3),unsigned short,f16_narrow16(x3)) */
{
 uint16x4_t r;
 r.s0=qcp_f16_narrow16(a.s0);
 r.s1=qcp_f16_narrow16(a.s1);
 r.s2=qcp_f16_narrow16(a.s2);
 r.s3=qcp_f16_narrow16(a.s3);
 return r;
}
