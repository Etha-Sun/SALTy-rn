#include "vector_ops.h"
uint16x4_t qcp_f16_vext_u16_2(const uint16x4_t* a,const uint16x4_t* b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require a == b && store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(__return.s0),unsigned short,x2) * store(&(__return.s1),unsigned short,x3) * store(&(__return.s2),unsigned short,x0) * store(&(__return.s3),unsigned short,x1) */
{ uint16x4_t r;
 r.s0=a->s2;
 r.s1=a->s3;
 r.s2=a->s0;
 r.s3=a->s1;
 return r; }
