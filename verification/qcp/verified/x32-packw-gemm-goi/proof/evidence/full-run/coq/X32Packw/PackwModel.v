From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Module PackwArray := UIntArray.
Open Scope Z_scope.
Fixpoint pw_copy_nat (n:nat) (A OLD:list Z) : list Z :=
 match n with O=>OLD | S k=>replace_Znth (Z.of_nat k) (Znth (Z.of_nat k) A 0) (pw_copy_nat k A OLD) end.
Definition pw_copy_prefix (n:Z) := pw_copy_nat (Z.to_nat n).
Fixpoint pw_pair_nat (n:nat) (A B OLD:list Z) : list Z :=
 match n with O=>OLD | S k=>replace_Znth (2*Z.of_nat k+1) (Znth (Z.of_nat k) B 0)
 (replace_Znth (2*Z.of_nat k) (Znth (Z.of_nat k) A 0) (pw_pair_nat k A B OLD)) end.
Definition pw_pair_prefix (n:Z) := pw_pair_nat (Z.to_nat n).
Fixpoint pw_stride_nat (n:nat) (A OLD:list Z) : list Z :=
 match n with O=>OLD | S k=>replace_Znth (2*Z.of_nat k) (Znth (Z.of_nat k) A 0) (pw_stride_nat k A OLD) end.
Definition pw_stride_prefix (n:Z) := pw_stride_nat (Z.to_nat n).
Lemma pw_copy_zero : forall A OLD, pw_copy_prefix 0 A OLD=OLD.
Proof. reflexivity. Qed.
Lemma pw_pair_zero : forall A B OLD, pw_pair_prefix 0 A B OLD=OLD.
Proof. reflexivity. Qed.
Lemma pw_stride_zero : forall A OLD, pw_stride_prefix 0 A OLD=OLD.
Proof. reflexivity. Qed.
Lemma pw_copy_step : forall i A OLD, 0<=i -> pw_copy_prefix (i+1) A OLD=
 replace_Znth i (Znth i A 0) (pw_copy_prefix i A OLD).
Proof. intros;unfold pw_copy_prefix;rewrite Z2Nat.inj_add by lia;simpl;rewrite Nat.add_1_r;cbn;rewrite Z2Nat.id by lia;reflexivity. Qed.
Lemma pw_pair_step : forall i A B OLD, 0<=i -> pw_pair_prefix (i+1) A B OLD=
 replace_Znth (2*i+1) (Znth i B 0) (replace_Znth (2*i) (Znth i A 0) (pw_pair_prefix i A B OLD)).
Proof. intros;unfold pw_pair_prefix;rewrite Z2Nat.inj_add by lia;simpl;rewrite Nat.add_1_r;cbn;rewrite Z2Nat.id by lia;reflexivity. Qed.
Lemma pw_stride_step : forall i A OLD, 0<=i -> pw_stride_prefix (i+1) A OLD=
 replace_Znth (2*i) (Znth i A 0) (pw_stride_prefix i A OLD).
Proof. intros;unfold pw_stride_prefix;rewrite Z2Nat.inj_add by lia;simpl;rewrite Nat.add_1_r;cbn;rewrite Z2Nat.id by lia;reflexivity. Qed.

(* A historical reference schedule only; NOT the contract of original vsetvl. *)
Definition pw_reference_vl (n:Z) : Z := Z.min n 16.

Print Assumptions pw_copy_zero.

Print Assumptions pw_pair_zero.

Print Assumptions pw_stride_zero.

Print Assumptions pw_copy_step.

Print Assumptions pw_pair_step.

Print Assumptions pw_stride_step.
