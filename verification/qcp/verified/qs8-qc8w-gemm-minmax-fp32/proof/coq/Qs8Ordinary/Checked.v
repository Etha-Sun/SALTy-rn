From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qs8Ordinary Require Import ordinary_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: VC_Correct.
Lemma proof_of_qcp_assert_return_wit_1:qcp_assert_return_wit_1.
Proof. pre_process_default;entailer!. Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_assert_return_wit_1.
