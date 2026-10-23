From Coq Require Import ZArith List.
From GemmSpec Require Import FmaModel IntrinsicModel.
From GemmNeon Require Import KernelModel.
From GemmKernelBridge Require Import ScheduleBridge.
From GemmFullBridge Require Import OutputBridge.
From FullDomainRvv Require Import FullState.
Import ListNotations.
Local Open Scope Z_scope.

Lemma global_bias_is_panel_bias : forall k col,
 bias_index k col=panel_wbase k (col/8)+col mod 8.
Proof. intros; unfold bias_index,panel_wbase; ring. Qed.
Lemma global_weight_is_panel_weight : forall k col d,
 weight_index k col d=panel_wbase k (col/8)+8*(d+1)+col mod 8.
Proof. intros; unfold weight_index; rewrite global_bias_is_panel_bias; ring. Qed.

Lemma scalar_schedule_is_panel_fold : forall xs k row col a w acc,
 scalar_schedule acc
  (map (fun t => (gget (row*k+Z.of_nat t) a,
                  gget (weight_index k col (Z.of_nat t)) w)) xs) =
 fold_left (fun value t => fma_rne (gget (row*k+Z.of_nat t) a)
  (gget (panel_wbase k (col/8)+8*(Z.of_nat t+1)+col mod 8) w) value) xs acc.
Proof.
 induction xs as [|t rest IH]; intros; [reflexivity|].
 cbn [map scalar_schedule fold_left].
 rewrite global_weight_is_panel_weight; apply IH.
Qed.

Theorem full_cell_is_neon_cell : forall k row col a w lo hi,
 full_cell a w k row col lo hi=neon_cell k row col a w lo hi.
Proof.
 intros; unfold full_cell,full_acc,neon_cell,depth_operands.
 rewrite pair_schedule_matches_scalar,scalar_schedule_is_panel_fold,
         global_bias_is_panel_bias; reflexivity.
Qed.

Print Assumptions global_bias_is_panel_bias.
Print Assumptions global_weight_is_panel_weight.
Print Assumptions scalar_schedule_is_panel_fold.
Print Assumptions full_cell_is_neon_cell.
