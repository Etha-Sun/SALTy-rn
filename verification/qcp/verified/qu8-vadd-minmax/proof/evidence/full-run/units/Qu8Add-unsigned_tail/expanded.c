/* Actual byte-view and LE stores adapted from worker-u8-tail-memory 9dd92b6b. */
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qu8Add.Model */
/*@ Extern Coq (qu_s8:Z -> Z) (qu_s16:Z -> Z) (qu_s32:Z -> Z)
 (qu_pow2:Z -> Z) (qu_floor:Z -> Z -> Z) (qu_sat16:Z -> Z) (qu_sat8:Z -> Z)
 (qu_neon_mul:Z -> Z -> Z) (qu_rvv_mul:Z -> Z -> Z)
 (qu_neon_mla:Z -> Z -> Z -> Z) (qu_rvv_macc:Z -> Z -> Z -> Z)
 (qu_neon_shift:Z -> Z -> Z) (qu_rvv_rnu:Z -> Z -> Z) (qu_rvv_sll:Z -> Z -> Z)
 (qu_neon_add16:Z -> Z -> Z) (qu_rvv_add16:Z -> Z -> Z) */
int8_t qcp_qu_s8(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qu_s8(x) && -128<=__return && __return<=127 && emp */;
int16_t qcp_qu_s16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qu_s16(x) && -32768<=__return && __return<=32767 && emp */;
int32_t qcp_qu_s32(int64_t x)
/*@ Require -9223372036854775807-1<=x && x<=9223372036854775807 && emp Ensure __return==qu_s32(x) && -2147483648<=__return && __return<=2147483647 && emp */;
int64_t qcp_qu_pow2(int32_t d)
/*@ Require 0<=d && d<=31 && emp Ensure __return==qu_pow2(d) && 1<=__return && __return<=2147483648 && emp */;
int64_t qcp_qu_floor(int64_t x,int64_t p)
/*@ Require -4294967296<=x && x<=4294967296 && 1<=p && p<=2147483648 && emp Ensure __return==qu_floor(x,p) && emp */;
int16_t qcp_qu_sat16(int64_t x)
/*@ Require -9223372036854775807-1<=x && x<=9223372036854775807 && emp Ensure __return==qu_sat16(x) && -32768<=__return && __return<=32767 && emp */;
int8_t qcp_qu_sat8(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qu_sat8(x) && -128<=__return && __return<=127 && emp */;
int32_t qcp_qu_neon_mul(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qu_neon_mul(a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_rvv_mul(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qu_rvv_mul(a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_neon_mla(int32_t a,int32_t b,int32_t c)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && -2147483648<=c && c<=2147483647 && emp Ensure __return==qu_neon_mla(a,b,c) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_rvv_macc(int32_t a,int32_t b,int32_t c)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && -2147483648<=c && c<=2147483647 && emp Ensure __return==qu_rvv_macc(a,b,c) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_neon_shift(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qu_neon_shift(a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_rvv_rnu(int32_t a,int32_t d)
/*@ Require -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp Ensure __return==qu_rvv_rnu(a,d) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qu_rvv_sll(int32_t a,int32_t d)
/*@ Require -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp Ensure __return==qu_rvv_sll(a,d) && -2147483648<=__return && __return<=2147483647 && emp */;
int16_t qcp_qu_neon_add16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qu_neon_add16(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qu_rvv_add16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qu_rvv_add16(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qu_sub8(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp Ensure __return==qu_s16(a-b) && -32768<=__return && __return<=32767 && emp */;
struct qu_scalar_params {uint8_t a_zero_point; uint8_t b_zero_point; int32_t bias; int32_t a_multiplier; int32_t b_multiplier; int32_t shift; int16_t output_zero_point; uint8_t output_min; uint8_t output_max;};
struct xnn_qu8_add_minmax_params {struct qu_scalar_params scalar;};
typedef struct uint8x8_t {
 uint8_t s0;
 uint8_t s1;
 uint8_t s2;
 uint8_t s3;
 uint8_t s4;
 uint8_t s5;
 uint8_t s6;
 uint8_t s7;
} uint8x8_t;
typedef struct uint8x16_t {
 uint8_t s0;
 uint8_t s1;
 uint8_t s2;
 uint8_t s3;
 uint8_t s4;
 uint8_t s5;
 uint8_t s6;
 uint8_t s7;
 uint8_t s8;
 uint8_t s9;
 uint8_t s10;
 uint8_t s11;
 uint8_t s12;
 uint8_t s13;
 uint8_t s14;
 uint8_t s15;
} uint8x16_t;
typedef struct uint16x8_t {
 uint16_t s0;
 uint16_t s1;
 uint16_t s2;
 uint16_t s3;
 uint16_t s4;
 uint16_t s5;
 uint16_t s6;
 uint16_t s7;
} uint16x8_t;
typedef struct int16x4_t {
 int16_t s0;
 int16_t s1;
 int16_t s2;
 int16_t s3;
} int16x4_t;
typedef struct int16x8_t {
 int16_t s0;
 int16_t s1;
 int16_t s2;
 int16_t s3;
 int16_t s4;
 int16_t s5;
 int16_t s6;
 int16_t s7;
} int16x8_t;
typedef struct int32x4_t {
 int32_t s0;
 int32_t s1;
 int32_t s2;
 int32_t s3;
} int32x4_t;
typedef struct vuint8m2_t {
 uint8_t s0;
 uint8_t s1;
 uint8_t s2;
 uint8_t s3;
 uint8_t s4;
 uint8_t s5;
 uint8_t s6;
 uint8_t s7;
 uint8_t s8;
 uint8_t s9;
 uint8_t s10;
 uint8_t s11;
 uint8_t s12;
 uint8_t s13;
 uint8_t s14;
 uint8_t s15;
 uint8_t s16;
 uint8_t s17;
 uint8_t s18;
 uint8_t s19;
 uint8_t s20;
 uint8_t s21;
 uint8_t s22;
 uint8_t s23;
 uint8_t s24;
 uint8_t s25;
 uint8_t s26;
 uint8_t s27;
 uint8_t s28;
 uint8_t s29;
 uint8_t s30;
 uint8_t s31;
} vuint8m2_t;
typedef struct vuint16m4_t {
 uint16_t s0;
 uint16_t s1;
 uint16_t s2;
 uint16_t s3;
 uint16_t s4;
 uint16_t s5;
 uint16_t s6;
 uint16_t s7;
 uint16_t s8;
 uint16_t s9;
 uint16_t s10;
 uint16_t s11;
 uint16_t s12;
 uint16_t s13;
 uint16_t s14;
 uint16_t s15;
 uint16_t s16;
 uint16_t s17;
 uint16_t s18;
 uint16_t s19;
 uint16_t s20;
 uint16_t s21;
 uint16_t s22;
 uint16_t s23;
 uint16_t s24;
 uint16_t s25;
 uint16_t s26;
 uint16_t s27;
 uint16_t s28;
 uint16_t s29;
 uint16_t s30;
 uint16_t s31;
} vuint16m4_t;
typedef struct vint16m4_t {
 int16_t s0;
 int16_t s1;
 int16_t s2;
 int16_t s3;
 int16_t s4;
 int16_t s5;
 int16_t s6;
 int16_t s7;
 int16_t s8;
 int16_t s9;
 int16_t s10;
 int16_t s11;
 int16_t s12;
 int16_t s13;
 int16_t s14;
 int16_t s15;
 int16_t s16;
 int16_t s17;
 int16_t s18;
 int16_t s19;
 int16_t s20;
 int16_t s21;
 int16_t s22;
 int16_t s23;
 int16_t s24;
 int16_t s25;
 int16_t s26;
 int16_t s27;
 int16_t s28;
 int16_t s29;
 int16_t s30;
 int16_t s31;
} vint16m4_t;
typedef struct vint32m8_t {
 int32_t s0;
 int32_t s1;
 int32_t s2;
 int32_t s3;
 int32_t s4;
 int32_t s5;
 int32_t s6;
 int32_t s7;
 int32_t s8;
 int32_t s9;
 int32_t s10;
 int32_t s11;
 int32_t s12;
 int32_t s13;
 int32_t s14;
 int32_t s15;
 int32_t s16;
 int32_t s17;
 int32_t s18;
 int32_t s19;
 int32_t s20;
 int32_t s21;
 int32_t s22;
 int32_t s23;
 int32_t s24;
 int32_t s25;
 int32_t s26;
 int32_t s27;
 int32_t s28;
 int32_t s29;
 int32_t s30;
 int32_t s31;
} vint32m8_t;
typedef uint8x8_t uint32x2_t;
typedef uint8x8_t uint16x4_t;
/*@ Import Coq Require Import Qu8Add.Types */
/*@ Extern Coq (UndefStructPreduint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint8x16_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint16x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint32x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvuint8m2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvuint16m4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint16m4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint32m8_t:Z -> Assertion) */
/*@ Import Coq Require Import Qu8Add.ByteBridge */
/*@ Extern Coq (u8_le_byte0:Z -> Z) (u8_le_byte1:Z -> Z)
               (u8_le_byte2:Z -> Z) (u8_le_byte3:Z -> Z) */
/*@ include strategies "unsigned_tail.strategies" */
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
{
 out[0]=(unsigned char)(word);
 out[1]=(unsigned char)(word/256U);
 out[2]=(unsigned char)(word/65536U);
 out[3]=(unsigned char)(word/16777216U);
}
void qcp_u8_store_word16(unsigned char *out,unsigned short word)
/*@ Require 0 <= word && word <= 65535 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char)
 Ensure data_at(out+0,unsigned char,u8_le_byte0(word)) *
data_at(out+1,unsigned char,u8_le_byte1(word)) */
{
 out[0]=(unsigned char)(word);
 out[1]=(unsigned char)(word/256U);
}
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
 Ensure 0 <= x0 && x0 <= 255 && 0 <= x1 && x1 <= 255 && 0 <= x2 && x2 <= 255 && 0 <= x3 && x3 <= 255 && 0 <= x4 && x4 <= 255 && 0 <= x5 && x5 <= 255 && 0 <= x6 && x6 <= 255 && 0 <= x7 && x7 <= 255 && store(&(__return.s0),unsigned char,unsigned_last_nbits(x0,8)) * store(&(__return.s1),unsigned char,unsigned_last_nbits(x1,8)) * store(&(__return.s2),unsigned char,unsigned_last_nbits(x2,8)) * store(&(__return.s3),unsigned char,unsigned_last_nbits(x3,8)) * store(&(__return.s4),unsigned char,unsigned_last_nbits(x4,8)) * store(&(__return.s5),unsigned char,unsigned_last_nbits(x5,8)) * store(&(__return.s6),unsigned char,unsigned_last_nbits(x6,8)) * store(&(__return.s7),unsigned char,unsigned_last_nbits(x7,8)) */
{
 /*@ Assert 0 <= x0 && x0 <= 255 && 0 <= x1 && x1 <= 255 && 0 <= x2 && x2 <= 255 && 0 <= x3 && x3 <= 255 && 0 <= x4 && x4 <= 255 && 0 <= x5 && x5 <= 255 && 0 <= x6 && x6 <= 255 && 0 <= x7 && x7 <= 255 && store(&a,void*,&a) * store(&(a.s0),unsigned char,x0) * store(&(a.s1),unsigned char,x1) * store(&(a.s2),unsigned char,x2) * store(&(a.s3),unsigned char,x3) * store(&(a.s4),unsigned char,x4) * store(&(a.s5),unsigned char,x5) * store(&(a.s6),unsigned char,x6) * store(&(a.s7),unsigned char,x7) */
 uint8x8_t r;
 r.s0=(unsigned char)a.s0;
 r.s1=(unsigned char)a.s1;
 r.s2=(unsigned char)a.s2;
 r.s3=(unsigned char)a.s3;
 r.s4=(unsigned char)a.s4;
 r.s5=(unsigned char)a.s5;
 r.s6=(unsigned char)a.s6;
 r.s7=(unsigned char)a.s7;
 return r;
}
void qcp_u8_store_u32_0(unsigned char*output,const uint32x2_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char) * undef_data_at(output+2,unsigned char) * undef_data_at(output+3,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) * store(output+2,unsigned char,x2) * store(output+3,unsigned char,x3) */
{
 qcp_u8_store_word32(output,qcp_u8_pack32(a->s0, a->s1, a->s2, a->s3));
}
void original_tail_store32(uint8_t*output,uint8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),unsigned char,x0) * store(&(vacc.s1),unsigned char,x1) * store(&(vacc.s2),unsigned char,x2) * store(&(vacc.s3),unsigned char,x3) * store(&(vacc.s4),unsigned char,x4) * store(&(vacc.s5),unsigned char,x5) * store(&(vacc.s6),unsigned char,x6) * store(&(vacc.s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char) * undef_data_at(output+2,unsigned char) * undef_data_at(output+3,unsigned char)
 Ensure store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) * store(output+2,unsigned char,x2) * store(output+3,unsigned char,x3) */
{
 { uint32x2_t qcp_store_tmp; qcp_store_tmp=(vreinterpret_u32_u8(vacc) /*@ where a=&vacc */); qcp_u8_store_u32_0(((void*) output),&qcp_store_tmp); };
}
uint16x4_t vreinterpret_u16_u8(uint8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),unsigned char,x0) * store(&(a.s1),unsigned char,x1) * store(&(a.s2),unsigned char,x2) * store(&(a.s3),unsigned char,x3) * store(&(a.s4),unsigned char,x4) * store(&(a.s5),unsigned char,x5) * store(&(a.s6),unsigned char,x6) * store(&(a.s7),unsigned char,x7)
 Ensure 0 <= x0 && x0 <= 255 && 0 <= x1 && x1 <= 255 && 0 <= x2 && x2 <= 255 && 0 <= x3 && x3 <= 255 && 0 <= x4 && x4 <= 255 && 0 <= x5 && x5 <= 255 && 0 <= x6 && x6 <= 255 && 0 <= x7 && x7 <= 255 && store(&(__return.s0),unsigned char,unsigned_last_nbits(x0,8)) * store(&(__return.s1),unsigned char,unsigned_last_nbits(x1,8)) * store(&(__return.s2),unsigned char,unsigned_last_nbits(x2,8)) * store(&(__return.s3),unsigned char,unsigned_last_nbits(x3,8)) * store(&(__return.s4),unsigned char,unsigned_last_nbits(x4,8)) * store(&(__return.s5),unsigned char,unsigned_last_nbits(x5,8)) * store(&(__return.s6),unsigned char,unsigned_last_nbits(x6,8)) * store(&(__return.s7),unsigned char,unsigned_last_nbits(x7,8)) */
{
 /*@ Assert 0 <= x0 && x0 <= 255 && 0 <= x1 && x1 <= 255 && 0 <= x2 && x2 <= 255 && 0 <= x3 && x3 <= 255 && 0 <= x4 && x4 <= 255 && 0 <= x5 && x5 <= 255 && 0 <= x6 && x6 <= 255 && 0 <= x7 && x7 <= 255 && store(&a,void*,&a) * store(&(a.s0),unsigned char,x0) * store(&(a.s1),unsigned char,x1) * store(&(a.s2),unsigned char,x2) * store(&(a.s3),unsigned char,x3) * store(&(a.s4),unsigned char,x4) * store(&(a.s5),unsigned char,x5) * store(&(a.s6),unsigned char,x6) * store(&(a.s7),unsigned char,x7) */
 uint8x8_t r;
 r.s0=(unsigned char)a.s0;
 r.s1=(unsigned char)a.s1;
 r.s2=(unsigned char)a.s2;
 r.s3=(unsigned char)a.s3;
 r.s4=(unsigned char)a.s4;
 r.s5=(unsigned char)a.s5;
 r.s6=(unsigned char)a.s6;
 r.s7=(unsigned char)a.s7;
 return r;
}
void qcp_u8_store_u16_0(unsigned char*output,const uint16x4_t*a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) */
{
 qcp_u8_store_word16(output,qcp_u8_pack16(a->s0, a->s1));
}
void original_tail_store16(uint8_t*output,uint8x8_t vacc)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(vacc.s0),unsigned char,x0) * store(&(vacc.s1),unsigned char,x1) * store(&(vacc.s2),unsigned char,x2) * store(&(vacc.s3),unsigned char,x3) * store(&(vacc.s4),unsigned char,x4) * store(&(vacc.s5),unsigned char,x5) * store(&(vacc.s6),unsigned char,x6) * store(&(vacc.s7),unsigned char,x7) * undef_data_at(output+0,unsigned char) * undef_data_at(output+1,unsigned char)
 Ensure store(output+0,unsigned char,x0) * store(output+1,unsigned char,x1) */
{
 { uint16x4_t qcp_store_tmp; qcp_store_tmp=(vreinterpret_u16_u8(vacc) /*@ where a=&vacc */); qcp_u8_store_u16_0(((void*) output),&qcp_store_tmp); };
}
