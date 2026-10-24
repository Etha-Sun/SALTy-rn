#ifndef QA_NEON_COMPOSED_H
#define QA_NEON_COMPOSED_H
#include "neon_api.h"
/*@ Import Coq Require Import Qs8Add.ComposedModel */
/*@ Extern Coq (qa_pack1:Z -> list Z) (qa_pack2:Z -> Z -> list Z) (qa_pack4:Z -> Z -> Z -> Z -> list Z) */
void qcp_qa_store4_0(int8_t *p,const int8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,4) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7)
 Ensure CharArray::full(p,4,qa_pack4(x0,x1,x2,x3)) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7) */;
void qcp_qa_store2_0(int8_t *p,const int8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,2) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7)
 Ensure CharArray::full(p,2,qa_pack2(x0,x1)) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7) */;
void qcp_qa_store1_0(int8_t *p,const int8x8_t *v)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require CharArray::undef_full(p,1) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7)
 Ensure CharArray::full(p,1,qa_pack1(x0)) * store(&(v->s0),char,x0) * store(&(v->s1),char,x1) * store(&(v->s2),char,x2) * store(&(v->s3),char,x3) * store(&(v->s4),char,x4) * store(&(v->s5),char,x5) * store(&(v->s6),char,x6) * store(&(v->s7),char,x7) */;
/* Frozen pure variable arguments only: borrow the source vector once, copy all
   eight actual fields in checked C, then evaluate the original nested body. */
#ifndef QA_COMPOSED_BODY
#undef vst1_lane_u32
#undef vst1_lane_u16
#undef vst1_lane_s8
#define QA_UNWRAP_U32_vreinterpret_u32_s8(a) a
#define QA_UNWRAP_U16_vreinterpret_u16_s8(a) a
#define vst1_lane_u32(p,a,lane) qcp_qa_store4_##lane((int8_t*)(p),&(QA_UNWRAP_U32_##a))
#define vst1_lane_u16(p,a,lane) qcp_qa_store2_##lane((int8_t*)(p),&(QA_UNWRAP_U16_##a))
#define vst1_lane_s8(p,a,lane) qcp_qa_store1_##lane((p),&(a))
#endif
#endif
