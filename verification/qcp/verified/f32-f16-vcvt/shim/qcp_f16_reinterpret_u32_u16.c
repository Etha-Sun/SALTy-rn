#include "vector_ops.h"
uint32x2_t qcp_f16_reinterpret_u32_u16(uint16x4_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a.s0),unsigned short,x0) * store(&(a.s1),unsigned short,x1) * store(&(a.s2),unsigned short,x2) * store(&(a.s3),unsigned short,x3)
 Ensure store(&(__return.s0),unsigned short,x0) * store(&(__return.s1),unsigned short,x1) * store(&(__return.s2),unsigned short,x2) * store(&(__return.s3),unsigned short,x3) */
{
 uint16x4_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 return r;
}
