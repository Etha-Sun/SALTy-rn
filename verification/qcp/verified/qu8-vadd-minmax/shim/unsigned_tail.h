#ifndef QCP_S8_SIGNED_TAIL_H
#define QCP_S8_SIGNED_TAIL_H
#include "types_def.h"
/*@ Import Coq Require Import Qu8Add.ByteBridge */
/*@ Extern Coq (u8_le_byte0:Z -> Z) (u8_le_byte1:Z -> Z)
               (u8_le_byte2:Z -> Z) (u8_le_byte3:Z -> Z) */
/*@ include strategies "unsigned_tail.strategies" */
#define vst1_lane_u32(p,a,lane) { uint32x2_t qcp_store_tmp; qcp_store_tmp=(a); qcp_u8_store_u32_##lane((p),&qcp_store_tmp); }
#define vst1_lane_u16(p,a,lane) { uint16x4_t qcp_store_tmp; qcp_store_tmp=(a); qcp_u8_store_u16_##lane((p),&qcp_store_tmp); }
#endif
