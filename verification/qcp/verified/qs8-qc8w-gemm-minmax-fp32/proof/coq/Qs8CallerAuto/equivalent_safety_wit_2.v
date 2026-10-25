From Coq Require Import ZArith List Lia Strings.String.
From Qs8Caller Require Import caller_goal.
From Qs8Gemm Require Import ProofSupport.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_equivalent_safety_wit_2:caller_goal.equivalent_safety_wit_2.
Proof. unfold equivalent_safety_wit_2;try left;intros;qs8_normalize;timeout 90 (first[qs8_pure|qs8_frame|entailer!]).
Qed.
End Checked.
Print Assumptions Checked.proof_of_equivalent_safety_wit_2.
