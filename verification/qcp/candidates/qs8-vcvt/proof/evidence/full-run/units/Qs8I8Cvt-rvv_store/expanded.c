typedef signed char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef long long int64_t;
typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
typedef unsigned long size_t;
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
/*@ Import Coq Require Import Qs8I8Cvt.MemoryModel */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (s8_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "s8_arrays.strategies" */
/*@ Import Coq Require Import Qs8I8Cvt.RvvMemoryModel */
/*@ Extern Coq (s8_rvv_prefix:Z -> list Z -> list Z) (s8_rvv_nth:list Z -> Z -> Z) (s8_rvv_snoc:list Z -> Z -> list Z) (s8_rvv_length:list Z -> Z) (s8_rvv_pack32:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
int8_t qcp_s8_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure __return==s8_read_lane(i,vl,idx,L) && CharArray::full(base,count,L) */;
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=vl && vl<=32 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,s8_read_lane(0,vl,idx,L)) * store(&(__return.s1),char,s8_read_lane(1,vl,idx,L)) * store(&(__return.s2),char,s8_read_lane(2,vl,idx,L)) * store(&(__return.s3),char,s8_read_lane(3,vl,idx,L)) * store(&(__return.s4),char,s8_read_lane(4,vl,idx,L)) * store(&(__return.s5),char,s8_read_lane(5,vl,idx,L)) * store(&(__return.s6),char,s8_read_lane(6,vl,idx,L)) * store(&(__return.s7),char,s8_read_lane(7,vl,idx,L)) * store(&(__return.s8),char,s8_read_lane(8,vl,idx,L)) * store(&(__return.s9),char,s8_read_lane(9,vl,idx,L)) * store(&(__return.s10),char,s8_read_lane(10,vl,idx,L)) * store(&(__return.s11),char,s8_read_lane(11,vl,idx,L)) * store(&(__return.s12),char,s8_read_lane(12,vl,idx,L)) * store(&(__return.s13),char,s8_read_lane(13,vl,idx,L)) * store(&(__return.s14),char,s8_read_lane(14,vl,idx,L)) * store(&(__return.s15),char,s8_read_lane(15,vl,idx,L)) * store(&(__return.s16),char,s8_read_lane(16,vl,idx,L)) * store(&(__return.s17),char,s8_read_lane(17,vl,idx,L)) * store(&(__return.s18),char,s8_read_lane(18,vl,idx,L)) * store(&(__return.s19),char,s8_read_lane(19,vl,idx,L)) * store(&(__return.s20),char,s8_read_lane(20,vl,idx,L)) * store(&(__return.s21),char,s8_read_lane(21,vl,idx,L)) * store(&(__return.s22),char,s8_read_lane(22,vl,idx,L)) * store(&(__return.s23),char,s8_read_lane(23,vl,idx,L)) * store(&(__return.s24),char,s8_read_lane(24,vl,idx,L)) * store(&(__return.s25),char,s8_read_lane(25,vl,idx,L)) * store(&(__return.s26),char,s8_read_lane(26,vl,idx,L)) * store(&(__return.s27),char,s8_read_lane(27,vl,idx,L)) * store(&(__return.s28),char,s8_read_lane(28,vl,idx,L)) * store(&(__return.s29),char,s8_read_lane(29,vl,idx,L)) * store(&(__return.s30),char,s8_read_lane(30,vl,idx,L)) * store(&(__return.s31),char,s8_read_lane(31,vl,idx,L)) */;
int8_t qcp_qcv_rvv_get32(const vint8m2_t *a,size_t i)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=i && i<32 && -128<=x0 && x0<=127 && -128<=x1 && x1<=127 && -128<=x2 && x2<=127 && -128<=x3 && x3<=127 && -128<=x4 && x4<=127 && -128<=x5 && x5<=127 && -128<=x6 && x6<=127 && -128<=x7 && x7<=127 && -128<=x8 && x8<=127 && -128<=x9 && x9<=127 && -128<=x10 && x10<=127 && -128<=x11 && x11<=127 && -128<=x12 && x12<=127 && -128<=x13 && x13<=127 && -128<=x14 && x14<=127 && -128<=x15 && x15<=127 && -128<=x16 && x16<=127 && -128<=x17 && x17<=127 && -128<=x18 && x18<=127 && -128<=x19 && x19<=127 && -128<=x20 && x20<=127 && -128<=x21 && x21<=127 && -128<=x22 && x22<=127 && -128<=x23 && x23<=127 && -128<=x24 && x24<=127 && -128<=x25 && x25<=127 && -128<=x26 && x26<=127 && -128<=x27 && x27<=127 && -128<=x28 && x28<=127 && -128<=x29 && x29<=127 && -128<=x30 && x30<=127 && -128<=x31 && x31<=127 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31)
 Ensure __return==s8_rvv_nth(s8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31),i) && -128<=__return && __return<=127 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) */;
void qcp_s8_rvv_store_next(int8_t *p,size_t vl,size_t i,int8_t value)
/*@ With (P:list Z)
 Require 0<=i && i<vl && vl<=32 && -128<=value && value<=127 && CharArray::seg(p,0,i,P) * CharArray::undef_seg(p,i,vl)
 Ensure CharArray::seg(p,0,i+1,s8_rvv_snoc(P,value)) * CharArray::undef_seg(p,i+1,vl) */;
void qcp_qcv_rvv_store32(int8_t *p,const vint8m2_t *a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=vl && vl<=32 && -128<=x0 && x0<=127 && -128<=x1 && x1<=127 && -128<=x2 && x2<=127 && -128<=x3 && x3<=127 && -128<=x4 && x4<=127 && -128<=x5 && x5<=127 && -128<=x6 && x6<=127 && -128<=x7 && x7<=127 && -128<=x8 && x8<=127 && -128<=x9 && x9<=127 && -128<=x10 && x10<=127 && -128<=x11 && x11<=127 && -128<=x12 && x12<=127 && -128<=x13 && x13<=127 && -128<=x14 && x14<=127 && -128<=x15 && x15<=127 && -128<=x16 && x16<=127 && -128<=x17 && x17<=127 && -128<=x18 && x18<=127 && -128<=x19 && x19<=127 && -128<=x20 && x20<=127 && -128<=x21 && x21<=127 && -128<=x22 && x22<=127 && -128<=x23 && x23<=127 && -128<=x24 && x24<=127 && -128<=x25 && x25<=127 && -128<=x26 && x26<=127 && -128<=x27 && x27<=127 && -128<=x28 && x28<=127 && -128<=x29 && x29<=127 && -128<=x30 && x30<=127 && -128<=x31 && x31<=127 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * CharArray::undef_seg(p,0,vl)
 Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * CharArray::seg(p,0,vl,s8_rvv_prefix(vl,s8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31))) */;
/*@ include strategies "rvv_store.strategies" */
int8_t qcp_qcv_rvv_get32(const vint8m2_t *a,size_t i)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=i && i<32 && -128<=x0 && x0<=127 && -128<=x1 && x1<=127 && -128<=x2 && x2<=127 && -128<=x3 && x3<=127 && -128<=x4 && x4<=127 && -128<=x5 && x5<=127 && -128<=x6 && x6<=127 && -128<=x7 && x7<=127 && -128<=x8 && x8<=127 && -128<=x9 && x9<=127 && -128<=x10 && x10<=127 && -128<=x11 && x11<=127 && -128<=x12 && x12<=127 && -128<=x13 && x13<=127 && -128<=x14 && x14<=127 && -128<=x15 && x15<=127 && -128<=x16 && x16<=127 && -128<=x17 && x17<=127 && -128<=x18 && x18<=127 && -128<=x19 && x19<=127 && -128<=x20 && x20<=127 && -128<=x21 && x21<=127 && -128<=x22 && x22<=127 && -128<=x23 && x23<=127 && -128<=x24 && x24<=127 && -128<=x25 && x25<=127 && -128<=x26 && x26<=127 && -128<=x27 && x27<=127 && -128<=x28 && x28<=127 && -128<=x29 && x29<=127 && -128<=x30 && x30<=127 && -128<=x31 && x31<=127 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31)
 Ensure __return==s8_rvv_nth(s8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31),i) && -128<=__return && __return<=127 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) */
{
 if(i<16) {
  if(i<8) {
   if(i<4) {
    if(i<2) {
     if(i<1) {
      return a->s0;
     } else {
      return a->s1;
     }
    } else {
     if(i<3) {
      return a->s2;
     } else {
      return a->s3;
     }
    }
   } else {
    if(i<6) {
     if(i<5) {
      return a->s4;
     } else {
      return a->s5;
     }
    } else {
     if(i<7) {
      return a->s6;
     } else {
      return a->s7;
     }
    }
   }
  } else {
   if(i<12) {
    if(i<10) {
     if(i<9) {
      return a->s8;
     } else {
      return a->s9;
     }
    } else {
     if(i<11) {
      return a->s10;
     } else {
      return a->s11;
     }
    }
   } else {
    if(i<14) {
     if(i<13) {
      return a->s12;
     } else {
      return a->s13;
     }
    } else {
     if(i<15) {
      return a->s14;
     } else {
      return a->s15;
     }
    }
   }
  }
 } else {
  if(i<24) {
   if(i<20) {
    if(i<18) {
     if(i<17) {
      return a->s16;
     } else {
      return a->s17;
     }
    } else {
     if(i<19) {
      return a->s18;
     } else {
      return a->s19;
     }
    }
   } else {
    if(i<22) {
     if(i<21) {
      return a->s20;
     } else {
      return a->s21;
     }
    } else {
     if(i<23) {
      return a->s22;
     } else {
      return a->s23;
     }
    }
   }
  } else {
   if(i<28) {
    if(i<26) {
     if(i<25) {
      return a->s24;
     } else {
      return a->s25;
     }
    } else {
     if(i<27) {
      return a->s26;
     } else {
      return a->s27;
     }
    }
   } else {
    if(i<30) {
     if(i<29) {
      return a->s28;
     } else {
      return a->s29;
     }
    } else {
     if(i<31) {
      return a->s30;
     } else {
      return a->s31;
     }
    }
   }
  }
 }
}
void qcp_s8_rvv_store_next(int8_t *p,size_t vl,size_t i,int8_t value)
/*@ With (P:list Z)
 Require 0<=i && i<vl && vl<=32 && -128<=value && value<=127 && CharArray::seg(p,0,i,P) * CharArray::undef_seg(p,i,vl)
 Ensure CharArray::seg(p,0,i+1,s8_rvv_snoc(P,value)) * CharArray::undef_seg(p,i+1,vl) */
{ p[i]=value; }
void qcp_qcv_rvv_store32(int8_t *p,const vint8m2_t *a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=vl && vl<=32 && -128<=x0 && x0<=127 && -128<=x1 && x1<=127 && -128<=x2 && x2<=127 && -128<=x3 && x3<=127 && -128<=x4 && x4<=127 && -128<=x5 && x5<=127 && -128<=x6 && x6<=127 && -128<=x7 && x7<=127 && -128<=x8 && x8<=127 && -128<=x9 && x9<=127 && -128<=x10 && x10<=127 && -128<=x11 && x11<=127 && -128<=x12 && x12<=127 && -128<=x13 && x13<=127 && -128<=x14 && x14<=127 && -128<=x15 && x15<=127 && -128<=x16 && x16<=127 && -128<=x17 && x17<=127 && -128<=x18 && x18<=127 && -128<=x19 && x19<=127 && -128<=x20 && x20<=127 && -128<=x21 && x21<=127 && -128<=x22 && x22<=127 && -128<=x23 && x23<=127 && -128<=x24 && x24<=127 && -128<=x25 && x25<=127 && -128<=x26 && x26<=127 && -128<=x27 && x27<=127 && -128<=x28 && x28<=127 && -128<=x29 && x29<=127 && -128<=x30 && x30<=127 && -128<=x31 && x31<=127 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * CharArray::undef_seg(p,0,vl)
 Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * CharArray::seg(p,0,vl,s8_rvv_prefix(vl,s8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31))) */
{
 size_t i=0;
 /*@ Inv Assert 0<=i && i<=vl && vl<=32 && p==p@pre && a==a@pre && vl==vl@pre && -128<=x0 && x0<=127 && -128<=x1 && x1<=127 && -128<=x2 && x2<=127 && -128<=x3 && x3<=127 && -128<=x4 && x4<=127 && -128<=x5 && x5<=127 && -128<=x6 && x6<=127 && -128<=x7 && x7<=127 && -128<=x8 && x8<=127 && -128<=x9 && x9<=127 && -128<=x10 && x10<=127 && -128<=x11 && x11<=127 && -128<=x12 && x12<=127 && -128<=x13 && x13<=127 && -128<=x14 && x14<=127 && -128<=x15 && x15<=127 && -128<=x16 && x16<=127 && -128<=x17 && x17<=127 && -128<=x18 && x18<=127 && -128<=x19 && x19<=127 && -128<=x20 && x20<=127 && -128<=x21 && x21<=127 && -128<=x22 && x22<=127 && -128<=x23 && x23<=127 && -128<=x24 && x24<=127 && -128<=x25 && x25<=127 && -128<=x26 && x26<=127 && -128<=x27 && x27<=127 && -128<=x28 && x28<=127 && -128<=x29 && x29<=127 && -128<=x30 && x30<=127 && -128<=x31 && x31<=127 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * CharArray::seg(p,0,i,s8_rvv_prefix(i,s8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31))) * CharArray::undef_seg(p,i,vl) */
 for(;i<vl;++i) {
  int8_t value=qcp_qcv_rvv_get32(a,i);
  qcp_s8_rvv_store_next(p,vl,i,value);
 }
}
