From Qu8Rsum Require Import neon_load_goal neon_load_proof_auto neon_load_proof_manual.

Module VC_Correctness : VC_Correct.
  Include byte_arrays_strategy_proof.
  Include neon_load_proof_auto.
  Include neon_load_proof_manual.
End VC_Correctness.
