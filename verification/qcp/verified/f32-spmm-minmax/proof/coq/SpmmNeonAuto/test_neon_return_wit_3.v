From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import NeonExtras.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_return_wit_3 : test_neon_return_wit_3.
Proof.

 unfold test_neon_return_wit_3;right;intros;spmm_normalize2.
 pose proof(spmm_mc_multiple mc ltac:(assumption)).
 assert(E:mc=0\/mc=4\/mc=8\/mc=12)by lia.
 assert(Z.quot mc 4=0).
 { destruct E as[E | [E | [E | E]]];subst mc;vm_compute in PreH17,PreH18;try lia;reflexivity. }
 rewrite H0;spmm_normalize2;spmm_frame2.

Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_return_wit_3.
