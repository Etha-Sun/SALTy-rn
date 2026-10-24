#ifndef QU_NEON_COMPOSED_H
#define QU_NEON_COMPOSED_H
#include "neon_api.h"
/*@ Import Coq Require Import Qu8Add.ComposedModel */
/*@ Extern Coq (qu_pack1:Z -> list Z) (qu_pack2:Z -> Z -> list Z) (qu_pack4:Z -> Z -> Z -> Z -> list Z) */
void qcp_qu_store4_0(uint8_t *p,const uint8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require UCharArray::undef_full(p,4) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7)
 Ensure UCharArray::full(p,4,qu_pack4(x0,x1,x2,x3)) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) */;
void qcp_qu_store2_0(uint8_t *p,const uint8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require UCharArray::undef_full(p,2) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7)
 Ensure UCharArray::full(p,2,qu_pack2(x0,x1)) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) */;
void qcp_qu_store1_0(uint8_t *p,const uint8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require UCharArray::undef_full(p,1) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7)
 Ensure UCharArray::full(p,1,qu_pack1(x0)) * store(&(v->s0),unsigned char,x0) * store(&(v->s1),unsigned char,x1) * store(&(v->s2),unsigned char,x2) * store(&(v->s3),unsigned char,x3) * store(&(v->s4),unsigned char,x4) * store(&(v->s5),unsigned char,x5) * store(&(v->s6),unsigned char,x6) * store(&(v->s7),unsigned char,x7) */;
/* Frozen pure variable arguments only: borrow the source vector once, copy all
   eight actual fields in checked C, then evaluate the original nested body. */
#ifndef QU_COMPOSED_BODY
#undef vst1_lane_u32
#undef vst1_lane_u16
#undef vst1_lane_u8
#define QU_UNWRAP_U32_vreinterpret_u32_u8(a) a
#define QU_UNWRAP_U16_vreinterpret_u16_u8(a) a
#define vst1_lane_u32(p,a,lane) qcp_qu_store4_##lane((uint8_t*)(p),&(QU_UNWRAP_U32_##a))
#define vst1_lane_u16(p,a,lane) qcp_qu_store2_##lane((uint8_t*)(p),&(QU_UNWRAP_U16_##a))
#define vst1_lane_u8(p,a,lane) qcp_qu_store1_##lane((p),&(a))
#endif
#endif
