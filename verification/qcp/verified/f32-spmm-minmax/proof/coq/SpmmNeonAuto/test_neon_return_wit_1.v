From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import NeonExtras.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_return_wit_1 : test_neon_return_wit_1.
Proof.

 unfold test_neon_return_wit_1;right;intros;spmm_normalize2.
 rewrite spmm_output_advance by lia.
 replace(rows-1+1)with rows by lia.
 spmm_frame2.

Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_return_wit_1.
