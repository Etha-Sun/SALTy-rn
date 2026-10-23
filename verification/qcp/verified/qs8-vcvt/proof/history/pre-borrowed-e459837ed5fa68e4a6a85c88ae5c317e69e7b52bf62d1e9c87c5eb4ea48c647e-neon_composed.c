#define QCV_COMPOSED_BODY 1
#include "neon_composed.h"
void qcp_qcv_store4_0(int8_t *p,int8x8_t v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,4) * store(&(v.s0),char,x0) * store(&(v.s1),char,x1) * store(&(v.s2),char,x2) * store(&(v.s3),char,x3) * store(&(v.s4),char,x4) * store(&(v.s5),char,x5) * store(&(v.s6),char,x6) * store(&(v.s7),char,x7)
 Ensure CharArray::full(p,4,qcv_pack4(x0,x1,x2,x3)) */
{
 /*@ Assert p==p@pre && store(&v,void*,&v) * store(&(v.s0),char,x0) * store(&(v.s1),char,x1) * store(&(v.s2),char,x2) * store(&(v.s3),char,x3) * store(&(v.s4),char,x4) * store(&(v.s5),char,x5) * store(&(v.s6),char,x6) * store(&(v.s7),char,x7) * undef_data_at(p+0,char) * undef_data_at(p+1,char) * undef_data_at(p+2,char) * undef_data_at(p+3,char) */
 vst1_lane_u32((void*)p,vreinterpret_u32_s8(v) /*@ where a=&v */,0);
}
void qcp_qcv_store2_0(int8_t *p,int8x8_t v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,2) * store(&(v.s0),char,x0) * store(&(v.s1),char,x1) * store(&(v.s2),char,x2) * store(&(v.s3),char,x3) * store(&(v.s4),char,x4) * store(&(v.s5),char,x5) * store(&(v.s6),char,x6) * store(&(v.s7),char,x7)
 Ensure CharArray::full(p,2,qcv_pack2(x0,x1)) */
{
 /*@ Assert p==p@pre && store(&v,void*,&v) * store(&(v.s0),char,x0) * store(&(v.s1),char,x1) * store(&(v.s2),char,x2) * store(&(v.s3),char,x3) * store(&(v.s4),char,x4) * store(&(v.s5),char,x5) * store(&(v.s6),char,x6) * store(&(v.s7),char,x7) * undef_data_at(p+0,char) * undef_data_at(p+1,char) */
 vst1_lane_u16((void*)p,vreinterpret_u16_s8(v) /*@ where a=&v */,0);
}
void qcp_qcv_store1_0(int8_t *p,int8x8_t v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,1) * store(&(v.s0),char,x0) * store(&(v.s1),char,x1) * store(&(v.s2),char,x2) * store(&(v.s3),char,x3) * store(&(v.s4),char,x4) * store(&(v.s5),char,x5) * store(&(v.s6),char,x6) * store(&(v.s7),char,x7)
 Ensure CharArray::full(p,1,qcv_pack1(x0)) */
{
 /*@ Assert p==p@pre && store(&v,void*,&v) * store(&(v.s0),char,x0) * store(&(v.s1),char,x1) * store(&(v.s2),char,x2) * store(&(v.s3),char,x3) * store(&(v.s4),char,x4) * store(&(v.s5),char,x5) * store(&(v.s6),char,x6) * store(&(v.s7),char,x7) * undef_data_at(p,char) */
 qcp_s8_store_lane0(p,&v);
}
