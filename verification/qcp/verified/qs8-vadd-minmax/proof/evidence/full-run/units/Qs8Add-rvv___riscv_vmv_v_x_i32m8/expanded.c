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
/*@ Import Coq Require Import Qs8Add.RvvActiveModel */
/*@ Extern Coq (qa_active_sub:Z -> Z -> Z -> Z -> Z) */
int16_t qcp_qa_active_sub(int8_t a,int8_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -128<=a && a<=127 && -128<=b && b<=127 && emp
 Ensure __return==qa_active_sub(i,vl,a,b) && -32768<=__return && __return<=32767 && emp */;
/*@ Extern Coq (qa_active_sext:Z -> Z -> Z -> Z) */
int32_t qcp_qa_active_sext(int16_t a,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -32768<=a && a<=32767 && emp
 Ensure __return==qa_active_sext(i,vl,a) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qa_active_mul:Z -> Z -> Z -> Z -> Z) */
int32_t qcp_qa_active_mul(int32_t a,int32_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp
 Ensure __return==qa_active_mul(i,vl,a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qa_active_macc:Z -> Z -> Z -> Z -> Z -> Z) */
int32_t qcp_qa_active_macc(int32_t a,int32_t c,int32_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && -2147483648<=c && c<=2147483647 && -2147483648<=b && b<=2147483647 && emp
 Ensure __return==qa_active_macc(i,vl,a,c,b) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qa_active_mov:Z -> Z -> Z -> Z) */
int32_t qcp_qa_active_mov(int32_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=b && b<=2147483647 && emp
 Ensure __return==qa_active_mov(i,vl,b) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qa_active_rnu:Z -> Z -> Z -> Z -> Z) */
int32_t qcp_qa_active_rnu(int32_t a,size_t d,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp
 Ensure __return==qa_active_rnu(i,vl,a,d) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qa_active_sll:Z -> Z -> Z -> Z -> Z) */
int32_t qcp_qa_active_sll(int32_t a,size_t d,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp
 Ensure __return==qa_active_sll(i,vl,a,d) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qa_active_clip16:Z -> Z -> Z -> Z) */
int16_t qcp_qa_active_clip16(int32_t a,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && emp
 Ensure __return==qa_active_clip16(i,vl,a) && -32768<=__return && __return<=32767 && emp */;
/*@ Extern Coq (qa_active_add:Z -> Z -> Z -> Z -> Z) */
int16_t qcp_qa_active_add(int16_t a,int16_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qa_active_add(i,vl,a,b) && -32768<=__return && __return<=32767 && emp */;
/*@ Extern Coq (qa_active_clip8:Z -> Z -> Z -> Z) */
int8_t qcp_qa_active_clip8(int16_t a,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -32768<=a && a<=32767 && emp
 Ensure __return==qa_active_clip8(i,vl,a) && -128<=__return && __return<=127 && emp */;
/*@ Extern Coq (qa_active_max:Z -> Z -> Z -> Z -> Z) */
int8_t qcp_qa_active_max(int8_t a,int8_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -128<=a && a<=127 && -128<=b && b<=127 && emp
 Ensure __return==qa_active_max(i,vl,a,b) && -128<=__return && __return<=127 && emp */;
/*@ Extern Coq (qa_active_min:Z -> Z -> Z -> Z -> Z) */
int8_t qcp_qa_active_min(int8_t a,int8_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -128<=a && a<=127 && -128<=b && b<=127 && emp
 Ensure __return==qa_active_min(i,vl,a,b) && -128<=__return && __return<=127 && emp */;
vint16m4_t __riscv_vwsub_vx_i16m4(vint8m2_t a,int8_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -128<=a0 && a0<=127 && -128<=a1 && a1<=127 && -128<=a2 && a2<=127 && -128<=a3 && a3<=127 && -128<=a4 && a4<=127 && -128<=a5 && a5<=127 && -128<=a6 && a6<=127 && -128<=a7 && a7<=127 && -128<=a8 && a8<=127 && -128<=a9 && a9<=127 && -128<=a10 && a10<=127 && -128<=a11 && a11<=127 && -128<=a12 && a12<=127 && -128<=a13 && a13<=127 && -128<=a14 && a14<=127 && -128<=a15 && a15<=127 && -128<=a16 && a16<=127 && -128<=a17 && a17<=127 && -128<=a18 && a18<=127 && -128<=a19 && a19<=127 && -128<=a20 && a20<=127 && -128<=a21 && a21<=127 && -128<=a22 && a22<=127 && -128<=a23 && a23<=127 && -128<=a24 && a24<=127 && -128<=a25 && a25<=127 && -128<=a26 && a26<=127 && -128<=a27 && a27<=127 && -128<=a28 && a28<=127 && -128<=a29 && a29<=127 && -128<=a30 && a30<=127 && -128<=a31 && a31<=127 && -128<=b && b<=127 && store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(a.s16),char,a16) * store(&(a.s17),char,a17) * store(&(a.s18),char,a18) * store(&(a.s19),char,a19) * store(&(a.s20),char,a20) * store(&(a.s21),char,a21) * store(&(a.s22),char,a22) * store(&(a.s23),char,a23) * store(&(a.s24),char,a24) * store(&(a.s25),char,a25) * store(&(a.s26),char,a26) * store(&(a.s27),char,a27) * store(&(a.s28),char,a28) * store(&(a.s29),char,a29) * store(&(a.s30),char,a30) * store(&(a.s31),char,a31)
 Ensure store(&(__return.s0),short,qa_active_sub(0,vl,a0,b)) * store(&(__return.s1),short,qa_active_sub(1,vl,a1,b)) * store(&(__return.s2),short,qa_active_sub(2,vl,a2,b)) * store(&(__return.s3),short,qa_active_sub(3,vl,a3,b)) * store(&(__return.s4),short,qa_active_sub(4,vl,a4,b)) * store(&(__return.s5),short,qa_active_sub(5,vl,a5,b)) * store(&(__return.s6),short,qa_active_sub(6,vl,a6,b)) * store(&(__return.s7),short,qa_active_sub(7,vl,a7,b)) * store(&(__return.s8),short,qa_active_sub(8,vl,a8,b)) * store(&(__return.s9),short,qa_active_sub(9,vl,a9,b)) * store(&(__return.s10),short,qa_active_sub(10,vl,a10,b)) * store(&(__return.s11),short,qa_active_sub(11,vl,a11,b)) * store(&(__return.s12),short,qa_active_sub(12,vl,a12,b)) * store(&(__return.s13),short,qa_active_sub(13,vl,a13,b)) * store(&(__return.s14),short,qa_active_sub(14,vl,a14,b)) * store(&(__return.s15),short,qa_active_sub(15,vl,a15,b)) * store(&(__return.s16),short,qa_active_sub(16,vl,a16,b)) * store(&(__return.s17),short,qa_active_sub(17,vl,a17,b)) * store(&(__return.s18),short,qa_active_sub(18,vl,a18,b)) * store(&(__return.s19),short,qa_active_sub(19,vl,a19,b)) * store(&(__return.s20),short,qa_active_sub(20,vl,a20,b)) * store(&(__return.s21),short,qa_active_sub(21,vl,a21,b)) * store(&(__return.s22),short,qa_active_sub(22,vl,a22,b)) * store(&(__return.s23),short,qa_active_sub(23,vl,a23,b)) * store(&(__return.s24),short,qa_active_sub(24,vl,a24,b)) * store(&(__return.s25),short,qa_active_sub(25,vl,a25,b)) * store(&(__return.s26),short,qa_active_sub(26,vl,a26,b)) * store(&(__return.s27),short,qa_active_sub(27,vl,a27,b)) * store(&(__return.s28),short,qa_active_sub(28,vl,a28,b)) * store(&(__return.s29),short,qa_active_sub(29,vl,a29,b)) * store(&(__return.s30),short,qa_active_sub(30,vl,a30,b)) * store(&(__return.s31),short,qa_active_sub(31,vl,a31,b)) */;
vint32m8_t __riscv_vsext_vf2_i32m8(vint16m4_t a,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),int,qa_active_sext(0,vl,a0)) * store(&(__return.s1),int,qa_active_sext(1,vl,a1)) * store(&(__return.s2),int,qa_active_sext(2,vl,a2)) * store(&(__return.s3),int,qa_active_sext(3,vl,a3)) * store(&(__return.s4),int,qa_active_sext(4,vl,a4)) * store(&(__return.s5),int,qa_active_sext(5,vl,a5)) * store(&(__return.s6),int,qa_active_sext(6,vl,a6)) * store(&(__return.s7),int,qa_active_sext(7,vl,a7)) * store(&(__return.s8),int,qa_active_sext(8,vl,a8)) * store(&(__return.s9),int,qa_active_sext(9,vl,a9)) * store(&(__return.s10),int,qa_active_sext(10,vl,a10)) * store(&(__return.s11),int,qa_active_sext(11,vl,a11)) * store(&(__return.s12),int,qa_active_sext(12,vl,a12)) * store(&(__return.s13),int,qa_active_sext(13,vl,a13)) * store(&(__return.s14),int,qa_active_sext(14,vl,a14)) * store(&(__return.s15),int,qa_active_sext(15,vl,a15)) * store(&(__return.s16),int,qa_active_sext(16,vl,a16)) * store(&(__return.s17),int,qa_active_sext(17,vl,a17)) * store(&(__return.s18),int,qa_active_sext(18,vl,a18)) * store(&(__return.s19),int,qa_active_sext(19,vl,a19)) * store(&(__return.s20),int,qa_active_sext(20,vl,a20)) * store(&(__return.s21),int,qa_active_sext(21,vl,a21)) * store(&(__return.s22),int,qa_active_sext(22,vl,a22)) * store(&(__return.s23),int,qa_active_sext(23,vl,a23)) * store(&(__return.s24),int,qa_active_sext(24,vl,a24)) * store(&(__return.s25),int,qa_active_sext(25,vl,a25)) * store(&(__return.s26),int,qa_active_sext(26,vl,a26)) * store(&(__return.s27),int,qa_active_sext(27,vl,a27)) * store(&(__return.s28),int,qa_active_sext(28,vl,a28)) * store(&(__return.s29),int,qa_active_sext(29,vl,a29)) * store(&(__return.s30),int,qa_active_sext(30,vl,a30)) * store(&(__return.s31),int,qa_active_sext(31,vl,a31)) */;
vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int32_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && -2147483648<=b && b<=2147483647 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(a.s4),int,a4) * store(&(a.s5),int,a5) * store(&(a.s6),int,a6) * store(&(a.s7),int,a7) * store(&(a.s8),int,a8) * store(&(a.s9),int,a9) * store(&(a.s10),int,a10) * store(&(a.s11),int,a11) * store(&(a.s12),int,a12) * store(&(a.s13),int,a13) * store(&(a.s14),int,a14) * store(&(a.s15),int,a15) * store(&(a.s16),int,a16) * store(&(a.s17),int,a17) * store(&(a.s18),int,a18) * store(&(a.s19),int,a19) * store(&(a.s20),int,a20) * store(&(a.s21),int,a21) * store(&(a.s22),int,a22) * store(&(a.s23),int,a23) * store(&(a.s24),int,a24) * store(&(a.s25),int,a25) * store(&(a.s26),int,a26) * store(&(a.s27),int,a27) * store(&(a.s28),int,a28) * store(&(a.s29),int,a29) * store(&(a.s30),int,a30) * store(&(a.s31),int,a31)
 Ensure store(&(__return.s0),int,qa_active_mul(0,vl,a0,b)) * store(&(__return.s1),int,qa_active_mul(1,vl,a1,b)) * store(&(__return.s2),int,qa_active_mul(2,vl,a2,b)) * store(&(__return.s3),int,qa_active_mul(3,vl,a3,b)) * store(&(__return.s4),int,qa_active_mul(4,vl,a4,b)) * store(&(__return.s5),int,qa_active_mul(5,vl,a5,b)) * store(&(__return.s6),int,qa_active_mul(6,vl,a6,b)) * store(&(__return.s7),int,qa_active_mul(7,vl,a7,b)) * store(&(__return.s8),int,qa_active_mul(8,vl,a8,b)) * store(&(__return.s9),int,qa_active_mul(9,vl,a9,b)) * store(&(__return.s10),int,qa_active_mul(10,vl,a10,b)) * store(&(__return.s11),int,qa_active_mul(11,vl,a11,b)) * store(&(__return.s12),int,qa_active_mul(12,vl,a12,b)) * store(&(__return.s13),int,qa_active_mul(13,vl,a13,b)) * store(&(__return.s14),int,qa_active_mul(14,vl,a14,b)) * store(&(__return.s15),int,qa_active_mul(15,vl,a15,b)) * store(&(__return.s16),int,qa_active_mul(16,vl,a16,b)) * store(&(__return.s17),int,qa_active_mul(17,vl,a17,b)) * store(&(__return.s18),int,qa_active_mul(18,vl,a18,b)) * store(&(__return.s19),int,qa_active_mul(19,vl,a19,b)) * store(&(__return.s20),int,qa_active_mul(20,vl,a20,b)) * store(&(__return.s21),int,qa_active_mul(21,vl,a21,b)) * store(&(__return.s22),int,qa_active_mul(22,vl,a22,b)) * store(&(__return.s23),int,qa_active_mul(23,vl,a23,b)) * store(&(__return.s24),int,qa_active_mul(24,vl,a24,b)) * store(&(__return.s25),int,qa_active_mul(25,vl,a25,b)) * store(&(__return.s26),int,qa_active_mul(26,vl,a26,b)) * store(&(__return.s27),int,qa_active_mul(27,vl,a27,b)) * store(&(__return.s28),int,qa_active_mul(28,vl,a28,b)) * store(&(__return.s29),int,qa_active_mul(29,vl,a29,b)) * store(&(__return.s30),int,qa_active_mul(30,vl,a30,b)) * store(&(__return.s31),int,qa_active_mul(31,vl,a31,b)) */;
vint32m8_t __riscv_vmacc_vx_i32m8(vint32m8_t a,int32_t b,vint32m8_t c,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) (c0:Z) (c1:Z) (c2:Z) (c3:Z) (c4:Z) (c5:Z) (c6:Z) (c7:Z) (c8:Z) (c9:Z) (c10:Z) (c11:Z) (c12:Z) (c13:Z) (c14:Z) (c15:Z) (c16:Z) (c17:Z) (c18:Z) (c19:Z) (c20:Z) (c21:Z) (c22:Z) (c23:Z) (c24:Z) (c25:Z) (c26:Z) (c27:Z) (c28:Z) (c29:Z) (c30:Z) (c31:Z)
 Require 0<=vl && vl<=32 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && -2147483648<=b && b<=2147483647 && -2147483648<=c0 && c0<=2147483647 && -2147483648<=c1 && c1<=2147483647 && -2147483648<=c2 && c2<=2147483647 && -2147483648<=c3 && c3<=2147483647 && -2147483648<=c4 && c4<=2147483647 && -2147483648<=c5 && c5<=2147483647 && -2147483648<=c6 && c6<=2147483647 && -2147483648<=c7 && c7<=2147483647 && -2147483648<=c8 && c8<=2147483647 && -2147483648<=c9 && c9<=2147483647 && -2147483648<=c10 && c10<=2147483647 && -2147483648<=c11 && c11<=2147483647 && -2147483648<=c12 && c12<=2147483647 && -2147483648<=c13 && c13<=2147483647 && -2147483648<=c14 && c14<=2147483647 && -2147483648<=c15 && c15<=2147483647 && -2147483648<=c16 && c16<=2147483647 && -2147483648<=c17 && c17<=2147483647 && -2147483648<=c18 && c18<=2147483647 && -2147483648<=c19 && c19<=2147483647 && -2147483648<=c20 && c20<=2147483647 && -2147483648<=c21 && c21<=2147483647 && -2147483648<=c22 && c22<=2147483647 && -2147483648<=c23 && c23<=2147483647 && -2147483648<=c24 && c24<=2147483647 && -2147483648<=c25 && c25<=2147483647 && -2147483648<=c26 && c26<=2147483647 && -2147483648<=c27 && c27<=2147483647 && -2147483648<=c28 && c28<=2147483647 && -2147483648<=c29 && c29<=2147483647 && -2147483648<=c30 && c30<=2147483647 && -2147483648<=c31 && c31<=2147483647 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(a.s4),int,a4) * store(&(a.s5),int,a5) * store(&(a.s6),int,a6) * store(&(a.s7),int,a7) * store(&(a.s8),int,a8) * store(&(a.s9),int,a9) * store(&(a.s10),int,a10) * store(&(a.s11),int,a11) * store(&(a.s12),int,a12) * store(&(a.s13),int,a13) * store(&(a.s14),int,a14) * store(&(a.s15),int,a15) * store(&(a.s16),int,a16) * store(&(a.s17),int,a17) * store(&(a.s18),int,a18) * store(&(a.s19),int,a19) * store(&(a.s20),int,a20) * store(&(a.s21),int,a21) * store(&(a.s22),int,a22) * store(&(a.s23),int,a23) * store(&(a.s24),int,a24) * store(&(a.s25),int,a25) * store(&(a.s26),int,a26) * store(&(a.s27),int,a27) * store(&(a.s28),int,a28) * store(&(a.s29),int,a29) * store(&(a.s30),int,a30) * store(&(a.s31),int,a31) * store(&(c.s0),int,c0) * store(&(c.s1),int,c1) * store(&(c.s2),int,c2) * store(&(c.s3),int,c3) * store(&(c.s4),int,c4) * store(&(c.s5),int,c5) * store(&(c.s6),int,c6) * store(&(c.s7),int,c7) * store(&(c.s8),int,c8) * store(&(c.s9),int,c9) * store(&(c.s10),int,c10) * store(&(c.s11),int,c11) * store(&(c.s12),int,c12) * store(&(c.s13),int,c13) * store(&(c.s14),int,c14) * store(&(c.s15),int,c15) * store(&(c.s16),int,c16) * store(&(c.s17),int,c17) * store(&(c.s18),int,c18) * store(&(c.s19),int,c19) * store(&(c.s20),int,c20) * store(&(c.s21),int,c21) * store(&(c.s22),int,c22) * store(&(c.s23),int,c23) * store(&(c.s24),int,c24) * store(&(c.s25),int,c25) * store(&(c.s26),int,c26) * store(&(c.s27),int,c27) * store(&(c.s28),int,c28) * store(&(c.s29),int,c29) * store(&(c.s30),int,c30) * store(&(c.s31),int,c31)
 Ensure store(&(__return.s0),int,qa_active_macc(0,vl,a0,c0,b)) * store(&(__return.s1),int,qa_active_macc(1,vl,a1,c1,b)) * store(&(__return.s2),int,qa_active_macc(2,vl,a2,c2,b)) * store(&(__return.s3),int,qa_active_macc(3,vl,a3,c3,b)) * store(&(__return.s4),int,qa_active_macc(4,vl,a4,c4,b)) * store(&(__return.s5),int,qa_active_macc(5,vl,a5,c5,b)) * store(&(__return.s6),int,qa_active_macc(6,vl,a6,c6,b)) * store(&(__return.s7),int,qa_active_macc(7,vl,a7,c7,b)) * store(&(__return.s8),int,qa_active_macc(8,vl,a8,c8,b)) * store(&(__return.s9),int,qa_active_macc(9,vl,a9,c9,b)) * store(&(__return.s10),int,qa_active_macc(10,vl,a10,c10,b)) * store(&(__return.s11),int,qa_active_macc(11,vl,a11,c11,b)) * store(&(__return.s12),int,qa_active_macc(12,vl,a12,c12,b)) * store(&(__return.s13),int,qa_active_macc(13,vl,a13,c13,b)) * store(&(__return.s14),int,qa_active_macc(14,vl,a14,c14,b)) * store(&(__return.s15),int,qa_active_macc(15,vl,a15,c15,b)) * store(&(__return.s16),int,qa_active_macc(16,vl,a16,c16,b)) * store(&(__return.s17),int,qa_active_macc(17,vl,a17,c17,b)) * store(&(__return.s18),int,qa_active_macc(18,vl,a18,c18,b)) * store(&(__return.s19),int,qa_active_macc(19,vl,a19,c19,b)) * store(&(__return.s20),int,qa_active_macc(20,vl,a20,c20,b)) * store(&(__return.s21),int,qa_active_macc(21,vl,a21,c21,b)) * store(&(__return.s22),int,qa_active_macc(22,vl,a22,c22,b)) * store(&(__return.s23),int,qa_active_macc(23,vl,a23,c23,b)) * store(&(__return.s24),int,qa_active_macc(24,vl,a24,c24,b)) * store(&(__return.s25),int,qa_active_macc(25,vl,a25,c25,b)) * store(&(__return.s26),int,qa_active_macc(26,vl,a26,c26,b)) * store(&(__return.s27),int,qa_active_macc(27,vl,a27,c27,b)) * store(&(__return.s28),int,qa_active_macc(28,vl,a28,c28,b)) * store(&(__return.s29),int,qa_active_macc(29,vl,a29,c29,b)) * store(&(__return.s30),int,qa_active_macc(30,vl,a30,c30,b)) * store(&(__return.s31),int,qa_active_macc(31,vl,a31,c31,b)) */;
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t b,size_t vl)
/*@ Require 0<=vl && vl<=32 && -2147483648<=b && b<=2147483647 && emp
 Ensure store(&(__return.s0),int,qa_active_mov(0,vl,b)) * store(&(__return.s1),int,qa_active_mov(1,vl,b)) * store(&(__return.s2),int,qa_active_mov(2,vl,b)) * store(&(__return.s3),int,qa_active_mov(3,vl,b)) * store(&(__return.s4),int,qa_active_mov(4,vl,b)) * store(&(__return.s5),int,qa_active_mov(5,vl,b)) * store(&(__return.s6),int,qa_active_mov(6,vl,b)) * store(&(__return.s7),int,qa_active_mov(7,vl,b)) * store(&(__return.s8),int,qa_active_mov(8,vl,b)) * store(&(__return.s9),int,qa_active_mov(9,vl,b)) * store(&(__return.s10),int,qa_active_mov(10,vl,b)) * store(&(__return.s11),int,qa_active_mov(11,vl,b)) * store(&(__return.s12),int,qa_active_mov(12,vl,b)) * store(&(__return.s13),int,qa_active_mov(13,vl,b)) * store(&(__return.s14),int,qa_active_mov(14,vl,b)) * store(&(__return.s15),int,qa_active_mov(15,vl,b)) * store(&(__return.s16),int,qa_active_mov(16,vl,b)) * store(&(__return.s17),int,qa_active_mov(17,vl,b)) * store(&(__return.s18),int,qa_active_mov(18,vl,b)) * store(&(__return.s19),int,qa_active_mov(19,vl,b)) * store(&(__return.s20),int,qa_active_mov(20,vl,b)) * store(&(__return.s21),int,qa_active_mov(21,vl,b)) * store(&(__return.s22),int,qa_active_mov(22,vl,b)) * store(&(__return.s23),int,qa_active_mov(23,vl,b)) * store(&(__return.s24),int,qa_active_mov(24,vl,b)) * store(&(__return.s25),int,qa_active_mov(25,vl,b)) * store(&(__return.s26),int,qa_active_mov(26,vl,b)) * store(&(__return.s27),int,qa_active_mov(27,vl,b)) * store(&(__return.s28),int,qa_active_mov(28,vl,b)) * store(&(__return.s29),int,qa_active_mov(29,vl,b)) * store(&(__return.s30),int,qa_active_mov(30,vl,b)) * store(&(__return.s31),int,qa_active_mov(31,vl,b)) */;
vint32m8_t __riscv_vssra_vx_i32m8(vint32m8_t a,size_t d,int rm,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && 0<=d && d<=31 && rm==0 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(a.s4),int,a4) * store(&(a.s5),int,a5) * store(&(a.s6),int,a6) * store(&(a.s7),int,a7) * store(&(a.s8),int,a8) * store(&(a.s9),int,a9) * store(&(a.s10),int,a10) * store(&(a.s11),int,a11) * store(&(a.s12),int,a12) * store(&(a.s13),int,a13) * store(&(a.s14),int,a14) * store(&(a.s15),int,a15) * store(&(a.s16),int,a16) * store(&(a.s17),int,a17) * store(&(a.s18),int,a18) * store(&(a.s19),int,a19) * store(&(a.s20),int,a20) * store(&(a.s21),int,a21) * store(&(a.s22),int,a22) * store(&(a.s23),int,a23) * store(&(a.s24),int,a24) * store(&(a.s25),int,a25) * store(&(a.s26),int,a26) * store(&(a.s27),int,a27) * store(&(a.s28),int,a28) * store(&(a.s29),int,a29) * store(&(a.s30),int,a30) * store(&(a.s31),int,a31)
 Ensure store(&(__return.s0),int,qa_active_rnu(0,vl,a0,d)) * store(&(__return.s1),int,qa_active_rnu(1,vl,a1,d)) * store(&(__return.s2),int,qa_active_rnu(2,vl,a2,d)) * store(&(__return.s3),int,qa_active_rnu(3,vl,a3,d)) * store(&(__return.s4),int,qa_active_rnu(4,vl,a4,d)) * store(&(__return.s5),int,qa_active_rnu(5,vl,a5,d)) * store(&(__return.s6),int,qa_active_rnu(6,vl,a6,d)) * store(&(__return.s7),int,qa_active_rnu(7,vl,a7,d)) * store(&(__return.s8),int,qa_active_rnu(8,vl,a8,d)) * store(&(__return.s9),int,qa_active_rnu(9,vl,a9,d)) * store(&(__return.s10),int,qa_active_rnu(10,vl,a10,d)) * store(&(__return.s11),int,qa_active_rnu(11,vl,a11,d)) * store(&(__return.s12),int,qa_active_rnu(12,vl,a12,d)) * store(&(__return.s13),int,qa_active_rnu(13,vl,a13,d)) * store(&(__return.s14),int,qa_active_rnu(14,vl,a14,d)) * store(&(__return.s15),int,qa_active_rnu(15,vl,a15,d)) * store(&(__return.s16),int,qa_active_rnu(16,vl,a16,d)) * store(&(__return.s17),int,qa_active_rnu(17,vl,a17,d)) * store(&(__return.s18),int,qa_active_rnu(18,vl,a18,d)) * store(&(__return.s19),int,qa_active_rnu(19,vl,a19,d)) * store(&(__return.s20),int,qa_active_rnu(20,vl,a20,d)) * store(&(__return.s21),int,qa_active_rnu(21,vl,a21,d)) * store(&(__return.s22),int,qa_active_rnu(22,vl,a22,d)) * store(&(__return.s23),int,qa_active_rnu(23,vl,a23,d)) * store(&(__return.s24),int,qa_active_rnu(24,vl,a24,d)) * store(&(__return.s25),int,qa_active_rnu(25,vl,a25,d)) * store(&(__return.s26),int,qa_active_rnu(26,vl,a26,d)) * store(&(__return.s27),int,qa_active_rnu(27,vl,a27,d)) * store(&(__return.s28),int,qa_active_rnu(28,vl,a28,d)) * store(&(__return.s29),int,qa_active_rnu(29,vl,a29,d)) * store(&(__return.s30),int,qa_active_rnu(30,vl,a30,d)) * store(&(__return.s31),int,qa_active_rnu(31,vl,a31,d)) */;
vint32m8_t __riscv_vsll_vx_i32m8(vint32m8_t a,size_t d,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && 0<=d && d<=31 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(a.s4),int,a4) * store(&(a.s5),int,a5) * store(&(a.s6),int,a6) * store(&(a.s7),int,a7) * store(&(a.s8),int,a8) * store(&(a.s9),int,a9) * store(&(a.s10),int,a10) * store(&(a.s11),int,a11) * store(&(a.s12),int,a12) * store(&(a.s13),int,a13) * store(&(a.s14),int,a14) * store(&(a.s15),int,a15) * store(&(a.s16),int,a16) * store(&(a.s17),int,a17) * store(&(a.s18),int,a18) * store(&(a.s19),int,a19) * store(&(a.s20),int,a20) * store(&(a.s21),int,a21) * store(&(a.s22),int,a22) * store(&(a.s23),int,a23) * store(&(a.s24),int,a24) * store(&(a.s25),int,a25) * store(&(a.s26),int,a26) * store(&(a.s27),int,a27) * store(&(a.s28),int,a28) * store(&(a.s29),int,a29) * store(&(a.s30),int,a30) * store(&(a.s31),int,a31)
 Ensure store(&(__return.s0),int,qa_active_sll(0,vl,a0,d)) * store(&(__return.s1),int,qa_active_sll(1,vl,a1,d)) * store(&(__return.s2),int,qa_active_sll(2,vl,a2,d)) * store(&(__return.s3),int,qa_active_sll(3,vl,a3,d)) * store(&(__return.s4),int,qa_active_sll(4,vl,a4,d)) * store(&(__return.s5),int,qa_active_sll(5,vl,a5,d)) * store(&(__return.s6),int,qa_active_sll(6,vl,a6,d)) * store(&(__return.s7),int,qa_active_sll(7,vl,a7,d)) * store(&(__return.s8),int,qa_active_sll(8,vl,a8,d)) * store(&(__return.s9),int,qa_active_sll(9,vl,a9,d)) * store(&(__return.s10),int,qa_active_sll(10,vl,a10,d)) * store(&(__return.s11),int,qa_active_sll(11,vl,a11,d)) * store(&(__return.s12),int,qa_active_sll(12,vl,a12,d)) * store(&(__return.s13),int,qa_active_sll(13,vl,a13,d)) * store(&(__return.s14),int,qa_active_sll(14,vl,a14,d)) * store(&(__return.s15),int,qa_active_sll(15,vl,a15,d)) * store(&(__return.s16),int,qa_active_sll(16,vl,a16,d)) * store(&(__return.s17),int,qa_active_sll(17,vl,a17,d)) * store(&(__return.s18),int,qa_active_sll(18,vl,a18,d)) * store(&(__return.s19),int,qa_active_sll(19,vl,a19,d)) * store(&(__return.s20),int,qa_active_sll(20,vl,a20,d)) * store(&(__return.s21),int,qa_active_sll(21,vl,a21,d)) * store(&(__return.s22),int,qa_active_sll(22,vl,a22,d)) * store(&(__return.s23),int,qa_active_sll(23,vl,a23,d)) * store(&(__return.s24),int,qa_active_sll(24,vl,a24,d)) * store(&(__return.s25),int,qa_active_sll(25,vl,a25,d)) * store(&(__return.s26),int,qa_active_sll(26,vl,a26,d)) * store(&(__return.s27),int,qa_active_sll(27,vl,a27,d)) * store(&(__return.s28),int,qa_active_sll(28,vl,a28,d)) * store(&(__return.s29),int,qa_active_sll(29,vl,a29,d)) * store(&(__return.s30),int,qa_active_sll(30,vl,a30,d)) * store(&(__return.s31),int,qa_active_sll(31,vl,a31,d)) */;
vint16m4_t __riscv_vnclip_wx_i16m4(vint32m8_t a,size_t d,int rm,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && d==0 && rm==2 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(a.s4),int,a4) * store(&(a.s5),int,a5) * store(&(a.s6),int,a6) * store(&(a.s7),int,a7) * store(&(a.s8),int,a8) * store(&(a.s9),int,a9) * store(&(a.s10),int,a10) * store(&(a.s11),int,a11) * store(&(a.s12),int,a12) * store(&(a.s13),int,a13) * store(&(a.s14),int,a14) * store(&(a.s15),int,a15) * store(&(a.s16),int,a16) * store(&(a.s17),int,a17) * store(&(a.s18),int,a18) * store(&(a.s19),int,a19) * store(&(a.s20),int,a20) * store(&(a.s21),int,a21) * store(&(a.s22),int,a22) * store(&(a.s23),int,a23) * store(&(a.s24),int,a24) * store(&(a.s25),int,a25) * store(&(a.s26),int,a26) * store(&(a.s27),int,a27) * store(&(a.s28),int,a28) * store(&(a.s29),int,a29) * store(&(a.s30),int,a30) * store(&(a.s31),int,a31)
 Ensure store(&(__return.s0),short,qa_active_clip16(0,vl,a0)) * store(&(__return.s1),short,qa_active_clip16(1,vl,a1)) * store(&(__return.s2),short,qa_active_clip16(2,vl,a2)) * store(&(__return.s3),short,qa_active_clip16(3,vl,a3)) * store(&(__return.s4),short,qa_active_clip16(4,vl,a4)) * store(&(__return.s5),short,qa_active_clip16(5,vl,a5)) * store(&(__return.s6),short,qa_active_clip16(6,vl,a6)) * store(&(__return.s7),short,qa_active_clip16(7,vl,a7)) * store(&(__return.s8),short,qa_active_clip16(8,vl,a8)) * store(&(__return.s9),short,qa_active_clip16(9,vl,a9)) * store(&(__return.s10),short,qa_active_clip16(10,vl,a10)) * store(&(__return.s11),short,qa_active_clip16(11,vl,a11)) * store(&(__return.s12),short,qa_active_clip16(12,vl,a12)) * store(&(__return.s13),short,qa_active_clip16(13,vl,a13)) * store(&(__return.s14),short,qa_active_clip16(14,vl,a14)) * store(&(__return.s15),short,qa_active_clip16(15,vl,a15)) * store(&(__return.s16),short,qa_active_clip16(16,vl,a16)) * store(&(__return.s17),short,qa_active_clip16(17,vl,a17)) * store(&(__return.s18),short,qa_active_clip16(18,vl,a18)) * store(&(__return.s19),short,qa_active_clip16(19,vl,a19)) * store(&(__return.s20),short,qa_active_clip16(20,vl,a20)) * store(&(__return.s21),short,qa_active_clip16(21,vl,a21)) * store(&(__return.s22),short,qa_active_clip16(22,vl,a22)) * store(&(__return.s23),short,qa_active_clip16(23,vl,a23)) * store(&(__return.s24),short,qa_active_clip16(24,vl,a24)) * store(&(__return.s25),short,qa_active_clip16(25,vl,a25)) * store(&(__return.s26),short,qa_active_clip16(26,vl,a26)) * store(&(__return.s27),short,qa_active_clip16(27,vl,a27)) * store(&(__return.s28),short,qa_active_clip16(28,vl,a28)) * store(&(__return.s29),short,qa_active_clip16(29,vl,a29)) * store(&(__return.s30),short,qa_active_clip16(30,vl,a30)) * store(&(__return.s31),short,qa_active_clip16(31,vl,a31)) */;
vint16m4_t __riscv_vsadd_vx_i16m4(vint16m4_t a,int16_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && -32768<=b && b<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),short,qa_active_add(0,vl,a0,b)) * store(&(__return.s1),short,qa_active_add(1,vl,a1,b)) * store(&(__return.s2),short,qa_active_add(2,vl,a2,b)) * store(&(__return.s3),short,qa_active_add(3,vl,a3,b)) * store(&(__return.s4),short,qa_active_add(4,vl,a4,b)) * store(&(__return.s5),short,qa_active_add(5,vl,a5,b)) * store(&(__return.s6),short,qa_active_add(6,vl,a6,b)) * store(&(__return.s7),short,qa_active_add(7,vl,a7,b)) * store(&(__return.s8),short,qa_active_add(8,vl,a8,b)) * store(&(__return.s9),short,qa_active_add(9,vl,a9,b)) * store(&(__return.s10),short,qa_active_add(10,vl,a10,b)) * store(&(__return.s11),short,qa_active_add(11,vl,a11,b)) * store(&(__return.s12),short,qa_active_add(12,vl,a12,b)) * store(&(__return.s13),short,qa_active_add(13,vl,a13,b)) * store(&(__return.s14),short,qa_active_add(14,vl,a14,b)) * store(&(__return.s15),short,qa_active_add(15,vl,a15,b)) * store(&(__return.s16),short,qa_active_add(16,vl,a16,b)) * store(&(__return.s17),short,qa_active_add(17,vl,a17,b)) * store(&(__return.s18),short,qa_active_add(18,vl,a18,b)) * store(&(__return.s19),short,qa_active_add(19,vl,a19,b)) * store(&(__return.s20),short,qa_active_add(20,vl,a20,b)) * store(&(__return.s21),short,qa_active_add(21,vl,a21,b)) * store(&(__return.s22),short,qa_active_add(22,vl,a22,b)) * store(&(__return.s23),short,qa_active_add(23,vl,a23,b)) * store(&(__return.s24),short,qa_active_add(24,vl,a24,b)) * store(&(__return.s25),short,qa_active_add(25,vl,a25,b)) * store(&(__return.s26),short,qa_active_add(26,vl,a26,b)) * store(&(__return.s27),short,qa_active_add(27,vl,a27,b)) * store(&(__return.s28),short,qa_active_add(28,vl,a28,b)) * store(&(__return.s29),short,qa_active_add(29,vl,a29,b)) * store(&(__return.s30),short,qa_active_add(30,vl,a30,b)) * store(&(__return.s31),short,qa_active_add(31,vl,a31,b)) */;
vint8m2_t __riscv_vnclip_wx_i8m2(vint16m4_t a,size_t d,int rm,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && d==0 && rm==2 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),char,qa_active_clip8(0,vl,a0)) * store(&(__return.s1),char,qa_active_clip8(1,vl,a1)) * store(&(__return.s2),char,qa_active_clip8(2,vl,a2)) * store(&(__return.s3),char,qa_active_clip8(3,vl,a3)) * store(&(__return.s4),char,qa_active_clip8(4,vl,a4)) * store(&(__return.s5),char,qa_active_clip8(5,vl,a5)) * store(&(__return.s6),char,qa_active_clip8(6,vl,a6)) * store(&(__return.s7),char,qa_active_clip8(7,vl,a7)) * store(&(__return.s8),char,qa_active_clip8(8,vl,a8)) * store(&(__return.s9),char,qa_active_clip8(9,vl,a9)) * store(&(__return.s10),char,qa_active_clip8(10,vl,a10)) * store(&(__return.s11),char,qa_active_clip8(11,vl,a11)) * store(&(__return.s12),char,qa_active_clip8(12,vl,a12)) * store(&(__return.s13),char,qa_active_clip8(13,vl,a13)) * store(&(__return.s14),char,qa_active_clip8(14,vl,a14)) * store(&(__return.s15),char,qa_active_clip8(15,vl,a15)) * store(&(__return.s16),char,qa_active_clip8(16,vl,a16)) * store(&(__return.s17),char,qa_active_clip8(17,vl,a17)) * store(&(__return.s18),char,qa_active_clip8(18,vl,a18)) * store(&(__return.s19),char,qa_active_clip8(19,vl,a19)) * store(&(__return.s20),char,qa_active_clip8(20,vl,a20)) * store(&(__return.s21),char,qa_active_clip8(21,vl,a21)) * store(&(__return.s22),char,qa_active_clip8(22,vl,a22)) * store(&(__return.s23),char,qa_active_clip8(23,vl,a23)) * store(&(__return.s24),char,qa_active_clip8(24,vl,a24)) * store(&(__return.s25),char,qa_active_clip8(25,vl,a25)) * store(&(__return.s26),char,qa_active_clip8(26,vl,a26)) * store(&(__return.s27),char,qa_active_clip8(27,vl,a27)) * store(&(__return.s28),char,qa_active_clip8(28,vl,a28)) * store(&(__return.s29),char,qa_active_clip8(29,vl,a29)) * store(&(__return.s30),char,qa_active_clip8(30,vl,a30)) * store(&(__return.s31),char,qa_active_clip8(31,vl,a31)) */;
vint8m2_t __riscv_vmax_vx_i8m2(vint8m2_t a,int8_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -128<=a0 && a0<=127 && -128<=a1 && a1<=127 && -128<=a2 && a2<=127 && -128<=a3 && a3<=127 && -128<=a4 && a4<=127 && -128<=a5 && a5<=127 && -128<=a6 && a6<=127 && -128<=a7 && a7<=127 && -128<=a8 && a8<=127 && -128<=a9 && a9<=127 && -128<=a10 && a10<=127 && -128<=a11 && a11<=127 && -128<=a12 && a12<=127 && -128<=a13 && a13<=127 && -128<=a14 && a14<=127 && -128<=a15 && a15<=127 && -128<=a16 && a16<=127 && -128<=a17 && a17<=127 && -128<=a18 && a18<=127 && -128<=a19 && a19<=127 && -128<=a20 && a20<=127 && -128<=a21 && a21<=127 && -128<=a22 && a22<=127 && -128<=a23 && a23<=127 && -128<=a24 && a24<=127 && -128<=a25 && a25<=127 && -128<=a26 && a26<=127 && -128<=a27 && a27<=127 && -128<=a28 && a28<=127 && -128<=a29 && a29<=127 && -128<=a30 && a30<=127 && -128<=a31 && a31<=127 && -128<=b && b<=127 && store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(a.s16),char,a16) * store(&(a.s17),char,a17) * store(&(a.s18),char,a18) * store(&(a.s19),char,a19) * store(&(a.s20),char,a20) * store(&(a.s21),char,a21) * store(&(a.s22),char,a22) * store(&(a.s23),char,a23) * store(&(a.s24),char,a24) * store(&(a.s25),char,a25) * store(&(a.s26),char,a26) * store(&(a.s27),char,a27) * store(&(a.s28),char,a28) * store(&(a.s29),char,a29) * store(&(a.s30),char,a30) * store(&(a.s31),char,a31)
 Ensure store(&(__return.s0),char,qa_active_max(0,vl,a0,b)) * store(&(__return.s1),char,qa_active_max(1,vl,a1,b)) * store(&(__return.s2),char,qa_active_max(2,vl,a2,b)) * store(&(__return.s3),char,qa_active_max(3,vl,a3,b)) * store(&(__return.s4),char,qa_active_max(4,vl,a4,b)) * store(&(__return.s5),char,qa_active_max(5,vl,a5,b)) * store(&(__return.s6),char,qa_active_max(6,vl,a6,b)) * store(&(__return.s7),char,qa_active_max(7,vl,a7,b)) * store(&(__return.s8),char,qa_active_max(8,vl,a8,b)) * store(&(__return.s9),char,qa_active_max(9,vl,a9,b)) * store(&(__return.s10),char,qa_active_max(10,vl,a10,b)) * store(&(__return.s11),char,qa_active_max(11,vl,a11,b)) * store(&(__return.s12),char,qa_active_max(12,vl,a12,b)) * store(&(__return.s13),char,qa_active_max(13,vl,a13,b)) * store(&(__return.s14),char,qa_active_max(14,vl,a14,b)) * store(&(__return.s15),char,qa_active_max(15,vl,a15,b)) * store(&(__return.s16),char,qa_active_max(16,vl,a16,b)) * store(&(__return.s17),char,qa_active_max(17,vl,a17,b)) * store(&(__return.s18),char,qa_active_max(18,vl,a18,b)) * store(&(__return.s19),char,qa_active_max(19,vl,a19,b)) * store(&(__return.s20),char,qa_active_max(20,vl,a20,b)) * store(&(__return.s21),char,qa_active_max(21,vl,a21,b)) * store(&(__return.s22),char,qa_active_max(22,vl,a22,b)) * store(&(__return.s23),char,qa_active_max(23,vl,a23,b)) * store(&(__return.s24),char,qa_active_max(24,vl,a24,b)) * store(&(__return.s25),char,qa_active_max(25,vl,a25,b)) * store(&(__return.s26),char,qa_active_max(26,vl,a26,b)) * store(&(__return.s27),char,qa_active_max(27,vl,a27,b)) * store(&(__return.s28),char,qa_active_max(28,vl,a28,b)) * store(&(__return.s29),char,qa_active_max(29,vl,a29,b)) * store(&(__return.s30),char,qa_active_max(30,vl,a30,b)) * store(&(__return.s31),char,qa_active_max(31,vl,a31,b)) */;
vint8m2_t __riscv_vmin_vx_i8m2(vint8m2_t a,int8_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -128<=a0 && a0<=127 && -128<=a1 && a1<=127 && -128<=a2 && a2<=127 && -128<=a3 && a3<=127 && -128<=a4 && a4<=127 && -128<=a5 && a5<=127 && -128<=a6 && a6<=127 && -128<=a7 && a7<=127 && -128<=a8 && a8<=127 && -128<=a9 && a9<=127 && -128<=a10 && a10<=127 && -128<=a11 && a11<=127 && -128<=a12 && a12<=127 && -128<=a13 && a13<=127 && -128<=a14 && a14<=127 && -128<=a15 && a15<=127 && -128<=a16 && a16<=127 && -128<=a17 && a17<=127 && -128<=a18 && a18<=127 && -128<=a19 && a19<=127 && -128<=a20 && a20<=127 && -128<=a21 && a21<=127 && -128<=a22 && a22<=127 && -128<=a23 && a23<=127 && -128<=a24 && a24<=127 && -128<=a25 && a25<=127 && -128<=a26 && a26<=127 && -128<=a27 && a27<=127 && -128<=a28 && a28<=127 && -128<=a29 && a29<=127 && -128<=a30 && a30<=127 && -128<=a31 && a31<=127 && -128<=b && b<=127 && store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(a.s16),char,a16) * store(&(a.s17),char,a17) * store(&(a.s18),char,a18) * store(&(a.s19),char,a19) * store(&(a.s20),char,a20) * store(&(a.s21),char,a21) * store(&(a.s22),char,a22) * store(&(a.s23),char,a23) * store(&(a.s24),char,a24) * store(&(a.s25),char,a25) * store(&(a.s26),char,a26) * store(&(a.s27),char,a27) * store(&(a.s28),char,a28) * store(&(a.s29),char,a29) * store(&(a.s30),char,a30) * store(&(a.s31),char,a31)
 Ensure store(&(__return.s0),char,qa_active_min(0,vl,a0,b)) * store(&(__return.s1),char,qa_active_min(1,vl,a1,b)) * store(&(__return.s2),char,qa_active_min(2,vl,a2,b)) * store(&(__return.s3),char,qa_active_min(3,vl,a3,b)) * store(&(__return.s4),char,qa_active_min(4,vl,a4,b)) * store(&(__return.s5),char,qa_active_min(5,vl,a5,b)) * store(&(__return.s6),char,qa_active_min(6,vl,a6,b)) * store(&(__return.s7),char,qa_active_min(7,vl,a7,b)) * store(&(__return.s8),char,qa_active_min(8,vl,a8,b)) * store(&(__return.s9),char,qa_active_min(9,vl,a9,b)) * store(&(__return.s10),char,qa_active_min(10,vl,a10,b)) * store(&(__return.s11),char,qa_active_min(11,vl,a11,b)) * store(&(__return.s12),char,qa_active_min(12,vl,a12,b)) * store(&(__return.s13),char,qa_active_min(13,vl,a13,b)) * store(&(__return.s14),char,qa_active_min(14,vl,a14,b)) * store(&(__return.s15),char,qa_active_min(15,vl,a15,b)) * store(&(__return.s16),char,qa_active_min(16,vl,a16,b)) * store(&(__return.s17),char,qa_active_min(17,vl,a17,b)) * store(&(__return.s18),char,qa_active_min(18,vl,a18,b)) * store(&(__return.s19),char,qa_active_min(19,vl,a19,b)) * store(&(__return.s20),char,qa_active_min(20,vl,a20,b)) * store(&(__return.s21),char,qa_active_min(21,vl,a21,b)) * store(&(__return.s22),char,qa_active_min(22,vl,a22,b)) * store(&(__return.s23),char,qa_active_min(23,vl,a23,b)) * store(&(__return.s24),char,qa_active_min(24,vl,a24,b)) * store(&(__return.s25),char,qa_active_min(25,vl,a25,b)) * store(&(__return.s26),char,qa_active_min(26,vl,a26,b)) * store(&(__return.s27),char,qa_active_min(27,vl,a27,b)) * store(&(__return.s28),char,qa_active_min(28,vl,a28,b)) * store(&(__return.s29),char,qa_active_min(29,vl,a29,b)) * store(&(__return.s30),char,qa_active_min(30,vl,a30,b)) * store(&(__return.s31),char,qa_active_min(31,vl,a31,b)) */;
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t b,size_t vl)
/*@ Require 0<=vl && vl<=32 && -2147483648<=b && b<=2147483647 && emp
 Ensure store(&(__return.s0),int,qa_active_mov(0,vl,b)) * store(&(__return.s1),int,qa_active_mov(1,vl,b)) * store(&(__return.s2),int,qa_active_mov(2,vl,b)) * store(&(__return.s3),int,qa_active_mov(3,vl,b)) * store(&(__return.s4),int,qa_active_mov(4,vl,b)) * store(&(__return.s5),int,qa_active_mov(5,vl,b)) * store(&(__return.s6),int,qa_active_mov(6,vl,b)) * store(&(__return.s7),int,qa_active_mov(7,vl,b)) * store(&(__return.s8),int,qa_active_mov(8,vl,b)) * store(&(__return.s9),int,qa_active_mov(9,vl,b)) * store(&(__return.s10),int,qa_active_mov(10,vl,b)) * store(&(__return.s11),int,qa_active_mov(11,vl,b)) * store(&(__return.s12),int,qa_active_mov(12,vl,b)) * store(&(__return.s13),int,qa_active_mov(13,vl,b)) * store(&(__return.s14),int,qa_active_mov(14,vl,b)) * store(&(__return.s15),int,qa_active_mov(15,vl,b)) * store(&(__return.s16),int,qa_active_mov(16,vl,b)) * store(&(__return.s17),int,qa_active_mov(17,vl,b)) * store(&(__return.s18),int,qa_active_mov(18,vl,b)) * store(&(__return.s19),int,qa_active_mov(19,vl,b)) * store(&(__return.s20),int,qa_active_mov(20,vl,b)) * store(&(__return.s21),int,qa_active_mov(21,vl,b)) * store(&(__return.s22),int,qa_active_mov(22,vl,b)) * store(&(__return.s23),int,qa_active_mov(23,vl,b)) * store(&(__return.s24),int,qa_active_mov(24,vl,b)) * store(&(__return.s25),int,qa_active_mov(25,vl,b)) * store(&(__return.s26),int,qa_active_mov(26,vl,b)) * store(&(__return.s27),int,qa_active_mov(27,vl,b)) * store(&(__return.s28),int,qa_active_mov(28,vl,b)) * store(&(__return.s29),int,qa_active_mov(29,vl,b)) * store(&(__return.s30),int,qa_active_mov(30,vl,b)) * store(&(__return.s31),int,qa_active_mov(31,vl,b)) */
{
 vint32m8_t r;
 r.s0=qcp_qa_active_mov(b,0,vl);
 r.s1=qcp_qa_active_mov(b,1,vl);
 r.s2=qcp_qa_active_mov(b,2,vl);
 r.s3=qcp_qa_active_mov(b,3,vl);
 r.s4=qcp_qa_active_mov(b,4,vl);
 r.s5=qcp_qa_active_mov(b,5,vl);
 r.s6=qcp_qa_active_mov(b,6,vl);
 r.s7=qcp_qa_active_mov(b,7,vl);
 r.s8=qcp_qa_active_mov(b,8,vl);
 r.s9=qcp_qa_active_mov(b,9,vl);
 r.s10=qcp_qa_active_mov(b,10,vl);
 r.s11=qcp_qa_active_mov(b,11,vl);
 r.s12=qcp_qa_active_mov(b,12,vl);
 r.s13=qcp_qa_active_mov(b,13,vl);
 r.s14=qcp_qa_active_mov(b,14,vl);
 r.s15=qcp_qa_active_mov(b,15,vl);
 r.s16=qcp_qa_active_mov(b,16,vl);
 r.s17=qcp_qa_active_mov(b,17,vl);
 r.s18=qcp_qa_active_mov(b,18,vl);
 r.s19=qcp_qa_active_mov(b,19,vl);
 r.s20=qcp_qa_active_mov(b,20,vl);
 r.s21=qcp_qa_active_mov(b,21,vl);
 r.s22=qcp_qa_active_mov(b,22,vl);
 r.s23=qcp_qa_active_mov(b,23,vl);
 r.s24=qcp_qa_active_mov(b,24,vl);
 r.s25=qcp_qa_active_mov(b,25,vl);
 r.s26=qcp_qa_active_mov(b,26,vl);
 r.s27=qcp_qa_active_mov(b,27,vl);
 r.s28=qcp_qa_active_mov(b,28,vl);
 r.s29=qcp_qa_active_mov(b,29,vl);
 r.s30=qcp_qa_active_mov(b,30,vl);
 r.s31=qcp_qa_active_mov(b,31,vl);
 return r;
}
