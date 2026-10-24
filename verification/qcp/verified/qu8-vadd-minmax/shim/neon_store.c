#include "neon_store.h"

void qcp_u8_store8(uint8_t *p,const uint8x8_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require UCharArray::undef_full(p,8) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7)
 Ensure UCharArray::full(p,8,u8_pack8(x0,x1,x2,x3,x4,x5,x6,x7)) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) */
{
 /*@ Assert p==p@pre && a==a@pre && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * undef_data_at(p+0,unsigned char) * undef_data_at(p+1,unsigned char) * undef_data_at(p+2,unsigned char) * undef_data_at(p+3,unsigned char) * undef_data_at(p+4,unsigned char) * undef_data_at(p+5,unsigned char) * undef_data_at(p+6,unsigned char) * undef_data_at(p+7,unsigned char) */
 p[0]=a->s0;
 p[1]=a->s1;
 p[2]=a->s2;
 p[3]=a->s3;
 p[4]=a->s4;
 p[5]=a->s5;
 p[6]=a->s6;
 p[7]=a->s7;
}

void qcp_u8_store16(uint8_t *p,const uint8x16_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z)
 Require UCharArray::undef_full(p,16) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15)
 Ensure UCharArray::full(p,16,u8_pack16(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15)) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) */
{
 /*@ Assert p==p@pre && a==a@pre && store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) * store(&(a->s8),unsigned char,x8) * store(&(a->s9),unsigned char,x9) * store(&(a->s10),unsigned char,x10) * store(&(a->s11),unsigned char,x11) * store(&(a->s12),unsigned char,x12) * store(&(a->s13),unsigned char,x13) * store(&(a->s14),unsigned char,x14) * store(&(a->s15),unsigned char,x15) * undef_data_at(p+0,unsigned char) * undef_data_at(p+1,unsigned char) * undef_data_at(p+2,unsigned char) * undef_data_at(p+3,unsigned char) * undef_data_at(p+4,unsigned char) * undef_data_at(p+5,unsigned char) * undef_data_at(p+6,unsigned char) * undef_data_at(p+7,unsigned char) * undef_data_at(p+8,unsigned char) * undef_data_at(p+9,unsigned char) * undef_data_at(p+10,unsigned char) * undef_data_at(p+11,unsigned char) * undef_data_at(p+12,unsigned char) * undef_data_at(p+13,unsigned char) * undef_data_at(p+14,unsigned char) * undef_data_at(p+15,unsigned char) */
 p[0]=a->s0;
 p[1]=a->s1;
 p[2]=a->s2;
 p[3]=a->s3;
 p[4]=a->s4;
 p[5]=a->s5;
 p[6]=a->s6;
 p[7]=a->s7;
 p[8]=a->s8;
 p[9]=a->s9;
 p[10]=a->s10;
 p[11]=a->s11;
 p[12]=a->s12;
 p[13]=a->s13;
 p[14]=a->s14;
 p[15]=a->s15;
}

void qcp_u8_store_lane0(uint8_t *p,const uint8x8_t *a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require undef_data_at(p,unsigned char) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7)
 Ensure store(p,unsigned char,x0) * store(&(a->s0),unsigned char,x0) * store(&(a->s1),unsigned char,x1) * store(&(a->s2),unsigned char,x2) * store(&(a->s3),unsigned char,x3) * store(&(a->s4),unsigned char,x4) * store(&(a->s5),unsigned char,x5) * store(&(a->s6),unsigned char,x6) * store(&(a->s7),unsigned char,x7) */
{ *p=a->s0; }
