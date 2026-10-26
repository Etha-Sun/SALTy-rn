#ifndef HWC_COPY_FLOAT_H
#define HWC_COPY_FLOAT_H
#ifdef HWC_FORMAL
#include "types.h"
/*@ Import Coq Require Import HwcConv.FloatCopyModel */
/*@ Extern Coq (hc_same_bits : fp32 -> fp32 -> Prop) */
#endif
float hc_copy_float(float x)
/*@ Require emp Ensure hc_same_bits(__return,x) && emp */
;
#endif
