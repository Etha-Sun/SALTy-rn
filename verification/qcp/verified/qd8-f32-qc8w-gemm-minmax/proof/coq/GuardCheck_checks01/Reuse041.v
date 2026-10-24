From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8Guard Require Import neon_guard_goal.
Require Import Qd8CheckedSubset.SubsetChecked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_partial_solve_wit_167_pure : neon_guard_goal.test_neon_partial_solve_wit_167_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_111_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_111_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_167_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_171_pure : neon_guard_goal.test_neon_partial_solve_wit_171_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_115_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_115_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_171_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_175_pure : neon_guard_goal.test_neon_partial_solve_wit_175_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_115_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_115_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_175_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_179_pure : neon_guard_goal.test_neon_partial_solve_wit_179_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_119_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_119_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_179_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_partial_solve_wit_183_pure : neon_guard_goal.test_neon_partial_solve_wit_183_pure.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_partial_solve_wit_119_pure) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_partial_solve_wit_119_pure in Hprior.
  unfold neon_guard_goal.test_neon_partial_solve_wit_183_pure.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
End Checked.
