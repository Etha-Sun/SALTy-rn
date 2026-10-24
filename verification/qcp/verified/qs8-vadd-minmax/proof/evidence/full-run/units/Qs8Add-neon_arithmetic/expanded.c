typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qs8Add.Model */
/*@ Extern Coq (qa_s8:Z -> Z) (qa_s16:Z -> Z) (qa_s32:Z -> Z)
 (qa_pow2:Z -> Z) (qa_floor:Z -> Z -> Z) (qa_sat16:Z -> Z) (qa_sat8:Z -> Z)
 (qa_neon_mul:Z -> Z -> Z) (qa_rvv_mul:Z -> Z -> Z)
 (qa_neon_mla:Z -> Z -> Z -> Z) (qa_rvv_macc:Z -> Z -> Z -> Z)
 (qa_neon_shift:Z -> Z -> Z) (qa_rvv_rnu:Z -> Z -> Z) (qa_rvv_sll:Z -> Z -> Z)
 (qa_neon_add16:Z -> Z -> Z) (qa_rvv_add16:Z -> Z -> Z) */
int8_t qcp_qa_s8(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qa_s8(x) && -128<=__return && __return<=127 && emp */;
int16_t qcp_qa_s16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qa_s16(x) && -32768<=__return && __return<=32767 && emp */;
int32_t qcp_qa_s32(int64_t x)
/*@ Require -9223372036854775807-1<=x && x<=9223372036854775807 && emp Ensure __return==qa_s32(x) && -2147483648<=__return && __return<=2147483647 && emp */;
int64_t qcp_qa_pow2(int32_t d)
/*@ Require 0<=d && d<=31 && emp Ensure __return==qa_pow2(d) && 1<=__return && __return<=2147483648 && emp */;
int64_t qcp_qa_floor(int64_t x,int64_t p)
/*@ Require -4294967296<=x && x<=4294967296 && 1<=p && p<=2147483648 && emp Ensure __return==qa_floor(x,p) && emp */;
int16_t qcp_qa_sat16(int64_t x)
/*@ Require -9223372036854775807-1<=x && x<=9223372036854775807 && emp Ensure __return==qa_sat16(x) && -32768<=__return && __return<=32767 && emp */;
int8_t qcp_qa_sat8(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qa_sat8(x) && -128<=__return && __return<=127 && emp */;
int32_t qcp_qa_neon_mul(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qa_neon_mul(a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qa_rvv_mul(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qa_rvv_mul(a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qa_neon_mla(int32_t a,int32_t b,int32_t c)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && -2147483648<=c && c<=2147483647 && emp Ensure __return==qa_neon_mla(a,b,c) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qa_rvv_macc(int32_t a,int32_t b,int32_t c)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && -2147483648<=c && c<=2147483647 && emp Ensure __return==qa_rvv_macc(a,b,c) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qa_neon_shift(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qa_neon_shift(a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qa_rvv_rnu(int32_t a,int32_t d)
/*@ Require -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp Ensure __return==qa_rvv_rnu(a,d) && -2147483648<=__return && __return<=2147483647 && emp */;
int32_t qcp_qa_rvv_sll(int32_t a,int32_t d)
/*@ Require -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp Ensure __return==qa_rvv_sll(a,d) && -2147483648<=__return && __return<=2147483647 && emp */;
int16_t qcp_qa_neon_add16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qa_neon_add16(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qa_rvv_add16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qa_rvv_add16(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qa_sub8(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp Ensure __return==qa_s16(a-b) && -32768<=__return && __return<=32767 && emp */;
struct qa_scalar_params {int8_t a_zero_point; int8_t b_zero_point; int32_t bias; int32_t a_multiplier; int32_t b_multiplier; int32_t shift; int16_t output_zero_point; int8_t output_min; int8_t output_max;};
struct xnn_qs8_add_minmax_params {struct qa_scalar_params scalar;};
typedef struct int8x8_t {
 int8_t s0;
 int8_t s1;
 int8_t s2;
 int8_t s3;
 int8_t s4;
 int8_t s5;
 int8_t s6;
 int8_t s7;
} int8x8_t;
typedef struct int8x16_t {
 int8_t s0;
 int8_t s1;
 int8_t s2;
 int8_t s3;
 int8_t s4;
 int8_t s5;
 int8_t s6;
 int8_t s7;
 int8_t s8;
 int8_t s9;
 int8_t s10;
 int8_t s11;
 int8_t s12;
 int8_t s13;
 int8_t s14;
 int8_t s15;
} int8x16_t;
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
typedef struct vint8m2_t {
 int8_t s0;
 int8_t s1;
 int8_t s2;
 int8_t s3;
 int8_t s4;
 int8_t s5;
 int8_t s6;
 int8_t s7;
 int8_t s8;
 int8_t s9;
 int8_t s10;
 int8_t s11;
 int8_t s12;
 int8_t s13;
 int8_t s14;
 int8_t s15;
 int8_t s16;
 int8_t s17;
 int8_t s18;
 int8_t s19;
 int8_t s20;
 int8_t s21;
 int8_t s22;
 int8_t s23;
 int8_t s24;
 int8_t s25;
 int8_t s26;
 int8_t s27;
 int8_t s28;
 int8_t s29;
 int8_t s30;
 int8_t s31;
} vint8m2_t;
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
typedef uint8x8_t uint32x2_t;
typedef uint8x8_t uint16x4_t;
/*@ Import Coq Require Import Qs8Add.Types */
/*@ Extern Coq (UndefStructPredint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint8x16_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint32x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint8m2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint16m4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint32m8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint8x8_t:Z -> Assertion) */
/*@ Import Coq Require Import Qs8Add.VectorModel */
/*@ Extern Coq (qa_min:Z -> Z -> Z) (qa_max:Z -> Z -> Z) */
int8x8_t vdup_n_s8(int8_t x)
/*@ Require -128<=x && x<=127
 Ensure store(&(__return.s0),char,x) * store(&(__return.s1),char,x) * store(&(__return.s2),char,x) * store(&(__return.s3),char,x) * store(&(__return.s4),char,x) * store(&(__return.s5),char,x) * store(&(__return.s6),char,x) * store(&(__return.s7),char,x) */;
int8x16_t vdupq_n_s8(int8_t x)
/*@ Require -128<=x && x<=127
 Ensure store(&(__return.s0),char,x) * store(&(__return.s1),char,x) * store(&(__return.s2),char,x) * store(&(__return.s3),char,x) * store(&(__return.s4),char,x) * store(&(__return.s5),char,x) * store(&(__return.s6),char,x) * store(&(__return.s7),char,x) * store(&(__return.s8),char,x) * store(&(__return.s9),char,x) * store(&(__return.s10),char,x) * store(&(__return.s11),char,x) * store(&(__return.s12),char,x) * store(&(__return.s13),char,x) * store(&(__return.s14),char,x) * store(&(__return.s15),char,x) */;
int16x8_t vdupq_n_s16(int16_t x)
/*@ Require -32768<=x && x<=32767
 Ensure store(&(__return.s0),short,x) * store(&(__return.s1),short,x) * store(&(__return.s2),short,x) * store(&(__return.s3),short,x) * store(&(__return.s4),short,x) * store(&(__return.s5),short,x) * store(&(__return.s6),short,x) * store(&(__return.s7),short,x) */;
int32x4_t vdupq_n_s32(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647
 Ensure store(&(__return.s0),int,x) * store(&(__return.s1),int,x) * store(&(__return.s2),int,x) * store(&(__return.s3),int,x) */;
int16x8_t vsubl_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),short,qa_s16(a0-b0)) * store(&(__return.s1),short,qa_s16(a1-b1)) * store(&(__return.s2),short,qa_s16(a2-b2)) * store(&(__return.s3),short,qa_s16(a3-b3)) * store(&(__return.s4),short,qa_s16(a4-b4)) * store(&(__return.s5),short,qa_s16(a5-b5)) * store(&(__return.s6),short,qa_s16(a6-b6)) * store(&(__return.s7),short,qa_s16(a7-b7)) */;
int16x4_t vget_low_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3) && -32768<=a4 && a4<=32767 && store(&(a.s4),short,a4) && -32768<=a5 && a5<=32767 && store(&(a.s5),short,a5) && -32768<=a6 && a6<=32767 && store(&(a.s6),short,a6) && -32768<=a7 && a7<=32767 && store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),short,a0) * store(&(__return.s1),short,a1) * store(&(__return.s2),short,a2) * store(&(__return.s3),short,a3) */;
int16x4_t vget_high_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3) && -32768<=a4 && a4<=32767 && store(&(a.s4),short,a4) && -32768<=a5 && a5<=32767 && store(&(a.s5),short,a5) && -32768<=a6 && a6<=32767 && store(&(a.s6),short,a6) && -32768<=a7 && a7<=32767 && store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),short,a4) * store(&(__return.s1),short,a5) * store(&(__return.s2),short,a6) * store(&(__return.s3),short,a7) */;
int8x8_t vget_low_s8(int8x16_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=a8 && a8<=127 && store(&(a.s8),char,a8) && -128<=a9 && a9<=127 && store(&(a.s9),char,a9) && -128<=a10 && a10<=127 && store(&(a.s10),char,a10) && -128<=a11 && a11<=127 && store(&(a.s11),char,a11) && -128<=a12 && a12<=127 && store(&(a.s12),char,a12) && -128<=a13 && a13<=127 && store(&(a.s13),char,a13) && -128<=a14 && a14<=127 && store(&(a.s14),char,a14) && -128<=a15 && a15<=127 && store(&(a.s15),char,a15)
 Ensure store(&(__return.s0),char,a0) * store(&(__return.s1),char,a1) * store(&(__return.s2),char,a2) * store(&(__return.s3),char,a3) * store(&(__return.s4),char,a4) * store(&(__return.s5),char,a5) * store(&(__return.s6),char,a6) * store(&(__return.s7),char,a7) */;
int32x4_t vmovl_s16(int16x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3)
 Ensure store(&(__return.s0),int,a0) * store(&(__return.s1),int,a1) * store(&(__return.s2),int,a2) * store(&(__return.s3),int,a3) */;
int32x4_t vmulq_s32(int32x4_t a,int32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require -2147483648<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && -2147483648<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && -2147483648<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && -2147483648<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && -2147483648<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && -2147483648<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && -2147483648<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && -2147483648<=b3 && b3<=2147483647 && store(&(b.s3),int,b3)
 Ensure store(&(__return.s0),int,qa_neon_mul(a0,b0)) * store(&(__return.s1),int,qa_neon_mul(a1,b1)) * store(&(__return.s2),int,qa_neon_mul(a2,b2)) * store(&(__return.s3),int,qa_neon_mul(a3,b3)) */;
int32x4_t vrshlq_s32(int32x4_t a,int32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require -2147483648<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && -2147483648<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && -2147483648<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && -2147483648<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && -2147483648<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && -2147483648<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && -2147483648<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && -2147483648<=b3 && b3<=2147483647 && store(&(b.s3),int,b3)
 Ensure store(&(__return.s0),int,qa_neon_shift(a0,b0)) * store(&(__return.s1),int,qa_neon_shift(a1,b1)) * store(&(__return.s2),int,qa_neon_shift(a2,b2)) * store(&(__return.s3),int,qa_neon_shift(a3,b3)) */;
int32x4_t vmlaq_s32(int32x4_t a,int32x4_t b,int32x4_t c)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (c0:Z) (c1:Z) (c2:Z) (c3:Z)
 Require -2147483648<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && -2147483648<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && -2147483648<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && -2147483648<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && -2147483648<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && -2147483648<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && -2147483648<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && -2147483648<=b3 && b3<=2147483647 && store(&(b.s3),int,b3) && -2147483648<=c0 && c0<=2147483647 && store(&(c.s0),int,c0) && -2147483648<=c1 && c1<=2147483647 && store(&(c.s1),int,c1) && -2147483648<=c2 && c2<=2147483647 && store(&(c.s2),int,c2) && -2147483648<=c3 && c3<=2147483647 && store(&(c.s3),int,c3)
 Ensure store(&(__return.s0),int,qa_neon_mla(a0,b0,c0)) * store(&(__return.s1),int,qa_neon_mla(a1,b1,c1)) * store(&(__return.s2),int,qa_neon_mla(a2,b2,c2)) * store(&(__return.s3),int,qa_neon_mla(a3,b3,c3)) */;
int16x4_t vqmovn_s32(int32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require -2147483648<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && -2147483648<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && -2147483648<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && -2147483648<=a3 && a3<=2147483647 && store(&(a.s3),int,a3)
 Ensure store(&(__return.s0),short,qa_sat16(a0)) * store(&(__return.s1),short,qa_sat16(a1)) * store(&(__return.s2),short,qa_sat16(a2)) * store(&(__return.s3),short,qa_sat16(a3)) */;
int8x8_t vqmovn_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3) && -32768<=a4 && a4<=32767 && store(&(a.s4),short,a4) && -32768<=a5 && a5<=32767 && store(&(a.s5),short,a5) && -32768<=a6 && a6<=32767 && store(&(a.s6),short,a6) && -32768<=a7 && a7<=32767 && store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),char,qa_sat8(a0)) * store(&(__return.s1),char,qa_sat8(a1)) * store(&(__return.s2),char,qa_sat8(a2)) * store(&(__return.s3),char,qa_sat8(a3)) * store(&(__return.s4),char,qa_sat8(a4)) * store(&(__return.s5),char,qa_sat8(a5)) * store(&(__return.s6),char,qa_sat8(a6)) * store(&(__return.s7),char,qa_sat8(a7)) */;
int16x8_t vqaddq_s16(int16x8_t a,int16x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3) && -32768<=a4 && a4<=32767 && store(&(a.s4),short,a4) && -32768<=a5 && a5<=32767 && store(&(a.s5),short,a5) && -32768<=a6 && a6<=32767 && store(&(a.s6),short,a6) && -32768<=a7 && a7<=32767 && store(&(a.s7),short,a7) && -32768<=b0 && b0<=32767 && store(&(b.s0),short,b0) && -32768<=b1 && b1<=32767 && store(&(b.s1),short,b1) && -32768<=b2 && b2<=32767 && store(&(b.s2),short,b2) && -32768<=b3 && b3<=32767 && store(&(b.s3),short,b3) && -32768<=b4 && b4<=32767 && store(&(b.s4),short,b4) && -32768<=b5 && b5<=32767 && store(&(b.s5),short,b5) && -32768<=b6 && b6<=32767 && store(&(b.s6),short,b6) && -32768<=b7 && b7<=32767 && store(&(b.s7),short,b7)
 Ensure store(&(__return.s0),short,qa_neon_add16(a0,b0)) * store(&(__return.s1),short,qa_neon_add16(a1,b1)) * store(&(__return.s2),short,qa_neon_add16(a2,b2)) * store(&(__return.s3),short,qa_neon_add16(a3,b3)) * store(&(__return.s4),short,qa_neon_add16(a4,b4)) * store(&(__return.s5),short,qa_neon_add16(a5,b5)) * store(&(__return.s6),short,qa_neon_add16(a6,b6)) * store(&(__return.s7),short,qa_neon_add16(a7,b7)) */;
int16x8_t vcombine_s16(int16x4_t a,int16x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3) && -32768<=b0 && b0<=32767 && store(&(b.s0),short,b0) && -32768<=b1 && b1<=32767 && store(&(b.s1),short,b1) && -32768<=b2 && b2<=32767 && store(&(b.s2),short,b2) && -32768<=b3 && b3<=32767 && store(&(b.s3),short,b3)
 Ensure store(&(__return.s0),short,a0) * store(&(__return.s1),short,a1) * store(&(__return.s2),short,a2) * store(&(__return.s3),short,a3) * store(&(__return.s4),short,b0) * store(&(__return.s5),short,b1) * store(&(__return.s6),short,b2) * store(&(__return.s7),short,b3) */;
int8x16_t vcombine_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),char,a0) * store(&(__return.s1),char,a1) * store(&(__return.s2),char,a2) * store(&(__return.s3),char,a3) * store(&(__return.s4),char,a4) * store(&(__return.s5),char,a5) * store(&(__return.s6),char,a6) * store(&(__return.s7),char,a7) * store(&(__return.s8),char,b0) * store(&(__return.s9),char,b1) * store(&(__return.s10),char,b2) * store(&(__return.s11),char,b3) * store(&(__return.s12),char,b4) * store(&(__return.s13),char,b5) * store(&(__return.s14),char,b6) * store(&(__return.s15),char,b7) */;
int8_t qcp_qa_min8(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp
 Ensure __return==qa_min(a,b) && -128<=__return && __return<=127 && emp */;
int8x8_t vmin_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),char,qa_min(a0,b0)) * store(&(__return.s1),char,qa_min(a1,b1)) * store(&(__return.s2),char,qa_min(a2,b2)) * store(&(__return.s3),char,qa_min(a3,b3)) * store(&(__return.s4),char,qa_min(a4,b4)) * store(&(__return.s5),char,qa_min(a5,b5)) * store(&(__return.s6),char,qa_min(a6,b6)) * store(&(__return.s7),char,qa_min(a7,b7)) */;
int8x16_t vminq_s8(int8x16_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=a8 && a8<=127 && store(&(a.s8),char,a8) && -128<=a9 && a9<=127 && store(&(a.s9),char,a9) && -128<=a10 && a10<=127 && store(&(a.s10),char,a10) && -128<=a11 && a11<=127 && store(&(a.s11),char,a11) && -128<=a12 && a12<=127 && store(&(a.s12),char,a12) && -128<=a13 && a13<=127 && store(&(a.s13),char,a13) && -128<=a14 && a14<=127 && store(&(a.s14),char,a14) && -128<=a15 && a15<=127 && store(&(a.s15),char,a15) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7) && -128<=b8 && b8<=127 && store(&(b.s8),char,b8) && -128<=b9 && b9<=127 && store(&(b.s9),char,b9) && -128<=b10 && b10<=127 && store(&(b.s10),char,b10) && -128<=b11 && b11<=127 && store(&(b.s11),char,b11) && -128<=b12 && b12<=127 && store(&(b.s12),char,b12) && -128<=b13 && b13<=127 && store(&(b.s13),char,b13) && -128<=b14 && b14<=127 && store(&(b.s14),char,b14) && -128<=b15 && b15<=127 && store(&(b.s15),char,b15)
 Ensure store(&(__return.s0),char,qa_min(a0,b0)) * store(&(__return.s1),char,qa_min(a1,b1)) * store(&(__return.s2),char,qa_min(a2,b2)) * store(&(__return.s3),char,qa_min(a3,b3)) * store(&(__return.s4),char,qa_min(a4,b4)) * store(&(__return.s5),char,qa_min(a5,b5)) * store(&(__return.s6),char,qa_min(a6,b6)) * store(&(__return.s7),char,qa_min(a7,b7)) * store(&(__return.s8),char,qa_min(a8,b8)) * store(&(__return.s9),char,qa_min(a9,b9)) * store(&(__return.s10),char,qa_min(a10,b10)) * store(&(__return.s11),char,qa_min(a11,b11)) * store(&(__return.s12),char,qa_min(a12,b12)) * store(&(__return.s13),char,qa_min(a13,b13)) * store(&(__return.s14),char,qa_min(a14,b14)) * store(&(__return.s15),char,qa_min(a15,b15)) */;
int8_t qcp_qa_max8(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp
 Ensure __return==qa_max(a,b) && -128<=__return && __return<=127 && emp */;
int8x8_t vmax_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),char,qa_max(a0,b0)) * store(&(__return.s1),char,qa_max(a1,b1)) * store(&(__return.s2),char,qa_max(a2,b2)) * store(&(__return.s3),char,qa_max(a3,b3)) * store(&(__return.s4),char,qa_max(a4,b4)) * store(&(__return.s5),char,qa_max(a5,b5)) * store(&(__return.s6),char,qa_max(a6,b6)) * store(&(__return.s7),char,qa_max(a7,b7)) */;
int8x16_t vmaxq_s8(int8x16_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=a8 && a8<=127 && store(&(a.s8),char,a8) && -128<=a9 && a9<=127 && store(&(a.s9),char,a9) && -128<=a10 && a10<=127 && store(&(a.s10),char,a10) && -128<=a11 && a11<=127 && store(&(a.s11),char,a11) && -128<=a12 && a12<=127 && store(&(a.s12),char,a12) && -128<=a13 && a13<=127 && store(&(a.s13),char,a13) && -128<=a14 && a14<=127 && store(&(a.s14),char,a14) && -128<=a15 && a15<=127 && store(&(a.s15),char,a15) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7) && -128<=b8 && b8<=127 && store(&(b.s8),char,b8) && -128<=b9 && b9<=127 && store(&(b.s9),char,b9) && -128<=b10 && b10<=127 && store(&(b.s10),char,b10) && -128<=b11 && b11<=127 && store(&(b.s11),char,b11) && -128<=b12 && b12<=127 && store(&(b.s12),char,b12) && -128<=b13 && b13<=127 && store(&(b.s13),char,b13) && -128<=b14 && b14<=127 && store(&(b.s14),char,b14) && -128<=b15 && b15<=127 && store(&(b.s15),char,b15)
 Ensure store(&(__return.s0),char,qa_max(a0,b0)) * store(&(__return.s1),char,qa_max(a1,b1)) * store(&(__return.s2),char,qa_max(a2,b2)) * store(&(__return.s3),char,qa_max(a3,b3)) * store(&(__return.s4),char,qa_max(a4,b4)) * store(&(__return.s5),char,qa_max(a5,b5)) * store(&(__return.s6),char,qa_max(a6,b6)) * store(&(__return.s7),char,qa_max(a7,b7)) * store(&(__return.s8),char,qa_max(a8,b8)) * store(&(__return.s9),char,qa_max(a9,b9)) * store(&(__return.s10),char,qa_max(a10,b10)) * store(&(__return.s11),char,qa_max(a11,b11)) * store(&(__return.s12),char,qa_max(a12,b12)) * store(&(__return.s13),char,qa_max(a13,b13)) * store(&(__return.s14),char,qa_max(a14,b14)) * store(&(__return.s15),char,qa_max(a15,b15)) */;
int8x8_t vdup_n_s8(int8_t x)
/*@ Require -128<=x && x<=127
 Ensure store(&(__return.s0),char,x) * store(&(__return.s1),char,x) * store(&(__return.s2),char,x) * store(&(__return.s3),char,x) * store(&(__return.s4),char,x) * store(&(__return.s5),char,x) * store(&(__return.s6),char,x) * store(&(__return.s7),char,x) */
{
 int8x8_t r;
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
int8x16_t vdupq_n_s8(int8_t x)
/*@ Require -128<=x && x<=127
 Ensure store(&(__return.s0),char,x) * store(&(__return.s1),char,x) * store(&(__return.s2),char,x) * store(&(__return.s3),char,x) * store(&(__return.s4),char,x) * store(&(__return.s5),char,x) * store(&(__return.s6),char,x) * store(&(__return.s7),char,x) * store(&(__return.s8),char,x) * store(&(__return.s9),char,x) * store(&(__return.s10),char,x) * store(&(__return.s11),char,x) * store(&(__return.s12),char,x) * store(&(__return.s13),char,x) * store(&(__return.s14),char,x) * store(&(__return.s15),char,x) */
{
 int8x16_t r;
 r.s0=x;
 r.s1=x;
 r.s2=x;
 r.s3=x;
 r.s4=x;
 r.s5=x;
 r.s6=x;
 r.s7=x;
 r.s8=x;
 r.s9=x;
 r.s10=x;
 r.s11=x;
 r.s12=x;
 r.s13=x;
 r.s14=x;
 r.s15=x;
 return r;
}
int16x8_t vdupq_n_s16(int16_t x)
/*@ Require -32768<=x && x<=32767
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
/*@ Require -2147483648<=x && x<=2147483647
 Ensure store(&(__return.s0),int,x) * store(&(__return.s1),int,x) * store(&(__return.s2),int,x) * store(&(__return.s3),int,x) */
{
 int32x4_t r;
 r.s0=x;
 r.s1=x;
 r.s2=x;
 r.s3=x;
 return r;
}
int16x8_t vsubl_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),short,qa_s16(a0-b0)) * store(&(__return.s1),short,qa_s16(a1-b1)) * store(&(__return.s2),short,qa_s16(a2-b2)) * store(&(__return.s3),short,qa_s16(a3-b3)) * store(&(__return.s4),short,qa_s16(a4-b4)) * store(&(__return.s5),short,qa_s16(a5-b5)) * store(&(__return.s6),short,qa_s16(a6-b6)) * store(&(__return.s7),short,qa_s16(a7-b7)) */
{
 int16x8_t r;
 r.s0=qcp_qa_sub8(a.s0,b.s0);
 r.s1=qcp_qa_sub8(a.s1,b.s1);
 r.s2=qcp_qa_sub8(a.s2,b.s2);
 r.s3=qcp_qa_sub8(a.s3,b.s3);
 r.s4=qcp_qa_sub8(a.s4,b.s4);
 r.s5=qcp_qa_sub8(a.s5,b.s5);
 r.s6=qcp_qa_sub8(a.s6,b.s6);
 r.s7=qcp_qa_sub8(a.s7,b.s7);
 return r;
}
int16x4_t vget_low_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3) && -32768<=a4 && a4<=32767 && store(&(a.s4),short,a4) && -32768<=a5 && a5<=32767 && store(&(a.s5),short,a5) && -32768<=a6 && a6<=32767 && store(&(a.s6),short,a6) && -32768<=a7 && a7<=32767 && store(&(a.s7),short,a7)
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
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3) && -32768<=a4 && a4<=32767 && store(&(a.s4),short,a4) && -32768<=a5 && a5<=32767 && store(&(a.s5),short,a5) && -32768<=a6 && a6<=32767 && store(&(a.s6),short,a6) && -32768<=a7 && a7<=32767 && store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),short,a4) * store(&(__return.s1),short,a5) * store(&(__return.s2),short,a6) * store(&(__return.s3),short,a7) */
{
 int16x4_t r;
 r.s0=a.s4;
 r.s1=a.s5;
 r.s2=a.s6;
 r.s3=a.s7;
 return r;
}
int8x8_t vget_low_s8(int8x16_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=a8 && a8<=127 && store(&(a.s8),char,a8) && -128<=a9 && a9<=127 && store(&(a.s9),char,a9) && -128<=a10 && a10<=127 && store(&(a.s10),char,a10) && -128<=a11 && a11<=127 && store(&(a.s11),char,a11) && -128<=a12 && a12<=127 && store(&(a.s12),char,a12) && -128<=a13 && a13<=127 && store(&(a.s13),char,a13) && -128<=a14 && a14<=127 && store(&(a.s14),char,a14) && -128<=a15 && a15<=127 && store(&(a.s15),char,a15)
 Ensure store(&(__return.s0),char,a0) * store(&(__return.s1),char,a1) * store(&(__return.s2),char,a2) * store(&(__return.s3),char,a3) * store(&(__return.s4),char,a4) * store(&(__return.s5),char,a5) * store(&(__return.s6),char,a6) * store(&(__return.s7),char,a7) */
{
 int8x8_t r;
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
int32x4_t vmovl_s16(int16x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3)
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
 Require -2147483648<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && -2147483648<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && -2147483648<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && -2147483648<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && -2147483648<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && -2147483648<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && -2147483648<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && -2147483648<=b3 && b3<=2147483647 && store(&(b.s3),int,b3)
 Ensure store(&(__return.s0),int,qa_neon_mul(a0,b0)) * store(&(__return.s1),int,qa_neon_mul(a1,b1)) * store(&(__return.s2),int,qa_neon_mul(a2,b2)) * store(&(__return.s3),int,qa_neon_mul(a3,b3)) */
{
 int32x4_t r;
 r.s0=qcp_qa_neon_mul(a.s0,b.s0);
 r.s1=qcp_qa_neon_mul(a.s1,b.s1);
 r.s2=qcp_qa_neon_mul(a.s2,b.s2);
 r.s3=qcp_qa_neon_mul(a.s3,b.s3);
 return r;
}
int32x4_t vrshlq_s32(int32x4_t a,int32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require -2147483648<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && -2147483648<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && -2147483648<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && -2147483648<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && -2147483648<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && -2147483648<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && -2147483648<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && -2147483648<=b3 && b3<=2147483647 && store(&(b.s3),int,b3)
 Ensure store(&(__return.s0),int,qa_neon_shift(a0,b0)) * store(&(__return.s1),int,qa_neon_shift(a1,b1)) * store(&(__return.s2),int,qa_neon_shift(a2,b2)) * store(&(__return.s3),int,qa_neon_shift(a3,b3)) */
{
 int32x4_t r;
 r.s0=qcp_qa_neon_shift(a.s0,b.s0);
 r.s1=qcp_qa_neon_shift(a.s1,b.s1);
 r.s2=qcp_qa_neon_shift(a.s2,b.s2);
 r.s3=qcp_qa_neon_shift(a.s3,b.s3);
 return r;
}
int32x4_t vmlaq_s32(int32x4_t a,int32x4_t b,int32x4_t c)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (c0:Z) (c1:Z) (c2:Z) (c3:Z)
 Require -2147483648<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && -2147483648<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && -2147483648<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && -2147483648<=a3 && a3<=2147483647 && store(&(a.s3),int,a3) && -2147483648<=b0 && b0<=2147483647 && store(&(b.s0),int,b0) && -2147483648<=b1 && b1<=2147483647 && store(&(b.s1),int,b1) && -2147483648<=b2 && b2<=2147483647 && store(&(b.s2),int,b2) && -2147483648<=b3 && b3<=2147483647 && store(&(b.s3),int,b3) && -2147483648<=c0 && c0<=2147483647 && store(&(c.s0),int,c0) && -2147483648<=c1 && c1<=2147483647 && store(&(c.s1),int,c1) && -2147483648<=c2 && c2<=2147483647 && store(&(c.s2),int,c2) && -2147483648<=c3 && c3<=2147483647 && store(&(c.s3),int,c3)
 Ensure store(&(__return.s0),int,qa_neon_mla(a0,b0,c0)) * store(&(__return.s1),int,qa_neon_mla(a1,b1,c1)) * store(&(__return.s2),int,qa_neon_mla(a2,b2,c2)) * store(&(__return.s3),int,qa_neon_mla(a3,b3,c3)) */
{
 int32x4_t r;
 r.s0=qcp_qa_neon_mla(a.s0,b.s0,c.s0);
 r.s1=qcp_qa_neon_mla(a.s1,b.s1,c.s1);
 r.s2=qcp_qa_neon_mla(a.s2,b.s2,c.s2);
 r.s3=qcp_qa_neon_mla(a.s3,b.s3,c.s3);
 return r;
}
int16x4_t vqmovn_s32(int32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require -2147483648<=a0 && a0<=2147483647 && store(&(a.s0),int,a0) && -2147483648<=a1 && a1<=2147483647 && store(&(a.s1),int,a1) && -2147483648<=a2 && a2<=2147483647 && store(&(a.s2),int,a2) && -2147483648<=a3 && a3<=2147483647 && store(&(a.s3),int,a3)
 Ensure store(&(__return.s0),short,qa_sat16(a0)) * store(&(__return.s1),short,qa_sat16(a1)) * store(&(__return.s2),short,qa_sat16(a2)) * store(&(__return.s3),short,qa_sat16(a3)) */
{
 int16x4_t r;
 r.s0=qcp_qa_sat16(a.s0);
 r.s1=qcp_qa_sat16(a.s1);
 r.s2=qcp_qa_sat16(a.s2);
 r.s3=qcp_qa_sat16(a.s3);
 return r;
}
int8x8_t vqmovn_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3) && -32768<=a4 && a4<=32767 && store(&(a.s4),short,a4) && -32768<=a5 && a5<=32767 && store(&(a.s5),short,a5) && -32768<=a6 && a6<=32767 && store(&(a.s6),short,a6) && -32768<=a7 && a7<=32767 && store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),char,qa_sat8(a0)) * store(&(__return.s1),char,qa_sat8(a1)) * store(&(__return.s2),char,qa_sat8(a2)) * store(&(__return.s3),char,qa_sat8(a3)) * store(&(__return.s4),char,qa_sat8(a4)) * store(&(__return.s5),char,qa_sat8(a5)) * store(&(__return.s6),char,qa_sat8(a6)) * store(&(__return.s7),char,qa_sat8(a7)) */
{
 int8x8_t r;
 r.s0=qcp_qa_sat8(a.s0);
 r.s1=qcp_qa_sat8(a.s1);
 r.s2=qcp_qa_sat8(a.s2);
 r.s3=qcp_qa_sat8(a.s3);
 r.s4=qcp_qa_sat8(a.s4);
 r.s5=qcp_qa_sat8(a.s5);
 r.s6=qcp_qa_sat8(a.s6);
 r.s7=qcp_qa_sat8(a.s7);
 return r;
}
int16x8_t vqaddq_s16(int16x8_t a,int16x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3) && -32768<=a4 && a4<=32767 && store(&(a.s4),short,a4) && -32768<=a5 && a5<=32767 && store(&(a.s5),short,a5) && -32768<=a6 && a6<=32767 && store(&(a.s6),short,a6) && -32768<=a7 && a7<=32767 && store(&(a.s7),short,a7) && -32768<=b0 && b0<=32767 && store(&(b.s0),short,b0) && -32768<=b1 && b1<=32767 && store(&(b.s1),short,b1) && -32768<=b2 && b2<=32767 && store(&(b.s2),short,b2) && -32768<=b3 && b3<=32767 && store(&(b.s3),short,b3) && -32768<=b4 && b4<=32767 && store(&(b.s4),short,b4) && -32768<=b5 && b5<=32767 && store(&(b.s5),short,b5) && -32768<=b6 && b6<=32767 && store(&(b.s6),short,b6) && -32768<=b7 && b7<=32767 && store(&(b.s7),short,b7)
 Ensure store(&(__return.s0),short,qa_neon_add16(a0,b0)) * store(&(__return.s1),short,qa_neon_add16(a1,b1)) * store(&(__return.s2),short,qa_neon_add16(a2,b2)) * store(&(__return.s3),short,qa_neon_add16(a3,b3)) * store(&(__return.s4),short,qa_neon_add16(a4,b4)) * store(&(__return.s5),short,qa_neon_add16(a5,b5)) * store(&(__return.s6),short,qa_neon_add16(a6,b6)) * store(&(__return.s7),short,qa_neon_add16(a7,b7)) */
{
 int16x8_t r;
 r.s0=qcp_qa_neon_add16(a.s0,b.s0);
 r.s1=qcp_qa_neon_add16(a.s1,b.s1);
 r.s2=qcp_qa_neon_add16(a.s2,b.s2);
 r.s3=qcp_qa_neon_add16(a.s3,b.s3);
 r.s4=qcp_qa_neon_add16(a.s4,b.s4);
 r.s5=qcp_qa_neon_add16(a.s5,b.s5);
 r.s6=qcp_qa_neon_add16(a.s6,b.s6);
 r.s7=qcp_qa_neon_add16(a.s7,b.s7);
 return r;
}
int16x8_t vcombine_s16(int16x4_t a,int16x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require -32768<=a0 && a0<=32767 && store(&(a.s0),short,a0) && -32768<=a1 && a1<=32767 && store(&(a.s1),short,a1) && -32768<=a2 && a2<=32767 && store(&(a.s2),short,a2) && -32768<=a3 && a3<=32767 && store(&(a.s3),short,a3) && -32768<=b0 && b0<=32767 && store(&(b.s0),short,b0) && -32768<=b1 && b1<=32767 && store(&(b.s1),short,b1) && -32768<=b2 && b2<=32767 && store(&(b.s2),short,b2) && -32768<=b3 && b3<=32767 && store(&(b.s3),short,b3)
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
int8x16_t vcombine_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),char,a0) * store(&(__return.s1),char,a1) * store(&(__return.s2),char,a2) * store(&(__return.s3),char,a3) * store(&(__return.s4),char,a4) * store(&(__return.s5),char,a5) * store(&(__return.s6),char,a6) * store(&(__return.s7),char,a7) * store(&(__return.s8),char,b0) * store(&(__return.s9),char,b1) * store(&(__return.s10),char,b2) * store(&(__return.s11),char,b3) * store(&(__return.s12),char,b4) * store(&(__return.s13),char,b5) * store(&(__return.s14),char,b6) * store(&(__return.s15),char,b7) */
{
 int8x16_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 r.s2=a.s2;
 r.s3=a.s3;
 r.s4=a.s4;
 r.s5=a.s5;
 r.s6=a.s6;
 r.s7=a.s7;
 r.s8=b.s0;
 r.s9=b.s1;
 r.s10=b.s2;
 r.s11=b.s3;
 r.s12=b.s4;
 r.s13=b.s5;
 r.s14=b.s6;
 r.s15=b.s7;
 return r;
}
int8_t qcp_qa_min8(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp
 Ensure __return==qa_min(a,b) && -128<=__return && __return<=127 && emp */
{if(a<b)return a;return b;}
int8x8_t vmin_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),char,qa_min(a0,b0)) * store(&(__return.s1),char,qa_min(a1,b1)) * store(&(__return.s2),char,qa_min(a2,b2)) * store(&(__return.s3),char,qa_min(a3,b3)) * store(&(__return.s4),char,qa_min(a4,b4)) * store(&(__return.s5),char,qa_min(a5,b5)) * store(&(__return.s6),char,qa_min(a6,b6)) * store(&(__return.s7),char,qa_min(a7,b7)) */
{
 int8x8_t r;
 r.s0=qcp_qa_min8(a.s0,b.s0);
 r.s1=qcp_qa_min8(a.s1,b.s1);
 r.s2=qcp_qa_min8(a.s2,b.s2);
 r.s3=qcp_qa_min8(a.s3,b.s3);
 r.s4=qcp_qa_min8(a.s4,b.s4);
 r.s5=qcp_qa_min8(a.s5,b.s5);
 r.s6=qcp_qa_min8(a.s6,b.s6);
 r.s7=qcp_qa_min8(a.s7,b.s7);
 return r;
}
int8x16_t vminq_s8(int8x16_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=a8 && a8<=127 && store(&(a.s8),char,a8) && -128<=a9 && a9<=127 && store(&(a.s9),char,a9) && -128<=a10 && a10<=127 && store(&(a.s10),char,a10) && -128<=a11 && a11<=127 && store(&(a.s11),char,a11) && -128<=a12 && a12<=127 && store(&(a.s12),char,a12) && -128<=a13 && a13<=127 && store(&(a.s13),char,a13) && -128<=a14 && a14<=127 && store(&(a.s14),char,a14) && -128<=a15 && a15<=127 && store(&(a.s15),char,a15) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7) && -128<=b8 && b8<=127 && store(&(b.s8),char,b8) && -128<=b9 && b9<=127 && store(&(b.s9),char,b9) && -128<=b10 && b10<=127 && store(&(b.s10),char,b10) && -128<=b11 && b11<=127 && store(&(b.s11),char,b11) && -128<=b12 && b12<=127 && store(&(b.s12),char,b12) && -128<=b13 && b13<=127 && store(&(b.s13),char,b13) && -128<=b14 && b14<=127 && store(&(b.s14),char,b14) && -128<=b15 && b15<=127 && store(&(b.s15),char,b15)
 Ensure store(&(__return.s0),char,qa_min(a0,b0)) * store(&(__return.s1),char,qa_min(a1,b1)) * store(&(__return.s2),char,qa_min(a2,b2)) * store(&(__return.s3),char,qa_min(a3,b3)) * store(&(__return.s4),char,qa_min(a4,b4)) * store(&(__return.s5),char,qa_min(a5,b5)) * store(&(__return.s6),char,qa_min(a6,b6)) * store(&(__return.s7),char,qa_min(a7,b7)) * store(&(__return.s8),char,qa_min(a8,b8)) * store(&(__return.s9),char,qa_min(a9,b9)) * store(&(__return.s10),char,qa_min(a10,b10)) * store(&(__return.s11),char,qa_min(a11,b11)) * store(&(__return.s12),char,qa_min(a12,b12)) * store(&(__return.s13),char,qa_min(a13,b13)) * store(&(__return.s14),char,qa_min(a14,b14)) * store(&(__return.s15),char,qa_min(a15,b15)) */
{
 int8x16_t r;
 r.s0=qcp_qa_min8(a.s0,b.s0);
 r.s1=qcp_qa_min8(a.s1,b.s1);
 r.s2=qcp_qa_min8(a.s2,b.s2);
 r.s3=qcp_qa_min8(a.s3,b.s3);
 r.s4=qcp_qa_min8(a.s4,b.s4);
 r.s5=qcp_qa_min8(a.s5,b.s5);
 r.s6=qcp_qa_min8(a.s6,b.s6);
 r.s7=qcp_qa_min8(a.s7,b.s7);
 r.s8=qcp_qa_min8(a.s8,b.s8);
 r.s9=qcp_qa_min8(a.s9,b.s9);
 r.s10=qcp_qa_min8(a.s10,b.s10);
 r.s11=qcp_qa_min8(a.s11,b.s11);
 r.s12=qcp_qa_min8(a.s12,b.s12);
 r.s13=qcp_qa_min8(a.s13,b.s13);
 r.s14=qcp_qa_min8(a.s14,b.s14);
 r.s15=qcp_qa_min8(a.s15,b.s15);
 return r;
}
int8_t qcp_qa_max8(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp
 Ensure __return==qa_max(a,b) && -128<=__return && __return<=127 && emp */
{if(a>b)return a;return b;}
int8x8_t vmax_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),char,qa_max(a0,b0)) * store(&(__return.s1),char,qa_max(a1,b1)) * store(&(__return.s2),char,qa_max(a2,b2)) * store(&(__return.s3),char,qa_max(a3,b3)) * store(&(__return.s4),char,qa_max(a4,b4)) * store(&(__return.s5),char,qa_max(a5,b5)) * store(&(__return.s6),char,qa_max(a6,b6)) * store(&(__return.s7),char,qa_max(a7,b7)) */
{
 int8x8_t r;
 r.s0=qcp_qa_max8(a.s0,b.s0);
 r.s1=qcp_qa_max8(a.s1,b.s1);
 r.s2=qcp_qa_max8(a.s2,b.s2);
 r.s3=qcp_qa_max8(a.s3,b.s3);
 r.s4=qcp_qa_max8(a.s4,b.s4);
 r.s5=qcp_qa_max8(a.s5,b.s5);
 r.s6=qcp_qa_max8(a.s6,b.s6);
 r.s7=qcp_qa_max8(a.s7,b.s7);
 return r;
}
int8x16_t vmaxq_s8(int8x16_t a,int8x16_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z)
 Require -128<=a0 && a0<=127 && store(&(a.s0),char,a0) && -128<=a1 && a1<=127 && store(&(a.s1),char,a1) && -128<=a2 && a2<=127 && store(&(a.s2),char,a2) && -128<=a3 && a3<=127 && store(&(a.s3),char,a3) && -128<=a4 && a4<=127 && store(&(a.s4),char,a4) && -128<=a5 && a5<=127 && store(&(a.s5),char,a5) && -128<=a6 && a6<=127 && store(&(a.s6),char,a6) && -128<=a7 && a7<=127 && store(&(a.s7),char,a7) && -128<=a8 && a8<=127 && store(&(a.s8),char,a8) && -128<=a9 && a9<=127 && store(&(a.s9),char,a9) && -128<=a10 && a10<=127 && store(&(a.s10),char,a10) && -128<=a11 && a11<=127 && store(&(a.s11),char,a11) && -128<=a12 && a12<=127 && store(&(a.s12),char,a12) && -128<=a13 && a13<=127 && store(&(a.s13),char,a13) && -128<=a14 && a14<=127 && store(&(a.s14),char,a14) && -128<=a15 && a15<=127 && store(&(a.s15),char,a15) && -128<=b0 && b0<=127 && store(&(b.s0),char,b0) && -128<=b1 && b1<=127 && store(&(b.s1),char,b1) && -128<=b2 && b2<=127 && store(&(b.s2),char,b2) && -128<=b3 && b3<=127 && store(&(b.s3),char,b3) && -128<=b4 && b4<=127 && store(&(b.s4),char,b4) && -128<=b5 && b5<=127 && store(&(b.s5),char,b5) && -128<=b6 && b6<=127 && store(&(b.s6),char,b6) && -128<=b7 && b7<=127 && store(&(b.s7),char,b7) && -128<=b8 && b8<=127 && store(&(b.s8),char,b8) && -128<=b9 && b9<=127 && store(&(b.s9),char,b9) && -128<=b10 && b10<=127 && store(&(b.s10),char,b10) && -128<=b11 && b11<=127 && store(&(b.s11),char,b11) && -128<=b12 && b12<=127 && store(&(b.s12),char,b12) && -128<=b13 && b13<=127 && store(&(b.s13),char,b13) && -128<=b14 && b14<=127 && store(&(b.s14),char,b14) && -128<=b15 && b15<=127 && store(&(b.s15),char,b15)
 Ensure store(&(__return.s0),char,qa_max(a0,b0)) * store(&(__return.s1),char,qa_max(a1,b1)) * store(&(__return.s2),char,qa_max(a2,b2)) * store(&(__return.s3),char,qa_max(a3,b3)) * store(&(__return.s4),char,qa_max(a4,b4)) * store(&(__return.s5),char,qa_max(a5,b5)) * store(&(__return.s6),char,qa_max(a6,b6)) * store(&(__return.s7),char,qa_max(a7,b7)) * store(&(__return.s8),char,qa_max(a8,b8)) * store(&(__return.s9),char,qa_max(a9,b9)) * store(&(__return.s10),char,qa_max(a10,b10)) * store(&(__return.s11),char,qa_max(a11,b11)) * store(&(__return.s12),char,qa_max(a12,b12)) * store(&(__return.s13),char,qa_max(a13,b13)) * store(&(__return.s14),char,qa_max(a14,b14)) * store(&(__return.s15),char,qa_max(a15,b15)) */
{
 int8x16_t r;
 r.s0=qcp_qa_max8(a.s0,b.s0);
 r.s1=qcp_qa_max8(a.s1,b.s1);
 r.s2=qcp_qa_max8(a.s2,b.s2);
 r.s3=qcp_qa_max8(a.s3,b.s3);
 r.s4=qcp_qa_max8(a.s4,b.s4);
 r.s5=qcp_qa_max8(a.s5,b.s5);
 r.s6=qcp_qa_max8(a.s6,b.s6);
 r.s7=qcp_qa_max8(a.s7,b.s7);
 r.s8=qcp_qa_max8(a.s8,b.s8);
 r.s9=qcp_qa_max8(a.s9,b.s9);
 r.s10=qcp_qa_max8(a.s10,b.s10);
 r.s11=qcp_qa_max8(a.s11,b.s11);
 r.s12=qcp_qa_max8(a.s12,b.s12);
 r.s13=qcp_qa_max8(a.s13,b.s13);
 r.s14=qcp_qa_max8(a.s14,b.s14);
 r.s15=qcp_qa_max8(a.s15,b.s15);
 return r;
}
