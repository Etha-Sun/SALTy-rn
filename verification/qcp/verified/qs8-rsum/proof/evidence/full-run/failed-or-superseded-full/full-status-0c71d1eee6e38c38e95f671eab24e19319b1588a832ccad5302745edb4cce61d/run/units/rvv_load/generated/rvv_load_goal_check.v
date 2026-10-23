From Qs8Rsum Require Import rvv_load_goal rvv_load_proof_auto rvv_load_proof_manual.

Module VC_Correctness : VC_Correct.
  Include byte_arrays_strategy_proof.
  Include rvv_load_proof_auto.
  Include rvv_load_proof_manual.
End VC_Correctness.
