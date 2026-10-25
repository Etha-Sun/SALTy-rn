#include "rvv_store.h"
int8_t qm_get32(const vint8m2_t *a,size_t i)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=i && i<32 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31)
 Ensure __return==qm_vec32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,i) && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) */
{
if(i==0)return a->s0;
if(i==1)return a->s1;
if(i==2)return a->s2;
if(i==3)return a->s3;
if(i==4)return a->s4;
if(i==5)return a->s5;
if(i==6)return a->s6;
if(i==7)return a->s7;
if(i==8)return a->s8;
if(i==9)return a->s9;
if(i==10)return a->s10;
if(i==11)return a->s11;
if(i==12)return a->s12;
if(i==13)return a->s13;
if(i==14)return a->s14;
if(i==15)return a->s15;
if(i==16)return a->s16;
if(i==17)return a->s17;
if(i==18)return a->s18;
if(i==19)return a->s19;
if(i==20)return a->s20;
if(i==21)return a->s21;
if(i==22)return a->s22;
if(i==23)return a->s23;
if(i==24)return a->s24;
if(i==25)return a->s25;
if(i==26)return a->s26;
if(i==27)return a->s27;
if(i==28)return a->s28;
if(i==29)return a->s29;
if(i==30)return a->s30;
return a->s31;
}
