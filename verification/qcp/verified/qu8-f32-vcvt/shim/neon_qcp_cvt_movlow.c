#include "neon_composed.h"
#include "neon_arithmetic.h"
int32x4_t qcp_cvt_movlow(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) Ensure store(&(__return.s0),int,a0) * store(&(__return.s1),int,a1) * store(&(__return.s2),int,a2) * store(&(__return.s3),int,a3) */
{
 int16x4_t t=vget_low_s16(a) /*@ where a=&a */;
 return vmovl_s16(t) /*@ where a=&t */;
}
