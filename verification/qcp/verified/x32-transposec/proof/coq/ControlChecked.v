From X32Transpose Require Import Types control_goal.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedControl:X32Transpose.control_goal.VC_Correct.
Lemma proof_of_xt_assert_return_wit_1:X32Transpose.control_goal.xt_assert_return_wit_1.
Proof. unfold X32Transpose.control_goal.xt_assert_return_wit_1;intros;entailer!. Qed.
End CheckedControl.
Module ControlExact:X32Transpose.control_goal.VC_Correct:=CheckedControl.
Print Assumptions CheckedControl.proof_of_xt_assert_return_wit_1.
