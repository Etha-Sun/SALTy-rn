#ifndef QCP_SQRT_MODEL_H
#define QCP_SQRT_MODEL_H
#include "types.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_store_def.h"
#include "../../../shared/c-shim/f32/QcpVadd/float_array_def.h"
/*@ Import Coq Require Import Sqrt.Types Sqrt.Pack Sqrt.Borrowed */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion) (FloatArray::undef_seg : Z -> Z -> Z -> Assertion) (UndefStructPredfloat32x4_t : Z -> Assertion) (UndefStructPredfloat32x2_t : Z -> Assertion) (UndefStructPredvfloat32m8_t : Z -> Assertion) (sqrt_arm : fp32 -> fp32) (sqrt_rvv : fp32 -> fp32) (sqrt_vl : Z -> Z) (sqrt_vl_allowed : Z -> Z -> Prop) (sqrt_take : Z -> list fp32 -> list fp32) (sqrt_lane : Z -> list fp32 -> fp32) (sqrt_active : Z -> Z -> fp32 -> fp32 -> fp32) (sqrt_read_at : Z -> Z -> Z -> list fp32 -> fp32 -> fp32) (sqrt_read_active : Z -> Z -> list fp32 -> fp32 -> fp32) (sqrt_arm_values : Z -> list fp32 -> list fp32) (sqrt_rvv_values : Z -> list fp32 -> list fp32) (sqrt_outputs_related : list fp32 -> list fp32 -> Prop) (sqrt_pack1 : fp32 -> list fp32) (sqrt_pack2 : fp32 -> fp32 -> list fp32) (sqrt_pack4 : fp32 -> fp32 -> fp32 -> fp32 -> list fp32) (sqrt_pack32 : fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> list fp32) */
#endif
