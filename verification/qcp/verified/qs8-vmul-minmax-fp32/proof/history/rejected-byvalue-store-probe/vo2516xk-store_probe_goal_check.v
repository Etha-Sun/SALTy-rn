From Qs8Mul Require Import store_probe_goal store_probe_proof_auto store_probe_proof_manual.

Module VC_Correctness : VC_Correct.
  Include store_probe_proof_auto.
  Include store_probe_proof_manual.
End VC_Correctness.
