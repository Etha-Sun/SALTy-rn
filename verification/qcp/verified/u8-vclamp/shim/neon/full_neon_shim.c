#include "tail.c"
#include "arrays.h"
/*@ Import Coq Require Import FullU8.U8Logic */
/*@ Extern Coq (u8_min:Z->Z->Z) (u8_max:Z->Z->Z) */
unsigned char qcp_u8_min(unsigned char x,unsigned char y)
/*@ Require 0<=x && x<=255 && 0<=y && y<=255 Ensure __return==u8_min(x,y) */
{if(x<y)return x;return y;}
unsigned char qcp_u8_max(unsigned char x,unsigned char y)
/*@ Require 0<=x && x<=255 && 0<=y && y<=255 Ensure __return==u8_max(x,y) */
{if(x<y)return y;return x;}
uint8x8_t vld1_u8(const unsigned char*p)
/*@ With (A:list Z) (n:Z) Require 8 <= n && n <= 18446744073709551615 && UCharArray::full(p,n,A) Ensure UCharArray::seg(p,0,8,sublist(0,8,A)) * UCharArray::full(p+8,n-8,sublist(8,n,A)) * store(&(__return.s0),unsigned char,A[0]) * store(&(__return.s1),unsigned char,A[1]) * store(&(__return.s2),unsigned char,A[2]) * store(&(__return.s3),unsigned char,A[3]) * store(&(__return.s4),unsigned char,A[4]) * store(&(__return.s5),unsigned char,A[5]) * store(&(__return.s6),unsigned char,A[6]) * store(&(__return.s7),unsigned char,A[7]) */
{ uint8x8_t r;
r.s0=p[0];
r.s1=p[1];
r.s2=p[2];
r.s3=p[3];
r.s4=p[4];
r.s5=p[5];
r.s6=p[6];
r.s7=p[7];
return r;}
uint8x8_t vmin_u8(uint8x8_t a,uint8x8_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (y4:Z) (y5:Z) (y6:Z) (y7:Z) Require store(&(a.s0),unsigned char,x0) * store(&(a.s1),unsigned char,x1) * store(&(a.s2),unsigned char,x2) * store(&(a.s3),unsigned char,x3) * store(&(a.s4),unsigned char,x4) * store(&(a.s5),unsigned char,x5) * store(&(a.s6),unsigned char,x6) * store(&(a.s7),unsigned char,x7) * store(&(b.s0),unsigned char,y0) * store(&(b.s1),unsigned char,y1) * store(&(b.s2),unsigned char,y2) * store(&(b.s3),unsigned char,y3) * store(&(b.s4),unsigned char,y4) * store(&(b.s5),unsigned char,y5) * store(&(b.s6),unsigned char,y6) * store(&(b.s7),unsigned char,y7) Ensure store(&(__return.s0),unsigned char,u8_min(x0,y0)) * store(&(__return.s1),unsigned char,u8_min(x1,y1)) * store(&(__return.s2),unsigned char,u8_min(x2,y2)) * store(&(__return.s3),unsigned char,u8_min(x3,y3)) * store(&(__return.s4),unsigned char,u8_min(x4,y4)) * store(&(__return.s5),unsigned char,u8_min(x5,y5)) * store(&(__return.s6),unsigned char,u8_min(x6,y6)) * store(&(__return.s7),unsigned char,u8_min(x7,y7)) */
{ uint8x8_t r;
r.s0=qcp_u8_min(a.s0,b.s0);
r.s1=qcp_u8_min(a.s1,b.s1);
r.s2=qcp_u8_min(a.s2,b.s2);
r.s3=qcp_u8_min(a.s3,b.s3);
r.s4=qcp_u8_min(a.s4,b.s4);
r.s5=qcp_u8_min(a.s5,b.s5);
r.s6=qcp_u8_min(a.s6,b.s6);
r.s7=qcp_u8_min(a.s7,b.s7);
return r;}
uint8x8_t vmax_u8(uint8x8_t a,uint8x8_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (y4:Z) (y5:Z) (y6:Z) (y7:Z) Require store(&(a.s0),unsigned char,x0) * store(&(a.s1),unsigned char,x1) * store(&(a.s2),unsigned char,x2) * store(&(a.s3),unsigned char,x3) * store(&(a.s4),unsigned char,x4) * store(&(a.s5),unsigned char,x5) * store(&(a.s6),unsigned char,x6) * store(&(a.s7),unsigned char,x7) * store(&(b.s0),unsigned char,y0) * store(&(b.s1),unsigned char,y1) * store(&(b.s2),unsigned char,y2) * store(&(b.s3),unsigned char,y3) * store(&(b.s4),unsigned char,y4) * store(&(b.s5),unsigned char,y5) * store(&(b.s6),unsigned char,y6) * store(&(b.s7),unsigned char,y7) Ensure store(&(__return.s0),unsigned char,u8_max(x0,y0)) * store(&(__return.s1),unsigned char,u8_max(x1,y1)) * store(&(__return.s2),unsigned char,u8_max(x2,y2)) * store(&(__return.s3),unsigned char,u8_max(x3,y3)) * store(&(__return.s4),unsigned char,u8_max(x4,y4)) * store(&(__return.s5),unsigned char,u8_max(x5,y5)) * store(&(__return.s6),unsigned char,u8_max(x6,y6)) * store(&(__return.s7),unsigned char,u8_max(x7,y7)) */
{ uint8x8_t r;
r.s0=qcp_u8_max(a.s0,b.s0);
r.s1=qcp_u8_max(a.s1,b.s1);
r.s2=qcp_u8_max(a.s2,b.s2);
r.s3=qcp_u8_max(a.s3,b.s3);
r.s4=qcp_u8_max(a.s4,b.s4);
r.s5=qcp_u8_max(a.s5,b.s5);
r.s6=qcp_u8_max(a.s6,b.s6);
r.s7=qcp_u8_max(a.s7,b.s7);
return r;}
void qcp_store8(unsigned char*p,const uint8x8_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (n:Z) Require 8 <= n && n <= 18446744073709551615 && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * UCharArray::undef_seg(p,0,n) Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * UCharArray::full(p,8,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil))))))))) * UCharArray::undef_full(p+8,n-8) */
{p[0]=a->s0;
p[1]=a->s1;
p[2]=a->s2;
p[3]=a->s3;
p[4]=a->s4;
p[5]=a->s5;
p[6]=a->s6;
p[7]=a->s7;
}
#define vst1_u8(p,a) { uint8x8_t qcp_vec_tmp; qcp_vec_tmp=(a); qcp_store8((p),&qcp_vec_tmp); }
uint8x16_t vld1q_u8(const unsigned char*p)
/*@ With (A:list Z) (n:Z) Require 16 <= n && n <= 18446744073709551615 && UCharArray::full(p,n,A) Ensure UCharArray::seg(p,0,16,sublist(0,16,A)) * UCharArray::full(p+16,n-16,sublist(16,n,A)) * store(&(__return.low.s0),unsigned char,A[0]) * store(&(__return.low.s1),unsigned char,A[1]) * store(&(__return.low.s2),unsigned char,A[2]) * store(&(__return.low.s3),unsigned char,A[3]) * store(&(__return.low.s4),unsigned char,A[4]) * store(&(__return.low.s5),unsigned char,A[5]) * store(&(__return.low.s6),unsigned char,A[6]) * store(&(__return.low.s7),unsigned char,A[7]) * store(&(__return.high.s0),unsigned char,A[8]) * store(&(__return.high.s1),unsigned char,A[9]) * store(&(__return.high.s2),unsigned char,A[10]) * store(&(__return.high.s3),unsigned char,A[11]) * store(&(__return.high.s4),unsigned char,A[12]) * store(&(__return.high.s5),unsigned char,A[13]) * store(&(__return.high.s6),unsigned char,A[14]) * store(&(__return.high.s7),unsigned char,A[15]) */
{ uint8x16_t r;
r.low.s0=p[0];
r.low.s1=p[1];
r.low.s2=p[2];
r.low.s3=p[3];
r.low.s4=p[4];
r.low.s5=p[5];
r.low.s6=p[6];
r.low.s7=p[7];
r.high.s0=p[8];
r.high.s1=p[9];
r.high.s2=p[10];
r.high.s3=p[11];
r.high.s4=p[12];
r.high.s5=p[13];
r.high.s6=p[14];
r.high.s7=p[15];
return r;}
uint8x16_t vminq_u8(uint8x16_t a,uint8x16_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (y4:Z) (y5:Z) (y6:Z) (y7:Z) (y8:Z) (y9:Z) (y10:Z) (y11:Z) (y12:Z) (y13:Z) (y14:Z) (y15:Z) Require store(&(a.low.s0),unsigned char,x0) * store(&(a.low.s1),unsigned char,x1) * store(&(a.low.s2),unsigned char,x2) * store(&(a.low.s3),unsigned char,x3) * store(&(a.low.s4),unsigned char,x4) * store(&(a.low.s5),unsigned char,x5) * store(&(a.low.s6),unsigned char,x6) * store(&(a.low.s7),unsigned char,x7) * store(&(a.high.s0),unsigned char,x8) * store(&(a.high.s1),unsigned char,x9) * store(&(a.high.s2),unsigned char,x10) * store(&(a.high.s3),unsigned char,x11) * store(&(a.high.s4),unsigned char,x12) * store(&(a.high.s5),unsigned char,x13) * store(&(a.high.s6),unsigned char,x14) * store(&(a.high.s7),unsigned char,x15) * store(&(b.low.s0),unsigned char,y0) * store(&(b.low.s1),unsigned char,y1) * store(&(b.low.s2),unsigned char,y2) * store(&(b.low.s3),unsigned char,y3) * store(&(b.low.s4),unsigned char,y4) * store(&(b.low.s5),unsigned char,y5) * store(&(b.low.s6),unsigned char,y6) * store(&(b.low.s7),unsigned char,y7) * store(&(b.high.s0),unsigned char,y8) * store(&(b.high.s1),unsigned char,y9) * store(&(b.high.s2),unsigned char,y10) * store(&(b.high.s3),unsigned char,y11) * store(&(b.high.s4),unsigned char,y12) * store(&(b.high.s5),unsigned char,y13) * store(&(b.high.s6),unsigned char,y14) * store(&(b.high.s7),unsigned char,y15) Ensure store(&(__return.low.s0),unsigned char,u8_min(x0,y0)) * store(&(__return.low.s1),unsigned char,u8_min(x1,y1)) * store(&(__return.low.s2),unsigned char,u8_min(x2,y2)) * store(&(__return.low.s3),unsigned char,u8_min(x3,y3)) * store(&(__return.low.s4),unsigned char,u8_min(x4,y4)) * store(&(__return.low.s5),unsigned char,u8_min(x5,y5)) * store(&(__return.low.s6),unsigned char,u8_min(x6,y6)) * store(&(__return.low.s7),unsigned char,u8_min(x7,y7)) * store(&(__return.high.s0),unsigned char,u8_min(x8,y8)) * store(&(__return.high.s1),unsigned char,u8_min(x9,y9)) * store(&(__return.high.s2),unsigned char,u8_min(x10,y10)) * store(&(__return.high.s3),unsigned char,u8_min(x11,y11)) * store(&(__return.high.s4),unsigned char,u8_min(x12,y12)) * store(&(__return.high.s5),unsigned char,u8_min(x13,y13)) * store(&(__return.high.s6),unsigned char,u8_min(x14,y14)) * store(&(__return.high.s7),unsigned char,u8_min(x15,y15)) */
{ uint8x16_t r;
r.low.s0=qcp_u8_min(a.low.s0,b.low.s0);
r.low.s1=qcp_u8_min(a.low.s1,b.low.s1);
r.low.s2=qcp_u8_min(a.low.s2,b.low.s2);
r.low.s3=qcp_u8_min(a.low.s3,b.low.s3);
r.low.s4=qcp_u8_min(a.low.s4,b.low.s4);
r.low.s5=qcp_u8_min(a.low.s5,b.low.s5);
r.low.s6=qcp_u8_min(a.low.s6,b.low.s6);
r.low.s7=qcp_u8_min(a.low.s7,b.low.s7);
r.high.s0=qcp_u8_min(a.high.s0,b.high.s0);
r.high.s1=qcp_u8_min(a.high.s1,b.high.s1);
r.high.s2=qcp_u8_min(a.high.s2,b.high.s2);
r.high.s3=qcp_u8_min(a.high.s3,b.high.s3);
r.high.s4=qcp_u8_min(a.high.s4,b.high.s4);
r.high.s5=qcp_u8_min(a.high.s5,b.high.s5);
r.high.s6=qcp_u8_min(a.high.s6,b.high.s6);
r.high.s7=qcp_u8_min(a.high.s7,b.high.s7);
return r;}
uint8x16_t vmaxq_u8(uint8x16_t a,uint8x16_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (y4:Z) (y5:Z) (y6:Z) (y7:Z) (y8:Z) (y9:Z) (y10:Z) (y11:Z) (y12:Z) (y13:Z) (y14:Z) (y15:Z) Require store(&(a.low.s0),unsigned char,x0) * store(&(a.low.s1),unsigned char,x1) * store(&(a.low.s2),unsigned char,x2) * store(&(a.low.s3),unsigned char,x3) * store(&(a.low.s4),unsigned char,x4) * store(&(a.low.s5),unsigned char,x5) * store(&(a.low.s6),unsigned char,x6) * store(&(a.low.s7),unsigned char,x7) * store(&(a.high.s0),unsigned char,x8) * store(&(a.high.s1),unsigned char,x9) * store(&(a.high.s2),unsigned char,x10) * store(&(a.high.s3),unsigned char,x11) * store(&(a.high.s4),unsigned char,x12) * store(&(a.high.s5),unsigned char,x13) * store(&(a.high.s6),unsigned char,x14) * store(&(a.high.s7),unsigned char,x15) * store(&(b.low.s0),unsigned char,y0) * store(&(b.low.s1),unsigned char,y1) * store(&(b.low.s2),unsigned char,y2) * store(&(b.low.s3),unsigned char,y3) * store(&(b.low.s4),unsigned char,y4) * store(&(b.low.s5),unsigned char,y5) * store(&(b.low.s6),unsigned char,y6) * store(&(b.low.s7),unsigned char,y7) * store(&(b.high.s0),unsigned char,y8) * store(&(b.high.s1),unsigned char,y9) * store(&(b.high.s2),unsigned char,y10) * store(&(b.high.s3),unsigned char,y11) * store(&(b.high.s4),unsigned char,y12) * store(&(b.high.s5),unsigned char,y13) * store(&(b.high.s6),unsigned char,y14) * store(&(b.high.s7),unsigned char,y15) Ensure store(&(__return.low.s0),unsigned char,u8_max(x0,y0)) * store(&(__return.low.s1),unsigned char,u8_max(x1,y1)) * store(&(__return.low.s2),unsigned char,u8_max(x2,y2)) * store(&(__return.low.s3),unsigned char,u8_max(x3,y3)) * store(&(__return.low.s4),unsigned char,u8_max(x4,y4)) * store(&(__return.low.s5),unsigned char,u8_max(x5,y5)) * store(&(__return.low.s6),unsigned char,u8_max(x6,y6)) * store(&(__return.low.s7),unsigned char,u8_max(x7,y7)) * store(&(__return.high.s0),unsigned char,u8_max(x8,y8)) * store(&(__return.high.s1),unsigned char,u8_max(x9,y9)) * store(&(__return.high.s2),unsigned char,u8_max(x10,y10)) * store(&(__return.high.s3),unsigned char,u8_max(x11,y11)) * store(&(__return.high.s4),unsigned char,u8_max(x12,y12)) * store(&(__return.high.s5),unsigned char,u8_max(x13,y13)) * store(&(__return.high.s6),unsigned char,u8_max(x14,y14)) * store(&(__return.high.s7),unsigned char,u8_max(x15,y15)) */
{ uint8x16_t r;
r.low.s0=qcp_u8_max(a.low.s0,b.low.s0);
r.low.s1=qcp_u8_max(a.low.s1,b.low.s1);
r.low.s2=qcp_u8_max(a.low.s2,b.low.s2);
r.low.s3=qcp_u8_max(a.low.s3,b.low.s3);
r.low.s4=qcp_u8_max(a.low.s4,b.low.s4);
r.low.s5=qcp_u8_max(a.low.s5,b.low.s5);
r.low.s6=qcp_u8_max(a.low.s6,b.low.s6);
r.low.s7=qcp_u8_max(a.low.s7,b.low.s7);
r.high.s0=qcp_u8_max(a.high.s0,b.high.s0);
r.high.s1=qcp_u8_max(a.high.s1,b.high.s1);
r.high.s2=qcp_u8_max(a.high.s2,b.high.s2);
r.high.s3=qcp_u8_max(a.high.s3,b.high.s3);
r.high.s4=qcp_u8_max(a.high.s4,b.high.s4);
r.high.s5=qcp_u8_max(a.high.s5,b.high.s5);
r.high.s6=qcp_u8_max(a.high.s6,b.high.s6);
r.high.s7=qcp_u8_max(a.high.s7,b.high.s7);
return r;}
void qcp_store16(unsigned char*p,const uint8x16_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (n:Z) Require 16 <= n && n <= 18446744073709551615 && store(&(a->low.s0),unsigned char,x0) * store(&(a->low.s1),unsigned char,x1) * store(&(a->low.s2),unsigned char,x2) * store(&(a->low.s3),unsigned char,x3) * store(&(a->low.s4),unsigned char,x4) * store(&(a->low.s5),unsigned char,x5) * store(&(a->low.s6),unsigned char,x6) * store(&(a->low.s7),unsigned char,x7) * store(&(a->high.s0),unsigned char,x8) * store(&(a->high.s1),unsigned char,x9) * store(&(a->high.s2),unsigned char,x10) * store(&(a->high.s3),unsigned char,x11) * store(&(a->high.s4),unsigned char,x12) * store(&(a->high.s5),unsigned char,x13) * store(&(a->high.s6),unsigned char,x14) * store(&(a->high.s7),unsigned char,x15) * UCharArray::undef_seg(p,0,n) Ensure store(&(a->low.s0),unsigned char,x0) * store(&(a->low.s1),unsigned char,x1) * store(&(a->low.s2),unsigned char,x2) * store(&(a->low.s3),unsigned char,x3) * store(&(a->low.s4),unsigned char,x4) * store(&(a->low.s5),unsigned char,x5) * store(&(a->low.s6),unsigned char,x6) * store(&(a->low.s7),unsigned char,x7) * store(&(a->high.s0),unsigned char,x8) * store(&(a->high.s1),unsigned char,x9) * store(&(a->high.s2),unsigned char,x10) * store(&(a->high.s3),unsigned char,x11) * store(&(a->high.s4),unsigned char,x12) * store(&(a->high.s5),unsigned char,x13) * store(&(a->high.s6),unsigned char,x14) * store(&(a->high.s7),unsigned char,x15) * UCharArray::full(p,16,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,cons(x8,cons(x9,cons(x10,cons(x11,cons(x12,cons(x13,cons(x14,cons(x15,nil))))))))))))))))) * UCharArray::undef_full(p+16,n-16) */
{p[0]=a->low.s0;
p[1]=a->low.s1;
p[2]=a->low.s2;
p[3]=a->low.s3;
p[4]=a->low.s4;
p[5]=a->low.s5;
p[6]=a->low.s6;
p[7]=a->low.s7;
p[8]=a->high.s0;
p[9]=a->high.s1;
p[10]=a->high.s2;
p[11]=a->high.s3;
p[12]=a->high.s4;
p[13]=a->high.s5;
p[14]=a->high.s6;
p[15]=a->high.s7;
}
#define vst1q_u8(p,a) { uint8x16_t qcp_vec_tmp; qcp_vec_tmp=(a); qcp_store16((p),&qcp_vec_tmp); }
#define vget_low_u8(a) ((a).low)
uint8x8_t qcp_self_ext2(const uint8x8_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(__return.s0),unsigned char,x2) * store(&(__return.s1),unsigned char,x3) * store(&(__return.s2),unsigned char,x4) * store(&(__return.s3),unsigned char,x5) * store(&(__return.s4),unsigned char,x6) * store(&(__return.s5),unsigned char,x7) * store(&(__return.s6),unsigned char,x0) * store(&(__return.s7),unsigned char,x1) */
{uint8x8_t r;r.s0=a->s2;
r.s1=a->s3;
r.s2=a->s4;
r.s3=a->s5;
r.s4=a->s6;
r.s5=a->s7;
r.s6=a->s0;
r.s7=a->s1;
return r;}
uint8x8_t qcp_self_ext4(const uint8x8_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(__return.s0),unsigned char,x4) * store(&(__return.s1),unsigned char,x5) * store(&(__return.s2),unsigned char,x6) * store(&(__return.s3),unsigned char,x7) * store(&(__return.s4),unsigned char,x0) * store(&(__return.s5),unsigned char,x1) * store(&(__return.s6),unsigned char,x2) * store(&(__return.s7),unsigned char,x3) */
{uint8x8_t r;r.s0=a->s4;
r.s1=a->s5;
r.s2=a->s6;
r.s3=a->s7;
r.s4=a->s0;
r.s5=a->s1;
r.s6=a->s2;
r.s7=a->s3;
return r;}
#define vext_u8(a,b,k) qcp_self_ext##k(&(a))
uint8x16_t vdupq_n_u8(unsigned char a)
/*@ Require 0<=a && a<=255 Ensure store(&(__return.low.s0),unsigned char,a) * store(&(__return.low.s1),unsigned char,a) * store(&(__return.low.s2),unsigned char,a) * store(&(__return.low.s3),unsigned char,a) * store(&(__return.low.s4),unsigned char,a) * store(&(__return.low.s5),unsigned char,a) * store(&(__return.low.s6),unsigned char,a) * store(&(__return.low.s7),unsigned char,a) * store(&(__return.high.s0),unsigned char,a) * store(&(__return.high.s1),unsigned char,a) * store(&(__return.high.s2),unsigned char,a) * store(&(__return.high.s3),unsigned char,a) * store(&(__return.high.s4),unsigned char,a) * store(&(__return.high.s5),unsigned char,a) * store(&(__return.high.s6),unsigned char,a) * store(&(__return.high.s7),unsigned char,a) */
{uint8x16_t r;r.low.s0=a;
r.low.s1=a;
r.low.s2=a;
r.low.s3=a;
r.low.s4=a;
r.low.s5=a;
r.low.s6=a;
r.low.s7=a;
r.high.s0=a;
r.high.s1=a;
r.high.s2=a;
r.high.s3=a;
r.high.s4=a;
r.high.s5=a;
r.high.s6=a;
r.high.s7=a;
return r;}
void qcp_store_byte(unsigned char*p,const uint8x8_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(p,unsigned char) Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(p,unsigned char,x0) */
{*p=a->s0;}
#define vst1_lane_u8(p,a,k) {uint8x8_t qcp_byte_tmp; qcp_byte_tmp=(a); qcp_store_byte((p),&qcp_byte_tmp);}

void qcp_array_store32_0(unsigned char*p,const uint32x2_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (n:Z) Require 4 <= n && n <= 18446744073709551615 && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * UCharArray::undef_seg(p,0,n) Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * UCharArray::full(p,4,cons(x0,cons(x1,cons(x2,cons(x3,nil))))) * UCharArray::undef_full(p+4,n-4) */
{ qcp_store_u32_0(p,a); }
#undef vst1_lane_u32
#define vst1_lane_u32(p,a,k) { uint32x2_t qcp_tail_tmp; qcp_tail_tmp=(a); qcp_array_store32_##k((p),&qcp_tail_tmp); }

void qcp_array_store16_0(unsigned char*p,const uint16x4_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (n:Z) Require 2 <= n && n <= 18446744073709551615 && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * UCharArray::undef_seg(p,0,n) Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * UCharArray::full(p,2,cons(x0,cons(x1,nil))) * UCharArray::undef_full(p+2,n-2) */
{ qcp_store_u16_0(p,a); }
#undef vst1_lane_u16
#define vst1_lane_u16(p,a,k) { uint16x4_t qcp_tail_tmp; qcp_tail_tmp=(a); qcp_array_store16_##k((p),&qcp_tail_tmp); }

void qcp_array_store8_0(unsigned char*p,const uint8x8_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (n:Z) Require 1 <= n && n <= 18446744073709551615 && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * UCharArray::undef_seg(p,0,n) Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * UCharArray::full(p,1,cons(x0,nil)) * UCharArray::undef_full(p+1,n-1) */
{ qcp_store_byte(p,a); }
#undef vst1_lane_u8
#define vst1_lane_u8(p,a,k) { uint8x8_t qcp_tail_tmp; qcp_tail_tmp=(a); qcp_array_store8_##k((p),&qcp_tail_tmp); }
