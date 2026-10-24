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
/*@ Import Coq Require Import Qu8Add.RvvMemoryModel */
/*@ Extern Coq (u8_rvv_prefix:Z -> list Z -> list Z) (u8_rvv_nth:list Z -> Z -> Z) (u8_rvv_snoc:list Z -> Z -> list Z) (u8_rvv_length:list Z -> Z) (u8_rvv_pack32:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
uint8_t qcp_u8_read_lane(const uint8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure __return==u8_read_lane(i,vl,idx,L) && UCharArray::full(base,count,L) */;
vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=vl && vl<=32 && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure UCharArray::full(base,count,L) * store(&(__return.s0),unsigned char,u8_read_lane(0,vl,idx,L)) * store(&(__return.s1),unsigned char,u8_read_lane(1,vl,idx,L)) * store(&(__return.s2),unsigned char,u8_read_lane(2,vl,idx,L)) * store(&(__return.s3),unsigned char,u8_read_lane(3,vl,idx,L)) * store(&(__return.s4),unsigned char,u8_read_lane(4,vl,idx,L)) * store(&(__return.s5),unsigned char,u8_read_lane(5,vl,idx,L)) * store(&(__return.s6),unsigned char,u8_read_lane(6,vl,idx,L)) * store(&(__return.s7),unsigned char,u8_read_lane(7,vl,idx,L)) * store(&(__return.s8),unsigned char,u8_read_lane(8,vl,idx,L)) * store(&(__return.s9),unsigned char,u8_read_lane(9,vl,idx,L)) * store(&(__return.s10),unsigned char,u8_read_lane(10,vl,idx,L)) * store(&(__return.s11),unsigned char,u8_read_lane(11,vl,idx,L)) * store(&(__return.s12),unsigned char,u8_read_lane(12,vl,idx,L)) * store(&(__return.s13),unsigned char,u8_read_lane(13,vl,idx,L)) * store(&(__return.s14),unsigned char,u8_read_lane(14,vl,idx,L)) * store(&(__return.s15),unsigned char,u8_read_lane(15,vl,idx,L)) * store(&(__return.s16),unsigned char,u8_read_lane(16,vl,idx,L)) * store(&(__return.s17),unsigned char,u8_read_lane(17,vl,idx,L)) * store(&(__return.s18),unsigned char,u8_read_lane(18,vl,idx,L)) * store(&(__return.s19),unsigned char,u8_read_lane(19,vl,idx,L)) * store(&(__return.s20),unsigned char,u8_read_lane(20,vl,idx,L)) * store(&(__return.s21),unsigned char,u8_read_lane(21,vl,idx,L)) * store(&(__return.s22),unsigned char,u8_read_lane(22,vl,idx,L)) * store(&(__return.s23),unsigned char,u8_read_lane(23,vl,idx,L)) * store(&(__return.s24),unsigned char,u8_read_lane(24,vl,idx,L)) * store(&(__return.s25),unsigned char,u8_read_lane(25,vl,idx,L)) * store(&(__return.s26),unsigned char,u8_read_lane(26,vl,idx,L)) * store(&(__return.s27),unsigned char,u8_read_lane(27,vl,idx,L)) * store(&(__return.s28),unsigned char,u8_read_lane(28,vl,idx,L)) * store(&(__return.s29),unsigned char,u8_read_lane(29,vl,idx,L)) * store(&(__return.s30),unsigned char,u8_read_lane(30,vl,idx,L)) * store(&(__return.s31),unsigned char,u8_read_lane(31,vl,idx,L)) */;
uint8_t qcp_qu_rvv_get32(const vuint8m2_t *a,size_t i)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=i && i<32 && 0<=x0 && x0<=255 && 0<=x1 && x1<=255 && 0<=x2 && x2<=255 && 0<=x3 && x3<=255 && 0<=x4 && x4<=255 && 0<=x5 && x5<=255 && 0<=x6 && x6<=255 && 0<=x7 && x7<=255 && 0<=x8 && x8<=255 && 0<=x9 && x9<=255 && 0<=x10 && x10<=255 && 0<=x11 && x11<=255 && 0<=x12 && x12<=255 && 0<=x13 && x13<=255 && 0<=x14 && x14<=255 && 0<=x15 && x15<=255 && 0<=x16 && x16<=255 && 0<=x17 && x17<=255 && 0<=x18 && x18<=255 && 0<=x19 && x19<=255 && 0<=x20 && x20<=255 && 0<=x21 && x21<=255 && 0<=x22 && x22<=255 && 0<=x23 && x23<=255 && 0<=x24 && x24<=255 && 0<=x25 && x25<=255 && 0<=x26 && x26<=255 && 0<=x27 && x27<=255 && 0<=x28 && x28<=255 && 0<=x29 && x29<=255 && 0<=x30 && x30<=255 && 0<=x31 && x31<=255 && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) * store(&(a->s16),unsigned char,x16) * store(&(a->s17),unsigned char,x17) * store(&(a->s18),unsigned char,x18) * store(&(a->s19),unsigned char,x19) * store(&(a->s20),unsigned char,x20) * store(&(a->s21),unsigned char,x21) * store(&(a->s22),unsigned char,x22) * store(&(a->s23),unsigned char,x23) * store(&(a->s24),unsigned char,x24) * store(&(a->s25),unsigned char,x25) * store(&(a->s26),unsigned char,x26) * store(&(a->s27),unsigned char,x27) * store(&(a->s28),unsigned char,x28) * store(&(a->s29),unsigned char,x29) * store(&(a->s30),unsigned char,x30) * store(&(a->s31),unsigned char,x31)
 Ensure __return==u8_rvv_nth(u8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31),i) && 0<=__return && __return<=255 && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) * store(&(a->s16),unsigned char,x16) * store(&(a->s17),unsigned char,x17) * store(&(a->s18),unsigned char,x18) * store(&(a->s19),unsigned char,x19) * store(&(a->s20),unsigned char,x20) * store(&(a->s21),unsigned char,x21) * store(&(a->s22),unsigned char,x22) * store(&(a->s23),unsigned char,x23) * store(&(a->s24),unsigned char,x24) * store(&(a->s25),unsigned char,x25) * store(&(a->s26),unsigned char,x26) * store(&(a->s27),unsigned char,x27) * store(&(a->s28),unsigned char,x28) * store(&(a->s29),unsigned char,x29) * store(&(a->s30),unsigned char,x30) * store(&(a->s31),unsigned char,x31) */;
void qcp_u8_rvv_store_next(uint8_t *p,size_t vl,size_t i,uint8_t value)
/*@ With (P:list Z)
 Require 0<=i && i<vl && vl<=32 && 0<=value && value<=255 && UCharArray::seg(p,0,i,P) * UCharArray::undef_seg(p,i,vl)
 Ensure UCharArray::seg(p,0,i+1,u8_rvv_snoc(P,value)) * UCharArray::undef_seg(p,i+1,vl) */;
void qcp_qu_rvv_store32(uint8_t *p,const vuint8m2_t *a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=vl && vl<=32 && 0<=x0 && x0<=255 && 0<=x1 && x1<=255 && 0<=x2 && x2<=255 && 0<=x3 && x3<=255 && 0<=x4 && x4<=255 && 0<=x5 && x5<=255 && 0<=x6 && x6<=255 && 0<=x7 && x7<=255 && 0<=x8 && x8<=255 && 0<=x9 && x9<=255 && 0<=x10 && x10<=255 && 0<=x11 && x11<=255 && 0<=x12 && x12<=255 && 0<=x13 && x13<=255 && 0<=x14 && x14<=255 && 0<=x15 && x15<=255 && 0<=x16 && x16<=255 && 0<=x17 && x17<=255 && 0<=x18 && x18<=255 && 0<=x19 && x19<=255 && 0<=x20 && x20<=255 && 0<=x21 && x21<=255 && 0<=x22 && x22<=255 && 0<=x23 && x23<=255 && 0<=x24 && x24<=255 && 0<=x25 && x25<=255 && 0<=x26 && x26<=255 && 0<=x27 && x27<=255 && 0<=x28 && x28<=255 && 0<=x29 && x29<=255 && 0<=x30 && x30<=255 && 0<=x31 && x31<=255 && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) * store(&(a->s16),unsigned char,x16) * store(&(a->s17),unsigned char,x17) * store(&(a->s18),unsigned char,x18) * store(&(a->s19),unsigned char,x19) * store(&(a->s20),unsigned char,x20) * store(&(a->s21),unsigned char,x21) * store(&(a->s22),unsigned char,x22) * store(&(a->s23),unsigned char,x23) * store(&(a->s24),unsigned char,x24) * store(&(a->s25),unsigned char,x25) * store(&(a->s26),unsigned char,x26) * store(&(a->s27),unsigned char,x27) * store(&(a->s28),unsigned char,x28) * store(&(a->s29),unsigned char,x29) * store(&(a->s30),unsigned char,x30) * store(&(a->s31),unsigned char,x31) * UCharArray::undef_seg(p,0,vl)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) * store(&(a->s16),unsigned char,x16) * store(&(a->s17),unsigned char,x17) * store(&(a->s18),unsigned char,x18) * store(&(a->s19),unsigned char,x19) * store(&(a->s20),unsigned char,x20) * store(&(a->s21),unsigned char,x21) * store(&(a->s22),unsigned char,x22) * store(&(a->s23),unsigned char,x23) * store(&(a->s24),unsigned char,x24) * store(&(a->s25),unsigned char,x25) * store(&(a->s26),unsigned char,x26) * store(&(a->s27),unsigned char,x27) * store(&(a->s28),unsigned char,x28) * store(&(a->s29),unsigned char,x29) * store(&(a->s30),unsigned char,x30) * store(&(a->s31),unsigned char,x31) * UCharArray::seg(p,0,vl,u8_rvv_prefix(vl,u8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31))) */;
vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=vl && vl<=32 && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure UCharArray::full(base,count,L) * store(&(__return.s0),unsigned char,u8_read_lane(0,vl,idx,L)) * store(&(__return.s1),unsigned char,u8_read_lane(1,vl,idx,L)) * store(&(__return.s2),unsigned char,u8_read_lane(2,vl,idx,L)) * store(&(__return.s3),unsigned char,u8_read_lane(3,vl,idx,L)) * store(&(__return.s4),unsigned char,u8_read_lane(4,vl,idx,L)) * store(&(__return.s5),unsigned char,u8_read_lane(5,vl,idx,L)) * store(&(__return.s6),unsigned char,u8_read_lane(6,vl,idx,L)) * store(&(__return.s7),unsigned char,u8_read_lane(7,vl,idx,L)) * store(&(__return.s8),unsigned char,u8_read_lane(8,vl,idx,L)) * store(&(__return.s9),unsigned char,u8_read_lane(9,vl,idx,L)) * store(&(__return.s10),unsigned char,u8_read_lane(10,vl,idx,L)) * store(&(__return.s11),unsigned char,u8_read_lane(11,vl,idx,L)) * store(&(__return.s12),unsigned char,u8_read_lane(12,vl,idx,L)) * store(&(__return.s13),unsigned char,u8_read_lane(13,vl,idx,L)) * store(&(__return.s14),unsigned char,u8_read_lane(14,vl,idx,L)) * store(&(__return.s15),unsigned char,u8_read_lane(15,vl,idx,L)) * store(&(__return.s16),unsigned char,u8_read_lane(16,vl,idx,L)) * store(&(__return.s17),unsigned char,u8_read_lane(17,vl,idx,L)) * store(&(__return.s18),unsigned char,u8_read_lane(18,vl,idx,L)) * store(&(__return.s19),unsigned char,u8_read_lane(19,vl,idx,L)) * store(&(__return.s20),unsigned char,u8_read_lane(20,vl,idx,L)) * store(&(__return.s21),unsigned char,u8_read_lane(21,vl,idx,L)) * store(&(__return.s22),unsigned char,u8_read_lane(22,vl,idx,L)) * store(&(__return.s23),unsigned char,u8_read_lane(23,vl,idx,L)) * store(&(__return.s24),unsigned char,u8_read_lane(24,vl,idx,L)) * store(&(__return.s25),unsigned char,u8_read_lane(25,vl,idx,L)) * store(&(__return.s26),unsigned char,u8_read_lane(26,vl,idx,L)) * store(&(__return.s27),unsigned char,u8_read_lane(27,vl,idx,L)) * store(&(__return.s28),unsigned char,u8_read_lane(28,vl,idx,L)) * store(&(__return.s29),unsigned char,u8_read_lane(29,vl,idx,L)) * store(&(__return.s30),unsigned char,u8_read_lane(30,vl,idx,L)) * store(&(__return.s31),unsigned char,u8_read_lane(31,vl,idx,L)) */
{
 vuint8m2_t r;
 r.s0=qcp_u8_read_lane(p,0,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=qcp_u8_read_lane(p,1,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=qcp_u8_read_lane(p,2,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=qcp_u8_read_lane(p,3,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=qcp_u8_read_lane(p,4,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=qcp_u8_read_lane(p,5,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=qcp_u8_read_lane(p,6,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=qcp_u8_read_lane(p,7,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s8=qcp_u8_read_lane(p,8,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s9=qcp_u8_read_lane(p,9,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s10=qcp_u8_read_lane(p,10,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s11=qcp_u8_read_lane(p,11,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s12=qcp_u8_read_lane(p,12,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s13=qcp_u8_read_lane(p,13,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s14=qcp_u8_read_lane(p,14,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s15=qcp_u8_read_lane(p,15,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s16=qcp_u8_read_lane(p,16,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s17=qcp_u8_read_lane(p,17,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s18=qcp_u8_read_lane(p,18,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s19=qcp_u8_read_lane(p,19,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s20=qcp_u8_read_lane(p,20,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s21=qcp_u8_read_lane(p,21,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s22=qcp_u8_read_lane(p,22,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s23=qcp_u8_read_lane(p,23,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s24=qcp_u8_read_lane(p,24,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s25=qcp_u8_read_lane(p,25,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s26=qcp_u8_read_lane(p,26,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s27=qcp_u8_read_lane(p,27,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s28=qcp_u8_read_lane(p,28,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s29=qcp_u8_read_lane(p,29,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s30=qcp_u8_read_lane(p,30,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s31=qcp_u8_read_lane(p,31,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}
