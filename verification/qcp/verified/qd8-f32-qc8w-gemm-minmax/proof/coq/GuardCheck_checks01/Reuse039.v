From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8Guard Require Import neon_guard_goal.
Require Import Qd8CheckedSubset.SubsetChecked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_neon_safety_wit_32 : neon_guard_goal.test_neon_safety_wit_32.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_31) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_31 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_32.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_33 : neon_guard_goal.test_neon_safety_wit_33.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_32) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_32 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_33.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_34 : neon_guard_goal.test_neon_safety_wit_34.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_32) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_32 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_34.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_35 : neon_guard_goal.test_neon_safety_wit_35.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_33) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_33 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_35.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_36 : neon_guard_goal.test_neon_safety_wit_36.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_33) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_33 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_36.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_37 : neon_guard_goal.test_neon_safety_wit_37.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_34) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_34 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_37.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_38 : neon_guard_goal.test_neon_safety_wit_38.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_34) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_34 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_38.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_39 : neon_guard_goal.test_neon_safety_wit_39.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_35) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_35 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_39.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_40 : neon_guard_goal.test_neon_safety_wit_40.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_35) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_35 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_40.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_41 : neon_guard_goal.test_neon_safety_wit_41.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_36) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_36 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_41.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_42 : neon_guard_goal.test_neon_safety_wit_42.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_36) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_36 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_42.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_43 : neon_guard_goal.test_neon_safety_wit_43.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_37) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_37 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_43.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_44 : neon_guard_goal.test_neon_safety_wit_44.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_37) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_37 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_44.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_45 : neon_guard_goal.test_neon_safety_wit_45.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_38) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_38 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_45.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_46 : neon_guard_goal.test_neon_safety_wit_46.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_38) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_38 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_46.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_47 : neon_guard_goal.test_neon_safety_wit_47.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_39) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_39 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_47.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_48 : neon_guard_goal.test_neon_safety_wit_48.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_39) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_39 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_48.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_49 : neon_guard_goal.test_neon_safety_wit_49.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_40) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_40 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_49.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_50 : neon_guard_goal.test_neon_safety_wit_50.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_40) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_40 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_50.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_51 : neon_guard_goal.test_neon_safety_wit_51.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_41) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_41 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_51.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_52 : neon_guard_goal.test_neon_safety_wit_52.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_41) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_41 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_52.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_53 : neon_guard_goal.test_neon_safety_wit_53.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_42) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_42 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_53.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_54 : neon_guard_goal.test_neon_safety_wit_54.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_42) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_42 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_54.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_55 : neon_guard_goal.test_neon_safety_wit_55.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_43) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_43 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_55.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_56 : neon_guard_goal.test_neon_safety_wit_56.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_43) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_43 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_56.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_57 : neon_guard_goal.test_neon_safety_wit_57.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_44) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_44 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_57.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_58 : neon_guard_goal.test_neon_safety_wit_58.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_44) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_44 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_58.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_59 : neon_guard_goal.test_neon_safety_wit_59.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_45) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_45 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_59.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_60 : neon_guard_goal.test_neon_safety_wit_60.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_45) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_45 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_60.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_61 : neon_guard_goal.test_neon_safety_wit_61.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_46) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_46 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_61.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_62 : neon_guard_goal.test_neon_safety_wit_62.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_46) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_46 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_62.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
Lemma proof_of_test_neon_safety_wit_63 : neon_guard_goal.test_neon_safety_wit_63.
Proof.
  pose proof (Qd8CheckedSubset.SubsetChecked.Checked.proof_of_test_neon_safety_wit_47) as Hprior.
  unfold Qd8API.neon_full_goal.test_neon_safety_wit_47 in Hprior.
  unfold neon_guard_goal.test_neon_safety_wit_63.
  first [exact Hprior | intros; eapply Hprior; eassumption |
    destruct Hprior as [Hprior|Hprior];[left|right];intros;eapply Hprior;eassumption].
Qed.
End Checked.
