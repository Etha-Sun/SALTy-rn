From Coq Require Import ZArith.
From GemmSpec Require Import FmaModel IntrinsicModel.
From FullDomainNeon Require Import FullNeonModel.
From FullDomainRvv Require Import FullState.
From GemmFullNeonBridge Require Import NeonSchedule.
From GemmFullRvvBridge Require Import RvvSchedule.
Local Open Scope Z_scope.
Lemma clamped_acc_cell : forall A W k row col lo hi,
 fp32_neon_max(fp32_neon_min(fulln_acc k k row col A W)hi)lo =
 full_cell A W k row col lo hi.
Proof.
 intros;change(neon_clamp(fulln_acc k k row col A W)lo hi=full_cell A W k row col lo hi).
 rewrite fulln_acc_finishes_at_neon_cell,full_cell_is_neon_cell;reflexivity.
Qed.
Print Assumptions clamped_acc_cell.
