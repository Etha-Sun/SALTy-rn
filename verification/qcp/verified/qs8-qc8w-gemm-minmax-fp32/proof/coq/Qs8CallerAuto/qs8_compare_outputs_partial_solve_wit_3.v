From Coq Require Import ZArith List Lia Strings.String.
From Qs8Caller Require Import caller_goal.
From Qs8Gemm Require Import ProofSupport.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_qs8_compare_outputs_partial_solve_wit_3:caller_goal.qs8_compare_outputs_partial_solve_wit_3.
Proof. unfold qs8_compare_outputs_partial_solve_wit_3;intros right_pre left_pre n_pre L0 i. intros.
 sep_apply(CharArray.full_split_to_missing_i right_pre i n_pre L0 0);[|lia].
 unfold StoreCharAsElement.storeA;entailer!.
Qed.
End Checked.
Print Assumptions Checked.proof_of_qs8_compare_outputs_partial_solve_wit_3.
