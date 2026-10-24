typedef unsigned long long size_t;
typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct uint32x4_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; } uint32x4_t;
typedef struct uint16x8_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; unsigned short s4; unsigned short s5; unsigned short s6; unsigned short s7; } uint16x8_t;
typedef struct uint16x4_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; } uint16x4_t;
typedef struct vfloat32m8_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31; } vfloat32m8_t;
typedef struct vuint32m8_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; unsigned int s4; unsigned int s5; unsigned int s6; unsigned int s7; unsigned int s8; unsigned int s9; unsigned int s10; unsigned int s11; unsigned int s12; unsigned int s13; unsigned int s14; unsigned int s15; unsigned int s16; unsigned int s17; unsigned int s18; unsigned int s19; unsigned int s20; unsigned int s21; unsigned int s22; unsigned int s23; unsigned int s24; unsigned int s25; unsigned int s26; unsigned int s27; unsigned int s28; unsigned int s29; unsigned int s30; unsigned int s31; } vuint32m8_t;
typedef struct vuint16m4_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; unsigned short s4; unsigned short s5; unsigned short s6; unsigned short s7; unsigned short s8; unsigned short s9; unsigned short s10; unsigned short s11; unsigned short s12; unsigned short s13; unsigned short s14; unsigned short s15; unsigned short s16; unsigned short s17; unsigned short s18; unsigned short s19; unsigned short s20; unsigned short s21; unsigned short s22; unsigned short s23; unsigned short s24; unsigned short s25; unsigned short s26; unsigned short s27; unsigned short s28; unsigned short s29; unsigned short s30; unsigned short s31; } vuint16m4_t;
typedef struct vbool4_t { int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15; int s16; int s17; int s18; int s19; int s20; int s21; int s22; int s23; int s24; int s25; int s26; int s27; int s28; int s29; int s30; int s31; } vbool4_t;
/* Raw eight-byte view; u32 lane0 stores two ushort cells, no uint32 pointer dereference. */
typedef uint16x4_t uint32x2_t;
/*@ Import Coq Require Import F32F16.Types */
/*@ Extern Coq 
 (UndefStructPredfloat32x4_t : Z -> Assertion)
 (UndefStructPredfloat32x2_t : Z -> Assertion)
 (UndefStructPreduint32x4_t : Z -> Assertion)
 (UndefStructPreduint16x8_t : Z -> Assertion)
 (UndefStructPreduint16x4_t : Z -> Assertion)
 (UndefStructPredvfloat32m8_t : Z -> Assertion)
 (UndefStructPredvuint32m8_t : Z -> Assertion)
 (UndefStructPredvuint16m4_t : Z -> Assertion)
 (UndefStructPredvbool4_t : Z -> Assertion) */
/*@ Import Coq Require Import F32F16.UShortStoreModel */
/*@ Extern Coq
 (UShortArray::full : Z -> Z -> list Z -> Assertion)
 (UShortArray::undef_full : Z -> Z -> Assertion)
 (UShortArray::seg : Z -> Z -> Z -> list Z -> Assertion)
 (UShortArray::undef_seg : Z -> Z -> Z -> Assertion)
 (f16_take : Z -> list Z -> list Z)
 (f16_get : Z -> list Z -> Z)
 (f16_snoc : list Z -> Z -> list Z)
 (f16_length : list Z -> Z)
 (f16_u16_equal : Z -> Z -> Prop)
 (f16_pack32 : Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
               (fp32_bits_equal : fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import QcpNeonLoop.InvariantFacts */
/*@ Extern Coq (fp32_length : list fp32 -> Z) */
/*@ Import Coq Require Import QcpNeon.NeonBridge */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion)
               (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
               (fp32_slice : Z -> Z -> list fp32 -> list fp32)
               (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (UndefStructPredfloat32x4_t : Z -> Assertion)
               (UndefStructPredfloat32x2_t : Z -> Assertion) */
/*@ Import Coq Require Import QcpNeonLoop.NeonLoopBridge */
/*@ Import Coq Require Import QcpRvv32.RvvLogic */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
 (rvv_read_value : Z -> Z -> list fp32 -> fp32) */
/*@ Import Coq Require Import QcpRvv32.RvvStoreModel */
/*@ Extern Coq
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
 (rvv_take : Z -> list fp32 -> list fp32)
 (rvv_get : Z -> list fp32 -> fp32)
 (rvv_snoc : list fp32 -> fp32 -> list fp32)
 (rvv_length : list fp32 -> Z)
 (rvv_pack32 : fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> list fp32) */
/*@ Import Coq Require Import QcpRvv32.RvvLoopModel */
/*@ Extern Coq (rvv_slice : Z -> Z -> list fp32 -> list fp32)
 (vadd_vl : Z -> Z)
 (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
/*@ Import Coq Require Import F32F16.ProgramModel */
/*@ Extern Coq (f16_values : Z -> list fp32 -> list Z)
 (f16_rvv_values : Z -> list fp32 -> list Z) */
/*@ include strategies "f16_ushort_store.strategies" */
/*@ include strategies "f16_memory.strategies" */
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Import Coq Require Import QcpRvv32.RvvLogic */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
 (rvv_read_value : Z -> Z -> list fp32 -> fp32) */
/*@ Import Coq Require Import QcpRvv32.RvvStoreModel */
/*@ Extern Coq
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
 (rvv_take : Z -> list fp32 -> list fp32)
 (rvv_get : Z -> list fp32 -> fp32)
 (rvv_snoc : list fp32 -> fp32 -> list fp32)
 (rvv_length : list fp32 -> Z)
 (rvv_pack32 : fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> list fp32) */
/*@ Import Coq Require Import QcpRvv32.RvvLoopModel */
/*@ Extern Coq (rvv_slice : Z -> Z -> list fp32 -> list fp32)
 (vadd_vl : Z -> Z)
 (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
unsigned short qcp_f16_get32(const struct vuint16m4_t *a,unsigned long long i)
/*@ With (L:list Z) (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0 <= i && i < 32 && L == f16_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31) && store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * store(&(a->s8),unsigned short,x8) * store(&(a->s9),unsigned short,x9) * store(&(a->s10),unsigned short,x10) * store(&(a->s11),unsigned short,x11) * store(&(a->s12),unsigned short,x12) * store(&(a->s13),unsigned short,x13) * store(&(a->s14),unsigned short,x14) * store(&(a->s15),unsigned short,x15) * store(&(a->s16),unsigned short,x16) * store(&(a->s17),unsigned short,x17) * store(&(a->s18),unsigned short,x18) * store(&(a->s19),unsigned short,x19) * store(&(a->s20),unsigned short,x20) * store(&(a->s21),unsigned short,x21) * store(&(a->s22),unsigned short,x22) * store(&(a->s23),unsigned short,x23) * store(&(a->s24),unsigned short,x24) * store(&(a->s25),unsigned short,x25) * store(&(a->s26),unsigned short,x26) * store(&(a->s27),unsigned short,x27) * store(&(a->s28),unsigned short,x28) * store(&(a->s29),unsigned short,x29) * store(&(a->s30),unsigned short,x30) * store(&(a->s31),unsigned short,x31)
 Ensure f16_u16_equal(__return,f16_get(i,L)) && store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * store(&(a->s8),unsigned short,x8) * store(&(a->s9),unsigned short,x9) * store(&(a->s10),unsigned short,x10) * store(&(a->s11),unsigned short,x11) * store(&(a->s12),unsigned short,x12) * store(&(a->s13),unsigned short,x13) * store(&(a->s14),unsigned short,x14) * store(&(a->s15),unsigned short,x15) * store(&(a->s16),unsigned short,x16) * store(&(a->s17),unsigned short,x17) * store(&(a->s18),unsigned short,x18) * store(&(a->s19),unsigned short,x19) * store(&(a->s20),unsigned short,x20) * store(&(a->s21),unsigned short,x21) * store(&(a->s22),unsigned short,x22) * store(&(a->s23),unsigned short,x23) * store(&(a->s24),unsigned short,x24) * store(&(a->s25),unsigned short,x25) * store(&(a->s26),unsigned short,x26) * store(&(a->s27),unsigned short,x27) * store(&(a->s28),unsigned short,x28) * store(&(a->s29),unsigned short,x29) * store(&(a->s30),unsigned short,x30) * store(&(a->s31),unsigned short,x31) */
{
 switch(i) {
 case 0: return a->s0;
 case 1: return a->s1;
 case 2: return a->s2;
 case 3: return a->s3;
 case 4: return a->s4;
 case 5: return a->s5;
 case 6: return a->s6;
 case 7: return a->s7;
 case 8: return a->s8;
 case 9: return a->s9;
 case 10: return a->s10;
 case 11: return a->s11;
 case 12: return a->s12;
 case 13: return a->s13;
 case 14: return a->s14;
 case 15: return a->s15;
 case 16: return a->s16;
 case 17: return a->s17;
 case 18: return a->s18;
 case 19: return a->s19;
 case 20: return a->s20;
 case 21: return a->s21;
 case 22: return a->s22;
 case 23: return a->s23;
 case 24: return a->s24;
 case 25: return a->s25;
 case 26: return a->s26;
 case 27: return a->s27;
 case 28: return a->s28;
 case 29: return a->s29;
 case 30: return a->s30;
 case 31: return a->s31;
 default: return 0;
 }
}
void qcp_f16_store_next(unsigned short *p,unsigned long long vl,unsigned long long i,unsigned short value)
/*@ With (P:list Z)
 Require 0 <= i && i < vl && vl <= 32 &&
   UShortArray::seg(p,0,i,P) * UShortArray::undef_seg(p,i,vl)
 Ensure UShortArray::seg(p,0,i+1,f16_snoc(P,value)) * UShortArray::undef_seg(p,i+1,vl) */
{
 /*@ 0 <= i && i < vl && vl <= 32 && UShortArray::undef_seg(p,i,vl)
     which implies
     undef_data_at(pointer_offset(p,i,unsigned short),unsigned short) *
     UShortArray::undef_seg(p,i+1,vl)
 */
 p[i] = value;
}
void qcp_f16_vse16(unsigned short *p,const struct vuint16m4_t *a,unsigned long long vl)
/*@ With (L:list Z) (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0 <= vl && vl <= 32 && L == f16_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31) && store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * store(&(a->s8),unsigned short,x8) * store(&(a->s9),unsigned short,x9) * store(&(a->s10),unsigned short,x10) * store(&(a->s11),unsigned short,x11) * store(&(a->s12),unsigned short,x12) * store(&(a->s13),unsigned short,x13) * store(&(a->s14),unsigned short,x14) * store(&(a->s15),unsigned short,x15) * store(&(a->s16),unsigned short,x16) * store(&(a->s17),unsigned short,x17) * store(&(a->s18),unsigned short,x18) * store(&(a->s19),unsigned short,x19) * store(&(a->s20),unsigned short,x20) * store(&(a->s21),unsigned short,x21) * store(&(a->s22),unsigned short,x22) * store(&(a->s23),unsigned short,x23) * store(&(a->s24),unsigned short,x24) * store(&(a->s25),unsigned short,x25) * store(&(a->s26),unsigned short,x26) * store(&(a->s27),unsigned short,x27) * store(&(a->s28),unsigned short,x28) * store(&(a->s29),unsigned short,x29) * store(&(a->s30),unsigned short,x30) * store(&(a->s31),unsigned short,x31) * UShortArray::undef_full(p,vl)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * store(&(a->s8),unsigned short,x8) * store(&(a->s9),unsigned short,x9) * store(&(a->s10),unsigned short,x10) * store(&(a->s11),unsigned short,x11) * store(&(a->s12),unsigned short,x12) * store(&(a->s13),unsigned short,x13) * store(&(a->s14),unsigned short,x14) * store(&(a->s15),unsigned short,x15) * store(&(a->s16),unsigned short,x16) * store(&(a->s17),unsigned short,x17) * store(&(a->s18),unsigned short,x18) * store(&(a->s19),unsigned short,x19) * store(&(a->s20),unsigned short,x20) * store(&(a->s21),unsigned short,x21) * store(&(a->s22),unsigned short,x22) * store(&(a->s23),unsigned short,x23) * store(&(a->s24),unsigned short,x24) * store(&(a->s25),unsigned short,x25) * store(&(a->s26),unsigned short,x26) * store(&(a->s27),unsigned short,x27) * store(&(a->s28),unsigned short,x28) * store(&(a->s29),unsigned short,x29) * store(&(a->s30),unsigned short,x30) * store(&(a->s31),unsigned short,x31) * UShortArray::full(p,vl,f16_take(vl,L)) */
{
 unsigned long long i=0;
/*@ Inv 0 <= i && i <= vl && vl <= 32 && p == p@pre && a == a@pre && vl == vl@pre &&
 L == f16_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31) && f16_length(L) == 32 &&
 store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * store(&(a->s8),unsigned short,x8) * store(&(a->s9),unsigned short,x9) * store(&(a->s10),unsigned short,x10) * store(&(a->s11),unsigned short,x11) * store(&(a->s12),unsigned short,x12) * store(&(a->s13),unsigned short,x13) * store(&(a->s14),unsigned short,x14) * store(&(a->s15),unsigned short,x15) * store(&(a->s16),unsigned short,x16) * store(&(a->s17),unsigned short,x17) * store(&(a->s18),unsigned short,x18) * store(&(a->s19),unsigned short,x19) * store(&(a->s20),unsigned short,x20) * store(&(a->s21),unsigned short,x21) * store(&(a->s22),unsigned short,x22) * store(&(a->s23),unsigned short,x23) * store(&(a->s24),unsigned short,x24) * store(&(a->s25),unsigned short,x25) * store(&(a->s26),unsigned short,x26) * store(&(a->s27),unsigned short,x27) * store(&(a->s28),unsigned short,x28) * store(&(a->s29),unsigned short,x29) * store(&(a->s30),unsigned short,x30) * store(&(a->s31),unsigned short,x31) * UShortArray::seg(p,0,i,f16_take(i,L)) * UShortArray::undef_seg(p,i,vl) */
 for(; i<vl; ++i) {
  unsigned short value=qcp_f16_get32(a,i);
  qcp_f16_store_next(p,vl,i,value);
 }
}
