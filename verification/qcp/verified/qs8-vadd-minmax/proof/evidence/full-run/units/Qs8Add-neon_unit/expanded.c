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
/*@ Import Coq Require Import Qs8Add.MemoryModel */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (s8_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "s8_arrays.strategies" */
/*@ Import Coq Require Import Qs8Add.NeonStoreModel */
/*@ Extern Coq (s8_pack8:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
/*@ Extern Coq (s8_pack16:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
/*@ Import Coq Require Import Qs8Add.ByteBridge */
/*@ Extern Coq (s8_le_byte0:Z -> Z) (s8_le_byte1:Z -> Z)
               (s8_le_byte2:Z -> Z) (s8_le_byte3:Z -> Z) */
/*@ include strategies "signed_tail.strategies" */
int8x8_t qcp_s8_ext2(const int8x8_t *a,const int8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
    Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(__return.s0),char,x2) * store(&(__return.s1),char,x3) * store(&(__return.s2),char,x4) * store(&(__return.s3),char,x5) * store(&(__return.s4),char,x6) * store(&(__return.s5),char,x7) * store(&(__return.s6),char,x0) * store(&(__return.s7),char,x1) */;
int8x8_t qcp_s8_ext4(const int8x8_t *a,const int8x8_t *b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
    Require a==b && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
    Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(__return.s0),char,x4) * store(&(__return.s1),char,x5) * store(&(__return.s2),char,x6) * store(&(__return.s3),char,x7) * store(&(__return.s4),char,x0) * store(&(__return.s5),char,x1) * store(&(__return.s6),char,x2) * store(&(__return.s7),char,x3) */;
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
/*@ Import Coq Require Import Qs8Add.ProgramModel */
/*@ Extern Coq (qa_values:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z -> list Z -> list Z)
 (qa_neon_lane:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z)
 (qa_outputs_related:list Z -> list Z -> Prop) */
void qcp_qa_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */;
/*@ include strategies "s8_neon_memory.strategies" */
/*@ Import Coq Require Import Qs8Add.ComposedModel */
/*@ Extern Coq (qa_pack1:Z -> list Z) (qa_pack2:Z -> Z -> list Z) (qa_pack4:Z -> Z -> Z -> Z -> list Z) */
void qcp_qa_store4_0(int8_t *p,const int8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,4) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7)
 Ensure CharArray::full(p,4,qa_pack4(x0,x1,x2,x3)) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7) */;
void qcp_qa_store2_0(int8_t *p,const int8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,2) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7)
 Ensure CharArray::full(p,2,qa_pack2(x0,x1)) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7) */;
void qcp_qa_store1_0(int8_t *p,const int8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,1) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7)
 Ensure CharArray::full(p,1,qa_pack1(x0)) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7) */;
/* Frozen pure variable arguments only: borrow the source vector once, copy all
   eight actual fields in checked C, then evaluate the original nested body. */
/*@ Extern Coq (qa_negword:Z -> Z) (qa_ctrl:Z -> Z) */
/*@ Import Coq Require Import Qs8Add.ControlFacts */
/*
struct xnn_qs8_add_minmax_params {
  struct {
    int8_t a_zero_point;
    int8_t b_zero_point;
    int32_t bias;
    int32_t a_multiplier;
    int32_t b_multiplier;
    int32_t shift;
    int16_t output_zero_point;
    int8_t output_min;
    int8_t output_max;
  } scalar;
};
*/
void test_neon(
    size_t batch,
    const int8_t* input_a,
    const int8_t* input_b,
    int8_t* output,
    const struct xnn_qs8_add_minmax_params* restrict params)
/*@ With (A:list Z) (B:list Z) (Az:Z) (Bz:Z) (RawBias:Z) (Ma:Z) (Mb:Z) (RawShift:Z) (Oz:Z) (Lo:Z) (Hi:Z)
 Require 0<batch && batch<=18446744073709551608 && input_a!=0 && input_b!=0 && output!=0 && params!=0 && (-128)<=Az && Az<=127 && (-128)<=Bz && Bz<=127 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (-128)<=Lo && Lo<=127 && (-128)<=Hi && Hi<=127 &&
 CharArray::full(input_a,batch+7,A) * CharArray::full(input_b,batch+7,B) * CharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),char,Az) * store(&(params->scalar.b_zero_point),char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi)
 Ensure CharArray::full(input_a,batch+7,A) * CharArray::full(input_b,batch+7,B) * CharArray::full(output,batch,qa_values(batch,Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * store(&(params->scalar.a_zero_point),char,Az) * store(&(params->scalar.b_zero_point),char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi) */
{
/*@ Assert Zlength(A)==batch@pre+7 && Zlength(B)==batch@pre+7 && sizeof(int8_t)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<=batch && batch<=batch@pre && 0<=(batch@pre-batch) && params==params@pre && params!=0 && (-128)<=Az && Az<=127 && (-128)<=Bz && Bz<=127 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (-128)<=Lo && Lo<=127 && (-128)<=Hi && Hi<=127 && batch%sizeof(int8_t)==0 && input_a!=0 && input_b!=0 && output!=0 && batch==batch@pre && input_a==input_a@pre && input_b==input_b@pre && output==output@pre && CharArray::full(input_a@pre,batch@pre+7,A) * CharArray::full(input_b@pre,batch@pre+7,B) * CharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),char,Az) * store(&(params->scalar.b_zero_point),char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi) */
  qcp_qa_assert((batch != 0));
  qcp_qa_assert((batch % sizeof(int8_t) == 0));
  qcp_qa_assert((input_a != ((void*)0)));
  qcp_qa_assert((input_b != ((void*)0)));
  qcp_qa_assert((output != ((void*)0)));
  const int8x8_t va_zero_point = vdup_n_s8(params->scalar.a_zero_point);
  const int8x8_t vb_zero_point = vdup_n_s8(params->scalar.b_zero_point);
  const int32x4_t va_multiplier = vdupq_n_s32(params->scalar.a_multiplier);
  const int32x4_t vb_multiplier = vdupq_n_s32(params->scalar.b_multiplier);
  int32_t right_shift = -(params->scalar.shift % 256);
  if (right_shift > 127) right_shift -= 256;
  if (right_shift < -128) right_shift += 256;
  const int32x4_t vright_shift = vdupq_n_s32(right_shift);
  const int16x8_t voutput_zero_point = vdupq_n_s16(params->scalar.output_zero_point);
  const int8x16_t voutput_min = vdupq_n_s8(params->scalar.output_min);
  const int8x16_t voutput_max = vdupq_n_s8(params->scalar.output_max);
/*@ Inv Assert Zlength(A)==batch@pre+7 && Zlength(B)==batch@pre+7 && sizeof(int8_t)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<=batch && batch<=batch@pre && 0<=(batch@pre-batch) && params==params@pre && params!=0 && (-128)<=Az && Az<=127 && (-128)<=Bz && Bz<=127 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (-128)<=Lo && Lo<=127 && (-128)<=Hi && Hi<=127 && ((batch>0 && input_a==input_a@pre+(batch@pre-batch) && input_b==input_b@pre+(batch@pre-batch) && output==output@pre+(batch@pre-batch)) || batch==0) && right_shift==qa_ctrl(RawShift) && input_a@pre<=input_a && input_a<=input_a@pre+batch@pre+7 && input_b@pre<=input_b && input_b<=input_b@pre+batch@pre+7 && CharArray::full(input_a@pre,batch@pre+7,A) * CharArray::full(input_b@pre,batch@pre+7,B) * CharArray::full(output@pre,(batch@pre-batch),qa_values((batch@pre-batch),Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * CharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),char,Az) * store(&(params->scalar.b_zero_point),char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi) * store(&(va_zero_point.s0),char,Az) * store(&(va_zero_point.s1),char,Az) * store(&(va_zero_point.s2),char,Az) * store(&(va_zero_point.s3),char,Az) * store(&(va_zero_point.s4),char,Az) * store(&(va_zero_point.s5),char,Az) * store(&(va_zero_point.s6),char,Az) * store(&(va_zero_point.s7),char,Az) * store(&(vb_zero_point.s0),char,Bz) * store(&(vb_zero_point.s1),char,Bz) * store(&(vb_zero_point.s2),char,Bz) * store(&(vb_zero_point.s3),char,Bz) * store(&(vb_zero_point.s4),char,Bz) * store(&(vb_zero_point.s5),char,Bz) * store(&(vb_zero_point.s6),char,Bz) * store(&(vb_zero_point.s7),char,Bz) * store(&(va_multiplier.s0),int,Ma) * store(&(va_multiplier.s1),int,Ma) * store(&(va_multiplier.s2),int,Ma) * store(&(va_multiplier.s3),int,Ma) * store(&(vb_multiplier.s0),int,Mb) * store(&(vb_multiplier.s1),int,Mb) * store(&(vb_multiplier.s2),int,Mb) * store(&(vb_multiplier.s3),int,Mb) * store(&(vright_shift.s0),int,qa_ctrl(RawShift)) * store(&(vright_shift.s1),int,qa_ctrl(RawShift)) * store(&(vright_shift.s2),int,qa_ctrl(RawShift)) * store(&(vright_shift.s3),int,qa_ctrl(RawShift)) * store(&(voutput_zero_point.s0),short,Oz) * store(&(voutput_zero_point.s1),short,Oz) * store(&(voutput_zero_point.s2),short,Oz) * store(&(voutput_zero_point.s3),short,Oz) * store(&(voutput_zero_point.s4),short,Oz) * store(&(voutput_zero_point.s5),short,Oz) * store(&(voutput_zero_point.s6),short,Oz) * store(&(voutput_zero_point.s7),short,Oz) * store(&(voutput_min.s0),char,Lo) * store(&(voutput_min.s1),char,Lo) * store(&(voutput_min.s2),char,Lo) * store(&(voutput_min.s3),char,Lo) * store(&(voutput_min.s4),char,Lo) * store(&(voutput_min.s5),char,Lo) * store(&(voutput_min.s6),char,Lo) * store(&(voutput_min.s7),char,Lo) * store(&(voutput_min.s8),char,Lo) * store(&(voutput_min.s9),char,Lo) * store(&(voutput_min.s10),char,Lo) * store(&(voutput_min.s11),char,Lo) * store(&(voutput_min.s12),char,Lo) * store(&(voutput_min.s13),char,Lo) * store(&(voutput_min.s14),char,Lo) * store(&(voutput_min.s15),char,Lo) * store(&(voutput_max.s0),char,Hi) * store(&(voutput_max.s1),char,Hi) * store(&(voutput_max.s2),char,Hi) * store(&(voutput_max.s3),char,Hi) * store(&(voutput_max.s4),char,Hi) * store(&(voutput_max.s5),char,Hi) * store(&(voutput_max.s6),char,Hi) * store(&(voutput_max.s7),char,Hi) * store(&(voutput_max.s8),char,Hi) * store(&(voutput_max.s9),char,Hi) * store(&(voutput_max.s10),char,Hi) * store(&(voutput_max.s11),char,Hi) * store(&(voutput_max.s12),char,Hi) * store(&(voutput_max.s13),char,Hi) * store(&(voutput_max.s14),char,Hi) * store(&(voutput_max.s15),char,Hi) */
  for (; batch >= 16 * sizeof(int8_t); batch -= 16 * sizeof(int8_t)) {
    const int8x8_t va01234567 = qcp_s8_load8((input_a)) /*@ where base=input_a@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */; input_a += 8;
    const int8x8_t vb01234567 = qcp_s8_load8((input_b)) /*@ where base=input_b@pre,count=batch@pre+7,idx=batch@pre-batch,L=B */; input_b += 8;
    const int8x8_t va89ABCDEF = qcp_s8_load8((input_a)) /*@ where base=input_a@pre,count=batch@pre+7,idx=batch@pre-batch+8,L=A */; input_a += 8;
    const int8x8_t vb89ABCDEF = qcp_s8_load8((input_b)) /*@ where base=input_b@pre,count=batch@pre+7,idx=batch@pre-batch+8,L=B */; input_b += 8;
    const int16x8_t vxa01234567 = vsubl_s8(va01234567, va_zero_point) /*@ where a=&va01234567,b=&va_zero_point */;
    const int16x8_t vxb01234567 = vsubl_s8(vb01234567, vb_zero_point) /*@ where a=&vb01234567,b=&vb_zero_point */;
    const int16x8_t vxa89ABCDEF = vsubl_s8(va89ABCDEF, va_zero_point) /*@ where a=&va89ABCDEF,b=&va_zero_point */;
    const int16x8_t vxb89ABCDEF = vsubl_s8(vb89ABCDEF, vb_zero_point) /*@ where a=&vb89ABCDEF,b=&vb_zero_point */;
    int32x4_t vacc0123 = vmulq_s32(vmovl_s16(vget_low_s16(vxa01234567) /*@ where a=&vxa01234567 */) /*@ where a=0 */, va_multiplier) /*@ where a=0,b=&va_multiplier */;
    int32x4_t vacc4567 = vmulq_s32(vmovl_s16(vget_high_s16(vxa01234567) /*@ where a=&vxa01234567 */) /*@ where a=0 */, va_multiplier) /*@ where a=0,b=&va_multiplier */;
    int32x4_t vacc89AB = vmulq_s32(vmovl_s16(vget_low_s16(vxa89ABCDEF) /*@ where a=&vxa89ABCDEF */) /*@ where a=0 */, va_multiplier) /*@ where a=0,b=&va_multiplier */;
    int32x4_t vaccCDEF = vmulq_s32(vmovl_s16(vget_high_s16(vxa89ABCDEF) /*@ where a=&vxa89ABCDEF */) /*@ where a=0 */, va_multiplier) /*@ where a=0,b=&va_multiplier */;
    vacc0123 = vmlaq_s32(vacc0123, vmovl_s16(vget_low_s16(vxb01234567) /*@ where a=&vxb01234567 */) /*@ where a=0 */, vb_multiplier) /*@ where a=&vacc0123,b=0,c=&vb_multiplier */;
    vacc4567 = vmlaq_s32(vacc4567, vmovl_s16(vget_high_s16(vxb01234567) /*@ where a=&vxb01234567 */) /*@ where a=0 */, vb_multiplier) /*@ where a=&vacc4567,b=0,c=&vb_multiplier */;
    vacc89AB = vmlaq_s32(vacc89AB, vmovl_s16(vget_low_s16(vxb89ABCDEF) /*@ where a=&vxb89ABCDEF */) /*@ where a=0 */, vb_multiplier) /*@ where a=&vacc89AB,b=0,c=&vb_multiplier */;
    vaccCDEF = vmlaq_s32(vaccCDEF, vmovl_s16(vget_high_s16(vxb89ABCDEF) /*@ where a=&vxb89ABCDEF */) /*@ where a=0 */, vb_multiplier) /*@ where a=&vaccCDEF,b=0,c=&vb_multiplier */;
    vacc0123 = vrshlq_s32(vacc0123, vright_shift) /*@ where a=&vacc0123,b=&vright_shift */;
    vacc4567 = vrshlq_s32(vacc4567, vright_shift) /*@ where a=&vacc4567,b=&vright_shift */;
    vacc89AB = vrshlq_s32(vacc89AB, vright_shift) /*@ where a=&vacc89AB,b=&vright_shift */;
    vaccCDEF = vrshlq_s32(vaccCDEF, vright_shift) /*@ where a=&vaccCDEF,b=&vright_shift */;
    const int16x8_t vacc01234567 = vqaddq_s16(vcombine_s16(vqmovn_s32(vacc0123) /*@ where a=&vacc0123 */, vqmovn_s32(vacc4567) /*@ where a=&vacc4567 */) /*@ where a=0,b=0 */, voutput_zero_point) /*@ where a=0,b=&voutput_zero_point */;
    const int16x8_t vacc89ABCDEF = vqaddq_s16(vcombine_s16(vqmovn_s32(vacc89AB) /*@ where a=&vacc89AB */, vqmovn_s32(vaccCDEF) /*@ where a=&vaccCDEF */) /*@ where a=0,b=0 */, voutput_zero_point) /*@ where a=0,b=&voutput_zero_point */;
    int8x16_t vout0123456789ABCDEF = vcombine_s8(vqmovn_s16(vacc01234567) /*@ where a=&vacc01234567 */, vqmovn_s16(vacc89ABCDEF) /*@ where a=&vacc89ABCDEF */) /*@ where a=0,b=0 */;
    vout0123456789ABCDEF = vmaxq_s8(vout0123456789ABCDEF, voutput_min) /*@ where a=&vout0123456789ABCDEF,b=&voutput_min */;
    vout0123456789ABCDEF = vminq_s8(vout0123456789ABCDEF, voutput_max) /*@ where a=&vout0123456789ABCDEF,b=&voutput_max */;
    qcp_s8_store16((output),&(vout0123456789ABCDEF)); output += 16;
  }
  if (batch != 0) {
/*@ Assert Zlength(A)==batch@pre+7 && Zlength(B)==batch@pre+7 && sizeof(int8_t)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<=batch && batch<=batch@pre && 0<=(batch@pre-batch) && params==params@pre && params!=0 && (-128)<=Az && Az<=127 && (-128)<=Bz && Bz<=127 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (-128)<=Lo && Lo<=127 && (-128)<=Hi && Hi<=127 && (batch>0 && input_a==input_a@pre+(batch@pre-batch) && input_b==input_b@pre+(batch@pre-batch) && output==output@pre+(batch@pre-batch)) && right_shift==qa_ctrl(RawShift) && input_a@pre<=input_a && input_a<=input_a@pre+batch@pre+7 && input_b@pre<=input_b && input_b<=input_b@pre+batch@pre+7 && batch<16 && ((batch==1 && (batch & (4 * sizeof(int8_t)))==0 && (batch & (2 * sizeof(int8_t)))==0 && (batch & (1 * sizeof(int8_t)))==1) || (batch==2 && (batch & (4 * sizeof(int8_t)))==0 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==0) || (batch==3 && (batch & (4 * sizeof(int8_t)))==0 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==1) || (batch==4 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==0 && (batch & (1 * sizeof(int8_t)))==0) || (batch==5 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==0 && (batch & (1 * sizeof(int8_t)))==1) || (batch==6 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==0) || (batch==7 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==1) || (batch==8 && (batch & (4 * sizeof(int8_t)))==0 && (batch & (2 * sizeof(int8_t)))==0 && (batch & (1 * sizeof(int8_t)))==0) || (batch==9 && (batch & (4 * sizeof(int8_t)))==0 && (batch & (2 * sizeof(int8_t)))==0 && (batch & (1 * sizeof(int8_t)))==1) || (batch==10 && (batch & (4 * sizeof(int8_t)))==0 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==0) || (batch==11 && (batch & (4 * sizeof(int8_t)))==0 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==1) || (batch==12 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==0 && (batch & (1 * sizeof(int8_t)))==0) || (batch==13 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==0 && (batch & (1 * sizeof(int8_t)))==1) || (batch==14 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==0) || (batch==15 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==1)) && CharArray::full(input_a@pre,batch@pre+7,A) * CharArray::full(input_b@pre,batch@pre+7,B) * CharArray::full(output@pre,(batch@pre-batch),qa_values((batch@pre-batch),Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * CharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),char,Az) * store(&(params->scalar.b_zero_point),char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi) * store(&(va_zero_point.s0),char,Az) * store(&(va_zero_point.s1),char,Az) * store(&(va_zero_point.s2),char,Az) * store(&(va_zero_point.s3),char,Az) * store(&(va_zero_point.s4),char,Az) * store(&(va_zero_point.s5),char,Az) * store(&(va_zero_point.s6),char,Az) * store(&(va_zero_point.s7),char,Az) * store(&(vb_zero_point.s0),char,Bz) * store(&(vb_zero_point.s1),char,Bz) * store(&(vb_zero_point.s2),char,Bz) * store(&(vb_zero_point.s3),char,Bz) * store(&(vb_zero_point.s4),char,Bz) * store(&(vb_zero_point.s5),char,Bz) * store(&(vb_zero_point.s6),char,Bz) * store(&(vb_zero_point.s7),char,Bz) * store(&(va_multiplier.s0),int,Ma) * store(&(va_multiplier.s1),int,Ma) * store(&(va_multiplier.s2),int,Ma) * store(&(va_multiplier.s3),int,Ma) * store(&(vb_multiplier.s0),int,Mb) * store(&(vb_multiplier.s1),int,Mb) * store(&(vb_multiplier.s2),int,Mb) * store(&(vb_multiplier.s3),int,Mb) * store(&(vright_shift.s0),int,qa_ctrl(RawShift)) * store(&(vright_shift.s1),int,qa_ctrl(RawShift)) * store(&(vright_shift.s2),int,qa_ctrl(RawShift)) * store(&(vright_shift.s3),int,qa_ctrl(RawShift)) * store(&(voutput_zero_point.s0),short,Oz) * store(&(voutput_zero_point.s1),short,Oz) * store(&(voutput_zero_point.s2),short,Oz) * store(&(voutput_zero_point.s3),short,Oz) * store(&(voutput_zero_point.s4),short,Oz) * store(&(voutput_zero_point.s5),short,Oz) * store(&(voutput_zero_point.s6),short,Oz) * store(&(voutput_zero_point.s7),short,Oz) * store(&(voutput_min.s0),char,Lo) * store(&(voutput_min.s1),char,Lo) * store(&(voutput_min.s2),char,Lo) * store(&(voutput_min.s3),char,Lo) * store(&(voutput_min.s4),char,Lo) * store(&(voutput_min.s5),char,Lo) * store(&(voutput_min.s6),char,Lo) * store(&(voutput_min.s7),char,Lo) * store(&(voutput_min.s8),char,Lo) * store(&(voutput_min.s9),char,Lo) * store(&(voutput_min.s10),char,Lo) * store(&(voutput_min.s11),char,Lo) * store(&(voutput_min.s12),char,Lo) * store(&(voutput_min.s13),char,Lo) * store(&(voutput_min.s14),char,Lo) * store(&(voutput_min.s15),char,Lo) * store(&(voutput_max.s0),char,Hi) * store(&(voutput_max.s1),char,Hi) * store(&(voutput_max.s2),char,Hi) * store(&(voutput_max.s3),char,Hi) * store(&(voutput_max.s4),char,Hi) * store(&(voutput_max.s5),char,Hi) * store(&(voutput_max.s6),char,Hi) * store(&(voutput_max.s7),char,Hi) * store(&(voutput_max.s8),char,Hi) * store(&(voutput_max.s9),char,Hi) * store(&(voutput_max.s10),char,Hi) * store(&(voutput_max.s11),char,Hi) * store(&(voutput_max.s12),char,Hi) * store(&(voutput_max.s13),char,Hi) * store(&(voutput_max.s14),char,Hi) * store(&(voutput_max.s15),char,Hi) */
    do {
      const int8x8_t va01234567 = qcp_s8_load8((input_a)) /*@ where base=input_a@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */; input_a += 8;
      const int8x8_t vb01234567 = qcp_s8_load8((input_b)) /*@ where base=input_b@pre,count=batch@pre+7,idx=batch@pre-batch,L=B */; input_b += 8;
      const int16x8_t vxa01234567 = vsubl_s8(va01234567, va_zero_point) /*@ where a=&va01234567,b=&va_zero_point */;
      const int16x8_t vxb01234567 = vsubl_s8(vb01234567, vb_zero_point) /*@ where a=&vb01234567,b=&vb_zero_point */;
      int32x4_t vacc0123 = vmulq_s32(vmovl_s16(vget_low_s16(vxa01234567) /*@ where a=&vxa01234567 */) /*@ where a=0 */, va_multiplier) /*@ where a=0,b=&va_multiplier */;
      int32x4_t vacc4567 = vmulq_s32(vmovl_s16(vget_high_s16(vxa01234567) /*@ where a=&vxa01234567 */) /*@ where a=0 */, va_multiplier) /*@ where a=0,b=&va_multiplier */;
      vacc0123 = vmlaq_s32(vacc0123, vmovl_s16(vget_low_s16(vxb01234567) /*@ where a=&vxb01234567 */) /*@ where a=0 */, vb_multiplier) /*@ where a=&vacc0123,b=0,c=&vb_multiplier */;
      vacc4567 = vmlaq_s32(vacc4567, vmovl_s16(vget_high_s16(vxb01234567) /*@ where a=&vxb01234567 */) /*@ where a=0 */, vb_multiplier) /*@ where a=&vacc4567,b=0,c=&vb_multiplier */;
      vacc0123 = vrshlq_s32(vacc0123, vright_shift) /*@ where a=&vacc0123,b=&vright_shift */;
      vacc4567 = vrshlq_s32(vacc4567, vright_shift) /*@ where a=&vacc4567,b=&vright_shift */;
      const int16x8_t vacc01234567 = vqaddq_s16(vcombine_s16(vqmovn_s32(vacc0123) /*@ where a=&vacc0123 */, vqmovn_s32(vacc4567) /*@ where a=&vacc4567 */) /*@ where a=0,b=0 */, voutput_zero_point) /*@ where a=0,b=&voutput_zero_point */;
      int8x8_t vout01234567 = vqmovn_s16(vacc01234567) /*@ where a=&vacc01234567 */;
      vout01234567 = vmax_s8(vout01234567, vget_low_s8(voutput_min) /*@ where a=&voutput_min */) /*@ where a=&vout01234567,b=0 */;
      vout01234567 = vmin_s8(vout01234567, vget_low_s8(voutput_max) /*@ where a=&voutput_max */) /*@ where a=&vout01234567,b=0 */;
      if (batch >= (8 * sizeof(int8_t))) {
        qcp_s8_store8((output),&(vout01234567)); output += 8;
        batch -= 8 * sizeof(int8_t);
      } else {
        if (batch & (4 * sizeof(int8_t))) {
          qcp_qa_store4_0((int8_t*)((void*) output),&(vout01234567)); output += 4;
          vout01234567 = qcp_s8_ext4(&(vout01234567),&(vout01234567));
        }
        if (batch & (2 * sizeof(int8_t))) {
          qcp_qa_store2_0((int8_t*)((void*) output),&(vout01234567)); output += 2;
          vout01234567 = qcp_s8_ext2(&(vout01234567),&(vout01234567));
        }
        if (batch & (1 * sizeof(int8_t))) {
          qcp_qa_store1_0((output),&(vout01234567));
        }
        batch = 0;
      }
    } /*@ Inv Assert Zlength(A)==batch@pre+7 && Zlength(B)==batch@pre+7 && sizeof(int8_t)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<=batch && batch<=batch@pre && 0<=(batch@pre-batch) && params==params@pre && params!=0 && (-128)<=Az && Az<=127 && (-128)<=Bz && Bz<=127 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (-128)<=Lo && Lo<=127 && (-128)<=Hi && Hi<=127 && ((batch>0 && input_a==input_a@pre+(batch@pre-batch) && input_b==input_b@pre+(batch@pre-batch) && output==output@pre+(batch@pre-batch)) || batch==0) && right_shift==qa_ctrl(RawShift) && input_a@pre<=input_a && input_a<=input_a@pre+batch@pre+7 && input_b@pre<=input_b && input_b<=input_b@pre+batch@pre+7 && batch<16 && ((batch==0 && (batch & (4 * sizeof(int8_t)))==0 && (batch & (2 * sizeof(int8_t)))==0 && (batch & (1 * sizeof(int8_t)))==0) || (batch==1 && (batch & (4 * sizeof(int8_t)))==0 && (batch & (2 * sizeof(int8_t)))==0 && (batch & (1 * sizeof(int8_t)))==1) || (batch==2 && (batch & (4 * sizeof(int8_t)))==0 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==0) || (batch==3 && (batch & (4 * sizeof(int8_t)))==0 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==1) || (batch==4 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==0 && (batch & (1 * sizeof(int8_t)))==0) || (batch==5 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==0 && (batch & (1 * sizeof(int8_t)))==1) || (batch==6 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==0) || (batch==7 && (batch & (4 * sizeof(int8_t)))==4 && (batch & (2 * sizeof(int8_t)))==2 && (batch & (1 * sizeof(int8_t)))==1)) && CharArray::full(input_a@pre,batch@pre+7,A) * CharArray::full(input_b@pre,batch@pre+7,B) * CharArray::full(output@pre,(batch@pre-batch),qa_values((batch@pre-batch),Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * CharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),char,Az) * store(&(params->scalar.b_zero_point),char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi) * store(&(va_zero_point.s0),char,Az) * store(&(va_zero_point.s1),char,Az) * store(&(va_zero_point.s2),char,Az) * store(&(va_zero_point.s3),char,Az) * store(&(va_zero_point.s4),char,Az) * store(&(va_zero_point.s5),char,Az) * store(&(va_zero_point.s6),char,Az) * store(&(va_zero_point.s7),char,Az) * store(&(vb_zero_point.s0),char,Bz) * store(&(vb_zero_point.s1),char,Bz) * store(&(vb_zero_point.s2),char,Bz) * store(&(vb_zero_point.s3),char,Bz) * store(&(vb_zero_point.s4),char,Bz) * store(&(vb_zero_point.s5),char,Bz) * store(&(vb_zero_point.s6),char,Bz) * store(&(vb_zero_point.s7),char,Bz) * store(&(va_multiplier.s0),int,Ma) * store(&(va_multiplier.s1),int,Ma) * store(&(va_multiplier.s2),int,Ma) * store(&(va_multiplier.s3),int,Ma) * store(&(vb_multiplier.s0),int,Mb) * store(&(vb_multiplier.s1),int,Mb) * store(&(vb_multiplier.s2),int,Mb) * store(&(vb_multiplier.s3),int,Mb) * store(&(vright_shift.s0),int,qa_ctrl(RawShift)) * store(&(vright_shift.s1),int,qa_ctrl(RawShift)) * store(&(vright_shift.s2),int,qa_ctrl(RawShift)) * store(&(vright_shift.s3),int,qa_ctrl(RawShift)) * store(&(voutput_zero_point.s0),short,Oz) * store(&(voutput_zero_point.s1),short,Oz) * store(&(voutput_zero_point.s2),short,Oz) * store(&(voutput_zero_point.s3),short,Oz) * store(&(voutput_zero_point.s4),short,Oz) * store(&(voutput_zero_point.s5),short,Oz) * store(&(voutput_zero_point.s6),short,Oz) * store(&(voutput_zero_point.s7),short,Oz) * store(&(voutput_min.s0),char,Lo) * store(&(voutput_min.s1),char,Lo) * store(&(voutput_min.s2),char,Lo) * store(&(voutput_min.s3),char,Lo) * store(&(voutput_min.s4),char,Lo) * store(&(voutput_min.s5),char,Lo) * store(&(voutput_min.s6),char,Lo) * store(&(voutput_min.s7),char,Lo) * store(&(voutput_min.s8),char,Lo) * store(&(voutput_min.s9),char,Lo) * store(&(voutput_min.s10),char,Lo) * store(&(voutput_min.s11),char,Lo) * store(&(voutput_min.s12),char,Lo) * store(&(voutput_min.s13),char,Lo) * store(&(voutput_min.s14),char,Lo) * store(&(voutput_min.s15),char,Lo) * store(&(voutput_max.s0),char,Hi) * store(&(voutput_max.s1),char,Hi) * store(&(voutput_max.s2),char,Hi) * store(&(voutput_max.s3),char,Hi) * store(&(voutput_max.s4),char,Hi) * store(&(voutput_max.s5),char,Hi) * store(&(voutput_max.s6),char,Hi) * store(&(voutput_max.s7),char,Hi) * store(&(voutput_max.s8),char,Hi) * store(&(voutput_max.s9),char,Hi) * store(&(voutput_max.s10),char,Hi) * store(&(voutput_max.s11),char,Hi) * store(&(voutput_max.s12),char,Hi) * store(&(voutput_max.s13),char,Hi) * store(&(voutput_max.s14),char,Hi) * store(&(voutput_max.s15),char,Hi) && batch<8 */ while (batch != 0);
  }
}
