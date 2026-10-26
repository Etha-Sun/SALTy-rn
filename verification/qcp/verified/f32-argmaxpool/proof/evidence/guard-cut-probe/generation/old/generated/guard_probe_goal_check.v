From ArgmaxPool Require Import guard_probe_goal guard_probe_proof_auto guard_probe_proof_manual.

Module VC_Correctness : VC_Correct.
  Include guard_probe_proof_auto.
  Include guard_probe_proof_manual.
End VC_Correctness.
