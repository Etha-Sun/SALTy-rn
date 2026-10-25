From Coq Require Import ZArith List Lia Strings.String.
From Qs8Caller Require Import caller_goal.
From Qs8Gemm Require Import ProofSupport.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_equivalent_partial_solve_wit_3_pure:caller_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold equivalent_partial_solve_wit_3_pure;try left;intros;qs8_normalize;timeout 90 (first[qs8_pure|qs8_frame|entailer!]).
Qed.
End Checked.
Print Assumptions Checked.proof_of_equivalent_partial_solve_wit_3_pure.
