#include "neon_unsigned.h"
int16x8_t vreinterpretq_s16_u16(uint16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) Require 0<=a0 && a0<=65535 && 0<=a1 && a1<=65535 && 0<=a2 && a2<=65535 && 0<=a3 && a3<=65535 && 0<=a4 && a4<=65535 && 0<=a5 && a5<=65535 && 0<=a6 && a6<=65535 && 0<=a7 && a7<=65535 && store(&(a.s0),unsigned short,a0) * store(&(a.s1),unsigned short,a1) * store(&(a.s2),unsigned short,a2) * store(&(a.s3),unsigned short,a3) * store(&(a.s4),unsigned short,a4) * store(&(a.s5),unsigned short,a5) * store(&(a.s6),unsigned short,a6) * store(&(a.s7),unsigned short,a7) Ensure store(&(__return.s0),short,cvt_s16(a0)) * store(&(__return.s1),short,cvt_s16(a1)) * store(&(__return.s2),short,cvt_s16(a2)) * store(&(__return.s3),short,cvt_s16(a3)) * store(&(__return.s4),short,cvt_s16(a4)) * store(&(__return.s5),short,cvt_s16(a5)) * store(&(__return.s6),short,cvt_s16(a6)) * store(&(__return.s7),short,cvt_s16(a7)) */
{ int16x8_t r;
 r.s0=qcp_cvt_as_s16(a.s0);
 r.s1=qcp_cvt_as_s16(a.s1);
 r.s2=qcp_cvt_as_s16(a.s2);
 r.s3=qcp_cvt_as_s16(a.s3);
 r.s4=qcp_cvt_as_s16(a.s4);
 r.s5=qcp_cvt_as_s16(a.s5);
 r.s6=qcp_cvt_as_s16(a.s6);
 r.s7=qcp_cvt_as_s16(a.s7);
 return r;
}
