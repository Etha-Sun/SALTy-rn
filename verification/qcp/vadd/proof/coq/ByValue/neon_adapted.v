From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import neon_full_checked LoopMemory TailMemory neon_init_lemmas neon_tail_models InvariantFacts NeonLoopBridge.
From ByValue Require Import neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module AdaptedNeonTactics.
Lemma proof_of_test_neon_safety_wit_22 : test_neon_safety_wit_22.
Proof. unfold test_neon_safety_wit_22; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_23 : test_neon_safety_wit_23.
Proof. unfold test_neon_safety_wit_23; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_24 : test_neon_safety_wit_24.
Proof. unfold test_neon_safety_wit_24; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_34 : test_neon_safety_wit_34.
Proof. unfold test_neon_safety_wit_34; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_35 : test_neon_safety_wit_35.
Proof. unfold test_neon_safety_wit_35; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_36 : test_neon_safety_wit_36.
Proof. unfold test_neon_safety_wit_36; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_37 : test_neon_safety_wit_37.
Proof. unfold test_neon_safety_wit_37; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_38 : test_neon_safety_wit_38.
Proof. unfold test_neon_safety_wit_38; intros; repeat rewrite sizeof_float in *; subst batch; vm_compute in PreH20; discriminate. Qed.
Lemma proof_of_test_neon_safety_wit_39 : test_neon_safety_wit_39.
Proof. unfold test_neon_safety_wit_39; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_40 : test_neon_safety_wit_40.
Proof. unfold test_neon_safety_wit_40; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_41 : test_neon_safety_wit_41.
Proof. unfold test_neon_safety_wit_41; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_42 : test_neon_safety_wit_42.
Proof. unfold test_neon_safety_wit_42; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_43 : test_neon_safety_wit_43.
Proof. unfold test_neon_safety_wit_43; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_44 : test_neon_safety_wit_44.
Proof. unfold test_neon_safety_wit_44; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_45 : test_neon_safety_wit_45.
Proof. unfold test_neon_safety_wit_45; intros; repeat rewrite sizeof_float in *; subst batch; vm_compute in PreH21; discriminate. Qed.
Lemma proof_of_test_neon_safety_wit_46 : test_neon_safety_wit_46.
Proof. unfold test_neon_safety_wit_46; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_47 : test_neon_safety_wit_47.
Proof. unfold test_neon_safety_wit_47; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_48 : test_neon_safety_wit_48.
Proof. unfold test_neon_safety_wit_48; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_safety_wit_49 : test_neon_safety_wit_49.
Proof. unfold test_neon_safety_wit_49; pre_process; subst; try csimpl; entailer!. Qed.
Lemma proof_of_test_neon_entail_wit_3_1 : test_neon_entail_wit_3_1.
Proof. first [solve [unfold test_neon_entail_wit_3_1; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_3_1; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_3_2 : test_neon_entail_wit_3_2.
Proof. first [solve [unfold test_neon_entail_wit_3_2; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_3_2; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_3_3 : test_neon_entail_wit_3_3.
Proof. first [solve [unfold test_neon_entail_wit_3_3; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_3_3; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_4_1 : test_neon_entail_wit_4_1.
Proof. first [solve [unfold test_neon_entail_wit_4_1; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_4_1; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_4_2 : test_neon_entail_wit_4_2.
Proof. first [solve [unfold test_neon_entail_wit_4_2; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_4_2; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_4_3 : test_neon_entail_wit_4_3.
Proof. first [solve [unfold test_neon_entail_wit_4_3; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_4_3; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_5_1 : test_neon_entail_wit_5_1.
Proof. first [solve [unfold test_neon_entail_wit_5_1; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_5_1; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_5_2 : test_neon_entail_wit_5_2.
Proof. first [solve [unfold test_neon_entail_wit_5_2; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_5_2; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_5_3 : test_neon_entail_wit_5_3.
Proof. first [solve [unfold test_neon_entail_wit_5_3; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_5_3; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_6_1 : test_neon_entail_wit_6_1.
Proof. first [solve [unfold test_neon_entail_wit_6_1; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_6_1; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_6_2 : test_neon_entail_wit_6_2.
Proof. first [solve [unfold test_neon_entail_wit_6_2; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_6_2; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
Lemma proof_of_test_neon_entail_wit_6_3 : test_neon_entail_wit_6_3.
Proof. first [solve [unfold test_neon_entail_wit_6_3; intros; subst batch; repeat rewrite sizeof_float in *; try (vm_compute in PreH20); try (vm_compute in PreH21); exfalso; congruence] | solve [unfold test_neon_entail_wit_6_3; intros; try (Exists k); try (Exists k_2); repeat rewrite sizeof_float in *; entailer!]]. Qed.
End AdaptedNeonTactics.
