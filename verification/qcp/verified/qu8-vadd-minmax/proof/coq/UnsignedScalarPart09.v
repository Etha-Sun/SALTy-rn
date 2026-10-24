From Qu8Add Require Import UnsignedScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qu_from_u16_return_wit_2 : Qu8Add.unsigned_scalar_goal.qcp_qu_from_u16_return_wit_2.
Proof. unfold Qu8Add.unsigned_scalar_goal.qcp_qu_from_u16_return_wit_2;try left;intros;subst;pose proof(qu_s16_range x_pre);rewrite qu_s16_id by lia;qu_unsigned_core. Qed.
