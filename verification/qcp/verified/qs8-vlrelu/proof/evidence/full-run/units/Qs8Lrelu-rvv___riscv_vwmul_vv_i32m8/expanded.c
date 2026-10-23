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
/*@ Import Coq Require Import Qs8Lrelu.RvvModel */
/*@ Extern Coq (qcv_vl:Z -> Z) (qcv_active_sext:Z -> Z -> Z -> Z) (qcv_active_rsub:Z -> Z -> Z -> Z -> Z) (qcv_active_shl7:Z -> Z -> Z -> Z) (qcv_active_mul:Z -> Z -> Z -> Z -> Z) (qcv_active_clip15:Z -> Z -> Z -> Z) (qcv_active_add:Z -> Z -> Z -> Z -> Z) (qcv_active_clip8:Z -> Z -> Z -> Z) */
int16_t qcp_qcv_active_sext(int8_t x,size_t i,size_t vl)
/*@ Require -128<=x && x<=127 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_sext(i,vl,x) && -128<=__return && __return<=127 && emp */;
int16_t qcp_qcv_active_rsub(int16_t a,int16_t b,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_rsub(i,vl,a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_active_shl7(int16_t a,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_shl7(i,vl,a) && -32768<=__return && __return<=32767 && emp */;
int32_t qcp_qcv_active_mul(int16_t a,int16_t b,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_mul(i,vl,a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
int16_t qcp_qcv_active_clip15(int32_t a,size_t i,size_t vl)
/*@ Require -2147483648<=a && a<=2147483647 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_clip15(i,vl,a) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_active_add(int16_t a,int16_t b,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_add(i,vl,a,b) && -32768<=__return && __return<=32767 && emp */;
int8_t qcp_qcv_active_clip8(int16_t a,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_clip8(i,vl,a) && -128<=__return && __return<=127 && emp */;
size_t __riscv_vsetvl_e8m2(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp Ensure __return==qcv_vl(n) && 0<=__return && __return<=32 && __return<=n && (n==0 || 0<__return) && emp */;
/*@ Import Coq Require Import Qs8Lrelu.LreluActiveModel */
/*@ Extern Coq (qlr_active_mask:Z -> Z -> Z -> Z -> Z)
 (qlr_active_splat:Z -> Z -> Z -> Z)
 (qlr_active_merge:Z -> Z -> Z -> Z -> Z -> Z) */
uint8_t qcp_qlr_active_mask(int16_t a,int16_t b,size_t k,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=k && k<=31 && 0<=vl && vl<=32 && emp
 Ensure __return==qlr_active_mask(a,b,k,vl) && 0<=__return && __return<=1 && emp */;
int16_t qcp_qlr_active_splat(int16_t b,size_t k,size_t vl)
/*@ Require -32768<=b && b<=32767 && 0<=k && k<=31 && 0<=vl && vl<=32 && emp
 Ensure __return==qlr_active_splat(b,k,vl) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qlr_active_merge(int16_t a,int16_t b,uint8_t m,size_t k,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=m && m<=1 && 0<=k && k<=31 && 0<=vl && vl<=32 && emp
 Ensure __return==qlr_active_merge(a,b,m,k,vl) && -32768<=__return && __return<=32767 && emp */;
/* Inactive C fields use zero and are unobserved by the kernel. This is
 a fixed C-shim convention, not an architectural tail policy claim. */
vbool4_t __riscv_vmslt_vx_i16m4_b4(vint16m4_t a,int16_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && -32768<=b && b<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),unsigned char,qlr_active_mask(a0,b,0,vl)) * store(&(__return.s1),unsigned char,qlr_active_mask(a1,b,1,vl)) * store(&(__return.s2),unsigned char,qlr_active_mask(a2,b,2,vl)) * store(&(__return.s3),unsigned char,qlr_active_mask(a3,b,3,vl)) * store(&(__return.s4),unsigned char,qlr_active_mask(a4,b,4,vl)) * store(&(__return.s5),unsigned char,qlr_active_mask(a5,b,5,vl)) * store(&(__return.s6),unsigned char,qlr_active_mask(a6,b,6,vl)) * store(&(__return.s7),unsigned char,qlr_active_mask(a7,b,7,vl)) * store(&(__return.s8),unsigned char,qlr_active_mask(a8,b,8,vl)) * store(&(__return.s9),unsigned char,qlr_active_mask(a9,b,9,vl)) * store(&(__return.s10),unsigned char,qlr_active_mask(a10,b,10,vl)) * store(&(__return.s11),unsigned char,qlr_active_mask(a11,b,11,vl)) * store(&(__return.s12),unsigned char,qlr_active_mask(a12,b,12,vl)) * store(&(__return.s13),unsigned char,qlr_active_mask(a13,b,13,vl)) * store(&(__return.s14),unsigned char,qlr_active_mask(a14,b,14,vl)) * store(&(__return.s15),unsigned char,qlr_active_mask(a15,b,15,vl)) * store(&(__return.s16),unsigned char,qlr_active_mask(a16,b,16,vl)) * store(&(__return.s17),unsigned char,qlr_active_mask(a17,b,17,vl)) * store(&(__return.s18),unsigned char,qlr_active_mask(a18,b,18,vl)) * store(&(__return.s19),unsigned char,qlr_active_mask(a19,b,19,vl)) * store(&(__return.s20),unsigned char,qlr_active_mask(a20,b,20,vl)) * store(&(__return.s21),unsigned char,qlr_active_mask(a21,b,21,vl)) * store(&(__return.s22),unsigned char,qlr_active_mask(a22,b,22,vl)) * store(&(__return.s23),unsigned char,qlr_active_mask(a23,b,23,vl)) * store(&(__return.s24),unsigned char,qlr_active_mask(a24,b,24,vl)) * store(&(__return.s25),unsigned char,qlr_active_mask(a25,b,25,vl)) * store(&(__return.s26),unsigned char,qlr_active_mask(a26,b,26,vl)) * store(&(__return.s27),unsigned char,qlr_active_mask(a27,b,27,vl)) * store(&(__return.s28),unsigned char,qlr_active_mask(a28,b,28,vl)) * store(&(__return.s29),unsigned char,qlr_active_mask(a29,b,29,vl)) * store(&(__return.s30),unsigned char,qlr_active_mask(a30,b,30,vl)) * store(&(__return.s31),unsigned char,qlr_active_mask(a31,b,31,vl)) */;
vint16m4_t __riscv_vmv_v_x_i16m4(int16_t b,size_t vl)
/*@ Require 0<=vl && vl<=32 && -32768<=b && b<=32767 && emp
 Ensure store(&(__return.s0),short,qlr_active_splat(b,0,vl)) * store(&(__return.s1),short,qlr_active_splat(b,1,vl)) * store(&(__return.s2),short,qlr_active_splat(b,2,vl)) * store(&(__return.s3),short,qlr_active_splat(b,3,vl)) * store(&(__return.s4),short,qlr_active_splat(b,4,vl)) * store(&(__return.s5),short,qlr_active_splat(b,5,vl)) * store(&(__return.s6),short,qlr_active_splat(b,6,vl)) * store(&(__return.s7),short,qlr_active_splat(b,7,vl)) * store(&(__return.s8),short,qlr_active_splat(b,8,vl)) * store(&(__return.s9),short,qlr_active_splat(b,9,vl)) * store(&(__return.s10),short,qlr_active_splat(b,10,vl)) * store(&(__return.s11),short,qlr_active_splat(b,11,vl)) * store(&(__return.s12),short,qlr_active_splat(b,12,vl)) * store(&(__return.s13),short,qlr_active_splat(b,13,vl)) * store(&(__return.s14),short,qlr_active_splat(b,14,vl)) * store(&(__return.s15),short,qlr_active_splat(b,15,vl)) * store(&(__return.s16),short,qlr_active_splat(b,16,vl)) * store(&(__return.s17),short,qlr_active_splat(b,17,vl)) * store(&(__return.s18),short,qlr_active_splat(b,18,vl)) * store(&(__return.s19),short,qlr_active_splat(b,19,vl)) * store(&(__return.s20),short,qlr_active_splat(b,20,vl)) * store(&(__return.s21),short,qlr_active_splat(b,21,vl)) * store(&(__return.s22),short,qlr_active_splat(b,22,vl)) * store(&(__return.s23),short,qlr_active_splat(b,23,vl)) * store(&(__return.s24),short,qlr_active_splat(b,24,vl)) * store(&(__return.s25),short,qlr_active_splat(b,25,vl)) * store(&(__return.s26),short,qlr_active_splat(b,26,vl)) * store(&(__return.s27),short,qlr_active_splat(b,27,vl)) * store(&(__return.s28),short,qlr_active_splat(b,28,vl)) * store(&(__return.s29),short,qlr_active_splat(b,29,vl)) * store(&(__return.s30),short,qlr_active_splat(b,30,vl)) * store(&(__return.s31),short,qlr_active_splat(b,31,vl)) */;
vint16m4_t __riscv_vmerge_vxm_i16m4(vint16m4_t a,int16_t b,vbool4_t m,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) (m0:Z) (m1:Z) (m2:Z) (m3:Z) (m4:Z) (m5:Z) (m6:Z) (m7:Z) (m8:Z) (m9:Z) (m10:Z) (m11:Z) (m12:Z) (m13:Z) (m14:Z) (m15:Z) (m16:Z) (m17:Z) (m18:Z) (m19:Z) (m20:Z) (m21:Z) (m22:Z) (m23:Z) (m24:Z) (m25:Z) (m26:Z) (m27:Z) (m28:Z) (m29:Z) (m30:Z) (m31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && 0<=m0 && m0<=1 && 0<=m1 && m1<=1 && 0<=m2 && m2<=1 && 0<=m3 && m3<=1 && 0<=m4 && m4<=1 && 0<=m5 && m5<=1 && 0<=m6 && m6<=1 && 0<=m7 && m7<=1 && 0<=m8 && m8<=1 && 0<=m9 && m9<=1 && 0<=m10 && m10<=1 && 0<=m11 && m11<=1 && 0<=m12 && m12<=1 && 0<=m13 && m13<=1 && 0<=m14 && m14<=1 && 0<=m15 && m15<=1 && 0<=m16 && m16<=1 && 0<=m17 && m17<=1 && 0<=m18 && m18<=1 && 0<=m19 && m19<=1 && 0<=m20 && m20<=1 && 0<=m21 && m21<=1 && 0<=m22 && m22<=1 && 0<=m23 && m23<=1 && 0<=m24 && m24<=1 && 0<=m25 && m25<=1 && 0<=m26 && m26<=1 && 0<=m27 && m27<=1 && 0<=m28 && m28<=1 && 0<=m29 && m29<=1 && 0<=m30 && m30<=1 && 0<=m31 && m31<=1 && -32768<=b && b<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31) * store(&(m.s0),unsigned char,m0) * store(&(m.s1),unsigned char,m1) * store(&(m.s2),unsigned char,m2) * store(&(m.s3),unsigned char,m3) * store(&(m.s4),unsigned char,m4) * store(&(m.s5),unsigned char,m5) * store(&(m.s6),unsigned char,m6) * store(&(m.s7),unsigned char,m7) * store(&(m.s8),unsigned char,m8) * store(&(m.s9),unsigned char,m9) * store(&(m.s10),unsigned char,m10) * store(&(m.s11),unsigned char,m11) * store(&(m.s12),unsigned char,m12) * store(&(m.s13),unsigned char,m13) * store(&(m.s14),unsigned char,m14) * store(&(m.s15),unsigned char,m15) * store(&(m.s16),unsigned char,m16) * store(&(m.s17),unsigned char,m17) * store(&(m.s18),unsigned char,m18) * store(&(m.s19),unsigned char,m19) * store(&(m.s20),unsigned char,m20) * store(&(m.s21),unsigned char,m21) * store(&(m.s22),unsigned char,m22) * store(&(m.s23),unsigned char,m23) * store(&(m.s24),unsigned char,m24) * store(&(m.s25),unsigned char,m25) * store(&(m.s26),unsigned char,m26) * store(&(m.s27),unsigned char,m27) * store(&(m.s28),unsigned char,m28) * store(&(m.s29),unsigned char,m29) * store(&(m.s30),unsigned char,m30) * store(&(m.s31),unsigned char,m31)
 Ensure store(&(__return.s0),short,qlr_active_merge(a0,b,m0,0,vl)) * store(&(__return.s1),short,qlr_active_merge(a1,b,m1,1,vl)) * store(&(__return.s2),short,qlr_active_merge(a2,b,m2,2,vl)) * store(&(__return.s3),short,qlr_active_merge(a3,b,m3,3,vl)) * store(&(__return.s4),short,qlr_active_merge(a4,b,m4,4,vl)) * store(&(__return.s5),short,qlr_active_merge(a5,b,m5,5,vl)) * store(&(__return.s6),short,qlr_active_merge(a6,b,m6,6,vl)) * store(&(__return.s7),short,qlr_active_merge(a7,b,m7,7,vl)) * store(&(__return.s8),short,qlr_active_merge(a8,b,m8,8,vl)) * store(&(__return.s9),short,qlr_active_merge(a9,b,m9,9,vl)) * store(&(__return.s10),short,qlr_active_merge(a10,b,m10,10,vl)) * store(&(__return.s11),short,qlr_active_merge(a11,b,m11,11,vl)) * store(&(__return.s12),short,qlr_active_merge(a12,b,m12,12,vl)) * store(&(__return.s13),short,qlr_active_merge(a13,b,m13,13,vl)) * store(&(__return.s14),short,qlr_active_merge(a14,b,m14,14,vl)) * store(&(__return.s15),short,qlr_active_merge(a15,b,m15,15,vl)) * store(&(__return.s16),short,qlr_active_merge(a16,b,m16,16,vl)) * store(&(__return.s17),short,qlr_active_merge(a17,b,m17,17,vl)) * store(&(__return.s18),short,qlr_active_merge(a18,b,m18,18,vl)) * store(&(__return.s19),short,qlr_active_merge(a19,b,m19,19,vl)) * store(&(__return.s20),short,qlr_active_merge(a20,b,m20,20,vl)) * store(&(__return.s21),short,qlr_active_merge(a21,b,m21,21,vl)) * store(&(__return.s22),short,qlr_active_merge(a22,b,m22,22,vl)) * store(&(__return.s23),short,qlr_active_merge(a23,b,m23,23,vl)) * store(&(__return.s24),short,qlr_active_merge(a24,b,m24,24,vl)) * store(&(__return.s25),short,qlr_active_merge(a25,b,m25,25,vl)) * store(&(__return.s26),short,qlr_active_merge(a26,b,m26,26,vl)) * store(&(__return.s27),short,qlr_active_merge(a27,b,m27,27,vl)) * store(&(__return.s28),short,qlr_active_merge(a28,b,m28,28,vl)) * store(&(__return.s29),short,qlr_active_merge(a29,b,m29,29,vl)) * store(&(__return.s30),short,qlr_active_merge(a30,b,m30,30,vl)) * store(&(__return.s31),short,qlr_active_merge(a31,b,m31,31,vl)) */;
vint32m8_t __riscv_vwmul_vv_i32m8(vint16m4_t a,vint16m4_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z) (b16:Z) (b17:Z) (b18:Z) (b19:Z) (b20:Z) (b21:Z) (b22:Z) (b23:Z) (b24:Z) (b25:Z) (b26:Z) (b27:Z) (b28:Z) (b29:Z) (b30:Z) (b31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && -32768<=b0 && b0<=32767 && -32768<=b1 && b1<=32767 && -32768<=b2 && b2<=32767 && -32768<=b3 && b3<=32767 && -32768<=b4 && b4<=32767 && -32768<=b5 && b5<=32767 && -32768<=b6 && b6<=32767 && -32768<=b7 && b7<=32767 && -32768<=b8 && b8<=32767 && -32768<=b9 && b9<=32767 && -32768<=b10 && b10<=32767 && -32768<=b11 && b11<=32767 && -32768<=b12 && b12<=32767 && -32768<=b13 && b13<=32767 && -32768<=b14 && b14<=32767 && -32768<=b15 && b15<=32767 && -32768<=b16 && b16<=32767 && -32768<=b17 && b17<=32767 && -32768<=b18 && b18<=32767 && -32768<=b19 && b19<=32767 && -32768<=b20 && b20<=32767 && -32768<=b21 && b21<=32767 && -32768<=b22 && b22<=32767 && -32768<=b23 && b23<=32767 && -32768<=b24 && b24<=32767 && -32768<=b25 && b25<=32767 && -32768<=b26 && b26<=32767 && -32768<=b27 && b27<=32767 && -32768<=b28 && b28<=32767 && -32768<=b29 && b29<=32767 && -32768<=b30 && b30<=32767 && -32768<=b31 && b31<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3) * store(&(b.s4),short,b4) * store(&(b.s5),short,b5) * store(&(b.s6),short,b6) * store(&(b.s7),short,b7) * store(&(b.s8),short,b8) * store(&(b.s9),short,b9) * store(&(b.s10),short,b10) * store(&(b.s11),short,b11) * store(&(b.s12),short,b12) * store(&(b.s13),short,b13) * store(&(b.s14),short,b14) * store(&(b.s15),short,b15) * store(&(b.s16),short,b16) * store(&(b.s17),short,b17) * store(&(b.s18),short,b18) * store(&(b.s19),short,b19) * store(&(b.s20),short,b20) * store(&(b.s21),short,b21) * store(&(b.s22),short,b22) * store(&(b.s23),short,b23) * store(&(b.s24),short,b24) * store(&(b.s25),short,b25) * store(&(b.s26),short,b26) * store(&(b.s27),short,b27) * store(&(b.s28),short,b28) * store(&(b.s29),short,b29) * store(&(b.s30),short,b30) * store(&(b.s31),short,b31)
 Ensure store(&(__return.s0),int,qcv_active_mul(0,vl,a0,b0)) * store(&(__return.s1),int,qcv_active_mul(1,vl,a1,b1)) * store(&(__return.s2),int,qcv_active_mul(2,vl,a2,b2)) * store(&(__return.s3),int,qcv_active_mul(3,vl,a3,b3)) * store(&(__return.s4),int,qcv_active_mul(4,vl,a4,b4)) * store(&(__return.s5),int,qcv_active_mul(5,vl,a5,b5)) * store(&(__return.s6),int,qcv_active_mul(6,vl,a6,b6)) * store(&(__return.s7),int,qcv_active_mul(7,vl,a7,b7)) * store(&(__return.s8),int,qcv_active_mul(8,vl,a8,b8)) * store(&(__return.s9),int,qcv_active_mul(9,vl,a9,b9)) * store(&(__return.s10),int,qcv_active_mul(10,vl,a10,b10)) * store(&(__return.s11),int,qcv_active_mul(11,vl,a11,b11)) * store(&(__return.s12),int,qcv_active_mul(12,vl,a12,b12)) * store(&(__return.s13),int,qcv_active_mul(13,vl,a13,b13)) * store(&(__return.s14),int,qcv_active_mul(14,vl,a14,b14)) * store(&(__return.s15),int,qcv_active_mul(15,vl,a15,b15)) * store(&(__return.s16),int,qcv_active_mul(16,vl,a16,b16)) * store(&(__return.s17),int,qcv_active_mul(17,vl,a17,b17)) * store(&(__return.s18),int,qcv_active_mul(18,vl,a18,b18)) * store(&(__return.s19),int,qcv_active_mul(19,vl,a19,b19)) * store(&(__return.s20),int,qcv_active_mul(20,vl,a20,b20)) * store(&(__return.s21),int,qcv_active_mul(21,vl,a21,b21)) * store(&(__return.s22),int,qcv_active_mul(22,vl,a22,b22)) * store(&(__return.s23),int,qcv_active_mul(23,vl,a23,b23)) * store(&(__return.s24),int,qcv_active_mul(24,vl,a24,b24)) * store(&(__return.s25),int,qcv_active_mul(25,vl,a25,b25)) * store(&(__return.s26),int,qcv_active_mul(26,vl,a26,b26)) * store(&(__return.s27),int,qcv_active_mul(27,vl,a27,b27)) * store(&(__return.s28),int,qcv_active_mul(28,vl,a28,b28)) * store(&(__return.s29),int,qcv_active_mul(29,vl,a29,b29)) * store(&(__return.s30),int,qcv_active_mul(30,vl,a30,b30)) * store(&(__return.s31),int,qcv_active_mul(31,vl,a31,b31)) */;
vint32m8_t __riscv_vwmul_vv_i32m8(vint16m4_t a,vint16m4_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z) (b16:Z) (b17:Z) (b18:Z) (b19:Z) (b20:Z) (b21:Z) (b22:Z) (b23:Z) (b24:Z) (b25:Z) (b26:Z) (b27:Z) (b28:Z) (b29:Z) (b30:Z) (b31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && -32768<=b0 && b0<=32767 && -32768<=b1 && b1<=32767 && -32768<=b2 && b2<=32767 && -32768<=b3 && b3<=32767 && -32768<=b4 && b4<=32767 && -32768<=b5 && b5<=32767 && -32768<=b6 && b6<=32767 && -32768<=b7 && b7<=32767 && -32768<=b8 && b8<=32767 && -32768<=b9 && b9<=32767 && -32768<=b10 && b10<=32767 && -32768<=b11 && b11<=32767 && -32768<=b12 && b12<=32767 && -32768<=b13 && b13<=32767 && -32768<=b14 && b14<=32767 && -32768<=b15 && b15<=32767 && -32768<=b16 && b16<=32767 && -32768<=b17 && b17<=32767 && -32768<=b18 && b18<=32767 && -32768<=b19 && b19<=32767 && -32768<=b20 && b20<=32767 && -32768<=b21 && b21<=32767 && -32768<=b22 && b22<=32767 && -32768<=b23 && b23<=32767 && -32768<=b24 && b24<=32767 && -32768<=b25 && b25<=32767 && -32768<=b26 && b26<=32767 && -32768<=b27 && b27<=32767 && -32768<=b28 && b28<=32767 && -32768<=b29 && b29<=32767 && -32768<=b30 && b30<=32767 && -32768<=b31 && b31<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3) * store(&(b.s4),short,b4) * store(&(b.s5),short,b5) * store(&(b.s6),short,b6) * store(&(b.s7),short,b7) * store(&(b.s8),short,b8) * store(&(b.s9),short,b9) * store(&(b.s10),short,b10) * store(&(b.s11),short,b11) * store(&(b.s12),short,b12) * store(&(b.s13),short,b13) * store(&(b.s14),short,b14) * store(&(b.s15),short,b15) * store(&(b.s16),short,b16) * store(&(b.s17),short,b17) * store(&(b.s18),short,b18) * store(&(b.s19),short,b19) * store(&(b.s20),short,b20) * store(&(b.s21),short,b21) * store(&(b.s22),short,b22) * store(&(b.s23),short,b23) * store(&(b.s24),short,b24) * store(&(b.s25),short,b25) * store(&(b.s26),short,b26) * store(&(b.s27),short,b27) * store(&(b.s28),short,b28) * store(&(b.s29),short,b29) * store(&(b.s30),short,b30) * store(&(b.s31),short,b31)
 Ensure store(&(__return.s0),int,qcv_active_mul(0,vl,a0,b0)) * store(&(__return.s1),int,qcv_active_mul(1,vl,a1,b1)) * store(&(__return.s2),int,qcv_active_mul(2,vl,a2,b2)) * store(&(__return.s3),int,qcv_active_mul(3,vl,a3,b3)) * store(&(__return.s4),int,qcv_active_mul(4,vl,a4,b4)) * store(&(__return.s5),int,qcv_active_mul(5,vl,a5,b5)) * store(&(__return.s6),int,qcv_active_mul(6,vl,a6,b6)) * store(&(__return.s7),int,qcv_active_mul(7,vl,a7,b7)) * store(&(__return.s8),int,qcv_active_mul(8,vl,a8,b8)) * store(&(__return.s9),int,qcv_active_mul(9,vl,a9,b9)) * store(&(__return.s10),int,qcv_active_mul(10,vl,a10,b10)) * store(&(__return.s11),int,qcv_active_mul(11,vl,a11,b11)) * store(&(__return.s12),int,qcv_active_mul(12,vl,a12,b12)) * store(&(__return.s13),int,qcv_active_mul(13,vl,a13,b13)) * store(&(__return.s14),int,qcv_active_mul(14,vl,a14,b14)) * store(&(__return.s15),int,qcv_active_mul(15,vl,a15,b15)) * store(&(__return.s16),int,qcv_active_mul(16,vl,a16,b16)) * store(&(__return.s17),int,qcv_active_mul(17,vl,a17,b17)) * store(&(__return.s18),int,qcv_active_mul(18,vl,a18,b18)) * store(&(__return.s19),int,qcv_active_mul(19,vl,a19,b19)) * store(&(__return.s20),int,qcv_active_mul(20,vl,a20,b20)) * store(&(__return.s21),int,qcv_active_mul(21,vl,a21,b21)) * store(&(__return.s22),int,qcv_active_mul(22,vl,a22,b22)) * store(&(__return.s23),int,qcv_active_mul(23,vl,a23,b23)) * store(&(__return.s24),int,qcv_active_mul(24,vl,a24,b24)) * store(&(__return.s25),int,qcv_active_mul(25,vl,a25,b25)) * store(&(__return.s26),int,qcv_active_mul(26,vl,a26,b26)) * store(&(__return.s27),int,qcv_active_mul(27,vl,a27,b27)) * store(&(__return.s28),int,qcv_active_mul(28,vl,a28,b28)) * store(&(__return.s29),int,qcv_active_mul(29,vl,a29,b29)) * store(&(__return.s30),int,qcv_active_mul(30,vl,a30,b30)) * store(&(__return.s31),int,qcv_active_mul(31,vl,a31,b31)) */
{
 vint32m8_t r;
 r.s0=qcp_qcv_active_mul(a.s0,b.s0,0,vl);
 r.s1=qcp_qcv_active_mul(a.s1,b.s1,1,vl);
 r.s2=qcp_qcv_active_mul(a.s2,b.s2,2,vl);
 r.s3=qcp_qcv_active_mul(a.s3,b.s3,3,vl);
 r.s4=qcp_qcv_active_mul(a.s4,b.s4,4,vl);
 r.s5=qcp_qcv_active_mul(a.s5,b.s5,5,vl);
 r.s6=qcp_qcv_active_mul(a.s6,b.s6,6,vl);
 r.s7=qcp_qcv_active_mul(a.s7,b.s7,7,vl);
 r.s8=qcp_qcv_active_mul(a.s8,b.s8,8,vl);
 r.s9=qcp_qcv_active_mul(a.s9,b.s9,9,vl);
 r.s10=qcp_qcv_active_mul(a.s10,b.s10,10,vl);
 r.s11=qcp_qcv_active_mul(a.s11,b.s11,11,vl);
 r.s12=qcp_qcv_active_mul(a.s12,b.s12,12,vl);
 r.s13=qcp_qcv_active_mul(a.s13,b.s13,13,vl);
 r.s14=qcp_qcv_active_mul(a.s14,b.s14,14,vl);
 r.s15=qcp_qcv_active_mul(a.s15,b.s15,15,vl);
 r.s16=qcp_qcv_active_mul(a.s16,b.s16,16,vl);
 r.s17=qcp_qcv_active_mul(a.s17,b.s17,17,vl);
 r.s18=qcp_qcv_active_mul(a.s18,b.s18,18,vl);
 r.s19=qcp_qcv_active_mul(a.s19,b.s19,19,vl);
 r.s20=qcp_qcv_active_mul(a.s20,b.s20,20,vl);
 r.s21=qcp_qcv_active_mul(a.s21,b.s21,21,vl);
 r.s22=qcp_qcv_active_mul(a.s22,b.s22,22,vl);
 r.s23=qcp_qcv_active_mul(a.s23,b.s23,23,vl);
 r.s24=qcp_qcv_active_mul(a.s24,b.s24,24,vl);
 r.s25=qcp_qcv_active_mul(a.s25,b.s25,25,vl);
 r.s26=qcp_qcv_active_mul(a.s26,b.s26,26,vl);
 r.s27=qcp_qcv_active_mul(a.s27,b.s27,27,vl);
 r.s28=qcp_qcv_active_mul(a.s28,b.s28,28,vl);
 r.s29=qcp_qcv_active_mul(a.s29,b.s29,29,vl);
 r.s30=qcp_qcv_active_mul(a.s30,b.s30,30,vl);
 r.s31=qcp_qcv_active_mul(a.s31,b.s31,31,vl);
 return r;
}
