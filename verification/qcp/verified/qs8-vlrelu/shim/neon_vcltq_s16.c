#include "lrelu_vectors.h"
uint16x8_t vcltq_s16(int16x8_t a,int16x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=b0 && b0<=32767 && -32768<=b1 && b1<=32767 && -32768<=b2 && b2<=32767 && -32768<=b3 && b3<=32767 && -32768<=b4 && b4<=32767 && -32768<=b5 && b5<=32767 && -32768<=b6 && b6<=32767 && -32768<=b7 && b7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3) * store(&(b.s4),short,b4) * store(&(b.s5),short,b5) * store(&(b.s6),short,b6) * store(&(b.s7),short,b7)
 Ensure store(&(__return.s0),unsigned short,qlr_neon_mask(a0,b0)) * store(&(__return.s1),unsigned short,qlr_neon_mask(a1,b1)) * store(&(__return.s2),unsigned short,qlr_neon_mask(a2,b2)) * store(&(__return.s3),unsigned short,qlr_neon_mask(a3,b3)) * store(&(__return.s4),unsigned short,qlr_neon_mask(a4,b4)) * store(&(__return.s5),unsigned short,qlr_neon_mask(a5,b5)) * store(&(__return.s6),unsigned short,qlr_neon_mask(a6,b6)) * store(&(__return.s7),unsigned short,qlr_neon_mask(a7,b7)) */
{
 uint16x8_t r;
 r.s0=qcp_qlr_cmp16(a.s0,b.s0);
 r.s1=qcp_qlr_cmp16(a.s1,b.s1);
 r.s2=qcp_qlr_cmp16(a.s2,b.s2);
 r.s3=qcp_qlr_cmp16(a.s3,b.s3);
 r.s4=qcp_qlr_cmp16(a.s4,b.s4);
 r.s5=qcp_qlr_cmp16(a.s5,b.s5);
 r.s6=qcp_qlr_cmp16(a.s6,b.s6);
 r.s7=qcp_qlr_cmp16(a.s7,b.s7);
 return r;
}
