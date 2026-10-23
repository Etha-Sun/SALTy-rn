From Qu8Rsum Require Import vpadalq_u8_goal vpadalq_u8_proof_auto vpadalq_u8_proof_manual.

Module VC_Correctness : VC_Correct.
  Include vpadalq_u8_proof_auto.
  Include vpadalq_u8_proof_manual.
End VC_Correctness.
