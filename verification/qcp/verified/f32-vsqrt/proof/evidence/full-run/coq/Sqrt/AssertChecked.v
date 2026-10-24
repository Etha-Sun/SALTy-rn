From Coq Require Import ZArith Lia.
From Sqrt Require Import KernelSupport assert_unit_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedAssert : Sqrt.assert_unit_goal.VC_Correct.
Lemma proof_of_qcp_sqrt_assert_return_wit_1 : Sqrt.assert_unit_goal.qcp_sqrt_assert_return_wit_1.
Proof. unfold Sqrt.assert_unit_goal.qcp_sqrt_assert_return_wit_1;sqrt_kernel_finish. Qed.
End CheckedAssert.
Print Assumptions CheckedAssert.proof_of_qcp_sqrt_assert_return_wit_1.
