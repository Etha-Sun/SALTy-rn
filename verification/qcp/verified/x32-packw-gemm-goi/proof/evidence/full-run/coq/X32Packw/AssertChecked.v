From Coq Require Import ZArith.
From SimpleC.SL Require Import Mem SeparationLogic.
From X32Packw Require Import assert_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedAssert : X32Packw.assert_goal.VC_Correct.
Lemma proof_of_pw_assert_return_wit_1:pw_assert_return_wit_1.
Proof. unfold pw_assert_return_wit_1;intros;entailer!. Qed.
End CheckedAssert.
Module AssertExact : X32Packw.assert_goal.VC_Correct := CheckedAssert.
Print Assumptions CheckedAssert.proof_of_pw_assert_return_wit_1.
