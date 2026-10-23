typedef signed char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef long long int64_t;
typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
/* Native LP64 and the formal unsigned64 alias share the full value domain.
 * QCP maps unsigned long to32 bits even with --arch=64: use its explicit64 type. */
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qs8I8Cvt.Model */
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
/*@ Import Coq Require Import Qs8I8Cvt.Types */
/*@ Extern Coq (UndefStructPredint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint8x16_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint8m2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint16m4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint32m8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPreduint8x8_t:Z -> Assertion) */
/*@ Import Coq Require Import Qs8I8Cvt.RvvModel */
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
vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -128<=a0 && a0<=127 && -128<=a1 && a1<=127 && -128<=a2 && a2<=127 && -128<=a3 && a3<=127 && -128<=a4 && a4<=127 && -128<=a5 && a5<=127 && -128<=a6 && a6<=127 && -128<=a7 && a7<=127 && -128<=a8 && a8<=127 && -128<=a9 && a9<=127 && -128<=a10 && a10<=127 && -128<=a11 && a11<=127 && -128<=a12 && a12<=127 && -128<=a13 && a13<=127 && -128<=a14 && a14<=127 && -128<=a15 && a15<=127 && -128<=a16 && a16<=127 && -128<=a17 && a17<=127 && -128<=a18 && a18<=127 && -128<=a19 && a19<=127 && -128<=a20 && a20<=127 && -128<=a21 && a21<=127 && -128<=a22 && a22<=127 && -128<=a23 && a23<=127 && -128<=a24 && a24<=127 && -128<=a25 && a25<=127 && -128<=a26 && a26<=127 && -128<=a27 && a27<=127 && -128<=a28 && a28<=127 && -128<=a29 && a29<=127 && -128<=a30 && a30<=127 && -128<=a31 && a31<=127 && store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(a.s16),char,a16) * store(&(a.s17),char,a17) * store(&(a.s18),char,a18) * store(&(a.s19),char,a19) * store(&(a.s20),char,a20) * store(&(a.s21),char,a21) * store(&(a.s22),char,a22) * store(&(a.s23),char,a23) * store(&(a.s24),char,a24) * store(&(a.s25),char,a25) * store(&(a.s26),char,a26) * store(&(a.s27),char,a27) * store(&(a.s28),char,a28) * store(&(a.s29),char,a29) * store(&(a.s30),char,a30) * store(&(a.s31),char,a31)
 Ensure store(&(__return.s0),short,qcv_active_sext(0,vl,a0)) * store(&(__return.s1),short,qcv_active_sext(1,vl,a1)) * store(&(__return.s2),short,qcv_active_sext(2,vl,a2)) * store(&(__return.s3),short,qcv_active_sext(3,vl,a3)) * store(&(__return.s4),short,qcv_active_sext(4,vl,a4)) * store(&(__return.s5),short,qcv_active_sext(5,vl,a5)) * store(&(__return.s6),short,qcv_active_sext(6,vl,a6)) * store(&(__return.s7),short,qcv_active_sext(7,vl,a7)) * store(&(__return.s8),short,qcv_active_sext(8,vl,a8)) * store(&(__return.s9),short,qcv_active_sext(9,vl,a9)) * store(&(__return.s10),short,qcv_active_sext(10,vl,a10)) * store(&(__return.s11),short,qcv_active_sext(11,vl,a11)) * store(&(__return.s12),short,qcv_active_sext(12,vl,a12)) * store(&(__return.s13),short,qcv_active_sext(13,vl,a13)) * store(&(__return.s14),short,qcv_active_sext(14,vl,a14)) * store(&(__return.s15),short,qcv_active_sext(15,vl,a15)) * store(&(__return.s16),short,qcv_active_sext(16,vl,a16)) * store(&(__return.s17),short,qcv_active_sext(17,vl,a17)) * store(&(__return.s18),short,qcv_active_sext(18,vl,a18)) * store(&(__return.s19),short,qcv_active_sext(19,vl,a19)) * store(&(__return.s20),short,qcv_active_sext(20,vl,a20)) * store(&(__return.s21),short,qcv_active_sext(21,vl,a21)) * store(&(__return.s22),short,qcv_active_sext(22,vl,a22)) * store(&(__return.s23),short,qcv_active_sext(23,vl,a23)) * store(&(__return.s24),short,qcv_active_sext(24,vl,a24)) * store(&(__return.s25),short,qcv_active_sext(25,vl,a25)) * store(&(__return.s26),short,qcv_active_sext(26,vl,a26)) * store(&(__return.s27),short,qcv_active_sext(27,vl,a27)) * store(&(__return.s28),short,qcv_active_sext(28,vl,a28)) * store(&(__return.s29),short,qcv_active_sext(29,vl,a29)) * store(&(__return.s30),short,qcv_active_sext(30,vl,a30)) * store(&(__return.s31),short,qcv_active_sext(31,vl,a31)) */;
vint16m4_t __riscv_vrsub_vx_i16m4(vint16m4_t a,int16_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && -32768<=b && b<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),short,qcv_active_rsub(0,vl,a0,b)) * store(&(__return.s1),short,qcv_active_rsub(1,vl,a1,b)) * store(&(__return.s2),short,qcv_active_rsub(2,vl,a2,b)) * store(&(__return.s3),short,qcv_active_rsub(3,vl,a3,b)) * store(&(__return.s4),short,qcv_active_rsub(4,vl,a4,b)) * store(&(__return.s5),short,qcv_active_rsub(5,vl,a5,b)) * store(&(__return.s6),short,qcv_active_rsub(6,vl,a6,b)) * store(&(__return.s7),short,qcv_active_rsub(7,vl,a7,b)) * store(&(__return.s8),short,qcv_active_rsub(8,vl,a8,b)) * store(&(__return.s9),short,qcv_active_rsub(9,vl,a9,b)) * store(&(__return.s10),short,qcv_active_rsub(10,vl,a10,b)) * store(&(__return.s11),short,qcv_active_rsub(11,vl,a11,b)) * store(&(__return.s12),short,qcv_active_rsub(12,vl,a12,b)) * store(&(__return.s13),short,qcv_active_rsub(13,vl,a13,b)) * store(&(__return.s14),short,qcv_active_rsub(14,vl,a14,b)) * store(&(__return.s15),short,qcv_active_rsub(15,vl,a15,b)) * store(&(__return.s16),short,qcv_active_rsub(16,vl,a16,b)) * store(&(__return.s17),short,qcv_active_rsub(17,vl,a17,b)) * store(&(__return.s18),short,qcv_active_rsub(18,vl,a18,b)) * store(&(__return.s19),short,qcv_active_rsub(19,vl,a19,b)) * store(&(__return.s20),short,qcv_active_rsub(20,vl,a20,b)) * store(&(__return.s21),short,qcv_active_rsub(21,vl,a21,b)) * store(&(__return.s22),short,qcv_active_rsub(22,vl,a22,b)) * store(&(__return.s23),short,qcv_active_rsub(23,vl,a23,b)) * store(&(__return.s24),short,qcv_active_rsub(24,vl,a24,b)) * store(&(__return.s25),short,qcv_active_rsub(25,vl,a25,b)) * store(&(__return.s26),short,qcv_active_rsub(26,vl,a26,b)) * store(&(__return.s27),short,qcv_active_rsub(27,vl,a27,b)) * store(&(__return.s28),short,qcv_active_rsub(28,vl,a28,b)) * store(&(__return.s29),short,qcv_active_rsub(29,vl,a29,b)) * store(&(__return.s30),short,qcv_active_rsub(30,vl,a30,b)) * store(&(__return.s31),short,qcv_active_rsub(31,vl,a31,b)) */;
vint16m4_t __riscv_vsll_vx_i16m4(vint16m4_t a,unsigned int s,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && s==7 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),short,qcv_active_shl7(0,vl,a0)) * store(&(__return.s1),short,qcv_active_shl7(1,vl,a1)) * store(&(__return.s2),short,qcv_active_shl7(2,vl,a2)) * store(&(__return.s3),short,qcv_active_shl7(3,vl,a3)) * store(&(__return.s4),short,qcv_active_shl7(4,vl,a4)) * store(&(__return.s5),short,qcv_active_shl7(5,vl,a5)) * store(&(__return.s6),short,qcv_active_shl7(6,vl,a6)) * store(&(__return.s7),short,qcv_active_shl7(7,vl,a7)) * store(&(__return.s8),short,qcv_active_shl7(8,vl,a8)) * store(&(__return.s9),short,qcv_active_shl7(9,vl,a9)) * store(&(__return.s10),short,qcv_active_shl7(10,vl,a10)) * store(&(__return.s11),short,qcv_active_shl7(11,vl,a11)) * store(&(__return.s12),short,qcv_active_shl7(12,vl,a12)) * store(&(__return.s13),short,qcv_active_shl7(13,vl,a13)) * store(&(__return.s14),short,qcv_active_shl7(14,vl,a14)) * store(&(__return.s15),short,qcv_active_shl7(15,vl,a15)) * store(&(__return.s16),short,qcv_active_shl7(16,vl,a16)) * store(&(__return.s17),short,qcv_active_shl7(17,vl,a17)) * store(&(__return.s18),short,qcv_active_shl7(18,vl,a18)) * store(&(__return.s19),short,qcv_active_shl7(19,vl,a19)) * store(&(__return.s20),short,qcv_active_shl7(20,vl,a20)) * store(&(__return.s21),short,qcv_active_shl7(21,vl,a21)) * store(&(__return.s22),short,qcv_active_shl7(22,vl,a22)) * store(&(__return.s23),short,qcv_active_shl7(23,vl,a23)) * store(&(__return.s24),short,qcv_active_shl7(24,vl,a24)) * store(&(__return.s25),short,qcv_active_shl7(25,vl,a25)) * store(&(__return.s26),short,qcv_active_shl7(26,vl,a26)) * store(&(__return.s27),short,qcv_active_shl7(27,vl,a27)) * store(&(__return.s28),short,qcv_active_shl7(28,vl,a28)) * store(&(__return.s29),short,qcv_active_shl7(29,vl,a29)) * store(&(__return.s30),short,qcv_active_shl7(30,vl,a30)) * store(&(__return.s31),short,qcv_active_shl7(31,vl,a31)) */;
vint32m8_t __riscv_vwmul_vx_i32m8(vint16m4_t a,int16_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && -32768<=b && b<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),int,qcv_active_mul(0,vl,a0,b)) * store(&(__return.s1),int,qcv_active_mul(1,vl,a1,b)) * store(&(__return.s2),int,qcv_active_mul(2,vl,a2,b)) * store(&(__return.s3),int,qcv_active_mul(3,vl,a3,b)) * store(&(__return.s4),int,qcv_active_mul(4,vl,a4,b)) * store(&(__return.s5),int,qcv_active_mul(5,vl,a5,b)) * store(&(__return.s6),int,qcv_active_mul(6,vl,a6,b)) * store(&(__return.s7),int,qcv_active_mul(7,vl,a7,b)) * store(&(__return.s8),int,qcv_active_mul(8,vl,a8,b)) * store(&(__return.s9),int,qcv_active_mul(9,vl,a9,b)) * store(&(__return.s10),int,qcv_active_mul(10,vl,a10,b)) * store(&(__return.s11),int,qcv_active_mul(11,vl,a11,b)) * store(&(__return.s12),int,qcv_active_mul(12,vl,a12,b)) * store(&(__return.s13),int,qcv_active_mul(13,vl,a13,b)) * store(&(__return.s14),int,qcv_active_mul(14,vl,a14,b)) * store(&(__return.s15),int,qcv_active_mul(15,vl,a15,b)) * store(&(__return.s16),int,qcv_active_mul(16,vl,a16,b)) * store(&(__return.s17),int,qcv_active_mul(17,vl,a17,b)) * store(&(__return.s18),int,qcv_active_mul(18,vl,a18,b)) * store(&(__return.s19),int,qcv_active_mul(19,vl,a19,b)) * store(&(__return.s20),int,qcv_active_mul(20,vl,a20,b)) * store(&(__return.s21),int,qcv_active_mul(21,vl,a21,b)) * store(&(__return.s22),int,qcv_active_mul(22,vl,a22,b)) * store(&(__return.s23),int,qcv_active_mul(23,vl,a23,b)) * store(&(__return.s24),int,qcv_active_mul(24,vl,a24,b)) * store(&(__return.s25),int,qcv_active_mul(25,vl,a25,b)) * store(&(__return.s26),int,qcv_active_mul(26,vl,a26,b)) * store(&(__return.s27),int,qcv_active_mul(27,vl,a27,b)) * store(&(__return.s28),int,qcv_active_mul(28,vl,a28,b)) * store(&(__return.s29),int,qcv_active_mul(29,vl,a29,b)) * store(&(__return.s30),int,qcv_active_mul(30,vl,a30,b)) * store(&(__return.s31),int,qcv_active_mul(31,vl,a31,b)) */;
vint16m4_t __riscv_vnclip_wx_i16m4(vint32m8_t a,unsigned int s,int mode,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && s==15 && mode==0 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(a.s4),int,a4) * store(&(a.s5),int,a5) * store(&(a.s6),int,a6) * store(&(a.s7),int,a7) * store(&(a.s8),int,a8) * store(&(a.s9),int,a9) * store(&(a.s10),int,a10) * store(&(a.s11),int,a11) * store(&(a.s12),int,a12) * store(&(a.s13),int,a13) * store(&(a.s14),int,a14) * store(&(a.s15),int,a15) * store(&(a.s16),int,a16) * store(&(a.s17),int,a17) * store(&(a.s18),int,a18) * store(&(a.s19),int,a19) * store(&(a.s20),int,a20) * store(&(a.s21),int,a21) * store(&(a.s22),int,a22) * store(&(a.s23),int,a23) * store(&(a.s24),int,a24) * store(&(a.s25),int,a25) * store(&(a.s26),int,a26) * store(&(a.s27),int,a27) * store(&(a.s28),int,a28) * store(&(a.s29),int,a29) * store(&(a.s30),int,a30) * store(&(a.s31),int,a31)
 Ensure store(&(__return.s0),short,qcv_active_clip15(0,vl,a0)) * store(&(__return.s1),short,qcv_active_clip15(1,vl,a1)) * store(&(__return.s2),short,qcv_active_clip15(2,vl,a2)) * store(&(__return.s3),short,qcv_active_clip15(3,vl,a3)) * store(&(__return.s4),short,qcv_active_clip15(4,vl,a4)) * store(&(__return.s5),short,qcv_active_clip15(5,vl,a5)) * store(&(__return.s6),short,qcv_active_clip15(6,vl,a6)) * store(&(__return.s7),short,qcv_active_clip15(7,vl,a7)) * store(&(__return.s8),short,qcv_active_clip15(8,vl,a8)) * store(&(__return.s9),short,qcv_active_clip15(9,vl,a9)) * store(&(__return.s10),short,qcv_active_clip15(10,vl,a10)) * store(&(__return.s11),short,qcv_active_clip15(11,vl,a11)) * store(&(__return.s12),short,qcv_active_clip15(12,vl,a12)) * store(&(__return.s13),short,qcv_active_clip15(13,vl,a13)) * store(&(__return.s14),short,qcv_active_clip15(14,vl,a14)) * store(&(__return.s15),short,qcv_active_clip15(15,vl,a15)) * store(&(__return.s16),short,qcv_active_clip15(16,vl,a16)) * store(&(__return.s17),short,qcv_active_clip15(17,vl,a17)) * store(&(__return.s18),short,qcv_active_clip15(18,vl,a18)) * store(&(__return.s19),short,qcv_active_clip15(19,vl,a19)) * store(&(__return.s20),short,qcv_active_clip15(20,vl,a20)) * store(&(__return.s21),short,qcv_active_clip15(21,vl,a21)) * store(&(__return.s22),short,qcv_active_clip15(22,vl,a22)) * store(&(__return.s23),short,qcv_active_clip15(23,vl,a23)) * store(&(__return.s24),short,qcv_active_clip15(24,vl,a24)) * store(&(__return.s25),short,qcv_active_clip15(25,vl,a25)) * store(&(__return.s26),short,qcv_active_clip15(26,vl,a26)) * store(&(__return.s27),short,qcv_active_clip15(27,vl,a27)) * store(&(__return.s28),short,qcv_active_clip15(28,vl,a28)) * store(&(__return.s29),short,qcv_active_clip15(29,vl,a29)) * store(&(__return.s30),short,qcv_active_clip15(30,vl,a30)) * store(&(__return.s31),short,qcv_active_clip15(31,vl,a31)) */;
vint16m4_t __riscv_vsadd_vx_i16m4(vint16m4_t a,int16_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && -32768<=b && b<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),short,qcv_active_add(0,vl,a0,b)) * store(&(__return.s1),short,qcv_active_add(1,vl,a1,b)) * store(&(__return.s2),short,qcv_active_add(2,vl,a2,b)) * store(&(__return.s3),short,qcv_active_add(3,vl,a3,b)) * store(&(__return.s4),short,qcv_active_add(4,vl,a4,b)) * store(&(__return.s5),short,qcv_active_add(5,vl,a5,b)) * store(&(__return.s6),short,qcv_active_add(6,vl,a6,b)) * store(&(__return.s7),short,qcv_active_add(7,vl,a7,b)) * store(&(__return.s8),short,qcv_active_add(8,vl,a8,b)) * store(&(__return.s9),short,qcv_active_add(9,vl,a9,b)) * store(&(__return.s10),short,qcv_active_add(10,vl,a10,b)) * store(&(__return.s11),short,qcv_active_add(11,vl,a11,b)) * store(&(__return.s12),short,qcv_active_add(12,vl,a12,b)) * store(&(__return.s13),short,qcv_active_add(13,vl,a13,b)) * store(&(__return.s14),short,qcv_active_add(14,vl,a14,b)) * store(&(__return.s15),short,qcv_active_add(15,vl,a15,b)) * store(&(__return.s16),short,qcv_active_add(16,vl,a16,b)) * store(&(__return.s17),short,qcv_active_add(17,vl,a17,b)) * store(&(__return.s18),short,qcv_active_add(18,vl,a18,b)) * store(&(__return.s19),short,qcv_active_add(19,vl,a19,b)) * store(&(__return.s20),short,qcv_active_add(20,vl,a20,b)) * store(&(__return.s21),short,qcv_active_add(21,vl,a21,b)) * store(&(__return.s22),short,qcv_active_add(22,vl,a22,b)) * store(&(__return.s23),short,qcv_active_add(23,vl,a23,b)) * store(&(__return.s24),short,qcv_active_add(24,vl,a24,b)) * store(&(__return.s25),short,qcv_active_add(25,vl,a25,b)) * store(&(__return.s26),short,qcv_active_add(26,vl,a26,b)) * store(&(__return.s27),short,qcv_active_add(27,vl,a27,b)) * store(&(__return.s28),short,qcv_active_add(28,vl,a28,b)) * store(&(__return.s29),short,qcv_active_add(29,vl,a29,b)) * store(&(__return.s30),short,qcv_active_add(30,vl,a30,b)) * store(&(__return.s31),short,qcv_active_add(31,vl,a31,b)) */;
vint8m2_t __riscv_vnclip_wx_i8m2(vint16m4_t a,unsigned int s,int mode,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && s==0 && mode==2 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),char,qcv_active_clip8(0,vl,a0)) * store(&(__return.s1),char,qcv_active_clip8(1,vl,a1)) * store(&(__return.s2),char,qcv_active_clip8(2,vl,a2)) * store(&(__return.s3),char,qcv_active_clip8(3,vl,a3)) * store(&(__return.s4),char,qcv_active_clip8(4,vl,a4)) * store(&(__return.s5),char,qcv_active_clip8(5,vl,a5)) * store(&(__return.s6),char,qcv_active_clip8(6,vl,a6)) * store(&(__return.s7),char,qcv_active_clip8(7,vl,a7)) * store(&(__return.s8),char,qcv_active_clip8(8,vl,a8)) * store(&(__return.s9),char,qcv_active_clip8(9,vl,a9)) * store(&(__return.s10),char,qcv_active_clip8(10,vl,a10)) * store(&(__return.s11),char,qcv_active_clip8(11,vl,a11)) * store(&(__return.s12),char,qcv_active_clip8(12,vl,a12)) * store(&(__return.s13),char,qcv_active_clip8(13,vl,a13)) * store(&(__return.s14),char,qcv_active_clip8(14,vl,a14)) * store(&(__return.s15),char,qcv_active_clip8(15,vl,a15)) * store(&(__return.s16),char,qcv_active_clip8(16,vl,a16)) * store(&(__return.s17),char,qcv_active_clip8(17,vl,a17)) * store(&(__return.s18),char,qcv_active_clip8(18,vl,a18)) * store(&(__return.s19),char,qcv_active_clip8(19,vl,a19)) * store(&(__return.s20),char,qcv_active_clip8(20,vl,a20)) * store(&(__return.s21),char,qcv_active_clip8(21,vl,a21)) * store(&(__return.s22),char,qcv_active_clip8(22,vl,a22)) * store(&(__return.s23),char,qcv_active_clip8(23,vl,a23)) * store(&(__return.s24),char,qcv_active_clip8(24,vl,a24)) * store(&(__return.s25),char,qcv_active_clip8(25,vl,a25)) * store(&(__return.s26),char,qcv_active_clip8(26,vl,a26)) * store(&(__return.s27),char,qcv_active_clip8(27,vl,a27)) * store(&(__return.s28),char,qcv_active_clip8(28,vl,a28)) * store(&(__return.s29),char,qcv_active_clip8(29,vl,a29)) * store(&(__return.s30),char,qcv_active_clip8(30,vl,a30)) * store(&(__return.s31),char,qcv_active_clip8(31,vl,a31)) */;
vint8m2_t __riscv_vnclip_wx_i8m2(vint16m4_t a,unsigned int s,int mode,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && s==0 && mode==2 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),char,qcv_active_clip8(0,vl,a0)) * store(&(__return.s1),char,qcv_active_clip8(1,vl,a1)) * store(&(__return.s2),char,qcv_active_clip8(2,vl,a2)) * store(&(__return.s3),char,qcv_active_clip8(3,vl,a3)) * store(&(__return.s4),char,qcv_active_clip8(4,vl,a4)) * store(&(__return.s5),char,qcv_active_clip8(5,vl,a5)) * store(&(__return.s6),char,qcv_active_clip8(6,vl,a6)) * store(&(__return.s7),char,qcv_active_clip8(7,vl,a7)) * store(&(__return.s8),char,qcv_active_clip8(8,vl,a8)) * store(&(__return.s9),char,qcv_active_clip8(9,vl,a9)) * store(&(__return.s10),char,qcv_active_clip8(10,vl,a10)) * store(&(__return.s11),char,qcv_active_clip8(11,vl,a11)) * store(&(__return.s12),char,qcv_active_clip8(12,vl,a12)) * store(&(__return.s13),char,qcv_active_clip8(13,vl,a13)) * store(&(__return.s14),char,qcv_active_clip8(14,vl,a14)) * store(&(__return.s15),char,qcv_active_clip8(15,vl,a15)) * store(&(__return.s16),char,qcv_active_clip8(16,vl,a16)) * store(&(__return.s17),char,qcv_active_clip8(17,vl,a17)) * store(&(__return.s18),char,qcv_active_clip8(18,vl,a18)) * store(&(__return.s19),char,qcv_active_clip8(19,vl,a19)) * store(&(__return.s20),char,qcv_active_clip8(20,vl,a20)) * store(&(__return.s21),char,qcv_active_clip8(21,vl,a21)) * store(&(__return.s22),char,qcv_active_clip8(22,vl,a22)) * store(&(__return.s23),char,qcv_active_clip8(23,vl,a23)) * store(&(__return.s24),char,qcv_active_clip8(24,vl,a24)) * store(&(__return.s25),char,qcv_active_clip8(25,vl,a25)) * store(&(__return.s26),char,qcv_active_clip8(26,vl,a26)) * store(&(__return.s27),char,qcv_active_clip8(27,vl,a27)) * store(&(__return.s28),char,qcv_active_clip8(28,vl,a28)) * store(&(__return.s29),char,qcv_active_clip8(29,vl,a29)) * store(&(__return.s30),char,qcv_active_clip8(30,vl,a30)) * store(&(__return.s31),char,qcv_active_clip8(31,vl,a31)) */
{
 vint8m2_t r;
 r.s0=qcp_qcv_active_clip8(a.s0,0,vl);
 r.s1=qcp_qcv_active_clip8(a.s1,1,vl);
 r.s2=qcp_qcv_active_clip8(a.s2,2,vl);
 r.s3=qcp_qcv_active_clip8(a.s3,3,vl);
 r.s4=qcp_qcv_active_clip8(a.s4,4,vl);
 r.s5=qcp_qcv_active_clip8(a.s5,5,vl);
 r.s6=qcp_qcv_active_clip8(a.s6,6,vl);
 r.s7=qcp_qcv_active_clip8(a.s7,7,vl);
 r.s8=qcp_qcv_active_clip8(a.s8,8,vl);
 r.s9=qcp_qcv_active_clip8(a.s9,9,vl);
 r.s10=qcp_qcv_active_clip8(a.s10,10,vl);
 r.s11=qcp_qcv_active_clip8(a.s11,11,vl);
 r.s12=qcp_qcv_active_clip8(a.s12,12,vl);
 r.s13=qcp_qcv_active_clip8(a.s13,13,vl);
 r.s14=qcp_qcv_active_clip8(a.s14,14,vl);
 r.s15=qcp_qcv_active_clip8(a.s15,15,vl);
 r.s16=qcp_qcv_active_clip8(a.s16,16,vl);
 r.s17=qcp_qcv_active_clip8(a.s17,17,vl);
 r.s18=qcp_qcv_active_clip8(a.s18,18,vl);
 r.s19=qcp_qcv_active_clip8(a.s19,19,vl);
 r.s20=qcp_qcv_active_clip8(a.s20,20,vl);
 r.s21=qcp_qcv_active_clip8(a.s21,21,vl);
 r.s22=qcp_qcv_active_clip8(a.s22,22,vl);
 r.s23=qcp_qcv_active_clip8(a.s23,23,vl);
 r.s24=qcp_qcv_active_clip8(a.s24,24,vl);
 r.s25=qcp_qcv_active_clip8(a.s25,25,vl);
 r.s26=qcp_qcv_active_clip8(a.s26,26,vl);
 r.s27=qcp_qcv_active_clip8(a.s27,27,vl);
 r.s28=qcp_qcv_active_clip8(a.s28,28,vl);
 r.s29=qcp_qcv_active_clip8(a.s29,29,vl);
 r.s30=qcp_qcv_active_clip8(a.s30,30,vl);
 r.s31=qcp_qcv_active_clip8(a.s31,31,vl);
 return r;
}
