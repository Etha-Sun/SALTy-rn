From Qs8Rsum Require Import scalar_primitives_goal scalar_primitives_proof_auto scalar_primitives_proof_manual.

Module VC_Correctness : VC_Correct.
  Include scalar_primitives_proof_auto.
  Include scalar_primitives_proof_manual.
End VC_Correctness.
