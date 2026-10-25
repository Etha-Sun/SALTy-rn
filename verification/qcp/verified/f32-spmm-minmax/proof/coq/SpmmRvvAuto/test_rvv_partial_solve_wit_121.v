From Coq Require Import ZArith List Lia.
From SpmmRvv Require Import rvv_goal.
From SpmmProof Require Import RvvFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_121 : rvv_goal.test_rvv_partial_solve_wit_121.
Proof.
 unfold test_rvv_partial_solve_wit_121.
 first [timeout 120 (right;intros;spmm_entry_normalize;solve [spmm_fast_frame|spmm_pure2|spmm_loan2|spmm_restore|spmm_input_window|spmm_output_loan])
 |timeout 120 (left;intros;spmm_entry_normalize;solve [spmm_fast_frame|spmm_pure2|spmm_loan2|spmm_restore|spmm_input_window|spmm_output_loan])
 |timeout 120 (intros;spmm_entry_normalize;solve [spmm_fast_frame|spmm_pure2|spmm_loan2|spmm_restore|spmm_input_window|spmm_output_loan])].
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_121.
