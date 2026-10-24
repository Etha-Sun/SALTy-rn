#ifndef QCP_S8_SIGNED_TAIL_H
#define QCP_S8_SIGNED_TAIL_H
#include "types_def.h"
/*@ Import Coq Require Import Qs8Add.ByteBridge */
/*@ Extern Coq (s8_le_byte0:Z -> Z) (s8_le_byte1:Z -> Z)
               (s8_le_byte2:Z -> Z) (s8_le_byte3:Z -> Z) */
/*@ include strategies "signed_tail.strategies" */
#define vst1_lane_u32(p,a,lane) { uint32x2_t qcp_store_tmp; qcp_store_tmp=(a); qcp_s8_store_u32_##lane((p),&qcp_store_tmp); }
#define vst1_lane_u16(p,a,lane) { uint16x4_t qcp_store_tmp; qcp_store_tmp=(a); qcp_s8_store_u16_##lane((p),&qcp_store_tmp); }
#endif
