#include "program_model.h"
/*@ include strategies "f16_ushort_store.strategies" */
/*@ include strategies "f16_memory.strategies" */
/*@ Import Coq Require Import QcpVadd.VaddBits */

#include "../../../shared/c-shim/f32/QcpRvv32/rvv_array_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_store_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_loop_def.h"
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
