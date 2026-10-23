#ifndef VLRELU_RVV_TYPES_H
#define VLRELU_RVV_TYPES_H
#include "types.h"
/*@ Import Coq Require Import VLRelu.RvvModel */
/*@ Extern Coq (bits_of_fp32 : fp32 -> Z) (rvv_signed_bits : fp32 -> Z)
 (rvv_mask : Z -> Z -> Z -> Z -> Z)
 (rvv_merge : Z -> Z -> fp32 -> fp32 -> Z -> fp32) */
typedef struct vint32m8_t { int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15; int s16; int s17; int s18; int s19; int s20; int s21; int s22; int s23; int s24; int s25; int s26; int s27; int s28; int s29; int s30; int s31; } vint32m8_t;
typedef struct vbool4_t { int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15; int s16; int s17; int s18; int s19; int s20; int s21; int s22; int s23; int s24; int s25; int s26; int s27; int s28; int s29; int s30; int s31; } vbool4_t;
#endif
