From Coq Require Import ZArith List Lia Strings.String.
From Qs8NeonGoals Require Import G0668.
From Qs8Gemm Require Import NeonMemory.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma checked:test_neon_partial_solve_wit_114_pure.
Proof.
 unfold test_neon_partial_solve_wit_114_pure;try right;intros;qs8_normalize2;qs8_domain_facts.
 assert(Hpad:kc_pre-k+8<=a_read_extent kc_pre)by(apply qs8_padded_block_extent;try lia;rewrite <-Z.rem_mod_nonneg by lia;assumption).
 qs8_neon_pure.
Qed.
Print Assumptions checked.
