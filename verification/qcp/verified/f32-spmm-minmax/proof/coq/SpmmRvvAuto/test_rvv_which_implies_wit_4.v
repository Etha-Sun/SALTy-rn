From Coq Require Import ZArith List Lia.
From SpmmRvv Require Import rvv_goal.
From SpmmProof Require Import MemoryFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_which_implies_wit_4 : rvv_goal.test_rvv_which_implies_wit_4.
Proof.
 unfold test_rvv_which_implies_wit_4.
 first [timeout 60 (right;intros;spmm_normalize2;solve [spmm_frame2|spmm_pure2|spmm_loan2|spmm_restore|spmm_input_window|spmm_output_loan|entailer!;spmm_pure2])
       |timeout 60 (left;intros;spmm_normalize2;solve [spmm_frame2|spmm_pure2|spmm_loan2|spmm_restore|spmm_input_window|spmm_output_loan|entailer!;spmm_pure2])
       |timeout 60 (intros;spmm_normalize2;solve [spmm_frame2|spmm_pure2|spmm_loan2|spmm_restore|spmm_input_window|spmm_output_loan|entailer!;spmm_pure2])].
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_which_implies_wit_4.
