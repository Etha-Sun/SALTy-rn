#ifndef MAXPOOL_COMPARE_INTRINSIC_SPECS_H
#define MAXPOOL_COMPARE_INTRINSIC_SPECS_H
#include "compare_types.h"
#include "neon_specs.h"
/*@ Import Coq Require Import MaxPool.CompareModel */
/*@ Extern Coq (mp_out_known:MPOutput->Z->fp32->Prop) (mp_word_equal:Z->Z->Z) (bits_of_fp32:fp32->Z) */
uint32x4_t vreinterpretq_u32_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),unsigned int,bits_of_fp32(a0)) * store(&(__return.s1),unsigned int,bits_of_fp32(a1)) * store(&(__return.s2),unsigned int,bits_of_fp32(a2)) * store(&(__return.s3),unsigned int,bits_of_fp32(a3)) */;
uint32_t vgetq_lane_u32(uint32x4_t a,int lane)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require lane==0 && store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3)
 Ensure __return==a0 && emp */;
#endif
