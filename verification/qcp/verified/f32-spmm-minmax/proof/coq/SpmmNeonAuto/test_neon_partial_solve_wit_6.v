From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import EntryFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_6 : neon_goal.test_neon_partial_solve_wit_6.
Proof.
 unfold test_neon_partial_solve_wit_6.
 first [timeout 60 (left;intros;spmm_entry_normalize;solve [spmm_frame2|spmm_pure2|spmm_loan2|spmm_restore|spmm_input_window|spmm_output_loan|spmm_tuple_frame])
 |timeout 60 (right;intros;spmm_entry_normalize;solve [spmm_frame2|spmm_pure2|spmm_loan2|spmm_restore|spmm_input_window|spmm_output_loan|spmm_tuple_frame])
 |timeout 60 (intros;spmm_entry_normalize;solve [spmm_frame2|spmm_pure2|spmm_loan2|spmm_restore|spmm_input_window|spmm_output_loan|spmm_tuple_frame])].
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_6.
