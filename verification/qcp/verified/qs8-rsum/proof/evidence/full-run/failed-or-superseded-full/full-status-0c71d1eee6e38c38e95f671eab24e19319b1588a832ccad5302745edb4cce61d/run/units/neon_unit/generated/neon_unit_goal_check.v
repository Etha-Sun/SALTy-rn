From Qs8Rsum Require Import neon_unit_goal neon_unit_proof_auto neon_unit_proof_manual.

Module VC_Correctness : VC_Correct.
  Include byte_arrays_strategy_proof.
  Include neon_unit_proof_auto.
  Include neon_unit_proof_manual.
End VC_Correctness.
