From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From MaxPool Require Import Model CountFacts assert_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedAssert : MaxPool.assert_goal.VC_Correct.
Lemma proof_of_mp_assert_return_wit_1 : MaxPool.assert_goal.mp_assert_return_wit_1.
Proof. unfold MaxPool.assert_goal.mp_assert_return_wit_1;try left;intros;unfold mp_remaining;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b) end;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;entailer!;lia. Qed.
End CheckedAssert.
Print Assumptions CheckedAssert.proof_of_mp_assert_return_wit_1.
