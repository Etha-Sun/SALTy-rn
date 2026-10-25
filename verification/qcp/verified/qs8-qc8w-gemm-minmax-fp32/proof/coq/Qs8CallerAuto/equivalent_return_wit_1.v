From Coq Require Import ZArith List Lia Strings.String.
From Qs8Caller Require Import caller_goal.
From Qs8Gemm Require Import ProofSupport.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_equivalent_return_wit_1:caller_goal.equivalent_return_wit_1.
Proof. unfold equivalent_return_wit_1;intros;Exists L_2;qs8_frame.
Qed.
End Checked.
Print Assumptions Checked.proof_of_equivalent_return_wit_1.
