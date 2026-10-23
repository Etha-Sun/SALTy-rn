#include "neon_arithmetic.h"
#include "scalar_primitives.h"
int16x4_t vget_low_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) Ensure store(&(__return.s0),short,a0) * store(&(__return.s1),short,a1) * store(&(__return.s2),short,a2) * store(&(__return.s3),short,a3) */
{ int16x4_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 return r;
}
