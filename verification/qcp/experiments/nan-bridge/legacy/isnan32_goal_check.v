From NanBridge Require Import isnan32_goal isnan32_proof_auto isnan32_proof_manual.

Module VC_Correctness : VC_Correct.
  Include isnan32_proof_auto.
  Include isnan32_proof_manual.
End VC_Correctness.
