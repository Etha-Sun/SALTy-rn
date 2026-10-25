#include "adapters.h"
int16x8_t qm_narrow_pair(int32x4_t a,int32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(b.s0),int,b0) * store(&(b.s1),int,b1) * store(&(b.s2),int,b2) * store(&(b.s3),int,b3)
 Ensure store(&(__return.s0),short,qm_sat16(a0)) * store(&(__return.s1),short,qm_sat16(a1)) * store(&(__return.s2),short,qm_sat16(a2)) * store(&(__return.s3),short,qm_sat16(a3)) * store(&(__return.s4),short,qm_sat16(b0)) * store(&(__return.s5),short,qm_sat16(b1)) * store(&(__return.s6),short,qm_sat16(b2)) * store(&(__return.s7),short,qm_sat16(b3)) */
{
int16x4_t lo=vqmovn_s32(a) /*@ where a=&a,a0=a0,a1=a1,a2=a2,a3=a3 */;
int16x8_t r=vqmovn_high_s32(lo,b) /*@ where a=&lo,b=&b,a0=qm_sat16(a0),a1=qm_sat16(a1),a2=qm_sat16(a2),a3=qm_sat16(a3),b0=b0,b1=b1,b2=b2,b3=b3 */;
return r;
}
