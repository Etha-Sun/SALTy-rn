typedef signed char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef long long int64_t;
typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
/* Native LP64 and the formal unsigned64 alias share the full value domain.
 * QCP maps unsigned long to32 bits even with --arch=64: use its explicit64 type. */
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qs8Lrelu.Model */
/*@ Extern Coq (qcv_s16:Z -> Z) (qcv_seed:Z -> Z)
 (qcv_asr15:Z -> Z) (qcv_asr16:Z -> Z) (qcv_subw:Z -> Z -> Z) (qcv_shl7:Z -> Z)
 (qcv_sat16:Z -> Z) (qcv_sat8:Z -> Z)
 (qcv_neon_qrdmulh:Z -> Z -> Z) (qcv_rvv_mul:Z -> Z -> Z)
 (qcv_rvv_rnu15:Z -> Z) (qcv_rvv_clip15:Z -> Z)
 (qcv_neon_add:Z -> Z -> Z) (qcv_rvv_add:Z -> Z -> Z) */
int16_t qcp_qcv_narrow16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qcv_s16(x) && -32768<=__return && __return<=32767 && emp */;
int64_t qcp_qcv_asr15(int64_t x)
/*@ Require -4294967296<=x && x<=4294967296 && emp Ensure __return==qcv_asr15(x) && -131072<=__return && __return<=131072 && emp */;
int64_t qcp_qcv_asr16(int64_t x)
/*@ Require -4294967296<=x && x<=4294967296 && emp Ensure __return==qcv_asr16(x) && -65536<=__return && __return<=65536 && emp */;
int16_t qcp_qcv_sat16(int64_t x)
/*@ Require -9223372036854775807-1<=x && x<=9223372036854775807 && emp Ensure __return==qcv_sat16(x) && -32768<=__return && __return<=32767 && emp */;
int8_t qcp_qcv_sat8(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qcv_sat8(x) && -128<=__return && __return<=127 && emp */;
int16_t qcp_qcv_seed(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qcv_seed(x) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_subw(int16_t z,int8_t x)
/*@ Require -32768<=z && z<=32767 && -128<=x && x<=127 && emp Ensure __return==qcv_subw(z,x) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_shl7(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qcv_shl7(x) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_neon_qrdmulh(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qcv_neon_qrdmulh(a,b) && -32768<=__return && __return<=32767 && emp */;
int32_t qcp_qcv_rvv_mul(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qcv_rvv_mul(a,b) && emp */;
int16_t qcp_qcv_rvv_clip15(int32_t p)
/*@ Require -2147483648<=p && p<=2147483647 && emp Ensure __return==qcv_rvv_clip15(p) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_neon_add(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qcv_neon_add(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_rvv_add(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qcv_rvv_add(a,b) && -32768<=__return && __return<=32767 && emp */;
typedef unsigned char uint8_t;
struct qcv_scalar_params { int16_t input_zero_point; int32_t multiplier; int16_t output_zero_point; };
struct xnn_qs8_cvt_params { struct qcv_scalar_params scalar; };
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
struct xnn_qs8_lrelu_params { struct { int32_t input_zero_point; int32_t positive_multiplier; int32_t negative_multiplier; int32_t output_zero_point; } scalar; };
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
typedef struct vbool4_t {
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
} vbool4_t;
/*@ Import Coq Require Import Qs8Lrelu.Types */
/*@ Extern Coq (UndefStructPredint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint8x16_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint8m2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint16m4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint32m8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint16x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvbool4_t:Z -> Assertion) */
int16x8_t vdupq_n_s16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp
 Ensure store(&(__return.s0),short,x) * store(&(__return.s1),short,x) * store(&(__return.s2),short,x) * store(&(__return.s3),short,x) * store(&(__return.s4),short,x) * store(&(__return.s5),short,x) * store(&(__return.s6),short,x) * store(&(__return.s7),short,x) */;
int16x8_t vsubw_s8(int16x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -128<=b0 && b0<=127 && -128<=b1 && b1<=127 && -128<=b2 && b2<=127 && -128<=b3 && b3<=127 && -128<=b4 && b4<=127 && -128<=b5 && b5<=127 && -128<=b6 && b6<=127 && -128<=b7 && b7<=127 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),short,qcv_subw(a0,b0)) * store(&(__return.s1),short,qcv_subw(a1,b1)) * store(&(__return.s2),short,qcv_subw(a2,b2)) * store(&(__return.s3),short,qcv_subw(a3,b3)) * store(&(__return.s4),short,qcv_subw(a4,b4)) * store(&(__return.s5),short,qcv_subw(a5,b5)) * store(&(__return.s6),short,qcv_subw(a6,b6)) * store(&(__return.s7),short,qcv_subw(a7,b7)) */;
int16x8_t qcp_qcv_vshlq_n_s16_7(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),short,qcv_shl7(a0)) * store(&(__return.s1),short,qcv_shl7(a1)) * store(&(__return.s2),short,qcv_shl7(a2)) * store(&(__return.s3),short,qcv_shl7(a3)) * store(&(__return.s4),short,qcv_shl7(a4)) * store(&(__return.s5),short,qcv_shl7(a5)) * store(&(__return.s6),short,qcv_shl7(a6)) * store(&(__return.s7),short,qcv_shl7(a7)) */;
int16x8_t vqrdmulhq_s16(int16x8_t a,int16x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=b0 && b0<=32767 && -32768<=b1 && b1<=32767 && -32768<=b2 && b2<=32767 && -32768<=b3 && b3<=32767 && -32768<=b4 && b4<=32767 && -32768<=b5 && b5<=32767 && -32768<=b6 && b6<=32767 && -32768<=b7 && b7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3) * store(&(b.s4),short,b4) * store(&(b.s5),short,b5) * store(&(b.s6),short,b6) * store(&(b.s7),short,b7)
 Ensure store(&(__return.s0),short,qcv_neon_qrdmulh(a0,b0)) * store(&(__return.s1),short,qcv_neon_qrdmulh(a1,b1)) * store(&(__return.s2),short,qcv_neon_qrdmulh(a2,b2)) * store(&(__return.s3),short,qcv_neon_qrdmulh(a3,b3)) * store(&(__return.s4),short,qcv_neon_qrdmulh(a4,b4)) * store(&(__return.s5),short,qcv_neon_qrdmulh(a5,b5)) * store(&(__return.s6),short,qcv_neon_qrdmulh(a6,b6)) * store(&(__return.s7),short,qcv_neon_qrdmulh(a7,b7)) */;
int16x8_t vqaddq_s16(int16x8_t a,int16x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=b0 && b0<=32767 && -32768<=b1 && b1<=32767 && -32768<=b2 && b2<=32767 && -32768<=b3 && b3<=32767 && -32768<=b4 && b4<=32767 && -32768<=b5 && b5<=32767 && -32768<=b6 && b6<=32767 && -32768<=b7 && b7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3) * store(&(b.s4),short,b4) * store(&(b.s5),short,b5) * store(&(b.s6),short,b6) * store(&(b.s7),short,b7)
 Ensure store(&(__return.s0),short,qcv_neon_add(a0,b0)) * store(&(__return.s1),short,qcv_neon_add(a1,b1)) * store(&(__return.s2),short,qcv_neon_add(a2,b2)) * store(&(__return.s3),short,qcv_neon_add(a3,b3)) * store(&(__return.s4),short,qcv_neon_add(a4,b4)) * store(&(__return.s5),short,qcv_neon_add(a5,b5)) * store(&(__return.s6),short,qcv_neon_add(a6,b6)) * store(&(__return.s7),short,qcv_neon_add(a7,b7)) */;
int8x8_t vqmovn_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),char,qcv_sat8(a0)) * store(&(__return.s1),char,qcv_sat8(a1)) * store(&(__return.s2),char,qcv_sat8(a2)) * store(&(__return.s3),char,qcv_sat8(a3)) * store(&(__return.s4),char,qcv_sat8(a4)) * store(&(__return.s5),char,qcv_sat8(a5)) * store(&(__return.s6),char,qcv_sat8(a6)) * store(&(__return.s7),char,qcv_sat8(a7)) */;
int16x8_t vsubw_s8(int16x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -128<=b0 && b0<=127 && -128<=b1 && b1<=127 && -128<=b2 && b2<=127 && -128<=b3 && b3<=127 && -128<=b4 && b4<=127 && -128<=b5 && b5<=127 && -128<=b6 && b6<=127 && -128<=b7 && b7<=127 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),short,qcv_subw(a0,b0)) * store(&(__return.s1),short,qcv_subw(a1,b1)) * store(&(__return.s2),short,qcv_subw(a2,b2)) * store(&(__return.s3),short,qcv_subw(a3,b3)) * store(&(__return.s4),short,qcv_subw(a4,b4)) * store(&(__return.s5),short,qcv_subw(a5,b5)) * store(&(__return.s6),short,qcv_subw(a6,b6)) * store(&(__return.s7),short,qcv_subw(a7,b7)) */
{
 int16x8_t r;
 r.s0=qcp_qcv_subw(a.s0,b.s0);
 r.s1=qcp_qcv_subw(a.s1,b.s1);
 r.s2=qcp_qcv_subw(a.s2,b.s2);
 r.s3=qcp_qcv_subw(a.s3,b.s3);
 r.s4=qcp_qcv_subw(a.s4,b.s4);
 r.s5=qcp_qcv_subw(a.s5,b.s5);
 r.s6=qcp_qcv_subw(a.s6,b.s6);
 r.s7=qcp_qcv_subw(a.s7,b.s7);
 return r;
}
