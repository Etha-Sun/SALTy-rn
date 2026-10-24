From Coq Require Import ZArith Lia List.
From Dwconv Require Import NeonKernelMemoryWord.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_4_6:Dwconv.neon_unit_goal.test_neon_entail_wit_4_6.
Proof. unfold test_neon_entail_wit_4_6;left;dwm_setup_rows. Qed.
Print Assumptions proof_of_test_neon_entail_wit_4_6.
