From Qu8Rsum Require Import rvv_unit_goal rvv_unit_proof_auto rvv_unit_proof_manual.

Module VC_Correctness : VC_Correct.
  Include byte_arrays_strategy_proof.
  Include rvv_unit_proof_auto.
  Include rvv_unit_proof_manual.
End VC_Correctness.
