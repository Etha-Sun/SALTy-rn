From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import NeonClosure.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_16_1 : test_neon_entail_wit_16_1.
Proof.
 unfold test_neon_entail_wit_16_1;right;intros;spmm_normalize2;mc_facts.
 assert(Hq:Z.quot mc 4=3)by(small_mc mc).
 rewrite Hq.
 rewrite(spmm_cyclic_input_end rows nc_pre start NN D A W(rows-3) ltac:(assumption)).
 rewrite !spmm_unsigned64.
 assert(Hrestore:word64(word64(spmm_output_cursor output_pre(rows-3)output_stride_pre nc_pre)-word64(word64(output_stride_pre*nc_pre)-8))=spmm_output_cursor output_pre(rows-3+2)output_stride_pre 0)by exact(spmm_word_cursor_restore output_pre(rows-3)output_stride_pre nc_pre 2).
 rewrite Hrestore.
 rewrite ?spmm_unsigned64,spmm_word64_add_sub.
 rewrite spmm_output_advance by lia.
 replace(rows-3+2)with(rows-1)by lia.
 try width_start;spmm_fast_frame_neon.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_16_1.
