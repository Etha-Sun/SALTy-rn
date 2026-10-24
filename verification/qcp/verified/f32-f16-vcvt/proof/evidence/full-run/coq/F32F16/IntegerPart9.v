From F32F16 Require Import IntegerSupport integer_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedIntegerPart9.
Lemma proof_of_qcp_f16_add16_partial_solve_wit_1 : F32F16.integer_goal.qcp_f16_add16_partial_solve_wit_1.
Proof. unfold F32F16.integer_goal.qcp_f16_add16_partial_solve_wit_1; f16_integer_finish. Qed.
End CheckedIntegerPart9.
