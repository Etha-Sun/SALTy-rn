From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Lrelu Require Import false_width_expanded_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module FalseWidth : Qs8Lrelu.false_width_expanded_goal.VC_Correct.
Lemma proof_of_false_width_return_wit_1 : Qs8Lrelu.false_width_expanded_goal.false_width_return_wit_1.
Proof. unfold Qs8Lrelu.false_width_expanded_goal.false_width_return_wit_1;entailer!. Qed.
End FalseWidth.
