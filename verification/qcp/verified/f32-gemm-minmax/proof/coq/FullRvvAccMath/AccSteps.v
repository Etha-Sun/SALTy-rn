From Coq Require Import ZArith List Lia.
From FullDomainRvv Require Import FullState ActiveVector RowValues.
Import ListNotations.
Local Open Scope Z_scope.

Lemma full_acc_zero : forall A W k row b lane,
  full_acc A W k row b lane 0 = rvv_at W (panel_wbase k b + lane).
Proof. intros; unfold full_acc; reflexivity. Qed.

Lemma full_acc_step : forall A W k row b lane d, 0 <= d ->
  full_acc A W k row b lane (d+1) =
  fma_rne (rvv_at A (row*k+d))
          (rvv_at W (panel_wbase k b+8*(d+1)+lane))
          (full_acc A W k row b lane d).
Proof.
  intros A W k row b lane d Hd; unfold full_acc.
  rewrite Z2Nat.inj_add by lia.
  replace (Z.to_nat 1) with 1%nat by reflexivity.
  rewrite Nat.add_1_r, seq_S, fold_left_app; cbn [fold_left].
  rewrite Nat.add_0_l, Z2Nat.id by lia; reflexivity.
Qed.

Lemma bit_same_eq : forall x y : fp32, bit_same x y -> x = y.
Proof. intros x y H; exact H. Qed.

Print Assumptions full_acc_zero.
Print Assumptions full_acc_step.
Print Assumptions bit_same_eq.
