From WidthDiagnostic Require Import width_expanded_goal width_expanded_proof_auto width_expanded_proof_manual.

Module VC_Correctness : VC_Correct.
  Include width_expanded_proof_auto.
  Include width_expanded_proof_manual.
End VC_Correctness.
