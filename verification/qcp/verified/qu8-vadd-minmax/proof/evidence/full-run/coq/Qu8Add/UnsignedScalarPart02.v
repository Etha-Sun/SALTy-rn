From Qu8Add Require Import UnsignedScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qu_subu8_return_wit_1 : Qu8Add.unsigned_scalar_goal.qcp_qu_subu8_return_wit_1.
Proof. unfold Qu8Add.unsigned_scalar_goal.qcp_qu_subu8_return_wit_1;try left;intros;subst;qu_unsigned_core. Qed.

Lemma proof_of_qcp_qu_max16_zero_safety_wit_2 : Qu8Add.unsigned_scalar_goal.qcp_qu_max16_zero_safety_wit_2.
Proof. unfold Qu8Add.unsigned_scalar_goal.qcp_qu_max16_zero_safety_wit_2;try left;intros;subst;qu_unsigned_core. Qed.
