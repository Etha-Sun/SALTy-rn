From Qs8Rsum Require Import public_wrapper_goal public_wrapper_proof_auto public_wrapper_proof_manual.

Module VC_Correctness : VC_Correct.
  Include byte_arrays_strategy_proof.
  Include public_wrapper_proof_auto.
  Include public_wrapper_proof_manual.
End VC_Correctness.
