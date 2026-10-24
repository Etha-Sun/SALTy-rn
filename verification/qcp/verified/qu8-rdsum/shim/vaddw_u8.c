#include "vector_primitives.h"
uint16x8_t vaddw_u8(uint16x8_t a,uint8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) Require 0<=a0 && a0<=65535 && 0<=a1 && a1<=65535 && 0<=a2 && a2<=65535 && 0<=a3 && a3<=65535 && 0<=a4 && a4<=65535 && 0<=a5 && a5<=65535 && 0<=a6 && a6<=65535 && 0<=a7 && a7<=65535 && 0<=b0 && b0<=255 && 0<=b1 && b1<=255 && 0<=b2 && b2<=255 && 0<=b3 && b3<=255 && 0<=b4 && b4<=255 && 0<=b5 && b5<=255 && 0<=b6 && b6<=255 && 0<=b7 && b7<=255 && store(&(a.s0),unsigned short,a0) * store(&(a.s1),unsigned short,a1) * store(&(a.s2),unsigned short,a2) * store(&(a.s3),unsigned short,a3) * store(&(a.s4),unsigned short,a4) * store(&(a.s5),unsigned short,a5) * store(&(a.s6),unsigned short,a6) * store(&(a.s7),unsigned short,a7) * store(&(b.s0),unsigned char,b0) * store(&(b.s1),unsigned char,b1) * store(&(b.s2),unsigned char,b2) * store(&(b.s3),unsigned char,b3) * store(&(b.s4),unsigned char,b4) * store(&(b.s5),unsigned char,b5) * store(&(b.s6),unsigned char,b6) * store(&(b.s7),unsigned char,b7) Ensure store(&(__return.s0),unsigned short,rd_wadd16(a0,b0)) * store(&(__return.s1),unsigned short,rd_wadd16(a1,b1)) * store(&(__return.s2),unsigned short,rd_wadd16(a2,b2)) * store(&(__return.s3),unsigned short,rd_wadd16(a3,b3)) * store(&(__return.s4),unsigned short,rd_wadd16(a4,b4)) * store(&(__return.s5),unsigned short,rd_wadd16(a5,b5)) * store(&(__return.s6),unsigned short,rd_wadd16(a6,b6)) * store(&(__return.s7),unsigned short,rd_wadd16(a7,b7)) */
{
uint16x8_t r;
r.s0=rdsum_wadd16(a.s0,b.s0);
r.s1=rdsum_wadd16(a.s1,b.s1);
r.s2=rdsum_wadd16(a.s2,b.s2);
r.s3=rdsum_wadd16(a.s3,b.s3);
r.s4=rdsum_wadd16(a.s4,b.s4);
r.s5=rdsum_wadd16(a.s5,b.s5);
r.s6=rdsum_wadd16(a.s6,b.s6);
r.s7=rdsum_wadd16(a.s7,b.s7);
return r;
}
