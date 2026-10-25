From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import NeonExtras.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_return_wit_2 : test_neon_return_wit_2.
Proof.

 unfold test_neon_return_wit_2;right;intros;spmm_normalize2.
 pose proof(spmm_mc_multiple mc ltac:(assumption)).
 assert(E:mc=0\/mc=4\/mc=8\/mc=12)by lia.
 assert(Z.quot mc 4=2).
 { destruct E as[E | [E | [E | E]]];subst mc;vm_compute in PreH25;try lia;reflexivity. }
 rewrite H0.
 rewrite spmm_output_advance by lia.
 replace(rows-2+2)with rows by lia.
 spmm_frame2.

Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_return_wit_2.
