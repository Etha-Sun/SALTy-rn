#ifndef EXP_PROGRAM_MODEL_H
#define EXP_PROGRAM_MODEL_H
#include "scalar.h"
/*@ Import Coq Require Import ExpMinusMax.RecordStageFacts */
/*@ Extern Coq
 (em_input:EMMap->Z->(Z->fp32))(em_arm_sum:Z->(Z->fp32)->fp32->fp32)
 (em_pack4:fp32->fp32->fp32->fp32->Recordfloat32x4_t)
 (em_valid:EMMap->list Z->Z->Z->Z->Z->Z->Prop)
 (em_arm_result:EMMap->Z->Z->Z->Z->Z->EMOutput->EMOutput)
 (em_rvv_result:EMMap->Z->Z->Z->Z->Z->EMOutput->EMOutput)
 (em_arm_acc_record:EMMap->Z->Z->Z->Recordfloat32x4_t)
 (em_arm_output_prefix:EMMap->Z->Z->Z->Z->EMOutput->EMOutput)
 (em_rvv_output_prefix:EMMap->Z->Z->Z->Z->EMOutput->EMOutput)
 (em_same_record4:Recordfloat32x4_t->Recordfloat32x4_t->Prop)
 (em_neon_expression:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t)
 (em_log2e:fp32)(em_magic_bias:fp32)(em_c5:fp32)(em_c4:fp32)(em_c3:fp32)(em_c2:fp32)(em_c1:fp32)(em_denorm_cutoff:fp32)(em_minus_ln2:fp32)(fp32_zero:fp32) */
#endif
