#include "vector_ops.h"
uint16x8_t vdupq_n_u16(unsigned short b)
/*@ Require emp
 Ensure store(&(__return.s0),unsigned short,b) * store(&(__return.s1),unsigned short,b) * store(&(__return.s2),unsigned short,b) * store(&(__return.s3),unsigned short,b) * store(&(__return.s4),unsigned short,b) * store(&(__return.s5),unsigned short,b) * store(&(__return.s6),unsigned short,b) * store(&(__return.s7),unsigned short,b) */
{
 uint16x8_t r;
 r.s0=b;
 r.s1=b;
 r.s2=b;
 r.s3=b;
 r.s4=b;
 r.s5=b;
 r.s6=b;
 r.s7=b;
 return r;
}
