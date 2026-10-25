From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From MaxPool Require Import Model CountFacts count_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedCount : MaxPool.count_goal.VC_Correct.
Lemma proof_of_mp_count_after_group_safety_wit_1 : MaxPool.count_goal.mp_count_after_group_safety_wit_1.
Proof. unfold MaxPool.count_goal.mp_count_after_group_safety_wit_1;try left;intros;unfold mp_remaining;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b) end;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_mp_count_after_group_safety_wit_2 : MaxPool.count_goal.mp_count_after_group_safety_wit_2.
Proof. unfold MaxPool.count_goal.mp_count_after_group_safety_wit_2;try left;intros;unfold mp_remaining;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b) end;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_mp_count_after_group_safety_wit_3 : MaxPool.count_goal.mp_count_after_group_safety_wit_3.
Proof. unfold MaxPool.count_goal.mp_count_after_group_safety_wit_3;try left;intros;unfold mp_remaining;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b) end;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_mp_count_after_group_return_wit_1 : MaxPool.count_goal.mp_count_after_group_return_wit_1.
Proof. unfold MaxPool.count_goal.mp_count_after_group_return_wit_1;try left;intros;unfold mp_remaining;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b) end;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;entailer!;lia. Qed.
Lemma proof_of_mp_count_after_group_return_wit_2 : MaxPool.count_goal.mp_count_after_group_return_wit_2.
Proof. unfold MaxPool.count_goal.mp_count_after_group_return_wit_2;try left;intros;unfold mp_remaining;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b) end;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;entailer!;lia. Qed.
End CheckedCount.
Print Assumptions CheckedCount.proof_of_mp_count_after_group_safety_wit_1.
Print Assumptions CheckedCount.proof_of_mp_count_after_group_safety_wit_2.
Print Assumptions CheckedCount.proof_of_mp_count_after_group_safety_wit_3.
Print Assumptions CheckedCount.proof_of_mp_count_after_group_return_wit_1.
Print Assumptions CheckedCount.proof_of_mp_count_after_group_return_wit_2.
