#ifndef HWC_NEON_KERNEL_PROGRAM_H
#define HWC_NEON_KERNEL_PROGRAM_H
#include "kernel_program.h"
#include "neon_views.h"
#include "store_half.h"
/*@ Import Coq Require Import HwcConv.NeonKernelModel */
/*@ Extern Coq
 (hc_neon_raw:HwcROMap->Z->Z->Z->Z->Z->Z->fp32->fp32->HwcRawPixels)
 (hc_neon_previous:Recordfloat32x4_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 */
/* Formal domain guards each actual source call q is the literal4. */
#define round_down_po2(n,q) hc_round_down4(n)
#define doz(a,b) hc_doz((a),(b))
#endif
