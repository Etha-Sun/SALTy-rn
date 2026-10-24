#include "vector_ops.h"
uint16x4_t vand_u16(uint16x4_t a,uint16x4_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z)
 Require store(&(a.s0),unsigned short,x0) * store(&(a.s1),unsigned short,x1) * store(&(a.s2),unsigned short,x2) * store(&(a.s3),unsigned short,x3) * store(&(b.s0),unsigned short,y0) * store(&(b.s1),unsigned short,y1) * store(&(b.s2),unsigned short,y2) * store(&(b.s3),unsigned short,y3)
 Ensure store(&(__return.s0),unsigned short,f16_and16(x0,y0)) * store(&(__return.s1),unsigned short,f16_and16(x1,y1)) * store(&(__return.s2),unsigned short,f16_and16(x2,y2)) * store(&(__return.s3),unsigned short,f16_and16(x3,y3)) */
{
 uint16x4_t r;
 r.s0=qcp_f16_and16(a.s0,b.s0);
 r.s1=qcp_f16_and16(a.s1,b.s1);
 r.s2=qcp_f16_and16(a.s2,b.s2);
 r.s3=qcp_f16_and16(a.s3,b.s3);
 return r;
}
