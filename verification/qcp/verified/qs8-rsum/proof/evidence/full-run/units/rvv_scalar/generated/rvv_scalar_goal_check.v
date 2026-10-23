From Qs8Rsum Require Import rvv_scalar_goal rvv_scalar_proof_auto rvv_scalar_proof_manual.

Module VC_Correctness : VC_Correct.
  Include rvv_scalar_proof_auto.
  Include rvv_scalar_proof_manual.
End VC_Correctness.
