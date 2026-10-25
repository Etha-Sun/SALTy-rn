From Coq Require Import ZArith List Lia.
From SpmmNeon Require Import neon_goal.
From SpmmProof Require Import NeonClosure.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_entail_wit_9 : test_neon_entail_wit_9.
Proof.
 unfold test_neon_entail_wit_9;right;intros;spmm_normalize2;mc_facts.
 assert(Hrem:Z.rem(mc-16)4=0).
 { replace(mc-16)with((Z.quot mc 4-4)*4)by lia;apply Z.rem_mul;lia. }
 rewrite(spmm_mc_subtract mc 4 ltac:(assumption)).
 rewrite(spmm_cyclic_input_end rows nc_pre start NN D A W (rows-Z.quot mc 4) ltac:(assumption)).
 rewrite !spmm_unsigned64.
 assert(Hrestore:word64(word64(spmm_output_cursor output_pre(rows-Z.quot mc 4)output_stride_pre nc_pre)-word64(word64(output_stride_pre*nc_pre)-16))=spmm_output_cursor output_pre(rows-Z.quot mc 4+4)output_stride_pre 0)by exact(spmm_word_cursor_restore output_pre(rows-Z.quot mc 4)output_stride_pre nc_pre 4).
 rewrite Hrestore.
 rewrite spmm_output_advance by lia.
 replace(rows-(Z.quot mc 4-4))with(rows-Z.quot mc 4+4)by lia.
 spmm_fast_frame_neon.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_neon_entail_wit_9.
