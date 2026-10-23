#ifndef QCP_S8_NEON_API_H
#define QCP_S8_NEON_API_H
#include "scalar_primitives.h"
#include "neon_store.h"
#include "signed_tail.h"
#include "control.h"
int8x8_t vmin_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
    Ensure store(&(__return.s0),char,s8_min(a0,b0)) * store(&(__return.s1),char,s8_min(a1,b1)) * store(&(__return.s2),char,s8_min(a2,b2)) * store(&(__return.s3),char,s8_min(a3,b3)) * store(&(__return.s4),char,s8_min(a4,b4)) * store(&(__return.s5),char,s8_min(a5,b5)) * store(&(__return.s6),char,s8_min(a6,b6)) * store(&(__return.s7),char,s8_min(a7,b7)) */;
int8x8_t vmax_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
    Ensure store(&(__return.s0),char,s8_max(a0,b0)) * store(&(__return.s1),char,s8_max(a1,b1)) * store(&(__return.s2),char,s8_max(a2,b2)) * store(&(__return.s3),char,s8_max(a3,b3)) * store(&(__return.s4),char,s8_max(a4,b4)) * store(&(__return.s5),char,s8_max(a5,b5)) * store(&(__return.s6),char,s8_max(a6,b6)) * store(&(__return.s7),char,s8_max(a7,b7)) */;
int8x16_t vminq_s8(int8x16_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7) * store(&(b.s8),char,b8) * store(&(b.s9),char,b9) * store(&(b.s10),char,b10) * store(&(b.s11),char,b11) * store(&(b.s12),char,b12) * store(&(b.s13),char,b13) * store(&(b.s14),char,b14) * store(&(b.s15),char,b15)
    Ensure store(&(__return.s0),char,s8_min(a0,b0)) * store(&(__return.s1),char,s8_min(a1,b1)) * store(&(__return.s2),char,s8_min(a2,b2)) * store(&(__return.s3),char,s8_min(a3,b3)) * store(&(__return.s4),char,s8_min(a4,b4)) * store(&(__return.s5),char,s8_min(a5,b5)) * store(&(__return.s6),char,s8_min(a6,b6)) * store(&(__return.s7),char,s8_min(a7,b7)) * store(&(__return.s8),char,s8_min(a8,b8)) * store(&(__return.s9),char,s8_min(a9,b9)) * store(&(__return.s10),char,s8_min(a10,b10)) * store(&(__return.s11),char,s8_min(a11,b11)) * store(&(__return.s12),char,s8_min(a12,b12)) * store(&(__return.s13),char,s8_min(a13,b13)) * store(&(__return.s14),char,s8_min(a14,b14)) * store(&(__return.s15),char,s8_min(a15,b15)) */;
int8x16_t vmaxq_s8(int8x16_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7) * store(&(b.s8),char,b8) * store(&(b.s9),char,b9) * store(&(b.s10),char,b10) * store(&(b.s11),char,b11) * store(&(b.s12),char,b12) * store(&(b.s13),char,b13) * store(&(b.s14),char,b14) * store(&(b.s15),char,b15)
    Ensure store(&(__return.s0),char,s8_max(a0,b0)) * store(&(__return.s1),char,s8_max(a1,b1)) * store(&(__return.s2),char,s8_max(a2,b2)) * store(&(__return.s3),char,s8_max(a3,b3)) * store(&(__return.s4),char,s8_max(a4,b4)) * store(&(__return.s5),char,s8_max(a5,b5)) * store(&(__return.s6),char,s8_max(a6,b6)) * store(&(__return.s7),char,s8_max(a7,b7)) * store(&(__return.s8),char,s8_max(a8,b8)) * store(&(__return.s9),char,s8_max(a9,b9)) * store(&(__return.s10),char,s8_max(a10,b10)) * store(&(__return.s11),char,s8_max(a11,b11)) * store(&(__return.s12),char,s8_max(a12,b12)) * store(&(__return.s13),char,s8_max(a13,b13)) * store(&(__return.s14),char,s8_max(a14,b14)) * store(&(__return.s15),char,s8_max(a15,b15)) */;
int8x16_t vdupq_n_s8(int8_t x)
/*@ Require -128<=x && x<=127 && emp
    Ensure store(&(__return.s0),char,x) * store(&(__return.s1),char,x) * store(&(__return.s2),char,x) * store(&(__return.s3),char,x) * store(&(__return.s4),char,x) * store(&(__return.s5),char,x) * store(&(__return.s6),char,x) * store(&(__return.s7),char,x) * store(&(__return.s8),char,x) * store(&(__return.s9),char,x) * store(&(__return.s10),char,x) * store(&(__return.s11),char,x) * store(&(__return.s12),char,x) * store(&(__return.s13),char,x) * store(&(__return.s14),char,x) * store(&(__return.s15),char,x) */;
int8x8_t vget_low_s8(int8x16_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z)
    Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15)
    Ensure store(&(__return.s0),char,a0) * store(&(__return.s1),char,a1) * store(&(__return.s2),char,a2) * store(&(__return.s3),char,a3) * store(&(__return.s4),char,a4) * store(&(__return.s5),char,a5) * store(&(__return.s6),char,a6) * store(&(__return.s7),char,a7) */;
int8_t qcp_s8_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure __return==s8_read_lane(i,vl,idx,L) && CharArray::full(base,count,L) */;
int8x8_t qcp_s8_load8(const int8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+8<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,L[idx+0]) * store(&(__return.s1),char,L[idx+1]) * store(&(__return.s2),char,L[idx+2]) * store(&(__return.s3),char,L[idx+3]) * store(&(__return.s4),char,L[idx+4]) * store(&(__return.s5),char,L[idx+5]) * store(&(__return.s6),char,L[idx+6]) * store(&(__return.s7),char,L[idx+7]) */;
int8x16_t qcp_s8_load16(const int8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+16<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,L[idx+0]) * store(&(__return.s1),char,L[idx+1]) * store(&(__return.s2),char,L[idx+2]) * store(&(__return.s3),char,L[idx+3]) * store(&(__return.s4),char,L[idx+4]) * store(&(__return.s5),char,L[idx+5]) * store(&(__return.s6),char,L[idx+6]) * store(&(__return.s7),char,L[idx+7]) * store(&(__return.s8),char,L[idx+8]) * store(&(__return.s9),char,L[idx+9]) * store(&(__return.s10),char,L[idx+10]) * store(&(__return.s11),char,L[idx+11]) * store(&(__return.s12),char,L[idx+12]) * store(&(__return.s13),char,L[idx+13]) * store(&(__return.s14),char,L[idx+14]) * store(&(__return.s15),char,L[idx+15]) */;
int8x8_t qcp_s8_ext2(const int8x8_t *a,const int8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
    Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(__return.s0),char,x2) * store(&(__return.s1),char,x3) * store(&(__return.s2),char,x4) * store(&(__return.s3),char,x5) * store(&(__return.s4),char,x6) * store(&(__return.s5),char,x7) * store(&(__return.s6),char,x0) * store(&(__return.s7),char,x1) */;
int8x8_t qcp_s8_ext4(const int8x8_t *a,const int8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
    Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(__return.s0),char,x4) * store(&(__return.s1),char,x5) * store(&(__return.s2),char,x6) * store(&(__return.s3),char,x7) * store(&(__return.s4),char,x0) * store(&(__return.s5),char,x1) * store(&(__return.s6),char,x2) * store(&(__return.s7),char,x3) */;
void qcp_s8_store8(int8_t *p,const int8x8_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,8) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
 Ensure CharArray::full(p,8,s8_pack8(x0,x1,x2,x3,x4,x5,x6,x7)) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) */;
void qcp_s8_store16(int8_t *p,const int8x16_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z)
 Require CharArray::undef_full(p,16) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15)
 Ensure CharArray::full(p,16,s8_pack16(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15)) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) */;
void qcp_s8_store_lane0(int8_t *p,const int8x8_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require undef_data_at(p,char) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
 Ensure store(p,char,x0) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) */;
void qcp_s8_store_word32(unsigned char *out,unsigned int word)
/*@ Require 0 <= word && word <= 4294967295 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char) *
    undef_data_at(out+2,unsigned char) *
    undef_data_at(out+3,unsigned char)
 Ensure data_at(out+0,unsigned char,s8_le_byte0(word)) *
data_at(out+1,unsigned char,s8_le_byte1(word)) *
data_at(out+2,unsigned char,s8_le_byte2(word)) *
data_at(out+3,unsigned char,s8_le_byte3(word)) */;
void qcp_s8_store_word16(unsigned char *out,unsigned short word)
/*@ Require 0 <= word && word <= 65535 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char)
 Ensure data_at(out+0,unsigned char,s8_le_byte0(word)) *
data_at(out+1,unsigned char,s8_le_byte1(word)) */;
unsigned short qcp_s8_pack16(unsigned char a,unsigned char b)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255
    Ensure __return == a + 256*b */;
unsigned int qcp_s8_pack32(unsigned char a,unsigned char b,unsigned char c,unsigned char d)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255 &&
            0 <= c && c <= 255 && 0 <= d && d <= 255
    Ensure __return == a + 256*b + 65536*c + 16777216*d */;
uint32x2_t vreinterpret_u32_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),signed char,x0) * store(&(a.s1),signed char,x1) * store(&(a.s2),signed char,x2) * store(&(a.s3),signed char,x3) * store(&(a.s4),signed char,x4) * store(&(a.s5),signed char,x5) * store(&(a.s6),signed char,x6) * store(&(a.s7),signed char,x7)
 Ensure -128 <= x0 && x0 <= 127 && -128 <= x1 && x1 <= 127 && -128 <= x2 && x2 <= 127 && -128 <= x3 && x3 <= 127 && -128 <= x4 && x4 <= 127 && -128 <= x5 && x5 <= 127 && -128 <= x6 && x6 <= 127 && -128 <= x7 && x7 <= 127 && store(&(__return.s0),unsigned char,unsigned_last_nbits(x0,8)) * store(&(__return.s1),unsigned char,unsigned_last_nbits(x1,8)) * store(&(__return.s2),unsigned char,unsigned_last_nbits(x2,8)) * store(&(__return.s3),unsigned char,unsigned_last_nbits(x3,8)) * store(&(__return.s4),unsigned char,unsigned_last_nbits(x4,8)) * store(&(__return.s5),unsigned char,unsigned_last_nbits(x5,8)) * store(&(__return.s6),unsigned char,unsigned_last_nbits(x6,8)) * store(&(__return.s7),unsigned char,unsigned_last_nbits(x7,8)) */;
void qcp_s8_store_u32_0(unsigned char*output,const uint32x2_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char) * undef_data_at(output+2,unsigned char) * undef_data_at(output+3,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) * store(output+2,unsigned char,x2) * store(output+3,unsigned char,x3) */;
void original_tail_store32(int8_t*output,int8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),signed char,x0) * store(&(vacc.s1),signed char,x1) * store(&(vacc.s2),signed char,x2) * store(&(vacc.s3),signed char,x3) * store(&(vacc.s4),signed char,x4) * store(&(vacc.s5),signed char,x5) * store(&(vacc.s6),signed char,x6) * store(&(vacc.s7),signed char,x7) * undef_data_at(output+0,signed char) * undef_data_at(output+1,signed char) * undef_data_at(output+2,signed char) * undef_data_at(output+3,signed char)
 Ensure store(output+0,signed char,x0) * store(output+1,signed char,x1) * store(output+2,signed char,x2) * store(output+3,signed char,x3) */;
uint16x4_t vreinterpret_u16_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),signed char,x0) * store(&(a.s1),signed char,x1) * store(&(a.s2),signed char,x2) * store(&(a.s3),signed char,x3) * store(&(a.s4),signed char,x4) * store(&(a.s5),signed char,x5) * store(&(a.s6),signed char,x6) * store(&(a.s7),signed char,x7)
 Ensure -128 <= x0 && x0 <= 127 && -128 <= x1 && x1 <= 127 && -128 <= x2 && x2 <= 127 && -128 <= x3 && x3 <= 127 && -128 <= x4 && x4 <= 127 && -128 <= x5 && x5 <= 127 && -128 <= x6 && x6 <= 127 && -128 <= x7 && x7 <= 127 && store(&(__return.s0),unsigned char,unsigned_last_nbits(x0,8)) * store(&(__return.s1),unsigned char,unsigned_last_nbits(x1,8)) * store(&(__return.s2),unsigned char,unsigned_last_nbits(x2,8)) * store(&(__return.s3),unsigned char,unsigned_last_nbits(x3,8)) * store(&(__return.s4),unsigned char,unsigned_last_nbits(x4,8)) * store(&(__return.s5),unsigned char,unsigned_last_nbits(x5,8)) * store(&(__return.s6),unsigned char,unsigned_last_nbits(x6,8)) * store(&(__return.s7),unsigned char,unsigned_last_nbits(x7,8)) */;
void qcp_s8_store_u16_0(unsigned char*output,const uint16x4_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) */;
void original_tail_store16(int8_t*output,int8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),signed char,x0) * store(&(vacc.s1),signed char,x1) * store(&(vacc.s2),signed char,x2) * store(&(vacc.s3),signed char,x3) * store(&(vacc.s4),signed char,x4) * store(&(vacc.s5),signed char,x5) * store(&(vacc.s6),signed char,x6) * store(&(vacc.s7),signed char,x7) * undef_data_at(output+0,signed char) * undef_data_at(output+1,signed char)
 Ensure store(output+0,signed char,x0) * store(output+1,signed char,x1) */;
#define vld1_s8(p) qcp_s8_load8((p))
#define vld1q_s8(p) qcp_s8_load16((p))
#define vst1_s8(p,a) qcp_s8_store8((p),&(a))
#define vst1q_s8(p,a) qcp_s8_store16((p),&(a))
#define vst1_lane_s8(p,a,lane) qcp_s8_store_lane##lane((p),&(a))
#define vext_s8(a,b,lane) qcp_s8_ext##lane(&(a),&(b))
#endif
