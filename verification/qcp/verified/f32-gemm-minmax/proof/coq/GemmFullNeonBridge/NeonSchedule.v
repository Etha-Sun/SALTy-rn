From Coq Require Import ZArith List.
From GemmSpec Require Import FmaModel IntrinsicModel.
From GemmNeon Require Import KernelModel.
From GemmKernelBridge Require Import ScheduleBridge.
From GemmFullBridge Require Import OutputBridge.
From FullDomainNeon Require Import FullNeonModel.
Import ListNotations.
Local Open Scope Z_scope.

Lemma scalar_schedule_append : forall xs ys acc,
 scalar_schedule acc (xs++ys)=scalar_schedule (scalar_schedule acc xs) ys.
Proof.
 induction xs as [|[a b] xs IH]; intros ys acc; cbn; [reflexivity|apply IH].
Qed.

Lemma fulln_recursive_schedule : forall n k row col a w,
 fulln_acc_nat n k row col a w =
 scalar_schedule (gget (bias_index k col) w)
  (map (fun t => (gget (row*k+Z.of_nat t) a,
                  gget (weight_index k col (Z.of_nat t)) w)) (seq 0 n)).
Proof.
 induction n as [|n IH]; intros; [reflexivity|].
 rewrite seq_S,map_app,scalar_schedule_append.
 cbn [fulln_acc_nat map scalar_schedule].
 now rewrite IH.
Qed.

Theorem fulln_acc_finishes_at_neon_cell : forall k row col a w lo hi,
 neon_clamp (fulln_acc k k row col a w) lo hi =
 neon_cell k row col a w lo hi.
Proof.
 intros; unfold fulln_acc,neon_cell,depth_operands.
 rewrite fulln_recursive_schedule,pair_schedule_matches_scalar; reflexivity.
Qed.

Print Assumptions scalar_schedule_append.
Print Assumptions fulln_recursive_schedule.
Print Assumptions fulln_acc_finishes_at_neon_cell.
