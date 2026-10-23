typedef unsigned char uint8_t;
typedef struct uint8x8_t {unsigned char s0;unsigned char s1;unsigned char s2;unsigned char s3;unsigned char s4;unsigned char s5;unsigned char s6;unsigned char s7;} uint8x8_t;
typedef struct uint8x16_t {unsigned char s0;unsigned char s1;unsigned char s2;unsigned char s3;unsigned char s4;unsigned char s5;unsigned char s6;unsigned char s7;unsigned char s8;unsigned char s9;unsigned char s10;unsigned char s11;unsigned char s12;unsigned char s13;unsigned char s14;unsigned char s15;} uint8x16_t;
typedef uint8x8_t uint32x2_t;
typedef uint8x8_t uint16x4_t;
#include "u8_copy.h"
#include "le_store.c"
unsigned short qcp_u8_pack16(unsigned char a,unsigned char b)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255
    Ensure __return == a + 256*b */
{ return (unsigned short)(a + 256*b); }
unsigned int qcp_u8_pack32(unsigned char a,unsigned char b,unsigned char c,unsigned char d)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255 &&
            0 <= c && c <= 255 && 0 <= d && d <= 255
    Ensure __return == a + 256*b + 65536*c + 16777216*d */
{ return (unsigned int)a + 256U*b + 65536U*c + 16777216U*d; }

uint32x2_t vreinterpret_u32_u8(uint8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),unsigned char,x0) * store(&(a.s1),unsigned char,x1) * store(&(a.s2),unsigned char,x2) * store(&(a.s3),unsigned char,x3) * store(&(a.s4),unsigned char,x4) * store(&(a.s5),unsigned char,x5) * store(&(a.s6),unsigned char,x6) * store(&(a.s7),unsigned char,x7)
 Ensure store(&(__return.s0),unsigned char,x0) * store(&(__return.s1),unsigned char,x1) * store(&(__return.s2),unsigned char,x2) * store(&(__return.s3),unsigned char,x3) * store(&(__return.s4),unsigned char,x4) * store(&(__return.s5),unsigned char,x5) * store(&(__return.s6),unsigned char,x6) * store(&(__return.s7),unsigned char,x7) */
{
 uint8x8_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 r.s4=a.s4;
 r.s5=a.s5;
 r.s6=a.s6;
 r.s7=a.s7;
 return r;
}
void qcp_store_u32_0(unsigned char*output,const uint32x2_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char) * undef_data_at(output+2,unsigned char) * undef_data_at(output+3,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) * store(output+2,unsigned char,x2) * store(output+3,unsigned char,x3) */
{
 qcp_u8_store_word32(output,qcp_u8_pack32(a->s0, a->s1, a->s2, a->s3));
}
#define vst1_lane_u32(p,a,lane) { uint32x2_t qcp_store_tmp; qcp_store_tmp=(a); qcp_store_u32_##lane((p),&qcp_store_tmp); }
void original_tail_store32(unsigned char*output,uint8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),unsigned char,x0) * store(&(vacc.s1),unsigned char,x1) * store(&(vacc.s2),unsigned char,x2) * store(&(vacc.s3),unsigned char,x3) * store(&(vacc.s4),unsigned char,x4) * store(&(vacc.s5),unsigned char,x5) * store(&(vacc.s6),unsigned char,x6) * store(&(vacc.s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char) * undef_data_at(output+2,unsigned char) * undef_data_at(output+3,unsigned char)
 Ensure store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) * store(output+2,unsigned char,x2) * store(output+3,unsigned char,x3) */
{
 vst1_lane_u32((void*) output, vreinterpret_u32_u8(vacc) /*@ where a=&vacc */, 0);
}
uint16x4_t vreinterpret_u16_u8(uint8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),unsigned char,x0) * store(&(a.s1),unsigned char,x1) * store(&(a.s2),unsigned char,x2) * store(&(a.s3),unsigned char,x3) * store(&(a.s4),unsigned char,x4) * store(&(a.s5),unsigned char,x5) * store(&(a.s6),unsigned char,x6) * store(&(a.s7),unsigned char,x7)
 Ensure store(&(__return.s0),unsigned char,x0) * store(&(__return.s1),unsigned char,x1) * store(&(__return.s2),unsigned char,x2) * store(&(__return.s3),unsigned char,x3) * store(&(__return.s4),unsigned char,x4) * store(&(__return.s5),unsigned char,x5) * store(&(__return.s6),unsigned char,x6) * store(&(__return.s7),unsigned char,x7) */
{
 uint8x8_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 r.s4=a.s4;
 r.s5=a.s5;
 r.s6=a.s6;
 r.s7=a.s7;
 return r;
}
void qcp_store_u16_0(unsigned char*output,const uint16x4_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) */
{
 qcp_u8_store_word16(output,qcp_u8_pack16(a->s0, a->s1));
}
#define vst1_lane_u16(p,a,lane) { uint16x4_t qcp_store_tmp; qcp_store_tmp=(a); qcp_store_u16_##lane((p),&qcp_store_tmp); }
void original_tail_store16(unsigned char*output,uint8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),unsigned char,x0) * store(&(vacc.s1),unsigned char,x1) * store(&(vacc.s2),unsigned char,x2) * store(&(vacc.s3),unsigned char,x3) * store(&(vacc.s4),unsigned char,x4) * store(&(vacc.s5),unsigned char,x5) * store(&(vacc.s6),unsigned char,x6) * store(&(vacc.s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char)
 Ensure store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) */
{
 vst1_lane_u16((void*) output, vreinterpret_u16_u8(vacc) /*@ where a=&vacc */, 0);
}
