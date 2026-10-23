From Coq Require Import ZArith Lia List.
From QcpRvv32 Require Export RvvLogic.
Import ListNotations.
Open Scope Z_scope.
Definition rvv_pack32 (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (x16:fp32) (x17:fp32) (x18:fp32) (x19:fp32) (x20:fp32) (x21:fp32) (x22:fp32) (x23:fp32) (x24:fp32) (x25:fp32) (x26:fp32) (x27:fp32) (x28:fp32) (x29:fp32) (x30:fp32) (x31:fp32) : list fp32 := [x0;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15;x16;x17;x18;x19;x20;x21;x22;x23;x24;x25;x26;x27;x28;x29;x30;x31].
Definition rvv_take (i:Z) (xs:list fp32) := firstn (Z.to_nat i) xs.
Definition rvv_get (i:Z) (xs:list fp32) := Znth i xs fp32_zero.
Definition rvv_snoc (xs:list fp32) (x:fp32) := xs ++ [x].
Definition rvv_length (xs:list fp32) := Zlength xs.
Lemma take_step : forall (xs:list fp32) i,
  0 <= i < Zlength xs -> rvv_snoc (rvv_take i xs) (rvv_get i xs) = rvv_take (i+1) xs.
Proof.
  assert (Hnth : forall (n:nat) (l:list fp32), (n < length l)%nat ->
     firstn n l ++ [nth n l fp32_zero] = firstn (S n) l).
  { induction n; destruct l; simpl; intros; try lia; try reflexivity.
    f_equal. apply IHn. lia. }
  intros xs i Hi. unfold rvv_snoc, rvv_take, rvv_get, Znth.
  replace (Z.to_nat (i+1)) with (S (Z.to_nat i)) by lia.
  apply Hnth. rewrite Zlength_correct in Hi. lia.
Qed.
Print Assumptions take_step.
