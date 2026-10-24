#ifndef QCP_F32F16_LITERALS_H
#define QCP_F32F16_LITERALS_H
#include "scalar.h"
/*@ Import Coq Require Import F32F16.LiteralModel */
/*@ Extern Coq (f16_scale_hi : fp32) (f16_scale_lo : fp32) */
float qcp_f16_scale_hi(void) /*@ Require emp Ensure f16_same_bits(__return,f16_scale_hi) && emp */;
float qcp_f16_scale_lo(void) /*@ Require emp Ensure f16_same_bits(__return,f16_scale_lo) && emp */;
#endif
