From HwcConv Require Import copy_float_unit_goal FloatCopyModel.
Import Snaive_C_Rules64. Local Open Scope sac.
Module CheckedFloatCopy:HwcConv.copy_float_unit_goal.VC_Correct.
Lemma proof_of_hc_copy_float_return_wit_1:HwcConv.copy_float_unit_goal.hc_copy_float_return_wit_1.
Proof. unfold HwcConv.copy_float_unit_goal.hc_copy_float_return_wit_1;left;intros;unfold hc_same_bits;entailer!. Qed.
End CheckedFloatCopy.
Module ExactSecond:HwcConv.copy_float_unit_goal.VC_Correct:=CheckedFloatCopy.
Print Assumptions CheckedFloatCopy.proof_of_hc_copy_float_return_wit_1.
