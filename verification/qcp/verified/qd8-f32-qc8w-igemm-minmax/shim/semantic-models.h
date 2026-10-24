#ifndef QCP_QD8_PRIMITIVE_MODELS_H
#define QCP_QD8_PRIMITIVE_MODELS_H
/* Logical registrations of existing checked definitions, not C extern
 * implementations. The pending intrinsic ledger blocks whole-kernel generation. */
/*@ Import Coq Require Import GemmSpec.FmaModel GemmSpec.IntrinsicModel
 Qd8Phase.IntegerFold Qd8Cast.CastModel */
/*@ Extern Coq
 (fma_rne : fp32 -> fp32 -> fp32 -> fp32)
 (fp32_neon_min : fp32 -> fp32 -> fp32)
 (fp32_neon_max : fp32 -> fp32 -> fp32)
 (fp32_min_number : fp32 -> fp32 -> fp32)
 (fp32_max_number : fp32 -> fp32 -> fp32)
 (wrap32 : Z -> Z)
 (signed32_view : Z -> Z) */
#endif
