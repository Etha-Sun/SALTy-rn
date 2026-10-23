From Qs8Rsum Require Import vaddvq_s32_goal vaddvq_s32_proof_auto vaddvq_s32_proof_manual.

Module VC_Correctness : VC_Correct.
  Include vaddvq_s32_proof_auto.
  Include vaddvq_s32_proof_manual.
End VC_Correctness.
