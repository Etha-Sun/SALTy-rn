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
/*@ Import Coq Require Import Qu8Add.MemoryModel */
/*@ Extern Coq (UCharArray::full:Z -> Z -> list Z -> Assertion)
 (UCharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (UCharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (UCharArray::undef_full:Z -> Z -> Assertion)
 (UCharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (UCharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (u8_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "u8_arrays.strategies" */
/*@ Import Coq Require Import Qu8Add.NeonStoreModel */
/*@ Extern Coq (u8_pack8:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
/*@ Extern Coq (u8_pack16:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
/*@ Import Coq Require Import Qu8Add.ByteBridge */
/*@ Extern Coq (u8_le_byte0:Z -> Z) (u8_le_byte1:Z -> Z)
               (u8_le_byte2:Z -> Z) (u8_le_byte3:Z -> Z) */
/*@ include strategies "unsigned_tail.strategies" */
uint8x8_t qcp_u8_ext2(const uint8x8_t *a,const uint8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7)
    Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(__return.s0),unsigned char,x2) * store(&(__return.s1),unsigned char,x3) * store(&(__return.s2),unsigned char,x4) * store(&(__return.s3),unsigned char,x5) * store(&(__return.s4),unsigned char,x6) * store(&(__return.s5),unsigned char,x7) * store(&(__return.s6),unsigned char,x0) * store(&(__return.s7),unsigned char,x1) */;
uint8x8_t qcp_u8_ext4(const uint8x8_t *a,const uint8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7)
    Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(__return.s0),unsigned char,x4) * store(&(__return.s1),unsigned char,x5) * store(&(__return.s2),unsigned char,x6) * store(&(__return.s3),unsigned char,x7) * store(&(__return.s4),unsigned char,x0) * store(&(__return.s5),unsigned char,x1) * store(&(__return.s6),unsigned char,x2) * store(&(__return.s7),unsigned char,x3) */;
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
/*@ Import Coq Require Import Qu8Add.ProgramModel */
/*@ Extern Coq (qu_values:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z -> list Z -> list Z)
 (qu_neon_lane:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z)
 (qu_outputs_related:list Z -> list Z -> Prop) */
void qcp_qu_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */;
/*@ include strategies "u8_neon_memory.strategies" */
/*@ Import Coq Require Import Qu8Add.ComposedModel */
/*@ Extern Coq (qu_pack1:Z -> list Z) (qu_pack2:Z -> Z -> list Z) (qu_pack4:Z -> Z -> Z -> Z -> list Z) */
void qcp_qu_store4_0(uint8_t *p,const uint8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require UCharArray::undef_full(p,4) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7)
 Ensure UCharArray::full(p,4,qu_pack4(x0,x1,x2,x3)) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) */;
void qcp_qu_store2_0(uint8_t *p,const uint8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require UCharArray::undef_full(p,2) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7)
 Ensure UCharArray::full(p,2,qu_pack2(x0,x1)) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) */;
void qcp_qu_store1_0(uint8_t *p,const uint8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require UCharArray::undef_full(p,1) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7)
 Ensure UCharArray::full(p,1,qu_pack1(x0)) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) */;
/* Frozen pure variable arguments only: borrow the source vector once, copy all
   eight actual fields in checked C, then evaluate the original nested body. */
/*@ Extern Coq (qu_negword:Z -> Z) (qu_ctrl:Z -> Z) */
/*@ Import Coq Require Import Qu8Add.ControlFacts */
/*
struct xnn_qu8_add_minmax_params {
  struct {
    uint8_t a_zero_point;
    uint8_t b_zero_point;
    int32_t bias;
    int32_t a_multiplier;
    int32_t b_multiplier;
    int32_t shift;
    int16_t output_zero_point;
    uint8_t output_min;
    uint8_t output_max;
  } scalar;
};
*/
void test_neon(
    size_t batch,
    const uint8_t* input_a,
    const uint8_t* input_b,
    uint8_t* output,
    const struct xnn_qu8_add_minmax_params* restrict params)
/*@ With (A:list Z) (B:list Z) (Az:Z) (Bz:Z) (RawBias:Z) (Ma:Z) (Mb:Z) (RawShift:Z) (Oz:Z) (Lo:Z) (Hi:Z)
 Require 0<batch && batch<=18446744073709551608 && input_a!=0 && input_b!=0 && output!=0 && params!=0 && (0)<=Az && Az<=255 && (0)<=Bz && Bz<=255 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (0)<=Lo && Lo<=255 && (0)<=Hi && Hi<=255 &&
 UCharArray::full(input_a,batch+7,A) * UCharArray::full(input_b,batch+7,B) * UCharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi)
 Ensure UCharArray::full(input_a,batch+7,A) * UCharArray::full(input_b,batch+7,B) * UCharArray::full(output,batch,qu_values(batch,Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi) */
{
/*@ Assert Zlength(A)==batch@pre+7 && Zlength(B)==batch@pre+7 && sizeof(uint8_t)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<=batch && batch<=batch@pre && 0<=(batch@pre-batch) && params==params@pre && params!=0 && (0)<=Az && Az<=255 && (0)<=Bz && Bz<=255 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (0)<=Lo && Lo<=255 && (0)<=Hi && Hi<=255 && batch%sizeof(uint8_t)==0 && input_a!=0 && input_b!=0 && output!=0 && batch==batch@pre && input_a==input_a@pre && input_b==input_b@pre && output==output@pre && UCharArray::full(input_a@pre,batch@pre+7,A) * UCharArray::full(input_b@pre,batch@pre+7,B) * UCharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi) */
  qcp_qu_assert((batch != 0));
  qcp_qu_assert((batch % sizeof(uint8_t) == 0));
  qcp_qu_assert((input_a != ((void*)0)));
  qcp_qu_assert((input_b != ((void*)0)));
  qcp_qu_assert((output != ((void*)0)));
  const uint8x8_t va_zero_point = vdup_n_u8(params->scalar.a_zero_point);
  const uint8x8_t vb_zero_point = vdup_n_u8(params->scalar.b_zero_point);
  const int32x4_t va_multiplier = vdupq_n_s32(params->scalar.a_multiplier);
  const int32x4_t vb_multiplier = vdupq_n_s32(params->scalar.b_multiplier);
  int32_t right_shift = -(params->scalar.shift % 256);
  if (right_shift > 127) right_shift -= 256;
  if (right_shift < -128) right_shift += 256;
  const int32x4_t vright_shift = vdupq_n_s32(right_shift);
  const int16x8_t voutput_zero_point = vdupq_n_s16(params->scalar.output_zero_point);
  const uint8x8_t voutput_min = vdup_n_u8(params->scalar.output_min);
  const uint8x8_t voutput_max = vdup_n_u8(params->scalar.output_max);
/*@ Inv Assert Zlength(A)==batch@pre+7 && Zlength(B)==batch@pre+7 && sizeof(uint8_t)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<=batch && batch<=batch@pre && 0<=(batch@pre-batch) && params==params@pre && params!=0 && (0)<=Az && Az<=255 && (0)<=Bz && Bz<=255 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (0)<=Lo && Lo<=255 && (0)<=Hi && Hi<=255 && ((batch>0 && input_a==input_a@pre+(batch@pre-batch) && input_b==input_b@pre+(batch@pre-batch) && output==output@pre+(batch@pre-batch)) || batch==0) && right_shift==qu_ctrl(RawShift) && input_a@pre<=input_a && input_a<=input_a@pre+batch@pre+7 && input_b@pre<=input_b && input_b<=input_b@pre+batch@pre+7 && UCharArray::full(input_a@pre,batch@pre+7,A) * UCharArray::full(input_b@pre,batch@pre+7,B) * UCharArray::full(output@pre,(batch@pre-batch),qu_values((batch@pre-batch),Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * UCharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi) * store(&(va_zero_point.s0),unsigned char,Az) * store(&(va_zero_point.s1),unsigned char,Az) * store(&(va_zero_point.s2),unsigned char,Az) * store(&(va_zero_point.s3),unsigned char,Az) * store(&(va_zero_point.s4),unsigned char,Az) * store(&(va_zero_point.s5),unsigned char,Az) * store(&(va_zero_point.s6),unsigned char,Az) * store(&(va_zero_point.s7),unsigned char,Az) * store(&(vb_zero_point.s0),unsigned char,Bz) * store(&(vb_zero_point.s1),unsigned char,Bz) * store(&(vb_zero_point.s2),unsigned char,Bz) * store(&(vb_zero_point.s3),unsigned char,Bz) * store(&(vb_zero_point.s4),unsigned char,Bz) * store(&(vb_zero_point.s5),unsigned char,Bz) * store(&(vb_zero_point.s6),unsigned char,Bz) * store(&(vb_zero_point.s7),unsigned char,Bz) * store(&(va_multiplier.s0),int,Ma) * store(&(va_multiplier.s1),int,Ma) * store(&(va_multiplier.s2),int,Ma) * store(&(va_multiplier.s3),int,Ma) * store(&(vb_multiplier.s0),int,Mb) * store(&(vb_multiplier.s1),int,Mb) * store(&(vb_multiplier.s2),int,Mb) * store(&(vb_multiplier.s3),int,Mb) * store(&(vright_shift.s0),int,qu_ctrl(RawShift)) * store(&(vright_shift.s1),int,qu_ctrl(RawShift)) * store(&(vright_shift.s2),int,qu_ctrl(RawShift)) * store(&(vright_shift.s3),int,qu_ctrl(RawShift)) * store(&(voutput_zero_point.s0),short,Oz) * store(&(voutput_zero_point.s1),short,Oz) * store(&(voutput_zero_point.s2),short,Oz) * store(&(voutput_zero_point.s3),short,Oz) * store(&(voutput_zero_point.s4),short,Oz) * store(&(voutput_zero_point.s5),short,Oz) * store(&(voutput_zero_point.s6),short,Oz) * store(&(voutput_zero_point.s7),short,Oz) * store(&(voutput_min.s0),unsigned char,Lo) * store(&(voutput_min.s1),unsigned char,Lo) * store(&(voutput_min.s2),unsigned char,Lo) * store(&(voutput_min.s3),unsigned char,Lo) * store(&(voutput_min.s4),unsigned char,Lo) * store(&(voutput_min.s5),unsigned char,Lo) * store(&(voutput_min.s6),unsigned char,Lo) * store(&(voutput_min.s7),unsigned char,Lo) * store(&(voutput_max.s0),unsigned char,Hi) * store(&(voutput_max.s1),unsigned char,Hi) * store(&(voutput_max.s2),unsigned char,Hi) * store(&(voutput_max.s3),unsigned char,Hi) * store(&(voutput_max.s4),unsigned char,Hi) * store(&(voutput_max.s5),unsigned char,Hi) * store(&(voutput_max.s6),unsigned char,Hi) * store(&(voutput_max.s7),unsigned char,Hi) */
  for (; batch >= 8 * sizeof(uint8_t); batch -= 8 * sizeof(uint8_t)) {
    const uint8x8_t va01234567 = qcp_u8_load8((input_a)) /*@ where base=input_a@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */; input_a += 8;
    const uint8x8_t vb01234567 = qcp_u8_load8((input_b)) /*@ where base=input_b@pre,count=batch@pre+7,idx=batch@pre-batch,L=B */; input_b += 8;
    const int16x8_t vxa01234567 = vreinterpretq_s16_u16(vsubl_u8(va01234567, va_zero_point) /*@ where a=&va01234567,b=&va_zero_point */) /*@ where a=0 */;
    const int16x8_t vxb01234567 = vreinterpretq_s16_u16(vsubl_u8(vb01234567, vb_zero_point) /*@ where a=&vb01234567,b=&vb_zero_point */) /*@ where a=0 */;
    int32x4_t vacc0123 = vmulq_s32(vmovl_s16(vget_low_s16(vxa01234567) /*@ where a=&vxa01234567 */) /*@ where a=0 */, va_multiplier) /*@ where a=0,b=&va_multiplier */;
    int32x4_t vacc4567 = vmulq_s32(vmovl_s16(vget_high_s16(vxa01234567) /*@ where a=&vxa01234567 */) /*@ where a=0 */, va_multiplier) /*@ where a=0,b=&va_multiplier */;
    vacc0123 = vmlaq_s32(vacc0123, vmovl_s16(vget_low_s16(vxb01234567) /*@ where a=&vxb01234567 */) /*@ where a=0 */, vb_multiplier) /*@ where a=&vacc0123,b=0,c=&vb_multiplier */;
    vacc4567 = vmlaq_s32(vacc4567, vmovl_s16(vget_high_s16(vxb01234567) /*@ where a=&vxb01234567 */) /*@ where a=0 */, vb_multiplier) /*@ where a=&vacc4567,b=0,c=&vb_multiplier */;
    vacc0123 = vrshlq_s32(vacc0123, vright_shift) /*@ where a=&vacc0123,b=&vright_shift */;
    vacc4567 = vrshlq_s32(vacc4567, vright_shift) /*@ where a=&vacc4567,b=&vright_shift */;
    const int16x8_t vacc01234567 = vqaddq_s16(vcombine_s16(vqmovn_s32(vacc0123) /*@ where a=&vacc0123 */, vqmovn_s32(vacc4567) /*@ where a=&vacc4567 */) /*@ where a=0,b=0 */, voutput_zero_point) /*@ where a=0,b=&voutput_zero_point */;
    uint8x8_t vout01234567 = vqmovun_s16(vacc01234567) /*@ where a=&vacc01234567 */;
    vout01234567 = vmax_u8(vout01234567, voutput_min) /*@ where a=&vout01234567,b=&voutput_min */;
    vout01234567 = vmin_u8(vout01234567, voutput_max) /*@ where a=&vout01234567,b=&voutput_max */;
    qcp_u8_store8((output),&(vout01234567)); output += 8;
  }
  if (batch != 0) {
/*@ Assert Zlength(A)==batch@pre+7 && Zlength(B)==batch@pre+7 && sizeof(uint8_t)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<=batch && batch<=batch@pre && 0<=(batch@pre-batch) && params==params@pre && params!=0 && (0)<=Az && Az<=255 && (0)<=Bz && Bz<=255 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (0)<=Lo && Lo<=255 && (0)<=Hi && Hi<=255 && (batch>0 && input_a==input_a@pre+(batch@pre-batch) && input_b==input_b@pre+(batch@pre-batch) && output==output@pre+(batch@pre-batch)) && right_shift==qu_ctrl(RawShift) && input_a@pre<=input_a && input_a<=input_a@pre+batch@pre+7 && input_b@pre<=input_b && input_b<=input_b@pre+batch@pre+7 && batch<8 && ((batch==1 && (batch & (4 * sizeof(uint8_t)))==0 && (batch & (2 * sizeof(uint8_t)))==0 && (batch & (1 * sizeof(uint8_t)))==1) || (batch==2 && (batch & (4 * sizeof(uint8_t)))==0 && (batch & (2 * sizeof(uint8_t)))==2 && (batch & (1 * sizeof(uint8_t)))==0) || (batch==3 && (batch & (4 * sizeof(uint8_t)))==0 && (batch & (2 * sizeof(uint8_t)))==2 && (batch & (1 * sizeof(uint8_t)))==1) || (batch==4 && (batch & (4 * sizeof(uint8_t)))==4 && (batch & (2 * sizeof(uint8_t)))==0 && (batch & (1 * sizeof(uint8_t)))==0) || (batch==5 && (batch & (4 * sizeof(uint8_t)))==4 && (batch & (2 * sizeof(uint8_t)))==0 && (batch & (1 * sizeof(uint8_t)))==1) || (batch==6 && (batch & (4 * sizeof(uint8_t)))==4 && (batch & (2 * sizeof(uint8_t)))==2 && (batch & (1 * sizeof(uint8_t)))==0) || (batch==7 && (batch & (4 * sizeof(uint8_t)))==4 && (batch & (2 * sizeof(uint8_t)))==2 && (batch & (1 * sizeof(uint8_t)))==1)) && UCharArray::full(input_a@pre,batch@pre+7,A) * UCharArray::full(input_b@pre,batch@pre+7,B) * UCharArray::full(output@pre,(batch@pre-batch),qu_values((batch@pre-batch),Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * UCharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi) * store(&(va_zero_point.s0),unsigned char,Az) * store(&(va_zero_point.s1),unsigned char,Az) * store(&(va_zero_point.s2),unsigned char,Az) * store(&(va_zero_point.s3),unsigned char,Az) * store(&(va_zero_point.s4),unsigned char,Az) * store(&(va_zero_point.s5),unsigned char,Az) * store(&(va_zero_point.s6),unsigned char,Az) * store(&(va_zero_point.s7),unsigned char,Az) * store(&(vb_zero_point.s0),unsigned char,Bz) * store(&(vb_zero_point.s1),unsigned char,Bz) * store(&(vb_zero_point.s2),unsigned char,Bz) * store(&(vb_zero_point.s3),unsigned char,Bz) * store(&(vb_zero_point.s4),unsigned char,Bz) * store(&(vb_zero_point.s5),unsigned char,Bz) * store(&(vb_zero_point.s6),unsigned char,Bz) * store(&(vb_zero_point.s7),unsigned char,Bz) * store(&(va_multiplier.s0),int,Ma) * store(&(va_multiplier.s1),int,Ma) * store(&(va_multiplier.s2),int,Ma) * store(&(va_multiplier.s3),int,Ma) * store(&(vb_multiplier.s0),int,Mb) * store(&(vb_multiplier.s1),int,Mb) * store(&(vb_multiplier.s2),int,Mb) * store(&(vb_multiplier.s3),int,Mb) * store(&(vright_shift.s0),int,qu_ctrl(RawShift)) * store(&(vright_shift.s1),int,qu_ctrl(RawShift)) * store(&(vright_shift.s2),int,qu_ctrl(RawShift)) * store(&(vright_shift.s3),int,qu_ctrl(RawShift)) * store(&(voutput_zero_point.s0),short,Oz) * store(&(voutput_zero_point.s1),short,Oz) * store(&(voutput_zero_point.s2),short,Oz) * store(&(voutput_zero_point.s3),short,Oz) * store(&(voutput_zero_point.s4),short,Oz) * store(&(voutput_zero_point.s5),short,Oz) * store(&(voutput_zero_point.s6),short,Oz) * store(&(voutput_zero_point.s7),short,Oz) * store(&(voutput_min.s0),unsigned char,Lo) * store(&(voutput_min.s1),unsigned char,Lo) * store(&(voutput_min.s2),unsigned char,Lo) * store(&(voutput_min.s3),unsigned char,Lo) * store(&(voutput_min.s4),unsigned char,Lo) * store(&(voutput_min.s5),unsigned char,Lo) * store(&(voutput_min.s6),unsigned char,Lo) * store(&(voutput_min.s7),unsigned char,Lo) * store(&(voutput_max.s0),unsigned char,Hi) * store(&(voutput_max.s1),unsigned char,Hi) * store(&(voutput_max.s2),unsigned char,Hi) * store(&(voutput_max.s3),unsigned char,Hi) * store(&(voutput_max.s4),unsigned char,Hi) * store(&(voutput_max.s5),unsigned char,Hi) * store(&(voutput_max.s6),unsigned char,Hi) * store(&(voutput_max.s7),unsigned char,Hi) */
    {
      const uint8x8_t va01234567 = qcp_u8_load8((input_a)) /*@ where base=input_a@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */;
      const uint8x8_t vb01234567 = qcp_u8_load8((input_b)) /*@ where base=input_b@pre,count=batch@pre+7,idx=batch@pre-batch,L=B */;
      const int16x8_t vxa01234567 = vreinterpretq_s16_u16(vsubl_u8(va01234567, va_zero_point) /*@ where a=&va01234567,b=&va_zero_point */) /*@ where a=0 */;
      const int16x8_t vxb01234567 = vreinterpretq_s16_u16(vsubl_u8(vb01234567, vb_zero_point) /*@ where a=&vb01234567,b=&vb_zero_point */) /*@ where a=0 */;
      int32x4_t vacc0123 = vmulq_s32(vmovl_s16(vget_low_s16(vxa01234567) /*@ where a=&vxa01234567 */) /*@ where a=0 */, va_multiplier) /*@ where a=0,b=&va_multiplier */;
      int32x4_t vacc4567 = vmulq_s32(vmovl_s16(vget_high_s16(vxa01234567) /*@ where a=&vxa01234567 */) /*@ where a=0 */, va_multiplier) /*@ where a=0,b=&va_multiplier */;
      vacc0123 = vmlaq_s32(vacc0123, vmovl_s16(vget_low_s16(vxb01234567) /*@ where a=&vxb01234567 */) /*@ where a=0 */, vb_multiplier) /*@ where a=&vacc0123,b=0,c=&vb_multiplier */;
      vacc4567 = vmlaq_s32(vacc4567, vmovl_s16(vget_high_s16(vxb01234567) /*@ where a=&vxb01234567 */) /*@ where a=0 */, vb_multiplier) /*@ where a=&vacc4567,b=0,c=&vb_multiplier */;
      vacc0123 = vrshlq_s32(vacc0123, vright_shift) /*@ where a=&vacc0123,b=&vright_shift */;
      vacc4567 = vrshlq_s32(vacc4567, vright_shift) /*@ where a=&vacc4567,b=&vright_shift */;
      const int16x8_t vacc01234567 = vqaddq_s16(vcombine_s16(vqmovn_s32(vacc0123) /*@ where a=&vacc0123 */, vqmovn_s32(vacc4567) /*@ where a=&vacc4567 */) /*@ where a=0,b=0 */, voutput_zero_point) /*@ where a=0,b=&voutput_zero_point */;
      uint8x8_t vout01234567 = vqmovun_s16(vacc01234567) /*@ where a=&vacc01234567 */;
      vout01234567 = vmax_u8(vout01234567, voutput_min) /*@ where a=&vout01234567,b=&voutput_min */;
      vout01234567 = vmin_u8(vout01234567, voutput_max) /*@ where a=&vout01234567,b=&voutput_max */;
      if (batch & (4 * sizeof(uint8_t))) {
        qcp_qu_store4_0((uint8_t*)((void*) output),&(vout01234567)); output += 4;
        vout01234567 = qcp_u8_ext4(&(vout01234567),&(vout01234567));
      }
      if (batch & (2 * sizeof(uint8_t))) {
        qcp_qu_store2_0((uint8_t*)((void*) output),&(vout01234567)); output += 2;
        vout01234567 = qcp_u8_ext2(&(vout01234567),&(vout01234567));
      }
      if (batch & (1 * sizeof(uint8_t))) {
        qcp_qu_store1_0((output),&(vout01234567));
      }
    }
  }
}
