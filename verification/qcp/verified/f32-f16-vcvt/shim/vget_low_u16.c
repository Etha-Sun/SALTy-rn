#include "vector_ops.h"
uint16x4_t vget_low_u16(uint16x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),unsigned short,x0) * store(&(a.s1),unsigned short,x1) * store(&(a.s2),unsigned short,x2) * store(&(a.s3),unsigned short,x3) * store(&(a.s4),unsigned short,x4) * store(&(a.s5),unsigned short,x5) * store(&(a.s6),unsigned short,x6) * store(&(a.s7),unsigned short,x7)
 Ensure store(&(__return.s0),unsigned short,x0) * store(&(__return.s1),unsigned short,x1) * store(&(__return.s2),unsigned short,x2) * store(&(__return.s3),unsigned short,x3) */
{
 uint16x4_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 return r;
}
