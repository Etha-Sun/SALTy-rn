#include "rvv_memory.h"
/*@ include strategies "rvv_store.strategies" */
uint8_t qcp_qu_rvv_get32(const vuint8m2_t *a,size_t i)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=i && i<32 && 0<=x0 && x0<=255 && 0<=x1 && x1<=255 && 0<=x2 && x2<=255 && 0<=x3 && x3<=255 && 0<=x4 && x4<=255 && 0<=x5 && x5<=255 && 0<=x6 && x6<=255 && 0<=x7 && x7<=255 && 0<=x8 && x8<=255 && 0<=x9 && x9<=255 && 0<=x10 && x10<=255 && 0<=x11 && x11<=255 && 0<=x12 && x12<=255 && 0<=x13 && x13<=255 && 0<=x14 && x14<=255 && 0<=x15 && x15<=255 && 0<=x16 && x16<=255 && 0<=x17 && x17<=255 && 0<=x18 && x18<=255 && 0<=x19 && x19<=255 && 0<=x20 && x20<=255 && 0<=x21 && x21<=255 && 0<=x22 && x22<=255 && 0<=x23 && x23<=255 && 0<=x24 && x24<=255 && 0<=x25 && x25<=255 && 0<=x26 && x26<=255 && 0<=x27 && x27<=255 && 0<=x28 && x28<=255 && 0<=x29 && x29<=255 && 0<=x30 && x30<=255 && 0<=x31 && x31<=255 && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) * store(&(a->s16),unsigned char,x16) * store(&(a->s17),unsigned char,x17) * store(&(a->s18),unsigned char,x18) * store(&(a->s19),unsigned char,x19) * store(&(a->s20),unsigned char,x20) * store(&(a->s21),unsigned char,x21) * store(&(a->s22),unsigned char,x22) * store(&(a->s23),unsigned char,x23) * store(&(a->s24),unsigned char,x24) * store(&(a->s25),unsigned char,x25) * store(&(a->s26),unsigned char,x26) * store(&(a->s27),unsigned char,x27) * store(&(a->s28),unsigned char,x28) * store(&(a->s29),unsigned char,x29) * store(&(a->s30),unsigned char,x30) * store(&(a->s31),unsigned char,x31)
 Ensure __return==u8_rvv_nth(u8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31),i) && 0<=__return && __return<=255 && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) * store(&(a->s16),unsigned char,x16) * store(&(a->s17),unsigned char,x17) * store(&(a->s18),unsigned char,x18) * store(&(a->s19),unsigned char,x19) * store(&(a->s20),unsigned char,x20) * store(&(a->s21),unsigned char,x21) * store(&(a->s22),unsigned char,x22) * store(&(a->s23),unsigned char,x23) * store(&(a->s24),unsigned char,x24) * store(&(a->s25),unsigned char,x25) * store(&(a->s26),unsigned char,x26) * store(&(a->s27),unsigned char,x27) * store(&(a->s28),unsigned char,x28) * store(&(a->s29),unsigned char,x29) * store(&(a->s30),unsigned char,x30) * store(&(a->s31),unsigned char,x31) */
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
void qcp_u8_rvv_store_next(uint8_t *p,size_t vl,size_t i,uint8_t value)
/*@ With (P:list Z)
 Require 0<=i && i<vl && vl<=32 && 0<=value && value<=255 && UCharArray::seg(p,0,i,P) * UCharArray::undef_seg(p,i,vl)
 Ensure UCharArray::seg(p,0,i+1,u8_rvv_snoc(P,value)) * UCharArray::undef_seg(p,i+1,vl) */
{ p[i]=value; }
void qcp_qu_rvv_store32(uint8_t *p,const vuint8m2_t *a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=vl && vl<=32 && 0<=x0 && x0<=255 && 0<=x1 && x1<=255 && 0<=x2 && x2<=255 && 0<=x3 && x3<=255 && 0<=x4 && x4<=255 && 0<=x5 && x5<=255 && 0<=x6 && x6<=255 && 0<=x7 && x7<=255 && 0<=x8 && x8<=255 && 0<=x9 && x9<=255 && 0<=x10 && x10<=255 && 0<=x11 && x11<=255 && 0<=x12 && x12<=255 && 0<=x13 && x13<=255 && 0<=x14 && x14<=255 && 0<=x15 && x15<=255 && 0<=x16 && x16<=255 && 0<=x17 && x17<=255 && 0<=x18 && x18<=255 && 0<=x19 && x19<=255 && 0<=x20 && x20<=255 && 0<=x21 && x21<=255 && 0<=x22 && x22<=255 && 0<=x23 && x23<=255 && 0<=x24 && x24<=255 && 0<=x25 && x25<=255 && 0<=x26 && x26<=255 && 0<=x27 && x27<=255 && 0<=x28 && x28<=255 && 0<=x29 && x29<=255 && 0<=x30 && x30<=255 && 0<=x31 && x31<=255 && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) * store(&(a->s16),unsigned char,x16) * store(&(a->s17),unsigned char,x17) * store(&(a->s18),unsigned char,x18) * store(&(a->s19),unsigned char,x19) * store(&(a->s20),unsigned char,x20) * store(&(a->s21),unsigned char,x21) * store(&(a->s22),unsigned char,x22) * store(&(a->s23),unsigned char,x23) * store(&(a->s24),unsigned char,x24) * store(&(a->s25),unsigned char,x25) * store(&(a->s26),unsigned char,x26) * store(&(a->s27),unsigned char,x27) * store(&(a->s28),unsigned char,x28) * store(&(a->s29),unsigned char,x29) * store(&(a->s30),unsigned char,x30) * store(&(a->s31),unsigned char,x31) * UCharArray::undef_seg(p,0,vl)
 Ensure store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) * store(&(a->s16),unsigned char,x16) * store(&(a->s17),unsigned char,x17) * store(&(a->s18),unsigned char,x18) * store(&(a->s19),unsigned char,x19) * store(&(a->s20),unsigned char,x20) * store(&(a->s21),unsigned char,x21) * store(&(a->s22),unsigned char,x22) * store(&(a->s23),unsigned char,x23) * store(&(a->s24),unsigned char,x24) * store(&(a->s25),unsigned char,x25) * store(&(a->s26),unsigned char,x26) * store(&(a->s27),unsigned char,x27) * store(&(a->s28),unsigned char,x28) * store(&(a->s29),unsigned char,x29) * store(&(a->s30),unsigned char,x30) * store(&(a->s31),unsigned char,x31) * UCharArray::seg(p,0,vl,u8_rvv_prefix(vl,u8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31))) */
{
 size_t i=0;
 /*@ Inv Assert 0<=i && i<=vl && vl<=32 && p==p@pre && a==a@pre && vl==vl@pre && 0<=x0 && x0<=255 && 0<=x1 && x1<=255 && 0<=x2 && x2<=255 && 0<=x3 && x3<=255 && 0<=x4 && x4<=255 && 0<=x5 && x5<=255 && 0<=x6 && x6<=255 && 0<=x7 && x7<=255 && 0<=x8 && x8<=255 && 0<=x9 && x9<=255 && 0<=x10 && x10<=255 && 0<=x11 && x11<=255 && 0<=x12 && x12<=255 && 0<=x13 && x13<=255 && 0<=x14 && x14<=255 && 0<=x15 && x15<=255 && 0<=x16 && x16<=255 && 0<=x17 && x17<=255 && 0<=x18 && x18<=255 && 0<=x19 && x19<=255 && 0<=x20 && x20<=255 && 0<=x21 && x21<=255 && 0<=x22 && x22<=255 && 0<=x23 && x23<=255 && 0<=x24 && x24<=255 && 0<=x25 && x25<=255 && 0<=x26 && x26<=255 && 0<=x27 && x27<=255 && 0<=x28 && x28<=255 && 0<=x29 && x29<=255 && 0<=x30 && x30<=255 && 0<=x31 && x31<=255 && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) * store(&(a->s16),unsigned char,x16) * store(&(a->s17),unsigned char,x17) * store(&(a->s18),unsigned char,x18) * store(&(a->s19),unsigned char,x19) * store(&(a->s20),unsigned char,x20) * store(&(a->s21),unsigned char,x21) * store(&(a->s22),unsigned char,x22) * store(&(a->s23),unsigned char,x23) * store(&(a->s24),unsigned char,x24) * store(&(a->s25),unsigned char,x25) * store(&(a->s26),unsigned char,x26) * store(&(a->s27),unsigned char,x27) * store(&(a->s28),unsigned char,x28) * store(&(a->s29),unsigned char,x29) * store(&(a->s30),unsigned char,x30) * store(&(a->s31),unsigned char,x31) * UCharArray::seg(p,0,i,u8_rvv_prefix(i,u8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31))) * UCharArray::undef_seg(p,i,vl) */
 for(;i<vl;++i) {
  uint8_t value=qcp_qu_rvv_get32(a,i);
  qcp_u8_rvv_store_next(p,vl,i,value);
 }
}
