From Coq Require Import ZArith List Lia Bool.
From GemmSpec Require Import FmaModel IntrinsicModel.
From GemmNeon Require Import KernelModel.
From GemmKernelBridge Require Import ScheduleBridge.
From GemmFullBridge Require Import OutputBridge.
From FullDomainRvv Require Import FullModel.
Import ListNotations.
Local Open Scope Z_scope.
(* Entire matrix and every packed panel; d is the processed scalar K prefix. *)
Fixpoint fulln_acc_nat (d:nat)(k row col:Z)(a w:list fp32):fp32 :=
 match d with
 | O => gget (bias_index k col) w
 | S t => fma_rne (gget (row*k+Z.of_nat t) a)
    (gget (weight_index k col (Z.of_nat t)) w)
    (fulln_acc_nat t k row col a w)
 end.
Definition fulln_acc (d k row col:Z)(a w:list fp32):fp32 :=
 fulln_acc_nat (Z.to_nat d) k row col a w.
Definition fulln_prefix (mr nc k done:Z)(a w:list fp32)(lo hi:fp32)(old:list fp32):list fp32 :=
 map (fun q => let i:=Z.of_nat q in
  if andb (Z.ltb (i/nc) mr) (Z.ltb (i mod nc) done)
  then neon_cell k (i/nc) (i mod nc) a w lo hi
  else gget i old) (seq 0 (length old)).
Definition fulln_result (mr nc k:Z)(a w:list fp32)(lo hi:fp32)(old:list fp32):list fp32 :=
 neon_matrix mr nc k a w lo hi ++ skipn (Z.to_nat (mr*nc)) old.
(* The same outer-loop conditional pointer invariant as one pure predicate,
   to avoid frontend assertion-list expansion of a disjunction. Addresses here
   are bytes; typed C pointer arithmetic in annotations uses float-cell units. *)
Definition fulln_outer_ptrs (remaining mr nc k a c a0 a1 a2 a3 c0 c1 c2 c3:Z):Prop :=
 remaining=0 \/
 (Z.rem (nc-remaining) 8=0 /\
  a0=a+4*(row_alias mr 0*k) /\ a1=a+4*(row_alias mr 1*k) /\
  a2=a+4*(row_alias mr 2*k) /\ a3=a+4*(row_alias mr 3*k) /\
  c0=c+4*(row_alias mr 0*nc+(nc-remaining)) /\
  c1=c+4*(row_alias mr 1*nc+(nc-remaining)) /\
  c2=c+4*(row_alias mr 2*nc+(nc-remaining)) /\
  c3=c+4*(row_alias mr 3*nc+(nc-remaining))).
Lemma fulln_acc_zero : forall k row col a w,
 fulln_acc 0 k row col a w = gget (bias_index k col) w.
Proof. reflexivity. Qed.
Lemma fulln_acc_step : forall d k row col a w, 0<=d ->
 fulln_acc (d+1) k row col a w =
 fma_rne (gget (row*k+d) a) (gget (weight_index k col d) w)
 (fulln_acc d k row col a w).
Proof.
 intros;unfold fulln_acc;rewrite Z2Nat.inj_add by lia.
 replace (Z.to_nat 1)with 1%nat by reflexivity;rewrite Nat.add_1_r.
 cbn[fulln_acc_nat];rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma fulln_prefix_length : forall mr nc k done a w lo hi old,
 length(fulln_prefix mr nc k done a w lo hi old)=length old.
Proof. intros;unfold fulln_prefix;now rewrite length_map,length_seq. Qed.
Lemma fulln_result_length : forall mr nc k a w lo hi old,
 (Z.to_nat(mr*nc)<=length old)%nat ->
 length(fulln_result mr nc k a w lo hi old)=length old.
Proof.
 intros;unfold fulln_result;rewrite length_app,matrix_output_length,skipn_length;lia.
Qed.
Print Assumptions fulln_acc_step.
Print Assumptions fulln_prefix_length.
Print Assumptions fulln_result_length.
