From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Export SeparationLogic ArrayLib.
From GemmSpec Require Export FmaModel IntrinsicModel.
From SpmmSpec Require Export Packing FmaSwap.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.

Fixpoint prefix_sum_nat (count:nat) (xs:list Z) : Z :=
 match count,xs with S n,x::rest => x+prefix_sum_nat n rest | _,_ => 0 end.
Definition prefix_sum (xs:list Z) (count:Z) := prefix_sum_nat (Z.to_nat count) xs.
Definition fp_at (xs:list fp32) (i:Z) := nth (Z.to_nat i) xs fp32_zero.
Definition z_at (xs:list Z) (i:Z) := nth (Z.to_nat i) xs 0.
Definition nnz_before (nnz:list Z) (column:Z) := prefix_sum nnz column.
Definition bias_index (nnz:list Z) (column:Z) := column+nnz_before nnz column.
Definition input_index (deltas:list Z) (start row cursor:Z) :=
 start + prefix_sum deltas cursor/4 + row.

Fixpoint spmm_acc_nat (depth:nat) (column row start:Z)
 (nnz deltas:list Z) (input weights:list fp32) : fp32 :=
 match depth with
 | O => fp_at weights (bias_index nnz column)
 | S k => fma_rne
     (fp_at input (input_index deltas start row (nnz_before nnz column+Z.of_nat k)))
     (fp_at weights (bias_index nnz column+1+Z.of_nat k))
     (spmm_acc_nat k column row start nnz deltas input weights)
 end.
Definition spmm_acc (depth column row start:Z) nnz deltas input weights :=
 spmm_acc_nat (Z.to_nat depth) column row start nnz deltas input weights.
Definition spmm_cell column row start nnz deltas input weights lo hi :=
 neon_clamp (spmm_acc (z_at nnz column) column row start nnz deltas input weights) lo hi.
Definition spmm_column_prefix count column start nnz deltas input weights lo hi :=
 map (fun row => spmm_cell column (Z.of_nat row) start nnz deltas input weights lo hi)
     (seq 0 (Z.to_nat count)).

(** Geometry and capacities only: no input condition assumes output equality.
    Cyclic byte increments are the declared packing convention. *)
Definition spmm_shape (rows columns start:Z) (nnz deltas:list Z)
 (input weights:list fp32) : Prop :=
 0<rows /\ 0<columns /\ Zlength nnz=columns /\
 Forall (fun n => 0<=n<=4294967295) nnz /\
 Zlength deltas=delta_sum nnz /\
 Forall (fun d => -2147483648<=d<=2147483647 /\ d mod 4=0) deltas /\
 delta_sum deltas=0 /\
 Zlength weights=columns+delta_sum nnz /\
 (forall cursor,0<=cursor<=Zlength deltas ->
   0<=start+prefix_sum deltas cursor/4 /\
   start+prefix_sum deltas cursor/4+rows<=Zlength input).
Definition spmm_capacity (rows columns stride a w d n out:Z)
 (nnz deltas:list Z) (input weights:list fp32) : Prop :=
 0<4*rows<modulus64 /\ 0<columns<modulus64 /\
 4*rows<=stride<modulus64 /\ stride mod 4=0 /\
 0<a /\ a mod 4=0 /\ a+4*(Zlength input+16)<modulus64 /\
 0<w /\ w mod 4=0 /\ w+4*(Zlength weights+32)<modulus64 /\
 0<d /\ d mod 4=0 /\ d+4*Zlength deltas<modulus64 /\
 0<n /\ n mod 4=0 /\ n+4*Zlength nnz<modulus64 /\
 0<out /\ out mod 4=0 /\ out+stride*(columns-1)+4*rows<modulus64.

Lemma prefix_sum_nat_step : forall k xs,
 (k<length xs)%nat -> prefix_sum_nat (S k) xs=prefix_sum_nat k xs+nth k xs 0.
Proof.
 induction k;intros [|x xs] H;cbn in *;try lia.
 rewrite IHk by lia;lia.
Qed.
Lemma prefix_sum_step : forall xs k,
 0<=k<Zlength xs -> prefix_sum xs (k+1)=prefix_sum xs k+z_at xs k.
Proof.
 intros;unfold prefix_sum,z_at;rewrite Z2Nat.inj_add by lia.
 replace (Z.to_nat 1) with 1%nat by reflexivity;rewrite Nat.add_1_r.
 apply prefix_sum_nat_step;rewrite Zlength_correct in H;lia.
Qed.
Lemma prefix_sum_nat_all : forall xs, prefix_sum_nat (length xs) xs=delta_sum xs.
Proof. induction xs;cbn;[reflexivity|now rewrite IHxs]. Qed.
Lemma prefix_sum_all : forall xs, prefix_sum xs (Zlength xs)=delta_sum xs.
Proof. intros;unfold prefix_sum;rewrite Zlength_correct,Nat2Z.id;apply prefix_sum_nat_all. Qed.
Lemma cyclic_input_end : forall deltas start row,
 delta_sum deltas=0 -> input_index deltas start row (Zlength deltas)=start+row.
Proof. intros;unfold input_index;rewrite prefix_sum_all,H;cbn;lia. Qed.
Lemma spmm_acc_zero : forall column row start nnz deltas input weights,
 spmm_acc 0 column row start nnz deltas input weights=fp_at weights(bias_index nnz column).
Proof. reflexivity. Qed.
Lemma spmm_acc_step : forall depth column row start nnz deltas input weights,
 0<=depth ->
 spmm_acc (depth+1) column row start nnz deltas input weights =
 fma_rne (fp_at input(input_index deltas start row(nnz_before nnz column+depth)))
         (fp_at weights(bias_index nnz column+1+depth))
         (spmm_acc depth column row start nnz deltas input weights).
Proof.
 intros;unfold spmm_acc;rewrite Z2Nat.inj_add by lia.
 replace (Z.to_nat 1) with 1%nat by reflexivity;rewrite Nat.add_1_r.
 cbn [spmm_acc_nat];now rewrite Z2Nat.id by lia.
Qed.
Lemma spmm_rvv_acc_step : forall depth column row start nnz deltas input weights,
 0<=depth ->
 spmm_acc (depth+1) column row start nnz deltas input weights =
 fma_rne (fp_at weights(bias_index nnz column+1+depth))
         (fp_at input(input_index deltas start row(nnz_before nnz column+depth)))
         (spmm_acc depth column row start nnz deltas input weights).
Proof. intros;rewrite spmm_acc_step by assumption;apply fma_multiplicands_swap. Qed.
Lemma next_bias_index : forall nnz column,
 0<=column<Zlength nnz ->
 bias_index nnz(column+1)=bias_index nnz column+1+z_at nnz column.
Proof. intros;unfold bias_index,nnz_before;rewrite prefix_sum_step by assumption;lia. Qed.

Print Assumptions prefix_sum_nat_step.
Print Assumptions prefix_sum_step.
Print Assumptions prefix_sum_all.
Print Assumptions cyclic_input_end.
Print Assumptions spmm_acc_zero.
Print Assumptions spmm_acc_step.
Print Assumptions spmm_rvv_acc_step.
Print Assumptions next_bias_index.
