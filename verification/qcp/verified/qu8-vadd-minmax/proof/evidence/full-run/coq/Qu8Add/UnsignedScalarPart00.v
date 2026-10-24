From Qu8Add Require Import UnsignedScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qu_u16_return_wit_1 : Qu8Add.unsigned_scalar_goal.qcp_qu_u16_return_wit_1.
Proof. unfold Qu8Add.unsigned_scalar_goal.qcp_qu_u16_return_wit_1;try left;intros;subst;pose proof(qu_u16_range x_pre);qu_unsigned_core. Qed.

Lemma proof_of_qcp_qu_usat8_return_wit_3 : Qu8Add.unsigned_scalar_goal.qcp_qu_usat8_return_wit_3.
Proof. unfold Qu8Add.unsigned_scalar_goal.qcp_qu_usat8_return_wit_3;try left;intros;subst;qu_unsigned_core. Qed.
