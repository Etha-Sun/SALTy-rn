From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import NeonClosure.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_16_2 : test_neon_entail_wit_16_2.
Proof.
 unfold test_neon_entail_wit_16_2;right;intros;spmm_normalize2;mc_facts.
 assert(Hq:Z.quot mc 4=1)by(small_mc mc).
 rewrite Hq.
 rewrite !spmm_unsigned64,!spmm_word64_add_sub.
 try width_start;spmm_fast_frame_neon.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_16_2.
