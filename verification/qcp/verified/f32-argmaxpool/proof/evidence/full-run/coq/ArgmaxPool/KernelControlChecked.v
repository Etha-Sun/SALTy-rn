From ArgmaxPool Require Import Model control_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedControl : ArgmaxPool.control_unit_goal.VC_Correct.
Lemma proof_of_ap_assert_return_wit_1 : ArgmaxPool.control_unit_goal.ap_assert_return_wit_1.
Proof. unfold ArgmaxPool.control_unit_goal.ap_assert_return_wit_1;intros;entailer!. Qed.
End CheckedControl.
Module ExactControl:ArgmaxPool.control_unit_goal.VC_Correct:=CheckedControl.
Print Assumptions ExactControl.proof_of_ap_assert_return_wit_1.
