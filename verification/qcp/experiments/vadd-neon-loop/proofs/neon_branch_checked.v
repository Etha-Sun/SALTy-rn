Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeonLoop Require Import neon_loop_unit_goal NeonLoopBridge.
From QcpNeon Require Import NeonBridge.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonBranches.
Lemma proof_of_test_neon_entail_wit_4_2 : test_neon_entail_wit_4_2.
Proof. unfold test_neon_entail_wit_4_2; intros; try (Exists k); repeat rewrite sizeof_float in *; entailer!. Qed.
Lemma proof_of_test_neon_entail_wit_4_3 : test_neon_entail_wit_4_3.
Proof. unfold test_neon_entail_wit_4_3; intros; try (Exists k_2); repeat rewrite sizeof_float in *; entailer!. Qed.
Lemma proof_of_test_neon_entail_wit_6_2 : test_neon_entail_wit_6_2.
Proof. unfold test_neon_entail_wit_6_2; intros; try (Exists k); repeat rewrite sizeof_float in *; entailer!. Qed.
Lemma proof_of_test_neon_entail_wit_6_3 : test_neon_entail_wit_6_3.
Proof. unfold test_neon_entail_wit_6_3; intros; try (Exists k_2); repeat rewrite sizeof_float in *; entailer!. Qed.
End CheckedNeonBranches.
Print Assumptions CheckedNeonBranches.proof_of_test_neon_entail_wit_4_2.
Print Assumptions CheckedNeonBranches.proof_of_test_neon_entail_wit_4_3.
Print Assumptions CheckedNeonBranches.proof_of_test_neon_entail_wit_6_2.
Print Assumptions CheckedNeonBranches.proof_of_test_neon_entail_wit_6_3.
