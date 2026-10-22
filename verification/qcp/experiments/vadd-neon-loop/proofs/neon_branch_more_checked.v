Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeonLoop Require Import neon_loop_unit_goal NeonLoopBridge.
From QcpNeon Require Import NeonBridge.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonBranches.
Lemma proof_of_test_neon_entail_wit_3_1 : test_neon_entail_wit_3_1.
Proof. unfold test_neon_entail_wit_3_1; intros; try (Exists k); repeat rewrite sizeof_float in *; entailer!. Qed.
Lemma proof_of_test_neon_entail_wit_5_1 : test_neon_entail_wit_5_1.
Proof. unfold test_neon_entail_wit_5_1; intros; try (Exists k); repeat rewrite sizeof_float in *; entailer!. Qed.
End CheckedNeonBranches.
Print Assumptions CheckedNeonBranches.proof_of_test_neon_entail_wit_3_1.
Print Assumptions CheckedNeonBranches.proof_of_test_neon_entail_wit_5_1.
