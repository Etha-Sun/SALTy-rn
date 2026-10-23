From Coq Require Import List ZArith.
From Flocq Require Import IEEE754.Binary.
From NanBridge Require Import BridgeLogic.
From QcpVadd Require Import VaddBits.

Lemma same_value_reflexive : forall x, same_value x x.
Proof.
  intros x. destruct x as [s | s | s payload | s m e Hvalid].
  - left. destruct s; reflexivity.
  - left. destruct s; reflexivity.
  - right. split; reflexivity.
  - left. destruct s; unfold fp32_eq, fp32_compare, Binary.Bcompare, BinarySingleNaN.Bcompare; simpl;
      rewrite Z.compare_refl, Pos.compare_cont_refl; reflexivity.
Qed.

Lemma identical_outputs_are_related : forall (xs : list fp32),
  Forall2 same_value xs xs.
Proof.
  induction xs; constructor; auto using same_value_reflexive.
Qed.

Lemma shared_vadd_model_implies_related : forall n a b left right,
  left = vadd_values n a b -> right = vadd_values n a b ->
  Forall2 same_value left right.
Proof. intros; subst; apply identical_outputs_are_related. Qed.

Print Assumptions same_value_reflexive.
Print Assumptions identical_outputs_are_related.
Print Assumptions shared_vadd_model_implies_related.
