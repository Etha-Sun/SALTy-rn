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
/*@ Import Coq Require Import Qs8Lrelu.LreluModel */
/*@ Extern Coq (qlr_neon_mask:Z -> Z -> Z) (qlr_rvv_mask:Z -> Z -> Z)
 (qlr_choose_neon:Z -> Z -> Z -> Z) (qlr_choose_rvv:Z -> Z -> Z -> Z) */
uint16_t qcp_qlr_cmp16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_neon_mask(a,b) && 0<=__return && __return<=65535 && emp */;
uint8_t qcp_qlr_cmpbool(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_rvv_mask(a,b) && 0<=__return && __return<=1 && emp */;
int16_t qcp_qlr_choose_neon(uint16_t m,int16_t a,int16_t b)
/*@ Require 0<=m && m<=65535 && -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_choose_neon(m,a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qlr_choose_rvv(uint8_t m,int16_t a,int16_t b)
/*@ Require 0<=m && m<=1 && -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_choose_rvv(m,a,b) && -32768<=__return && __return<=32767 && emp */;
/* Selection helpers model the canonical masks produced by the compared
   lanes in this kernel. They are not a full-domain ISA bit-select model. */
/*@ Extern Coq (qlr_neon_canonical:Z -> Prop) */
uint16x8_t vcltq_s16(int16x8_t a,int16x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=b0 && b0<=32767 && -32768<=b1 && b1<=32767 && -32768<=b2 && b2<=32767 && -32768<=b3 && b3<=32767 && -32768<=b4 && b4<=32767 && -32768<=b5 && b5<=32767 && -32768<=b6 && b6<=32767 && -32768<=b7 && b7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3) * store(&(b.s4),short,b4) * store(&(b.s5),short,b5) * store(&(b.s6),short,b6) * store(&(b.s7),short,b7)
 Ensure store(&(__return.s0),unsigned short,qlr_neon_mask(a0,b0)) * store(&(__return.s1),unsigned short,qlr_neon_mask(a1,b1)) * store(&(__return.s2),unsigned short,qlr_neon_mask(a2,b2)) * store(&(__return.s3),unsigned short,qlr_neon_mask(a3,b3)) * store(&(__return.s4),unsigned short,qlr_neon_mask(a4,b4)) * store(&(__return.s5),unsigned short,qlr_neon_mask(a5,b5)) * store(&(__return.s6),unsigned short,qlr_neon_mask(a6,b6)) * store(&(__return.s7),unsigned short,qlr_neon_mask(a7,b7)) */;
int16x8_t vbslq_s16(uint16x8_t m,int16x8_t a,int16x8_t b)
/*@ With (m0:Z) (m1:Z) (m2:Z) (m3:Z) (m4:Z) (m5:Z) (m6:Z) (m7:Z) (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require 0<=m0 && m0<=65535 && qlr_neon_canonical(m0) && 0<=m1 && m1<=65535 && qlr_neon_canonical(m1) && 0<=m2 && m2<=65535 && qlr_neon_canonical(m2) && 0<=m3 && m3<=65535 && qlr_neon_canonical(m3) && 0<=m4 && m4<=65535 && qlr_neon_canonical(m4) && 0<=m5 && m5<=65535 && qlr_neon_canonical(m5) && 0<=m6 && m6<=65535 && qlr_neon_canonical(m6) && 0<=m7 && m7<=65535 && qlr_neon_canonical(m7) && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=b0 && b0<=32767 && -32768<=b1 && b1<=32767 && -32768<=b2 && b2<=32767 && -32768<=b3 && b3<=32767 && -32768<=b4 && b4<=32767 && -32768<=b5 && b5<=32767 && -32768<=b6 && b6<=32767 && -32768<=b7 && b7<=32767 && store(&(m.s0),unsigned short,m0) * store(&(m.s1),unsigned short,m1) * store(&(m.s2),unsigned short,m2) * store(&(m.s3),unsigned short,m3) * store(&(m.s4),unsigned short,m4) * store(&(m.s5),unsigned short,m5) * store(&(m.s6),unsigned short,m6) * store(&(m.s7),unsigned short,m7) * store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3) * store(&(b.s4),short,b4) * store(&(b.s5),short,b5) * store(&(b.s6),short,b6) * store(&(b.s7),short,b7)
 Ensure store(&(__return.s0),short,qlr_choose_neon(m0,a0,b0)) * store(&(__return.s1),short,qlr_choose_neon(m1,a1,b1)) * store(&(__return.s2),short,qlr_choose_neon(m2,a2,b2)) * store(&(__return.s3),short,qlr_choose_neon(m3,a3,b3)) * store(&(__return.s4),short,qlr_choose_neon(m4,a4,b4)) * store(&(__return.s5),short,qlr_choose_neon(m5,a5,b5)) * store(&(__return.s6),short,qlr_choose_neon(m6,a6,b6)) * store(&(__return.s7),short,qlr_choose_neon(m7,a7,b7)) */;
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
/*@ Import Coq Require Import Qs8Lrelu.MemoryModel */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (s8_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "s8_arrays.strategies" */
/*@ Import Coq Require Import Qs8Lrelu.NeonStoreModel */
/*@ Extern Coq (s8_pack8:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
/*@ Extern Coq (s8_pack16:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
/*@ Import Coq Require Import Qs8Lrelu.ByteBridge */
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
/*@ Import Coq Require Import Qs8Lrelu.ProgramModel */
/*@ Extern Coq (qlr_values:Z -> Z -> Z -> Z -> Z -> list Z -> list Z)
 (qlr_neon_lane:Z -> Z -> Z -> Z -> Z -> Z)
 (qlr_outputs_related:list Z -> list Z -> Prop) */
void qcp_qcv_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */;
/*@ include strategies "s8_neon_memory.strategies" */
/*@ Import Coq Require Import Qs8Lrelu.ComposedModel */
/*@ Extern Coq (qcv_pack1:Z -> list Z) (qcv_pack2:Z -> Z -> list Z) (qcv_pack4:Z -> Z -> Z -> Z -> list Z) */
void qcp_qcv_store4_0(int8_t *p,const int8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,4) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7)
 Ensure CharArray::full(p,4,qcv_pack4(x0,x1,x2,x3)) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7) */;
void qcp_qcv_store2_0(int8_t *p,const int8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,2) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7)
 Ensure CharArray::full(p,2,qcv_pack2(x0,x1)) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7) */;
void qcp_qcv_store1_0(int8_t *p,const int8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,1) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7)
 Ensure CharArray::full(p,1,qcv_pack1(x0)) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7) */;
/* Frozen pure variable arguments only: borrow the source vector once, copy all
   eight actual fields in checked C, then evaluate the original nested body. */
/*
struct xnn_qs8_lrelu_params {
  struct {
    int32_t input_zero_point;
    int32_t positive_multiplier;
    int32_t negative_multiplier;
    int32_t output_zero_point;
  } scalar;
};
*/
void test_neon(
    size_t batch,
    const int8_t* input,
    int8_t* output,
    const struct xnn_qs8_lrelu_params* restrict params)
/*@ With (A:list Z) (RawZ:Z) (PM:Z) (NM:Z) (O:Z)
 Require 0<batch && batch<=18446744073709551608 &&
 input!=0 && output!=0 && params!=0 && (-2147483647-1)<=RawZ && RawZ<=2147483647 && (-2147483647-1)<=PM && PM<=2147483647 && (-2147483647-1)<=NM && NM<=2147483647 && (-2147483647-1)<=O && O<=2147483647 &&
 CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) *
 store(&(params->scalar.input_zero_point),int,RawZ) * store(&(params->scalar.positive_multiplier),int,PM) * store(&(params->scalar.negative_multiplier),int,NM) * store(&(params->scalar.output_zero_point),int,O)
 Ensure CharArray::full(input,batch+7,A) * CharArray::full(output,batch,qlr_values(batch,RawZ,PM,NM,O,A)) *
 store(&(params->scalar.input_zero_point),int,RawZ) * store(&(params->scalar.positive_multiplier),int,PM) * store(&(params->scalar.negative_multiplier),int,NM) * store(&(params->scalar.output_zero_point),int,O) */
{
/*@ Assert Zlength(A)==batch@pre+7 && sizeof(int8_t)==1 && batch%sizeof(int8_t)==0 && batch==batch@pre && input==input@pre && output==output@pre && params==params@pre && 0<batch@pre && batch@pre<=18446744073709551608 && input!=0 && output!=0 && params!=0 && (-2147483647-1)<=RawZ && RawZ<=2147483647 && (-2147483647-1)<=PM && PM<=2147483647 && (-2147483647-1)<=NM && NM<=2147483647 && (-2147483647-1)<=O && O<=2147483647 && CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) * store(&(params->scalar.input_zero_point),int,RawZ) * store(&(params->scalar.positive_multiplier),int,PM) * store(&(params->scalar.negative_multiplier),int,NM) * store(&(params->scalar.output_zero_point),int,O) */
  qcp_qcv_assert((batch != 0));
  qcp_qcv_assert((batch % sizeof(int8_t) == 0));
  qcp_qcv_assert((input != ((void*)0)));
  qcp_qcv_assert((output != ((void*)0)));
  const int16x8_t vinput_zero_point = vdupq_n_s16(params->scalar.input_zero_point);
  const int16x8_t vpositive_multiplier = vdupq_n_s16((int16_t)(0U-(uint32_t)params->scalar.positive_multiplier));
  const int16x8_t vnegative_multiplier = vdupq_n_s16((int16_t)(0U-(uint32_t)params->scalar.negative_multiplier));
  const int16x8_t voutput_zero_point = vdupq_n_s16(params->scalar.output_zero_point);
  const int16x8_t vzero = vdupq_n_s16(0);
/*@ Inv Assert Zlength(A)==batch@pre+7 && sizeof(int8_t)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<=batch && batch<=batch@pre && 0<=batch@pre-batch && input==input@pre+(batch@pre-batch) && ((batch>0 && output==output@pre+(batch@pre-batch)) || batch==0) && params==params@pre && params!=0 && (-2147483647-1)<=RawZ && RawZ<=2147483647 && (-2147483647-1)<=PM && PM<=2147483647 && (-2147483647-1)<=NM && NM<=2147483647 && (-2147483647-1)<=O && O<=2147483647 && CharArray::full(input@pre,batch@pre+7,A) * CharArray::full(output@pre,batch@pre-batch,qlr_values(batch@pre-batch,RawZ,PM,NM,O,A)) * CharArray::undef_full(output,batch) * store(&(params->scalar.input_zero_point),int,RawZ) * store(&(params->scalar.positive_multiplier),int,PM) * store(&(params->scalar.negative_multiplier),int,NM) * store(&(params->scalar.output_zero_point),int,O) * store(&(vinput_zero_point.s0),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s1),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s2),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s3),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s4),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s5),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s6),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s7),short,qcv_s16(RawZ)) * store(&(vpositive_multiplier.s0),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s0),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s1),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s1),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s2),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s2),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s3),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s3),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s4),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s4),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s5),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s5),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s6),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s6),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s7),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s7),short,qcv_seed(NM)) * store(&(voutput_zero_point.s0),short,qcv_s16(O)) * store(&(voutput_zero_point.s1),short,qcv_s16(O)) * store(&(voutput_zero_point.s2),short,qcv_s16(O)) * store(&(voutput_zero_point.s3),short,qcv_s16(O)) * store(&(voutput_zero_point.s4),short,qcv_s16(O)) * store(&(voutput_zero_point.s5),short,qcv_s16(O)) * store(&(voutput_zero_point.s6),short,qcv_s16(O)) * store(&(voutput_zero_point.s7),short,qcv_s16(O)) * store(&(vzero.s0),short,0) * store(&(vzero.s1),short,0) * store(&(vzero.s2),short,0) * store(&(vzero.s3),short,0) * store(&(vzero.s4),short,0) * store(&(vzero.s5),short,0) * store(&(vzero.s6),short,0) * store(&(vzero.s7),short,0) */
  for (; batch >= 8 * sizeof(int8_t); batch -= 8 * sizeof(int8_t)) {
    const int8x8_t vx = qcp_s8_load8((input)) /*@ where base=input@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */; input += 8;
    int16x8_t vacc = vsubw_s8(vinput_zero_point, vx) /*@ where a=&vinput_zero_point,b=&vx */;
    const uint16x8_t vmask = vcltq_s16(vacc, vzero) /*@ where a=&vacc,b=&vzero */;
    vacc = qcp_qcv_vshlq_n_s16_7(vacc) /*@ where a=&vacc */;
    const int16x8_t vmultiplier = vbslq_s16(vmask, vpositive_multiplier, vnegative_multiplier) /*@ where m=&vmask,a=&vpositive_multiplier,b=&vnegative_multiplier */;
    vacc = vqrdmulhq_s16(vacc, vmultiplier) /*@ where a=&vacc,b=&vmultiplier */;
    vacc = vqaddq_s16(vacc, voutput_zero_point) /*@ where a=&vacc,b=&voutput_zero_point */;
    const int8x8_t vy = vqmovn_s16(vacc) /*@ where a=&vacc */;
    qcp_s8_store8((output),&(vy)); output += 8;
  }
  if (batch != 0) {
    qcp_qcv_assert((batch >= 1 * sizeof(int8_t)));
    qcp_qcv_assert((batch <= 7 * sizeof(int8_t)));
/*@ Assert Zlength(A)==batch@pre+7 && sizeof(int8_t)==1 && 0<batch@pre && batch@pre<=18446744073709551608 && 0<batch && batch<8 && batch<=batch@pre && (batch==1 || batch==2 || batch==3 || batch==4 || batch==5 || batch==6 || batch==7) && 0<=batch@pre-batch && input==input@pre+(batch@pre-batch) && output==output@pre+(batch@pre-batch) && params==params@pre && params!=0 && (-2147483647-1)<=RawZ && RawZ<=2147483647 && (-2147483647-1)<=PM && PM<=2147483647 && (-2147483647-1)<=NM && NM<=2147483647 && (-2147483647-1)<=O && O<=2147483647 && CharArray::full(input@pre,batch@pre+7,A) * CharArray::full(output@pre,batch@pre-batch,qlr_values(batch@pre-batch,RawZ,PM,NM,O,A)) * CharArray::undef_full(output,batch) * store(&(params->scalar.input_zero_point),int,RawZ) * store(&(params->scalar.positive_multiplier),int,PM) * store(&(params->scalar.negative_multiplier),int,NM) * store(&(params->scalar.output_zero_point),int,O) * store(&(vinput_zero_point.s0),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s1),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s2),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s3),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s4),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s5),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s6),short,qcv_s16(RawZ)) * store(&(vinput_zero_point.s7),short,qcv_s16(RawZ)) * store(&(vpositive_multiplier.s0),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s0),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s1),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s1),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s2),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s2),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s3),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s3),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s4),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s4),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s5),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s5),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s6),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s6),short,qcv_seed(NM)) * store(&(vpositive_multiplier.s7),short,qcv_seed(PM)) * store(&(vnegative_multiplier.s7),short,qcv_seed(NM)) * store(&(voutput_zero_point.s0),short,qcv_s16(O)) * store(&(voutput_zero_point.s1),short,qcv_s16(O)) * store(&(voutput_zero_point.s2),short,qcv_s16(O)) * store(&(voutput_zero_point.s3),short,qcv_s16(O)) * store(&(voutput_zero_point.s4),short,qcv_s16(O)) * store(&(voutput_zero_point.s5),short,qcv_s16(O)) * store(&(voutput_zero_point.s6),short,qcv_s16(O)) * store(&(voutput_zero_point.s7),short,qcv_s16(O)) * store(&(vzero.s0),short,0) * store(&(vzero.s1),short,0) * store(&(vzero.s2),short,0) * store(&(vzero.s3),short,0) * store(&(vzero.s4),short,0) * store(&(vzero.s5),short,0) * store(&(vzero.s6),short,0) * store(&(vzero.s7),short,0) */
    const int8x8_t vx = qcp_s8_load8((input)) /*@ where base=input@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */;
    int16x8_t vacc = vsubw_s8(vinput_zero_point, vx) /*@ where a=&vinput_zero_point,b=&vx */;
    const uint16x8_t vmask = vcltq_s16(vacc, vzero) /*@ where a=&vacc,b=&vzero */;
    vacc = qcp_qcv_vshlq_n_s16_7(vacc) /*@ where a=&vacc */;
    const int16x8_t vmultiplier = vbslq_s16(vmask, vpositive_multiplier, vnegative_multiplier) /*@ where m=&vmask,a=&vpositive_multiplier,b=&vnegative_multiplier */;
    vacc = vqrdmulhq_s16(vacc, vmultiplier) /*@ where a=&vacc,b=&vmultiplier */;
    vacc = vqaddq_s16(vacc, voutput_zero_point) /*@ where a=&vacc,b=&voutput_zero_point */;
    int8x8_t vy = vqmovn_s16(vacc) /*@ where a=&vacc */;
    if (batch & (4 * sizeof(int8_t))) {
      qcp_qcv_store4_0((int8_t*)((void*) output),&(vy)); output += 4;
      vy = qcp_s8_ext4(&(vy),&(vy));
    }
    if (batch & (2 * sizeof(int8_t))) {
      qcp_qcv_store2_0((int8_t*)((void*) output),&(vy)); output += 2;
      vy = qcp_s8_ext2(&(vy),&(vy));
    }
    if (batch & (1 * sizeof(int8_t))) {
      qcp_qcv_store1_0((output),&(vy));
    }
  }
}
