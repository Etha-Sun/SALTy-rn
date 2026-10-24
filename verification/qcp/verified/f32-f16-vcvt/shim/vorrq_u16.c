#include "vector_ops.h"
uint16x8_t vorrq_u16(uint16x8_t a,uint16x8_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (y4:Z) (y5:Z) (y6:Z) (y7:Z)
 Require store(&(a.s0),unsigned short,x0) * store(&(a.s1),unsigned short,x1) * store(&(a.s2),unsigned short,x2) * store(&(a.s3),unsigned short,x3) * store(&(a.s4),unsigned short,x4) * store(&(a.s5),unsigned short,x5) * store(&(a.s6),unsigned short,x6) * store(&(a.s7),unsigned short,x7) * store(&(b.s0),unsigned short,y0) * store(&(b.s1),unsigned short,y1) * store(&(b.s2),unsigned short,y2) * store(&(b.s3),unsigned short,y3) * store(&(b.s4),unsigned short,y4) * store(&(b.s5),unsigned short,y5) * store(&(b.s6),unsigned short,y6) * store(&(b.s7),unsigned short,y7)
 Ensure store(&(__return.s0),unsigned short,f16_or16(x0,y0)) * store(&(__return.s1),unsigned short,f16_or16(x1,y1)) * store(&(__return.s2),unsigned short,f16_or16(x2,y2)) * store(&(__return.s3),unsigned short,f16_or16(x3,y3)) * store(&(__return.s4),unsigned short,f16_or16(x4,y4)) * store(&(__return.s5),unsigned short,f16_or16(x5,y5)) * store(&(__return.s6),unsigned short,f16_or16(x6,y6)) * store(&(__return.s7),unsigned short,f16_or16(x7,y7)) */
{
 uint16x8_t r;
 r.s0=qcp_f16_or16(a.s0,b.s0);
 r.s1=qcp_f16_or16(a.s1,b.s1);
 r.s2=qcp_f16_or16(a.s2,b.s2);
 r.s3=qcp_f16_or16(a.s3,b.s3);
 r.s4=qcp_f16_or16(a.s4,b.s4);
 r.s5=qcp_f16_or16(a.s5,b.s5);
 r.s6=qcp_f16_or16(a.s6,b.s6);
 r.s7=qcp_f16_or16(a.s7,b.s7);
 return r;
}
