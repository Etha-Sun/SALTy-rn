#ifndef QCP_VADD_TYPES_H
#define QCP_VADD_TYPES_H
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (fp32_bits_equal : fp32 -> fp32 -> Prop)
               (vadd_vl : Z -> Z)
               (vadd_active_sub : Z -> Z -> fp32 -> fp32 -> fp32) */
struct float32x4_t { float s0; float s1; float s2; float s3; };
struct float32x2_t { float s0; float s1; };
#endif
