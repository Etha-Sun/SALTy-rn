From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import NeonExtras.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_9 : test_neon_partial_solve_wit_9.
Proof.
 unfold test_neon_partial_solve_wit_9.
 first [timeout 120 (right;intros;spmm_extra_normalize;solve [spmm_fast_frame_neon|spmm_pure2|spmm_loan3|spmm_index_pure|spmm_restore|spmm_input_window|spmm_output_loan|spmm_tuple_frame])
 |timeout 120 (left;intros;spmm_extra_normalize;solve [spmm_fast_frame_neon|spmm_pure2|spmm_loan3|spmm_index_pure|spmm_restore|spmm_input_window|spmm_output_loan|spmm_tuple_frame])
 |timeout 120 (intros;spmm_extra_normalize;solve [spmm_fast_frame_neon|spmm_pure2|spmm_loan3|spmm_index_pure|spmm_restore|spmm_input_window|spmm_output_loan|spmm_tuple_frame])].
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_partial_solve_wit_9.
