From Coq Require Import ZArith List Lia Strings.String.
From Qs8Caller Require Import caller_goal.
From Qs8Gemm Require Import ProofSupport.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_qs8_compare_outputs_partial_solve_wit_4:caller_goal.qs8_compare_outputs_partial_solve_wit_4.
Proof. unfold qs8_compare_outputs_partial_solve_wit_4,qs8_compare_outputs_partial_solve_wit_4_aux.
 intros H right left n L0 i;intros.
 sep_apply (CharArray.full_split_to_missing_i left i n L0 0);[|lia].
 sep_apply (CharArray.full_split_to_missing_i right i n L0 0);[|lia].
 unfold StoreCharAsElement.storeA;qs8_normalize;entailer!.
Qed.
End Checked.
Print Assumptions Checked.proof_of_qs8_compare_outputs_partial_solve_wit_4.
