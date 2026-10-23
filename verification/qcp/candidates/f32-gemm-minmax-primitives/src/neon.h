#ifndef QCP_GEMM_NEON_PRIMITIVES_H
#define QCP_GEMM_NEON_PRIMITIVES_H
/*@ Import Coq Require Import GemmSpec.FmaModel GemmSpec.IntrinsicModel GemmNeon.KernelModel Minmax.VectorLayout */
/*@ Extern Coq (bit_same : fp32 -> fp32 -> Prop)
 (fp32_neon_min : fp32 -> fp32 -> fp32) (fp32_neon_max : fp32 -> fp32 -> fp32)
 (glane : Z -> fp32 -> fp32 -> fp32)
 (UndefStructPredfloat32x4_t : Z -> Assertion)
 (UndefStructPredfloat32x2_t : Z -> Assertion) */
struct float32x4_t { float s0;float s1;float s2;float s3; };
struct float32x2_t { float s0;float s1; };
typedef struct float32x4_t float32x4_t;
typedef struct float32x2_t float32x2_t;
float qcp_neon_min(float a,float b)
/*@ Require emp Ensure bit_same(__return,fp32_neon_min(a,b)) && emp */;
float qcp_neon_max(float a,float b)
/*@ Require emp Ensure bit_same(__return,fp32_neon_max(a,b)) && emp */;
/*@ include strategies "neon_copy.strategies" */
#endif
