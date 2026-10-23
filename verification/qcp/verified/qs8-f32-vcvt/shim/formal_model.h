#ifndef QS8_F32_FORMAL_MODEL_H
#define QS8_F32_FORMAL_MODEL_H
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
/*@ Import Coq Require Import Qs8Cvt.Model */
/*@ Extern Coq (cvt_s16 : Z -> Z) (cvt_seed : Z -> Z)
 (cvt_addw : Z -> Z -> Z) (cvt_sub16 : Z -> Z -> Z)
 (cvt_same : fp32 -> fp32 -> Prop) */
#endif
