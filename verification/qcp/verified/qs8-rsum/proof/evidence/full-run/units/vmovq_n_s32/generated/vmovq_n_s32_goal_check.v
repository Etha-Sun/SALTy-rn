From Qs8Rsum Require Import vmovq_n_s32_goal vmovq_n_s32_proof_auto vmovq_n_s32_proof_manual.

Module VC_Correctness : VC_Correct.
  Include vmovq_n_s32_proof_auto.
  Include vmovq_n_s32_proof_manual.
End VC_Correctness.
