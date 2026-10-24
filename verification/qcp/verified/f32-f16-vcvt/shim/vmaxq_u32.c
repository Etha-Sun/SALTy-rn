#include "vector_ops.h"
uint32x4_t vmaxq_u32(uint32x4_t a,uint32x4_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z)
 Require store(&(a.s0),unsigned int,x0) * store(&(a.s1),unsigned int,x1) * store(&(a.s2),unsigned int,x2) * store(&(a.s3),unsigned int,x3) * store(&(b.s0),unsigned int,y0) * store(&(b.s1),unsigned int,y1) * store(&(b.s2),unsigned int,y2) * store(&(b.s3),unsigned int,y3)
 Ensure store(&(__return.s0),unsigned int,f16_max32(x0,y0)) * store(&(__return.s1),unsigned int,f16_max32(x1,y1)) * store(&(__return.s2),unsigned int,f16_max32(x2,y2)) * store(&(__return.s3),unsigned int,f16_max32(x3,y3)) */
{
 uint32x4_t r;
 r.s0=qcp_f16_max32(a.s0,b.s0);
 r.s1=qcp_f16_max32(a.s1,b.s1);
 r.s2=qcp_f16_max32(a.s2,b.s2);
 r.s3=qcp_f16_max32(a.s3,b.s3);
 return r;
}
