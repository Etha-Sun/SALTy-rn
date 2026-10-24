#ifndef QCP_F32F16_MEMORY_NEON_H
#define QCP_F32F16_MEMORY_NEON_H
#include "types_def.h"
float32x4_t vld1q_f32(const float* p)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) Require store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) Ensure store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) * store(&(__return.s0),float,x0) * store(&(__return.s1),float,x1) * store(&(__return.s2),float,x2) * store(&(__return.s3),float,x3) */;
void qcp_f16_store8(uint16_t* p,const uint16x8_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,2,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,3,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,4,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,5,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,6,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,7,unsigned short),unsigned short) Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) * store(pointer_offset(p,2,unsigned short),unsigned short,x2) * store(pointer_offset(p,3,unsigned short),unsigned short,x3) * store(pointer_offset(p,4,unsigned short),unsigned short,x4) * store(pointer_offset(p,5,unsigned short),unsigned short,x5) * store(pointer_offset(p,6,unsigned short),unsigned short,x6) * store(pointer_offset(p,7,unsigned short),unsigned short,x7) */;
void qcp_f16_store4(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,2,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,3,unsigned short),unsigned short) Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) * store(pointer_offset(p,2,unsigned short),unsigned short,x2) * store(pointer_offset(p,3,unsigned short),unsigned short,x3) */;
void qcp_f16_store2_0(void* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) */;
void qcp_f16_store1_0(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(pointer_offset(p,0,unsigned short),unsigned short,x0) */;
const uint16x4_t* qcp_f16_u32_view(const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) Ensure __return == a && store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) */;
void qcp_assert(int condition)
/*@ Require condition != 0 && emp Ensure emp */;
#define vst1q_u16(p,a) qcp_f16_store8((p),&(a))
#define vst1_u16(p,a) qcp_f16_store4((p),&(a))
#define vst1_lane_u16(p,a,n) qcp_f16_store1_##n((p),&(a))
/* Supported composition only: local u16x4 -> unchanged8-byte borrowed view
 * -> lane0 four-byte store. Both actual helper bodies are checked. */
#ifdef vreinterpret_u32_u16
#undef vreinterpret_u32_u16
#endif
#define vreinterpret_u32_u16(a) qcp_f16_u32_view(&(a))
#define vst1_lane_u32(p,a,n) qcp_f16_store2_##n((p),(a))
#define assert(x) qcp_assert((x))
#endif
