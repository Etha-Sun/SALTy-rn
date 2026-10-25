From Coq Require Import ZArith Lia.
From Qs8NeonGoals Require Import G0678.
From Qs8Gemm Require Import NeonSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma checked:test_neon_partial_solve_wit_118.
Proof.
 unfold test_neon_partial_solve_wit_118,test_neon_partial_solve_wit_118_aux;try right;intros;qs8_normalize2;qs8_domain_facts;first[solve[qs8_neon_pure]|solve[qs8_neon_frame]].
Qed.
Print Assumptions checked.
