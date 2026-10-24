From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8Guard Require Import neon_guard_goal.
Require Import Qd8CheckedSubset.SubsetChecked.
Require Import Qd8Resume_loop02.KernelLoop.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_safety_wit_64 : neon_guard_goal.test_neon_safety_wit_64.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_47) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_47 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_64.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_65 : neon_guard_goal.test_neon_safety_wit_65.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_48) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_48 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_65.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_66 : neon_guard_goal.test_neon_safety_wit_66.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_48) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_48 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_66.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_entail_wit_2_1 : neon_guard_goal.test_neon_entail_wit_2_1.
Proof.
  pose proof (Qd8Resume_loop02.KernelLoop.Checked.proof_of_test_neon_entail_wit_2) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_entail_wit_2 in Hprior.
  unfold neon_guard_goal.test_neon_entail_wit_2_1.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_entail_wit_2_2 : neon_guard_goal.test_neon_entail_wit_2_2.
Proof.
  pose proof (Qd8Resume_loop02.KernelLoop.Checked.proof_of_test_neon_entail_wit_2) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_entail_wit_2 in Hprior.
  unfold neon_guard_goal.test_neon_entail_wit_2_2.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_59_pure : neon_guard_goal.test_neon_partial_solve_wit_59_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_59_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_59_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_59_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_63_pure : neon_guard_goal.test_neon_partial_solve_wit_63_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_59_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_59_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_63_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_67_pure : neon_guard_goal.test_neon_partial_solve_wit_67_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_63_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_63_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_67_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_71_pure : neon_guard_goal.test_neon_partial_solve_wit_71_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_63_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_63_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_71_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_75_pure : neon_guard_goal.test_neon_partial_solve_wit_75_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_67_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_67_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_75_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_79_pure : neon_guard_goal.test_neon_partial_solve_wit_79_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_67_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_67_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_79_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_83_pure : neon_guard_goal.test_neon_partial_solve_wit_83_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_71_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_71_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_83_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_87_pure : neon_guard_goal.test_neon_partial_solve_wit_87_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_71_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_71_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_87_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_91_pure : neon_guard_goal.test_neon_partial_solve_wit_91_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_75_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_75_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_91_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_95_pure : neon_guard_goal.test_neon_partial_solve_wit_95_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_75_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_75_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_95_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_99_pure : neon_guard_goal.test_neon_partial_solve_wit_99_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_79_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_79_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_99_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_103_pure : neon_guard_goal.test_neon_partial_solve_wit_103_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_79_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_79_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_103_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_107_pure : neon_guard_goal.test_neon_partial_solve_wit_107_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_83_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_83_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_107_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_111_pure : neon_guard_goal.test_neon_partial_solve_wit_111_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_83_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_83_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_111_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_115_pure : neon_guard_goal.test_neon_partial_solve_wit_115_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_87_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_87_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_115_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_119_pure : neon_guard_goal.test_neon_partial_solve_wit_119_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_87_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_87_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_119_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_123_pure : neon_guard_goal.test_neon_partial_solve_wit_123_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_91_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_91_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_123_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_127_pure : neon_guard_goal.test_neon_partial_solve_wit_127_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_91_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_91_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_127_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_131_pure : neon_guard_goal.test_neon_partial_solve_wit_131_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_95_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_95_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_131_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_135_pure : neon_guard_goal.test_neon_partial_solve_wit_135_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_95_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_95_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_135_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_139_pure : neon_guard_goal.test_neon_partial_solve_wit_139_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_99_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_99_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_139_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_143_pure : neon_guard_goal.test_neon_partial_solve_wit_143_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_99_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_99_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_143_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_147_pure : neon_guard_goal.test_neon_partial_solve_wit_147_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_103_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_103_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_147_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_151_pure : neon_guard_goal.test_neon_partial_solve_wit_151_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_103_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_103_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_151_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_155_pure : neon_guard_goal.test_neon_partial_solve_wit_155_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_107_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_107_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_155_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_159_pure : neon_guard_goal.test_neon_partial_solve_wit_159_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_107_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_107_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_159_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_163_pure : neon_guard_goal.test_neon_partial_solve_wit_163_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_111_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_111_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_163_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
End Checked.
