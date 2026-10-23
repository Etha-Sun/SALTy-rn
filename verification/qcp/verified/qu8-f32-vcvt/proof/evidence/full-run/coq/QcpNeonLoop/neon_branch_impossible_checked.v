Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeonLoop Require Import neon_loop_unit_goal NeonLoopBridge.
From QcpNeon Require Import NeonBridge.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedImpossibleNeonBranches.
Lemma proof_of_test_neon_entail_wit_3_2 : test_neon_entail_wit_3_2.
Proof. unfold test_neon_entail_wit_3_2; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence. Qed.
Lemma proof_of_test_neon_entail_wit_3_3 : test_neon_entail_wit_3_3.
Proof. unfold test_neon_entail_wit_3_3; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence. Qed.
Lemma proof_of_test_neon_entail_wit_4_1 : test_neon_entail_wit_4_1.
Proof. unfold test_neon_entail_wit_4_1; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence. Qed.
Lemma proof_of_test_neon_entail_wit_5_2 : test_neon_entail_wit_5_2.
Proof. unfold test_neon_entail_wit_5_2; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence. Qed.
Lemma proof_of_test_neon_entail_wit_5_3 : test_neon_entail_wit_5_3.
Proof. unfold test_neon_entail_wit_5_3; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence. Qed.
Lemma proof_of_test_neon_entail_wit_6_1 : test_neon_entail_wit_6_1.
Proof. unfold test_neon_entail_wit_6_1; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence. Qed.
End CheckedImpossibleNeonBranches.
