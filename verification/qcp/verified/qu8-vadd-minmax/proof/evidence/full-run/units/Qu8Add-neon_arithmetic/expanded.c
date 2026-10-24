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
/*@ Import Coq Require Import Qu8Add.UnsignedScalarModel */
/*@ Extern Coq (qu_u16:Z -> Z) (qu_udiff:Z -> Z -> Z) (qu_usat8:Z -> Z)
 (qu_umin:Z -> Z -> Z) (qu_umax:Z -> Z -> Z) (qu_max16zero:Z -> Z) */
uint16_t qcp_qu_u16(int32_t x)
/*@ Require (-2147483647-1)<=x && x<=2147483647 && emp Ensure __return==qu_u16(x) && 0<=__return && __return<=65535 && emp */;
uint16_t qcp_qu_subu8(uint8_t a,uint8_t b)
/*@ Require 0<=a && a<=255 && 0<=b && b<=255 && emp Ensure __return==qu_udiff(a,b) && 0<=__return && __return<=65535 && emp */;
int16_t qcp_qu_from_u16(uint16_t x)
/*@ Require 0<=x && x<=65535 && emp Ensure __return==qu_s16(x) && -32768<=__return && __return<=32767 && emp */;
uint8_t qcp_qu_usat8(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qu_usat8(x) && 0<=__return && __return<=255 && emp */;
int16_t qcp_qu_max16_zero(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qu_max16zero(x) && 0<=__return && __return<=32767 && emp */;
uint8_t qcp_qu_umin8(uint8_t a,uint8_t b)
/*@ Require 0<=a && a<=255 && 0<=b && b<=255 && emp Ensure __return==qu_umin(a,b) && 0<=__return && __return<=255 && emp */;
uint8_t qcp_qu_umax8(uint8_t a,uint8_t b)
/*@ Require 0<=a && a<=255 && 0<=b && b<=255 && emp Ensure __return==qu_umax(a,b) && 0<=__return && __return<=255 && emp */;
uint8x8_t vdup_n_u8(uint8_t x)
/*@ Require (0)<=x && x<=255
 Ensure store(&(__return.s0),unsigned char,x) * store(&(__return.s1),unsigned char,x) * store(&(__return.s2),unsigned char,x) * store(&(__return.s3),unsigned char,x) * store(&(__return.s4),unsigned char,x) * store(&(__return.s5),unsigned char,x) * store(&(__return.s6),unsigned char,x) * store(&(__return.s7),unsigned char,x) */;
int16x8_t vdupq_n_s16(int16_t x)
/*@ Require (-32768)<=x && x<=32767
 Ensure store(&(__return.s0),short,x) * store(&(__return.s1),short,x) * store(&(__return.s2),short,x) * store(&(__return.s3),short,x) * store(&(__return.s4),short,x) * store(&(__return.s5),short,x) * store(&(__return.s6),short,x) * store(&(__return.s7),short,x) */;
int32x4_t vdupq_n_s32(int32_t x)
/*@ Require (-2147483648)<=x && x<=2147483647
 Ensure store(&(__return.s0),int,x) * store(&(__return.s1),int,x) * store(&(__return.s2),int,x) * store(&(__return.s3),int,x) */;
uint16x8_t vsubl_u8(uint8x8_t a,uint8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require (0)<=a0 && a0<=255 && store(&(a.s0),unsigned char,a0) && (0)<=a1 && a1<=255 && store(&(a.s1),unsigned char,a1) && (0)<=a2 && a2<=255 && store(&(a.s2),unsigned char,a2) && (0)<=a3 && a3<=255 && store(&(a.s3),unsigned char,a3) && (0)<=a4 && a4<=255 && store(&(a.s4),unsigned char,a4) && (0)<=a5 && a5<=255 && store(&(a.s5),unsigned char,a5) && (0)<=a6 && a6<=255 && store(&(a.s6),unsigned char,a6) && (0)<=a7 && a7<=255 && store(&(a.s7),unsigned char,a7) && (0)<=b0 && b0<=255 && store(&(b.s0),unsigned char,b0) && (0)<=b1 && b1<=255 && store(&(b.s1),unsigned char,b1) && (0)<=b2 && b2<=255 && store(&(b.s2),unsigned char,b2) && (0)<=b3 && b3<=255 && store(&(b.s3),unsigned char,b3) && (0)<=b4 && b4<=255 && store(&(b.s4),unsigned char,b4) && (0)<=b5 && b5<=255 && store(&(b.s5),unsigned char,b5) && (0)<=b6 && b6<=255 && store(&(b.s6),unsigned char,b6) && (0)<=b7 && b7<=255 && store(&(b.s7),unsigned char,b7)
 Ensure store(&(__return.s0),unsigned short,qu_udiff(a0,b0)) * store(&(__return.s1),unsigned short,qu_udiff(a1,b1)) * store(&(__return.s2),unsigned short,qu_udiff(a2,b2)) * store(&(__return.s3),unsigned short,qu_udiff(a3,b3)) * store(&(__return.s4),unsigned short,qu_udiff(a4,b4)) * store(&(__return.s5),unsigned short,qu_udiff(a5,b5)) * store(&(__return.s6),unsigned short,qu_udiff(a6,b6)) * store(&(__return.s7),unsigned short,qu_udiff(a7,b7)) */;
int16x8_t vreinterpretq_s16_u16(uint16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require (0)<=a0 && a0<=65535 && store(&(a.s0),unsigned short,a0) && (0)<=a1 && a1<=65535 && store(&(a.s1),unsigned short,a1) && (0)<=a2 && a2<=65535 && store(&(a.s2),unsigned short,a2) && (0)<=a3 && a3<=65535 && store(&(a.s3),unsigned short,a3) && (0)<=a4 && a4<=65535 && store(&(a.s4),unsigned short,a4) && (0)<=a5 && a5<=65535 && store(&(a.s5),unsigned short,a5) && (0)<=a6 && a6<=65535 && store(&(a.s6),unsigned short,a6) && (0)<=a7 && a7<=65535 && store(&(a.s7),unsigned short,a7)
 Ensure store(&(__return.s0),short,qu_s16(a0)) * store(&(__return.s1),short,qu_s16(a1)) * store(&(__return.s2),short,qu_s16(a2)) * store(&(__return.s3),short,qu_s16(a3)) * store(&(__return.s4),short,qu_s16(a4)) * store(&(__return.s5),short,qu_s16(a5)) * store(&(__return.s6),short,qu_s16(a6)) * store(&(__return.s7),short,qu_s16(a7)) */;
int16x4_t vget_low_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3) && (-32768)<=a4 && a4<=32767 && store(&(a.s4),short,a4) && (-32768)<=a5 && a5<=32767 && store(&(a.s5),short,a5) && (-32768)<=a6 && a6<=32767 && store(&(a.s6),short,a6) && (-32768)<=a7 && a7<=32767 && store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),short,a0) * store(&(__return.s1),short,a1) * store(&(__return.s2),short,a2) * store(&(__return.s3),short,a3) */;
int16x4_t vget_high_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3) && (-32768)<=a4 && a4<=32767 && store(&(a.s4),short,a4) && (-32768)<=a5 && a5<=32767 && store(&(a.s5),short,a5) && (-32768)<=a6 && a6<=32767 && store(&(a.s6),short,a6) && (-32768)<=a7 && a7<=32767 && store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),short,a4) * store(&(__return.s1),short,a5) * store(&(__return.s2),short,a6) * store(&(__return.s3),short,a7) */;
int32x4_t vmovl_s16(int16x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3)
 Ensure store(&(__return.s0),int,a0) * store(&(__return.s1),int,a1) * store(&(__return.s2),int,a2) * store(&(__return.s3),int,a3) */;
int32x4_t vmulq_s32(int32x4_t a,int32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require (-2147483648)<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && (-2147483648)<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && (-2147483648)<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && (-2147483648)<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && (-2147483648)<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && (-2147483648)<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && (-2147483648)<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && (-2147483648)<=b3 && b3<=2147483647 && store(&(b.s3),int,b3)
 Ensure store(&(__return.s0),int,qu_neon_mul(a0,b0)) * store(&(__return.s1),int,qu_neon_mul(a1,b1)) * store(&(__return.s2),int,qu_neon_mul(a2,b2)) * store(&(__return.s3),int,qu_neon_mul(a3,b3)) */;
int32x4_t vrshlq_s32(int32x4_t a,int32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require (-2147483648)<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && (-2147483648)<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && (-2147483648)<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && (-2147483648)<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && (-2147483648)<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && (-2147483648)<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && (-2147483648)<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && (-2147483648)<=b3 && b3<=2147483647 && store(&(b.s3),int,b3)
 Ensure store(&(__return.s0),int,qu_neon_shift(a0,b0)) * store(&(__return.s1),int,qu_neon_shift(a1,b1)) * store(&(__return.s2),int,qu_neon_shift(a2,b2)) * store(&(__return.s3),int,qu_neon_shift(a3,b3)) */;
int32x4_t vmlaq_s32(int32x4_t a,int32x4_t b,int32x4_t c)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (c0:Z) (c1:Z) (c2:Z) (c3:Z)
 Require (-2147483648)<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && (-2147483648)<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && (-2147483648)<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && (-2147483648)<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && (-2147483648)<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && (-2147483648)<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && (-2147483648)<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && (-2147483648)<=b3 && b3<=2147483647 && store(&(b.s3),int,b3) && (-2147483648)<=c0 && c0<=2147483647 && store(&(c.s0),int,c0) && (-2147483648)<=c1 && c1<=2147483647 && store(&(c.s1),int,c1) && (-2147483648)<=c2 && c2<=2147483647 && store(&(c.s2),int,c2) && (-2147483648)<=c3 && c3<=2147483647 && store(&(c.s3),int,c3)
 Ensure store(&(__return.s0),int,qu_neon_mla(a0,b0,c0)) * store(&(__return.s1),int,qu_neon_mla(a1,b1,c1)) * store(&(__return.s2),int,qu_neon_mla(a2,b2,c2)) * store(&(__return.s3),int,qu_neon_mla(a3,b3,c3)) */;
int16x4_t vqmovn_s32(int32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require (-2147483648)<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && (-2147483648)<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && (-2147483648)<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && (-2147483648)<=a3 && a3<=2147483647 && store(&(a.s3),int,a3)
 Ensure store(&(__return.s0),short,qu_sat16(a0)) * store(&(__return.s1),short,qu_sat16(a1)) * store(&(__return.s2),short,qu_sat16(a2)) * store(&(__return.s3),short,qu_sat16(a3)) */;
int16x8_t vcombine_s16(int16x4_t a,int16x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3) && (-32768)<=b0 && b0<=32767 && store(&(b.s0),short,b0) && (-32768)<=b1 && b1<=32767 && store(&(b.s1),short,b1) && (-32768)<=b2 && b2<=32767 && store(&(b.s2),short,b2) && (-32768)<=b3 && b3<=32767 && store(&(b.s3),short,b3)
 Ensure store(&(__return.s0),short,a0) * store(&(__return.s1),short,a1) * store(&(__return.s2),short,a2) * store(&(__return.s3),short,a3) * store(&(__return.s4),short,b0) * store(&(__return.s5),short,b1) * store(&(__return.s6),short,b2) * store(&(__return.s7),short,b3) */;
int16x8_t vqaddq_s16(int16x8_t a,int16x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3) && (-32768)<=a4 && a4<=32767 && store(&(a.s4),short,a4) && (-32768)<=a5 && a5<=32767 && store(&(a.s5),short,a5) && (-32768)<=a6 && a6<=32767 && store(&(a.s6),short,a6) && (-32768)<=a7 && a7<=32767 && store(&(a.s7),short,a7) && (-32768)<=b0 && b0<=32767 && store(&(b.s0),short,b0) && (-32768)<=b1 && b1<=32767 && store(&(b.s1),short,b1) && (-32768)<=b2 && b2<=32767 && store(&(b.s2),short,b2) && (-32768)<=b3 && b3<=32767 && store(&(b.s3),short,b3) && (-32768)<=b4 && b4<=32767 && store(&(b.s4),short,b4) && (-32768)<=b5 && b5<=32767 && store(&(b.s5),short,b5) && (-32768)<=b6 && b6<=32767 && store(&(b.s6),short,b6) && (-32768)<=b7 && b7<=32767 && store(&(b.s7),short,b7)
 Ensure store(&(__return.s0),short,qu_neon_add16(a0,b0)) * store(&(__return.s1),short,qu_neon_add16(a1,b1)) * store(&(__return.s2),short,qu_neon_add16(a2,b2)) * store(&(__return.s3),short,qu_neon_add16(a3,b3)) * store(&(__return.s4),short,qu_neon_add16(a4,b4)) * store(&(__return.s5),short,qu_neon_add16(a5,b5)) * store(&(__return.s6),short,qu_neon_add16(a6,b6)) * store(&(__return.s7),short,qu_neon_add16(a7,b7)) */;
uint8x8_t vqmovun_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3) && (-32768)<=a4 && a4<=32767 && store(&(a.s4),short,a4) && (-32768)<=a5 && a5<=32767 && store(&(a.s5),short,a5) && (-32768)<=a6 && a6<=32767 && store(&(a.s6),short,a6) && (-32768)<=a7 && a7<=32767 && store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),unsigned char,qu_usat8(a0)) * store(&(__return.s1),unsigned char,qu_usat8(a1)) * store(&(__return.s2),unsigned char,qu_usat8(a2)) * store(&(__return.s3),unsigned char,qu_usat8(a3)) * store(&(__return.s4),unsigned char,qu_usat8(a4)) * store(&(__return.s5),unsigned char,qu_usat8(a5)) * store(&(__return.s6),unsigned char,qu_usat8(a6)) * store(&(__return.s7),unsigned char,qu_usat8(a7)) */;
uint8x8_t vmin_u8(uint8x8_t a,uint8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require (0)<=a0 && a0<=255 && store(&(a.s0),unsigned char,a0) && (0)<=a1 && a1<=255 && store(&(a.s1),unsigned char,a1) && (0)<=a2 && a2<=255 && store(&(a.s2),unsigned char,a2) && (0)<=a3 && a3<=255 && store(&(a.s3),unsigned char,a3) && (0)<=a4 && a4<=255 && store(&(a.s4),unsigned char,a4) && (0)<=a5 && a5<=255 && store(&(a.s5),unsigned char,a5) && (0)<=a6 && a6<=255 && store(&(a.s6),unsigned char,a6) && (0)<=a7 && a7<=255 && store(&(a.s7),unsigned char,a7) && (0)<=b0 && b0<=255 && store(&(b.s0),unsigned char,b0) && (0)<=b1 && b1<=255 && store(&(b.s1),unsigned char,b1) && (0)<=b2 && b2<=255 && store(&(b.s2),unsigned char,b2) && (0)<=b3 && b3<=255 && store(&(b.s3),unsigned char,b3) && (0)<=b4 && b4<=255 && store(&(b.s4),unsigned char,b4) && (0)<=b5 && b5<=255 && store(&(b.s5),unsigned char,b5) && (0)<=b6 && b6<=255 && store(&(b.s6),unsigned char,b6) && (0)<=b7 && b7<=255 && store(&(b.s7),unsigned char,b7)
 Ensure store(&(__return.s0),unsigned char,qu_umin(a0,b0)) * store(&(__return.s1),unsigned char,qu_umin(a1,b1)) * store(&(__return.s2),unsigned char,qu_umin(a2,b2)) * store(&(__return.s3),unsigned char,qu_umin(a3,b3)) * store(&(__return.s4),unsigned char,qu_umin(a4,b4)) * store(&(__return.s5),unsigned char,qu_umin(a5,b5)) * store(&(__return.s6),unsigned char,qu_umin(a6,b6)) * store(&(__return.s7),unsigned char,qu_umin(a7,b7)) */;
uint8x8_t vmax_u8(uint8x8_t a,uint8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require (0)<=a0 && a0<=255 && store(&(a.s0),unsigned char,a0) && (0)<=a1 && a1<=255 && store(&(a.s1),unsigned char,a1) && (0)<=a2 && a2<=255 && store(&(a.s2),unsigned char,a2) && (0)<=a3 && a3<=255 && store(&(a.s3),unsigned char,a3) && (0)<=a4 && a4<=255 && store(&(a.s4),unsigned char,a4) && (0)<=a5 && a5<=255 && store(&(a.s5),unsigned char,a5) && (0)<=a6 && a6<=255 && store(&(a.s6),unsigned char,a6) && (0)<=a7 && a7<=255 && store(&(a.s7),unsigned char,a7) && (0)<=b0 && b0<=255 && store(&(b.s0),unsigned char,b0) && (0)<=b1 && b1<=255 && store(&(b.s1),unsigned char,b1) && (0)<=b2 && b2<=255 && store(&(b.s2),unsigned char,b2) && (0)<=b3 && b3<=255 && store(&(b.s3),unsigned char,b3) && (0)<=b4 && b4<=255 && store(&(b.s4),unsigned char,b4) && (0)<=b5 && b5<=255 && store(&(b.s5),unsigned char,b5) && (0)<=b6 && b6<=255 && store(&(b.s6),unsigned char,b6) && (0)<=b7 && b7<=255 && store(&(b.s7),unsigned char,b7)
 Ensure store(&(__return.s0),unsigned char,qu_umax(a0,b0)) * store(&(__return.s1),unsigned char,qu_umax(a1,b1)) * store(&(__return.s2),unsigned char,qu_umax(a2,b2)) * store(&(__return.s3),unsigned char,qu_umax(a3,b3)) * store(&(__return.s4),unsigned char,qu_umax(a4,b4)) * store(&(__return.s5),unsigned char,qu_umax(a5,b5)) * store(&(__return.s6),unsigned char,qu_umax(a6,b6)) * store(&(__return.s7),unsigned char,qu_umax(a7,b7)) */;
uint8x8_t vdup_n_u8(uint8_t x)
/*@ Require (0)<=x && x<=255
 Ensure store(&(__return.s0),unsigned char,x) * store(&(__return.s1),unsigned char,x) * store(&(__return.s2),unsigned char,x) * store(&(__return.s3),unsigned char,x) * store(&(__return.s4),unsigned char,x) * store(&(__return.s5),unsigned char,x) * store(&(__return.s6),unsigned char,x) * store(&(__return.s7),unsigned char,x) */
{
 uint8x8_t r;
 r.s0=x;
 r.s1=x;
 r.s2=x;
 r.s3=x;
 r.s4=x;
 r.s5=x;
 r.s6=x;
 r.s7=x;
 return r;
}
int16x8_t vdupq_n_s16(int16_t x)
/*@ Require (-32768)<=x && x<=32767
 Ensure store(&(__return.s0),short,x) * store(&(__return.s1),short,x) * store(&(__return.s2),short,x) * store(&(__return.s3),short,x) * store(&(__return.s4),short,x) * store(&(__return.s5),short,x) * store(&(__return.s6),short,x) * store(&(__return.s7),short,x) */
{
 int16x8_t r;
 r.s0=x;
 r.s1=x;
 r.s2=x;
 r.s3=x;
 r.s4=x;
 r.s5=x;
 r.s6=x;
 r.s7=x;
 return r;
}
int32x4_t vdupq_n_s32(int32_t x)
/*@ Require (-2147483648)<=x && x<=2147483647
 Ensure store(&(__return.s0),int,x) * store(&(__return.s1),int,x) * store(&(__return.s2),int,x) * store(&(__return.s3),int,x) */
{
 int32x4_t r;
 r.s0=x;
 r.s1=x;
 r.s2=x;
 r.s3=x;
 return r;
}
uint16x8_t vsubl_u8(uint8x8_t a,uint8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require (0)<=a0 && a0<=255 && store(&(a.s0),unsigned char,a0) && (0)<=a1 && a1<=255 && store(&(a.s1),unsigned char,a1) && (0)<=a2 && a2<=255 && store(&(a.s2),unsigned char,a2) && (0)<=a3 && a3<=255 && store(&(a.s3),unsigned char,a3) && (0)<=a4 && a4<=255 && store(&(a.s4),unsigned char,a4) && (0)<=a5 && a5<=255 && store(&(a.s5),unsigned char,a5) && (0)<=a6 && a6<=255 && store(&(a.s6),unsigned char,a6) && (0)<=a7 && a7<=255 && store(&(a.s7),unsigned char,a7) && (0)<=b0 && b0<=255 && store(&(b.s0),unsigned char,b0) && (0)<=b1 && b1<=255 && store(&(b.s1),unsigned char,b1) && (0)<=b2 && b2<=255 && store(&(b.s2),unsigned char,b2) && (0)<=b3 && b3<=255 && store(&(b.s3),unsigned char,b3) && (0)<=b4 && b4<=255 && store(&(b.s4),unsigned char,b4) && (0)<=b5 && b5<=255 && store(&(b.s5),unsigned char,b5) && (0)<=b6 && b6<=255 && store(&(b.s6),unsigned char,b6) && (0)<=b7 && b7<=255 && store(&(b.s7),unsigned char,b7)
 Ensure store(&(__return.s0),unsigned short,qu_udiff(a0,b0)) * store(&(__return.s1),unsigned short,qu_udiff(a1,b1)) * store(&(__return.s2),unsigned short,qu_udiff(a2,b2)) * store(&(__return.s3),unsigned short,qu_udiff(a3,b3)) * store(&(__return.s4),unsigned short,qu_udiff(a4,b4)) * store(&(__return.s5),unsigned short,qu_udiff(a5,b5)) * store(&(__return.s6),unsigned short,qu_udiff(a6,b6)) * store(&(__return.s7),unsigned short,qu_udiff(a7,b7)) */
{
 uint16x8_t r;
 r.s0=qcp_qu_subu8(a.s0,b.s0);
 r.s1=qcp_qu_subu8(a.s1,b.s1);
 r.s2=qcp_qu_subu8(a.s2,b.s2);
 r.s3=qcp_qu_subu8(a.s3,b.s3);
 r.s4=qcp_qu_subu8(a.s4,b.s4);
 r.s5=qcp_qu_subu8(a.s5,b.s5);
 r.s6=qcp_qu_subu8(a.s6,b.s6);
 r.s7=qcp_qu_subu8(a.s7,b.s7);
 return r;
}
int16x8_t vreinterpretq_s16_u16(uint16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require (0)<=a0 && a0<=65535 && store(&(a.s0),unsigned short,a0) && (0)<=a1 && a1<=65535 && store(&(a.s1),unsigned short,a1) && (0)<=a2 && a2<=65535 && store(&(a.s2),unsigned short,a2) && (0)<=a3 && a3<=65535 && store(&(a.s3),unsigned short,a3) && (0)<=a4 && a4<=65535 && store(&(a.s4),unsigned short,a4) && (0)<=a5 && a5<=65535 && store(&(a.s5),unsigned short,a5) && (0)<=a6 && a6<=65535 && store(&(a.s6),unsigned short,a6) && (0)<=a7 && a7<=65535 && store(&(a.s7),unsigned short,a7)
 Ensure store(&(__return.s0),short,qu_s16(a0)) * store(&(__return.s1),short,qu_s16(a1)) * store(&(__return.s2),short,qu_s16(a2)) * store(&(__return.s3),short,qu_s16(a3)) * store(&(__return.s4),short,qu_s16(a4)) * store(&(__return.s5),short,qu_s16(a5)) * store(&(__return.s6),short,qu_s16(a6)) * store(&(__return.s7),short,qu_s16(a7)) */
{
 int16x8_t r;
 r.s0=qcp_qu_from_u16(a.s0);
 r.s1=qcp_qu_from_u16(a.s1);
 r.s2=qcp_qu_from_u16(a.s2);
 r.s3=qcp_qu_from_u16(a.s3);
 r.s4=qcp_qu_from_u16(a.s4);
 r.s5=qcp_qu_from_u16(a.s5);
 r.s6=qcp_qu_from_u16(a.s6);
 r.s7=qcp_qu_from_u16(a.s7);
 return r;
}
int16x4_t vget_low_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3) && (-32768)<=a4 && a4<=32767 && store(&(a.s4),short,a4) && (-32768)<=a5 && a5<=32767 && store(&(a.s5),short,a5) && (-32768)<=a6 && a6<=32767 && store(&(a.s6),short,a6) && (-32768)<=a7 && a7<=32767 && store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),short,a0) * store(&(__return.s1),short,a1) * store(&(__return.s2),short,a2) * store(&(__return.s3),short,a3) */
{
 int16x4_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 return r;
}
int16x4_t vget_high_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3) && (-32768)<=a4 && a4<=32767 && store(&(a.s4),short,a4) && (-32768)<=a5 && a5<=32767 && store(&(a.s5),short,a5) && (-32768)<=a6 && a6<=32767 && store(&(a.s6),short,a6) && (-32768)<=a7 && a7<=32767 && store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),short,a4) * store(&(__return.s1),short,a5) * store(&(__return.s2),short,a6) * store(&(__return.s3),short,a7) */
{
 int16x4_t r;
 r.s0=a.s4;
 r.s1=a.s5;
 r.s2=a.s6;
 r.s3=a.s7;
 return r;
}
int32x4_t vmovl_s16(int16x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3)
 Ensure store(&(__return.s0),int,a0) * store(&(__return.s1),int,a1) * store(&(__return.s2),int,a2) * store(&(__return.s3),int,a3) */
{
 int32x4_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 return r;
}
int32x4_t vmulq_s32(int32x4_t a,int32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require (-2147483648)<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && (-2147483648)<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && (-2147483648)<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && (-2147483648)<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && (-2147483648)<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && (-2147483648)<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && (-2147483648)<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && (-2147483648)<=b3 && b3<=2147483647 && store(&(b.s3),int,b3)
 Ensure store(&(__return.s0),int,qu_neon_mul(a0,b0)) * store(&(__return.s1),int,qu_neon_mul(a1,b1)) * store(&(__return.s2),int,qu_neon_mul(a2,b2)) * store(&(__return.s3),int,qu_neon_mul(a3,b3)) */
{
 int32x4_t r;
 r.s0=qcp_qu_neon_mul(a.s0,b.s0);
 r.s1=qcp_qu_neon_mul(a.s1,b.s1);
 r.s2=qcp_qu_neon_mul(a.s2,b.s2);
 r.s3=qcp_qu_neon_mul(a.s3,b.s3);
 return r;
}
int32x4_t vrshlq_s32(int32x4_t a,int32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require (-2147483648)<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && (-2147483648)<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && (-2147483648)<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && (-2147483648)<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && (-2147483648)<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && (-2147483648)<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && (-2147483648)<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && (-2147483648)<=b3 && b3<=2147483647 && store(&(b.s3),int,b3)
 Ensure store(&(__return.s0),int,qu_neon_shift(a0,b0)) * store(&(__return.s1),int,qu_neon_shift(a1,b1)) * store(&(__return.s2),int,qu_neon_shift(a2,b2)) * store(&(__return.s3),int,qu_neon_shift(a3,b3)) */
{
 int32x4_t r;
 r.s0=qcp_qu_neon_shift(a.s0,b.s0);
 r.s1=qcp_qu_neon_shift(a.s1,b.s1);
 r.s2=qcp_qu_neon_shift(a.s2,b.s2);
 r.s3=qcp_qu_neon_shift(a.s3,b.s3);
 return r;
}
int32x4_t vmlaq_s32(int32x4_t a,int32x4_t b,int32x4_t c)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (c0:Z) (c1:Z) (c2:Z) (c3:Z)
 Require (-2147483648)<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && (-2147483648)<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && (-2147483648)<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && (-2147483648)<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && (-2147483648)<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && (-2147483648)<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && (-2147483648)<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && (-2147483648)<=b3 && b3<=2147483647 && store(&(b.s3),int,b3) && (-2147483648)<=c0 && c0<=2147483647 && store(&(c.s0),int,c0) && (-2147483648)<=c1 && c1<=2147483647 && store(&(c.s1),int,c1) && (-2147483648)<=c2 && c2<=2147483647 && store(&(c.s2),int,c2) && (-2147483648)<=c3 && c3<=2147483647 && store(&(c.s3),int,c3)
 Ensure store(&(__return.s0),int,qu_neon_mla(a0,b0,c0)) * store(&(__return.s1),int,qu_neon_mla(a1,b1,c1)) * store(&(__return.s2),int,qu_neon_mla(a2,b2,c2)) * store(&(__return.s3),int,qu_neon_mla(a3,b3,c3)) */
{
 int32x4_t r;
 r.s0=qcp_qu_neon_mla(a.s0,b.s0,c.s0);
 r.s1=qcp_qu_neon_mla(a.s1,b.s1,c.s1);
 r.s2=qcp_qu_neon_mla(a.s2,b.s2,c.s2);
 r.s3=qcp_qu_neon_mla(a.s3,b.s3,c.s3);
 return r;
}
int16x4_t vqmovn_s32(int32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require (-2147483648)<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && (-2147483648)<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && (-2147483648)<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && (-2147483648)<=a3 && a3<=2147483647 && store(&(a.s3),int,a3)
 Ensure store(&(__return.s0),short,qu_sat16(a0)) * store(&(__return.s1),short,qu_sat16(a1)) * store(&(__return.s2),short,qu_sat16(a2)) * store(&(__return.s3),short,qu_sat16(a3)) */
{
 int16x4_t r;
 r.s0=qcp_qu_sat16(a.s0);
 r.s1=qcp_qu_sat16(a.s1);
 r.s2=qcp_qu_sat16(a.s2);
 r.s3=qcp_qu_sat16(a.s3);
 return r;
}
int16x8_t vcombine_s16(int16x4_t a,int16x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3) && (-32768)<=b0 && b0<=32767 && store(&(b.s0),short,b0) && (-32768)<=b1 && b1<=32767 && store(&(b.s1),short,b1) && (-32768)<=b2 && b2<=32767 && store(&(b.s2),short,b2) && (-32768)<=b3 && b3<=32767 && store(&(b.s3),short,b3)
 Ensure store(&(__return.s0),short,a0) * store(&(__return.s1),short,a1) * store(&(__return.s2),short,a2) * store(&(__return.s3),short,a3) * store(&(__return.s4),short,b0) * store(&(__return.s5),short,b1) * store(&(__return.s6),short,b2) * store(&(__return.s7),short,b3) */
{
 int16x8_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 r.s4=b.s0;
 r.s5=b.s1;
 r.s6=b.s2;
 r.s7=b.s3;
 return r;
}
int16x8_t vqaddq_s16(int16x8_t a,int16x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3) && (-32768)<=a4 && a4<=32767 && store(&(a.s4),short,a4) && (-32768)<=a5 && a5<=32767 && store(&(a.s5),short,a5) && (-32768)<=a6 && a6<=32767 && store(&(a.s6),short,a6) && (-32768)<=a7 && a7<=32767 && store(&(a.s7),short,a7) && (-32768)<=b0 && b0<=32767 && store(&(b.s0),short,b0) && (-32768)<=b1 && b1<=32767 && store(&(b.s1),short,b1) && (-32768)<=b2 && b2<=32767 && store(&(b.s2),short,b2) && (-32768)<=b3 && b3<=32767 && store(&(b.s3),short,b3) && (-32768)<=b4 && b4<=32767 && store(&(b.s4),short,b4) && (-32768)<=b5 && b5<=32767 && store(&(b.s5),short,b5) && (-32768)<=b6 && b6<=32767 && store(&(b.s6),short,b6) && (-32768)<=b7 && b7<=32767 && store(&(b.s7),short,b7)
 Ensure store(&(__return.s0),short,qu_neon_add16(a0,b0)) * store(&(__return.s1),short,qu_neon_add16(a1,b1)) * store(&(__return.s2),short,qu_neon_add16(a2,b2)) * store(&(__return.s3),short,qu_neon_add16(a3,b3)) * store(&(__return.s4),short,qu_neon_add16(a4,b4)) * store(&(__return.s5),short,qu_neon_add16(a5,b5)) * store(&(__return.s6),short,qu_neon_add16(a6,b6)) * store(&(__return.s7),short,qu_neon_add16(a7,b7)) */
{
 int16x8_t r;
 r.s0=qcp_qu_neon_add16(a.s0,b.s0);
 r.s1=qcp_qu_neon_add16(a.s1,b.s1);
 r.s2=qcp_qu_neon_add16(a.s2,b.s2);
 r.s3=qcp_qu_neon_add16(a.s3,b.s3);
 r.s4=qcp_qu_neon_add16(a.s4,b.s4);
 r.s5=qcp_qu_neon_add16(a.s5,b.s5);
 r.s6=qcp_qu_neon_add16(a.s6,b.s6);
 r.s7=qcp_qu_neon_add16(a.s7,b.s7);
 return r;
}
uint8x8_t vqmovun_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require (-32768)<=a0 && a0<=32767 && store(&(a.s0),short,a0) && (-32768)<=a1 && a1<=32767 && store(&(a.s1),short,a1) && (-32768)<=a2 && a2<=32767 && store(&(a.s2),short,a2) && (-32768)<=a3 && a3<=32767 && store(&(a.s3),short,a3) && (-32768)<=a4 && a4<=32767 && store(&(a.s4),short,a4) && (-32768)<=a5 && a5<=32767 && store(&(a.s5),short,a5) && (-32768)<=a6 && a6<=32767 && store(&(a.s6),short,a6) && (-32768)<=a7 && a7<=32767 && store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),unsigned char,qu_usat8(a0)) * store(&(__return.s1),unsigned char,qu_usat8(a1)) * store(&(__return.s2),unsigned char,qu_usat8(a2)) * store(&(__return.s3),unsigned char,qu_usat8(a3)) * store(&(__return.s4),unsigned char,qu_usat8(a4)) * store(&(__return.s5),unsigned char,qu_usat8(a5)) * store(&(__return.s6),unsigned char,qu_usat8(a6)) * store(&(__return.s7),unsigned char,qu_usat8(a7)) */
{
 uint8x8_t r;
 r.s0=qcp_qu_usat8(a.s0);
 r.s1=qcp_qu_usat8(a.s1);
 r.s2=qcp_qu_usat8(a.s2);
 r.s3=qcp_qu_usat8(a.s3);
 r.s4=qcp_qu_usat8(a.s4);
 r.s5=qcp_qu_usat8(a.s5);
 r.s6=qcp_qu_usat8(a.s6);
 r.s7=qcp_qu_usat8(a.s7);
 return r;
}
uint8x8_t vmin_u8(uint8x8_t a,uint8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require (0)<=a0 && a0<=255 && store(&(a.s0),unsigned char,a0) && (0)<=a1 && a1<=255 && store(&(a.s1),unsigned char,a1) && (0)<=a2 && a2<=255 && store(&(a.s2),unsigned char,a2) && (0)<=a3 && a3<=255 && store(&(a.s3),unsigned char,a3) && (0)<=a4 && a4<=255 && store(&(a.s4),unsigned char,a4) && (0)<=a5 && a5<=255 && store(&(a.s5),unsigned char,a5) && (0)<=a6 && a6<=255 && store(&(a.s6),unsigned char,a6) && (0)<=a7 && a7<=255 && store(&(a.s7),unsigned char,a7) && (0)<=b0 && b0<=255 && store(&(b.s0),unsigned char,b0) && (0)<=b1 && b1<=255 && store(&(b.s1),unsigned char,b1) && (0)<=b2 && b2<=255 && store(&(b.s2),unsigned char,b2) && (0)<=b3 && b3<=255 && store(&(b.s3),unsigned char,b3) && (0)<=b4 && b4<=255 && store(&(b.s4),unsigned char,b4) && (0)<=b5 && b5<=255 && store(&(b.s5),unsigned char,b5) && (0)<=b6 && b6<=255 && store(&(b.s6),unsigned char,b6) && (0)<=b7 && b7<=255 && store(&(b.s7),unsigned char,b7)
 Ensure store(&(__return.s0),unsigned char,qu_umin(a0,b0)) * store(&(__return.s1),unsigned char,qu_umin(a1,b1)) * store(&(__return.s2),unsigned char,qu_umin(a2,b2)) * store(&(__return.s3),unsigned char,qu_umin(a3,b3)) * store(&(__return.s4),unsigned char,qu_umin(a4,b4)) * store(&(__return.s5),unsigned char,qu_umin(a5,b5)) * store(&(__return.s6),unsigned char,qu_umin(a6,b6)) * store(&(__return.s7),unsigned char,qu_umin(a7,b7)) */
{
 uint8x8_t r;
 r.s0=qcp_qu_umin8(a.s0,b.s0);
 r.s1=qcp_qu_umin8(a.s1,b.s1);
 r.s2=qcp_qu_umin8(a.s2,b.s2);
 r.s3=qcp_qu_umin8(a.s3,b.s3);
 r.s4=qcp_qu_umin8(a.s4,b.s4);
 r.s5=qcp_qu_umin8(a.s5,b.s5);
 r.s6=qcp_qu_umin8(a.s6,b.s6);
 r.s7=qcp_qu_umin8(a.s7,b.s7);
 return r;
}
uint8x8_t vmax_u8(uint8x8_t a,uint8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require (0)<=a0 && a0<=255 && store(&(a.s0),unsigned char,a0) && (0)<=a1 && a1<=255 && store(&(a.s1),unsigned char,a1) && (0)<=a2 && a2<=255 && store(&(a.s2),unsigned char,a2) && (0)<=a3 && a3<=255 && store(&(a.s3),unsigned char,a3) && (0)<=a4 && a4<=255 && store(&(a.s4),unsigned char,a4) && (0)<=a5 && a5<=255 && store(&(a.s5),unsigned char,a5) && (0)<=a6 && a6<=255 && store(&(a.s6),unsigned char,a6) && (0)<=a7 && a7<=255 && store(&(a.s7),unsigned char,a7) && (0)<=b0 && b0<=255 && store(&(b.s0),unsigned char,b0) && (0)<=b1 && b1<=255 && store(&(b.s1),unsigned char,b1) && (0)<=b2 && b2<=255 && store(&(b.s2),unsigned char,b2) && (0)<=b3 && b3<=255 && store(&(b.s3),unsigned char,b3) && (0)<=b4 && b4<=255 && store(&(b.s4),unsigned char,b4) && (0)<=b5 && b5<=255 && store(&(b.s5),unsigned char,b5) && (0)<=b6 && b6<=255 && store(&(b.s6),unsigned char,b6) && (0)<=b7 && b7<=255 && store(&(b.s7),unsigned char,b7)
 Ensure store(&(__return.s0),unsigned char,qu_umax(a0,b0)) * store(&(__return.s1),unsigned char,qu_umax(a1,b1)) * store(&(__return.s2),unsigned char,qu_umax(a2,b2)) * store(&(__return.s3),unsigned char,qu_umax(a3,b3)) * store(&(__return.s4),unsigned char,qu_umax(a4,b4)) * store(&(__return.s5),unsigned char,qu_umax(a5,b5)) * store(&(__return.s6),unsigned char,qu_umax(a6,b6)) * store(&(__return.s7),unsigned char,qu_umax(a7,b7)) */
{
 uint8x8_t r;
 r.s0=qcp_qu_umax8(a.s0,b.s0);
 r.s1=qcp_qu_umax8(a.s1,b.s1);
 r.s2=qcp_qu_umax8(a.s2,b.s2);
 r.s3=qcp_qu_umax8(a.s3,b.s3);
 r.s4=qcp_qu_umax8(a.s4,b.s4);
 r.s5=qcp_qu_umax8(a.s5,b.s5);
 r.s6=qcp_qu_umax8(a.s6,b.s6);
 r.s7=qcp_qu_umax8(a.s7,b.s7);
 return r;
}
