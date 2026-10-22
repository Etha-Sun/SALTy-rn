From NanBridge Require Import bridge_goal bridge_proof_auto bridge_proof_manual.

Module VC_Correctness : VC_Correct.
  Include bridge_proof_auto.
  Include bridge_proof_manual.
End VC_Correctness.
