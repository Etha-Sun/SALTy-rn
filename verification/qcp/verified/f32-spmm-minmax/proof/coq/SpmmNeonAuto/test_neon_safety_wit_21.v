From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import KernelFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_safety_wit_21 : neon_goal.test_neon_safety_wit_21.
Proof.
 unfold test_neon_safety_wit_21.
 first [timeout 60 (right;intros;spmm_normalize2;solve [spmm_frame2|spmm_pure2|spmm_loan|spmm_restore|entailer!;spmm_pure2])
       |timeout 60 (left;intros;spmm_normalize2;solve [spmm_frame2|spmm_pure2|spmm_loan|spmm_restore|entailer!;spmm_pure2])
       |timeout 60 (intros;spmm_normalize2;solve [spmm_frame2|spmm_pure2|spmm_loan|spmm_restore|entailer!;spmm_pure2])].
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_safety_wit_21.
