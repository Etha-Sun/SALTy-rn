From Coq Require Import ZArith List Lia.
From AUXLib Require Import ListLib.
From FullDomainRvv Require Import FullState ActiveVector RowValues.
From FullRvvAccMath Require Import AccSteps.
Import ListNotations.
Local Open Scope Z_scope.

Lemma rvv_at_sublist_full : forall W lo hi j,
  0 <= lo -> 0 <= j < hi-lo ->
  rvv_at (sublist lo hi W) j = rvv_at W (j+lo).
Proof.
  intros; unfold rvv_at.
  change (Znth j (sublist lo hi W) fp32_zero = Znth (j+lo) W fp32_zero).
  apply Znth_sublist; assumption.
Qed.

Lemma row_acc_from_bias : forall A W K row b vl z0 z1 z2 z3 z4 z5 z6 z7,
  0 <= panel_wbase K b -> 0 <= vl <= 8 ->
  active8 vl z0 z1 z2 z3 z4 z5 z6 z7
    (rvv_at (sublist (panel_wbase K b) (panel_wbase K b+vl) W) 0)
    (rvv_at (sublist (panel_wbase K b) (panel_wbase K b+vl) W) 1)
    (rvv_at (sublist (panel_wbase K b) (panel_wbase K b+vl) W) 2)
    (rvv_at (sublist (panel_wbase K b) (panel_wbase K b+vl) W) 3)
    (rvv_at (sublist (panel_wbase K b) (panel_wbase K b+vl) W) 4)
    (rvv_at (sublist (panel_wbase K b) (panel_wbase K b+vl) W) 5)
    (rvv_at (sublist (panel_wbase K b) (panel_wbase K b+vl) W) 6)
    (rvv_at (sublist (panel_wbase K b) (panel_wbase K b+vl) W) 7) ->
  row_acc_values A W K row b 0 vl z0 z1 z2 z3 z4 z5 z6 z7.
Proof.
  intros A W K row b vl z0 z1 z2 z3 z4 z5 z6 z7 Hb Hvl Hz.
  assert (At : forall j, 0 <= j < vl ->
    rvv_at (sublist (panel_wbase K b) (panel_wbase K b+vl) W) j =
    rvv_at W (panel_wbase K b+j)).
  { intros; rewrite rvv_at_sublist_full by lia; f_equal; lia. }
  unfold row_acc_values; repeat rewrite full_acc_zero.
  unfold active8 in *; destruct Hz as (H0&H1&H2&H3&H4&H5&H6&H7).
  unfold active_value in *; repeat split; intro Hj.
  all: match goal with
       | |- bit_same _ (rvv_at _ (_ + ?j)) =>
         rewrite <- (At j ltac:(lia)); auto
       end.
Qed.

Print Assumptions rvv_at_sublist_full.
Print Assumptions row_acc_from_bias.
