#include "rvv_memory.h"
/*@ include strategies "rvv_store.strategies" */
int8_t qcp_qa_rvv_get32(const vint8m2_t *a,size_t i)
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
void qcp_qa_rvv_store32(int8_t *p,const vint8m2_t *a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=vl && vl<=32 && -128<=x0 && x0<=127 && -128<=x1 && x1<=127 && -128<=x2 && x2<=127 && -128<=x3 && x3<=127 && -128<=x4 && x4<=127 && -128<=x5 && x5<=127 && -128<=x6 && x6<=127 && -128<=x7 && x7<=127 && -128<=x8 && x8<=127 && -128<=x9 && x9<=127 && -128<=x10 && x10<=127 && -128<=x11 && x11<=127 && -128<=x12 && x12<=127 && -128<=x13 && x13<=127 && -128<=x14 && x14<=127 && -128<=x15 && x15<=127 && -128<=x16 && x16<=127 && -128<=x17 && x17<=127 && -128<=x18 && x18<=127 && -128<=x19 && x19<=127 && -128<=x20 && x20<=127 && -128<=x21 && x21<=127 && -128<=x22 && x22<=127 && -128<=x23 && x23<=127 && -128<=x24 && x24<=127 && -128<=x25 && x25<=127 && -128<=x26 && x26<=127 && -128<=x27 && x27<=127 && -128<=x28 && x28<=127 && -128<=x29 && x29<=127 && -128<=x30 && x30<=127 && -128<=x31 && x31<=127 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * CharArray::undef_seg(p,0,vl)
 Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * CharArray::seg(p,0,vl,s8_rvv_prefix(vl,s8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31))) */
{
 size_t i=0;
 /*@ Inv Assert 0<=i && i<=vl && vl<=32 && p==p@pre && a==a@pre && vl==vl@pre && -128<=x0 && x0<=127 && -128<=x1 && x1<=127 && -128<=x2 && x2<=127 && -128<=x3 && x3<=127 && -128<=x4 && x4<=127 && -128<=x5 && x5<=127 && -128<=x6 && x6<=127 && -128<=x7 && x7<=127 && -128<=x8 && x8<=127 && -128<=x9 && x9<=127 && -128<=x10 && x10<=127 && -128<=x11 && x11<=127 && -128<=x12 && x12<=127 && -128<=x13 && x13<=127 && -128<=x14 && x14<=127 && -128<=x15 && x15<=127 && -128<=x16 && x16<=127 && -128<=x17 && x17<=127 && -128<=x18 && x18<=127 && -128<=x19 && x19<=127 && -128<=x20 && x20<=127 && -128<=x21 && x21<=127 && -128<=x22 && x22<=127 && -128<=x23 && x23<=127 && -128<=x24 && x24<=127 && -128<=x25 && x25<=127 && -128<=x26 && x26<=127 && -128<=x27 && x27<=127 && -128<=x28 && x28<=127 && -128<=x29 && x29<=127 && -128<=x30 && x30<=127 && -128<=x31 && x31<=127 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) * CharArray::seg(p,0,i,s8_rvv_prefix(i,s8_rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31))) * CharArray::undef_seg(p,i,vl) */
 for(;i<vl;++i) {
  int8_t value=qcp_qa_rvv_get32(a,i);
  qcp_s8_rvv_store_next(p,vl,i,value);
 }
}
