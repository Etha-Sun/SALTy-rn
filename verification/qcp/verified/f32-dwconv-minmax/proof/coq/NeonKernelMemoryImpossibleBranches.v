From Coq Require Import ZArith Lia.
From Dwconv Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_8_2:Dwconv.neon_unit_goal.test_neon_entail_wit_8_2.
Proof. unfold test_neon_entail_wit_8_2;dwm_prepare;change(Z.land 2 2)with 2 in *;exfalso;lia. Qed.
Print Assumptions proof_of_test_neon_entail_wit_8_2.
Lemma proof_of_test_neon_entail_wit_8_3:Dwconv.neon_unit_goal.test_neon_entail_wit_8_3.
Proof. unfold test_neon_entail_wit_8_3;dwm_prepare;change(Z.land 3 2)with 2 in *;exfalso;lia. Qed.
Print Assumptions proof_of_test_neon_entail_wit_8_3.
Lemma proof_of_test_neon_entail_wit_9_1:Dwconv.neon_unit_goal.test_neon_entail_wit_9_1.
Proof. unfold test_neon_entail_wit_9_1;dwm_prepare;change(Z.land 1 2)with 0 in *;exfalso;lia. Qed.
Print Assumptions proof_of_test_neon_entail_wit_9_1.
Lemma proof_of_test_neon_entail_wit_12_1:Dwconv.neon_unit_goal.test_neon_entail_wit_12_1.
Proof. unfold test_neon_entail_wit_12_1;dwm_prepare;change(Z.land 2 1)with 0 in *;exfalso;lia. Qed.
Print Assumptions proof_of_test_neon_entail_wit_12_1.
