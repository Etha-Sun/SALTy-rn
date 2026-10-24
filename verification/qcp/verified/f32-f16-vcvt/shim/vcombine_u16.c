#include "vector_ops.h"
uint16x8_t vcombine_u16(uint16x4_t a,uint16x4_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z)
 Require store(&(a.s0),unsigned short,x0) * store(&(a.s1),unsigned short,x1) * store(&(a.s2),unsigned short,x2) * store(&(a.s3),unsigned short,x3) * store(&(b.s0),unsigned short,y0) * store(&(b.s1),unsigned short,y1) * store(&(b.s2),unsigned short,y2) * store(&(b.s3),unsigned short,y3)
 Ensure store(&(__return.s0),unsigned short,x0) * store(&(__return.s1),unsigned short,x1) * store(&(__return.s2),unsigned short,x2) * store(&(__return.s3),unsigned short,x3) * store(&(__return.s4),unsigned short,y0) * store(&(__return.s5),unsigned short,y1) * store(&(__return.s6),unsigned short,y2) * store(&(__return.s7),unsigned short,y3) */
{
 uint16x8_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 r.s4=b.s0;
 r.s5=b.s1;
 r.s6=b.s2;
 r.s7=b.s3;
 return r;
}
