From ArgmaxPool Require Import expanded_goal expanded_proof_auto expanded_proof_manual.

Module VC_Correctness : VC_Correct.
  Include expanded_proof_auto.
  Include expanded_proof_manual.
End VC_Correctness.
