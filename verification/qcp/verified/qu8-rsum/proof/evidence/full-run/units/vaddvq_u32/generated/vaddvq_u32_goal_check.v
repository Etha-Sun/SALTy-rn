From Qu8Rsum Require Import vaddvq_u32_goal vaddvq_u32_proof_auto vaddvq_u32_proof_manual.

Module VC_Correctness : VC_Correct.
  Include vaddvq_u32_proof_auto.
  Include vaddvq_u32_proof_manual.
End VC_Correctness.
