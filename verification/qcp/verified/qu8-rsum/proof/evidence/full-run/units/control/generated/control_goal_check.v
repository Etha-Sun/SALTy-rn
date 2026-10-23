From Qu8Rsum Require Import control_goal control_proof_auto control_proof_manual.

Module VC_Correctness : VC_Correct.
  Include control_proof_auto.
  Include control_proof_manual.
End VC_Correctness.
