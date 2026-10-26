#ifndef HWC_SUPPORT_H
#define HWC_SUPPORT_H
#include "types.h"
/*@ Import Coq Require Import HwcConv.SupportModel */
/*@ Extern Coq (hc_doz_model : Z -> Z -> Z) (hc_round_model : Z -> Z) */
size_t hc_round_down4(size_t n)
/*@ Require emp Ensure __return == hc_round_model(n) && emp */
;
size_t hc_doz(size_t a,size_t b)
/*@ Require emp Ensure __return == hc_doz_model(a,b) && emp */
;
#endif
