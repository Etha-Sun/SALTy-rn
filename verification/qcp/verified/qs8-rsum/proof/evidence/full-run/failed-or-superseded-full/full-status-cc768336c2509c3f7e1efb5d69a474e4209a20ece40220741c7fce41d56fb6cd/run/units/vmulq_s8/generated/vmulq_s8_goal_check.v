From Qs8Rsum Require Import vmulq_s8_goal vmulq_s8_proof_auto vmulq_s8_proof_manual.

Module VC_Correctness : VC_Correct.
  Include vmulq_s8_proof_auto.
  Include vmulq_s8_proof_manual.
End VC_Correctness.
