From Qu8Rsum Require Import vmulq_u8_goal vmulq_u8_proof_auto vmulq_u8_proof_manual.

Module VC_Correctness : VC_Correct.
  Include vmulq_u8_proof_auto.
  Include vmulq_u8_proof_manual.
End VC_Correctness.
