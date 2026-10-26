From ArgmaxPool Require Import read_previous_goal read_previous_proof_auto read_previous_proof_manual.

Module VC_Correctness : VC_Correct.
  Include read_previous_proof_auto.
  Include read_previous_proof_manual.
End VC_Correctness.
