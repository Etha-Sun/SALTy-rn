#ifndef QS8MUL_INTRINSIC_MODEL_H
#define QS8MUL_INTRINSIC_MODEL_H
#include "types_def.h"
/*@ Import Coq Require Import Qs8Mul.IntrinsicModel */
/*@ Extern Coq (RDMap :: *) */
/*@ Extern Coq (qm_min:Z -> Z -> Z) (qm_max:Z -> Z -> Z) (qm_sub16:Z -> Z -> Z) (qm_of_int:Z -> fp32) (qm_arm_mul:fp32 -> fp32 -> fp32) (qm_arm_add:fp32 -> fp32 -> fp32) (qm_rvv_mul:fp32 -> fp32 -> fp32) (qm_rvv_add:fp32 -> fp32 -> fp32) (qm_sign:fp32 -> fp32 -> fp32) (qm_sat32:Z -> Z) (qm_sat16:Z -> Z) (qm_sat8:Z -> Z) (qm_signed_bits:Z -> Z) (bits_of_fp32:fp32 -> Z) (qm_pack16:Z -> Z -> Z) (qm_pack32:Z -> Z -> Z -> Z -> Z) (qm_ext_pair:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z) (qm_lane_match:Z -> Z -> Z -> Z -> Prop) (qm_fp_lane_match:Z -> Z -> fp32 -> fp32 -> Prop) (qm_vl_allowed:Z -> Z -> Prop) (rd_get:RDMap -> Z -> Z) (rd_window:RDMap -> Z -> Z -> Prop) (rd_mem:RDMap -> Assertion) (qm_magic:fp32) */
#endif
