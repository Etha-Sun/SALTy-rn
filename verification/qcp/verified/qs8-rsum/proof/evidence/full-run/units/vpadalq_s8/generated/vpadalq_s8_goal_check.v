From Qs8Rsum Require Import vpadalq_s8_goal vpadalq_s8_proof_auto vpadalq_s8_proof_manual.

Module VC_Correctness : VC_Correct.
  Include vpadalq_s8_proof_auto.
  Include vpadalq_s8_proof_manual.
End VC_Correctness.
