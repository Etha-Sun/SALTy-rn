#ifndef QCP_F32F16_STORE_ARRAYS_H
#define QCP_F32F16_STORE_ARRAYS_H
#include "program_model.h"
#include "memory_neon.h"
/*@ Import Coq Require Import F32F16.PackModel */
/*@ Extern Coq 
 (f16_pack1 : Z -> list Z)
 (f16_pack2 : Z -> Z -> list Z)
 (f16_pack4 : Z -> Z -> Z -> Z -> list Z)
 (f16_pack8 : Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
void qcp_f16_store8_array(uint16_t* p,const uint16x8_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * UShortArray::undef_full(p,8)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * UShortArray::full(p,8,f16_pack8(x0,x1,x2,x3,x4,x5,x6,x7)) */;
void qcp_f16_store4_array(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,4)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,4,f16_pack4(x0,x1,x2,x3)) */;
void qcp_f16_store2_0_array(void* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,2)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,2,f16_pack2(x0,x1)) */;
void qcp_f16_store1_0_array(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,1)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,1,f16_pack1(x0)) */;
#undef vst1q_u16
#define vst1q_u16(p,a) qcp_f16_store8_array((p),&(a))
#undef vst1_u16
#define vst1_u16(p,a) qcp_f16_store4_array((p),&(a))
#undef vst1_lane_u16
#define vst1_lane_u16(p,a,n) qcp_f16_store1_##n##_array((p),&(a))
#undef vst1_lane_u32
#define vst1_lane_u32(p,a,n) qcp_f16_store2_##n##_array((p),(a))
#endif
