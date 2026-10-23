From Qs8Rsum Require Import rsum_alias_vadd_s32m8_goal rsum_alias_vadd_s32m8_proof_auto rsum_alias_vadd_s32m8_proof_manual.

Module VC_Correctness : VC_Correct.
  Include rsum_alias_vadd_s32m8_proof_auto.
  Include rsum_alias_vadd_s32m8_proof_manual.
End VC_Correctness.
