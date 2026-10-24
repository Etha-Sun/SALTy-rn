From F32F16 Require Import IntegerSupport integer_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedIntegerPart3.
Lemma proof_of_qcp_f16_or32_return_wit_1 : F32F16.integer_goal.qcp_f16_or32_return_wit_1.
Proof. unfold F32F16.integer_goal.qcp_f16_or32_return_wit_1; f16_integer_finish. Qed.
Lemma proof_of_qcp_f16_shrn13_partial_solve_wit_1 : F32F16.integer_goal.qcp_f16_shrn13_partial_solve_wit_1.
Proof. unfold F32F16.integer_goal.qcp_f16_shrn13_partial_solve_wit_1; f16_integer_finish. Qed.
End CheckedIntegerPart3.
