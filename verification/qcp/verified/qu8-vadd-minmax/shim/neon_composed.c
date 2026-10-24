#define QU_COMPOSED_BODY 1
#include "neon_composed.h"
void qcp_qu_store4_0(uint8_t *p,const uint8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require UCharArray::undef_full(p,4) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7)
 Ensure UCharArray::full(p,4,qu_pack4(x0,x1,x2,x3)) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) */
{
 /*@ Assert p==p@pre && v==v@pre && store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) * undef_data_at(p+0,unsigned char) * undef_data_at(p+1,unsigned char) * undef_data_at(p+2,unsigned char) * undef_data_at(p+3,unsigned char) */
 uint8x8_t value;
 value.s0=v->s0;
 value.s1=v->s1;
 value.s2=v->s2;
 value.s3=v->s3;
 value.s4=v->s4;
 value.s5=v->s5;
 value.s6=v->s6;
 value.s7=v->s7;
 vst1_lane_u32((void*)p,vreinterpret_u32_u8(value) /*@ where a=&value */,0);
}
void qcp_qu_store2_0(uint8_t *p,const uint8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require UCharArray::undef_full(p,2) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7)
 Ensure UCharArray::full(p,2,qu_pack2(x0,x1)) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) */
{
 /*@ Assert p==p@pre && v==v@pre && store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) * undef_data_at(p+0,unsigned char) * undef_data_at(p+1,unsigned char) */
 uint8x8_t value;
 value.s0=v->s0;
 value.s1=v->s1;
 value.s2=v->s2;
 value.s3=v->s3;
 value.s4=v->s4;
 value.s5=v->s5;
 value.s6=v->s6;
 value.s7=v->s7;
 vst1_lane_u16((void*)p,vreinterpret_u16_u8(value) /*@ where a=&value */,0);
}
void qcp_qu_store1_0(uint8_t *p,const uint8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require UCharArray::undef_full(p,1) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7)
 Ensure UCharArray::full(p,1,qu_pack1(x0)) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) */
{
 /*@ Assert p==p@pre && v==v@pre && store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) * undef_data_at(p,unsigned char) */
 uint8x8_t value;
 value.s0=v->s0;
 value.s1=v->s1;
 value.s2=v->s2;
 value.s3=v->s3;
 value.s4=v->s4;
 value.s5=v->s5;
 value.s6=v->s6;
 value.s7=v->s7;
 qcp_u8_store_lane0(p,&value);
}
