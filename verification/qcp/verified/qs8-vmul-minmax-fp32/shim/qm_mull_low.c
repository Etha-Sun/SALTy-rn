#include "adapters.h"
int32x4_t qm_mull_low(int16x8_t a,int16x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3) * store(&(b.s4),short,b4) * store(&(b.s5),short,b5) * store(&(b.s6),short,b6) * store(&(b.s7),short,b7)
 Ensure store(&(__return.s0),int,a0*b0) * store(&(__return.s1),int,a1*b1) * store(&(__return.s2),int,a2*b2) * store(&(__return.s3),int,a3*b3) */
{
int16x4_t al=vget_low_s16(a) /*@ where a=&a,a0=a0,a1=a1,a2=a2,a3=a3,a4=a4,a5=a5,a6=a6,a7=a7 */;
int16x4_t bl=vget_low_s16(b) /*@ where a=&b,a0=b0,a1=b1,a2=b2,a3=b3,a4=b4,a5=b5,a6=b6,a7=b7 */;
int32x4_t r=vmull_s16(al,bl) /*@ where a=&al,b=&bl,a0=a0,a1=a1,a2=a2,a3=a3,b0=b0,b1=b1,b2=b2,b3=b3 */;
return r;
}
