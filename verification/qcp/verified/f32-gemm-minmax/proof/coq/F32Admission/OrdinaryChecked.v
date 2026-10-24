From F32Admission Require Import ordinary_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Module Checked <: ordinary_goal.VC_Correct.
Lemma proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Proof. unfold qcp_assert_return_wit_1;intros;apply derivable1_refl. Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_assert_return_wit_1.
