From Qs8Rsum Require Import vl_goal vl_proof_auto vl_proof_manual.

Module VC_Correctness : VC_Correct.
  Include vl_proof_auto.
  Include vl_proof_manual.
End VC_Correctness.
