#ifndef QU_NEON_API_H
#define QU_NEON_API_H
#include "neon_arithmetic.h"
#include "neon_store.h"
#include "unsigned_tail.h"
#include "neon_ext.h"
uint8_t qcp_u8_read_lane(const uint8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure __return==u8_read_lane(i,vl,idx,L) && UCharArray::full(base,count,L) */
;
uint8x8_t qcp_u8_load8(const uint8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+8<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure UCharArray::full(base,count,L) * store(&(__return.s0),unsigned char,L[idx+0]) * store(&(__return.s1),unsigned char,L[idx+1]) * store(&(__return.s2),unsigned char,L[idx+2]) * store(&(__return.s3),unsigned char,L[idx+3]) * store(&(__return.s4),unsigned char,L[idx+4]) * store(&(__return.s5),unsigned char,L[idx+5]) * store(&(__return.s6),unsigned char,L[idx+6]) * store(&(__return.s7),unsigned char,L[idx+7]) */
;
uint8x16_t qcp_u8_load16(const uint8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+16<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure UCharArray::full(base,count,L) * store(&(__return.s0),unsigned char,L[idx+0]) * store(&(__return.s1),unsigned char,L[idx+1]) * store(&(__return.s2),unsigned char,L[idx+2]) * store(&(__return.s3),unsigned char,L[idx+3]) * store(&(__return.s4),unsigned char,L[idx+4]) * store(&(__return.s5),unsigned char,L[idx+5]) * store(&(__return.s6),unsigned char,L[idx+6]) * store(&(__return.s7),unsigned char,L[idx+7]) * store(&(__return.s8),unsigned char,L[idx+8]) * store(&(__return.s9),unsigned char,L[idx+9]) * store(&(__return.s10),unsigned char,L[idx+10]) * store(&(__return.s11),unsigned char,L[idx+11]) * store(&(__return.s12),unsigned char,L[idx+12]) * store(&(__return.s13),unsigned char,L[idx+13]) * store(&(__return.s14),unsigned char,L[idx+14]) * store(&(__return.s15),unsigned char,L[idx+15]) */
;
void qcp_u8_store8(uint8_t *p,const uint8x8_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require UCharArray::undef_full(p,8) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7)
 Ensure UCharArray::full(p,8,u8_pack8(x0,x1,x2,x3,x4,x5,x6,x7)) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) */
;
void qcp_u8_store16(uint8_t *p,const uint8x16_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z)
 Require UCharArray::undef_full(p,16) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15)
 Ensure UCharArray::full(p,16,u8_pack16(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15)) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) */
;
void qcp_u8_store_lane0(uint8_t *p,const uint8x8_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require undef_data_at(p,unsigned char) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7)
 Ensure store(p,unsigned char,x0) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) */
;
void qcp_u8_store_word32(unsigned char *out,unsigned int word)
/*@ Require 0 <= word && word <= 4294967295 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char) *
    undef_data_at(out+2,unsigned char) *
    undef_data_at(out+3,unsigned char)
 Ensure data_at(out+0,unsigned char,u8_le_byte0(word)) *
data_at(out+1,unsigned char,u8_le_byte1(word)) *
data_at(out+2,unsigned char,u8_le_byte2(word)) *
data_at(out+3,unsigned char,u8_le_byte3(word)) */
;
void qcp_u8_store_word16(unsigned char *out,unsigned short word)
/*@ Require 0 <= word && word <= 65535 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char)
 Ensure data_at(out+0,unsigned char,u8_le_byte0(word)) *
data_at(out+1,unsigned char,u8_le_byte1(word)) */
;
unsigned short qcp_u8_pack16(unsigned char a,unsigned char b)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255
    Ensure __return == a + 256*b */
;
unsigned int qcp_u8_pack32(unsigned char a,unsigned char b,unsigned char c,unsigned char d)
/*@ Require 0 <= a && a <= 255 && 0 <= b && b <= 255 &&
            0 <= c && c <= 255 && 0 <= d && d <= 255
    Ensure __return == a + 256*b + 65536*c + 16777216*d */
;
uint32x2_t vreinterpret_u32_u8(uint8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),unsigned char,x0) * store(&(a.s1),unsigned char,x1) * store(&(a.s2),unsigned char,x2) * store(&(a.s3),unsigned char,x3) * store(&(a.s4),unsigned char,x4) * store(&(a.s5),unsigned char,x5) * store(&(a.s6),unsigned char,x6) * store(&(a.s7),unsigned char,x7)
 Ensure 0 <= x0 && x0 <= 255 && 0 <= x1 && x1 <= 255 && 0 <= x2 && x2 <= 255 && 0 <= x3 && x3 <= 255 && 0 <= x4 && x4 <= 255 && 0 <= x5 && x5 <= 255 && 0 <= x6 && x6 <= 255 && 0 <= x7 && x7 <= 255 && store(&(__return.s0),unsigned char,unsigned_last_nbits(x0,8)) * store(&(__return.s1),unsigned char,unsigned_last_nbits(x1,8)) * store(&(__return.s2),unsigned char,unsigned_last_nbits(x2,8)) * store(&(__return.s3),unsigned char,unsigned_last_nbits(x3,8)) * store(&(__return.s4),unsigned char,unsigned_last_nbits(x4,8)) * store(&(__return.s5),unsigned char,unsigned_last_nbits(x5,8)) * store(&(__return.s6),unsigned char,unsigned_last_nbits(x6,8)) * store(&(__return.s7),unsigned char,unsigned_last_nbits(x7,8)) */
;
void qcp_u8_store_u32_0(unsigned char*output,const uint32x2_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char) * undef_data_at(output+2,unsigned char) * undef_data_at(output+3,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) * store(output+2,unsigned char,x2) * store(output+3,unsigned char,x3) */
;
void original_tail_store32(uint8_t*output,uint8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),unsigned char,x0) * store(&(vacc.s1),unsigned char,x1) * store(&(vacc.s2),unsigned char,x2) * store(&(vacc.s3),unsigned char,x3) * store(&(vacc.s4),unsigned char,x4) * store(&(vacc.s5),unsigned char,x5) * store(&(vacc.s6),unsigned char,x6) * store(&(vacc.s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char) * undef_data_at(output+2,unsigned char) * undef_data_at(output+3,unsigned char)
 Ensure store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) * store(output+2,unsigned char,x2) * store(output+3,unsigned char,x3) */
;
uint16x4_t vreinterpret_u16_u8(uint8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),unsigned char,x0) * store(&(a.s1),unsigned char,x1) * store(&(a.s2),unsigned char,x2) * store(&(a.s3),unsigned char,x3) * store(&(a.s4),unsigned char,x4) * store(&(a.s5),unsigned char,x5) * store(&(a.s6),unsigned char,x6) * store(&(a.s7),unsigned char,x7)
 Ensure 0 <= x0 && x0 <= 255 && 0 <= x1 && x1 <= 255 && 0 <= x2 && x2 <= 255 && 0 <= x3 && x3 <= 255 && 0 <= x4 && x4 <= 255 && 0 <= x5 && x5 <= 255 && 0 <= x6 && x6 <= 255 && 0 <= x7 && x7 <= 255 && store(&(__return.s0),unsigned char,unsigned_last_nbits(x0,8)) * store(&(__return.s1),unsigned char,unsigned_last_nbits(x1,8)) * store(&(__return.s2),unsigned char,unsigned_last_nbits(x2,8)) * store(&(__return.s3),unsigned char,unsigned_last_nbits(x3,8)) * store(&(__return.s4),unsigned char,unsigned_last_nbits(x4,8)) * store(&(__return.s5),unsigned char,unsigned_last_nbits(x5,8)) * store(&(__return.s6),unsigned char,unsigned_last_nbits(x6,8)) * store(&(__return.s7),unsigned char,unsigned_last_nbits(x7,8)) */
;
void qcp_u8_store_u16_0(unsigned char*output,const uint16x4_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) */
;
void original_tail_store16(uint8_t*output,uint8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),unsigned char,x0) * store(&(vacc.s1),unsigned char,x1) * store(&(vacc.s2),unsigned char,x2) * store(&(vacc.s3),unsigned char,x3) * store(&(vacc.s4),unsigned char,x4) * store(&(vacc.s5),unsigned char,x5) * store(&(vacc.s6),unsigned char,x6) * store(&(vacc.s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char)
 Ensure store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) */
;

#define vld1_u8(p) qcp_u8_load8((p))
#define vst1q_u8(p,a) qcp_u8_store16((p),&(a))
#define vst1_u8(p,a) qcp_u8_store8((p),&(a))
#define vst1_lane_u8(p,a,lane) qcp_u8_store_lane##lane((p),&(a))
#endif
