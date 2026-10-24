From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullState.
From FullDomainNeon Require Import NeonStoreState.
From FullDomainMemory Require Import InitialState ChunkState.
From FullNeonPhase Require Import NeonPhaseChecked.
From FullDomainRvvStore Require Import StoreValues.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma tail_geometry : forall nc,0<nc<8 ->
 0<=Z.land nc 4 /\ 0<=Z.land nc 2 /\
 (Z.land nc 4<>0 ->4<=nc) /\
 (Z.land nc 2<>0 ->Z.land nc 4+2<=nc) /\
 (Z.land nc 1<>0 ->Z.land nc 4+Z.land nc 2+1<=nc).
Proof.
 intros nc H. assert(Hc:nc=1\/nc=2\/nc=3\/nc=4\/nc=5\/nc=6\/nc=7)by lia.
 repeat match goal with Hc : _ \/ _ |- _ =>destruct Hc end;subst nc;vm_compute;intuition congruence.
Qed.
Lemma chunk_values1 : forall A W k row done lo hi,0<=done ->
 chunk_values A W k row done 1 lo hi =
 [full_cell A W k row done lo hi].
Proof. intros;rewrite chunk_values_shift by lia;cbv[Z.to_nat Pos.to_nat Pos.iter Pos.iter_op Nat.add seq map Z.of_nat Pos.of_succ_nat];rewrite ?Z.add_0_r;reflexivity. Qed.
Lemma chunk_values2 : forall A W k row done lo hi,0<=done ->
 chunk_values A W k row done 2 lo hi =
 [full_cell A W k row done lo hi;full_cell A W k row(done+1)lo hi].
Proof. intros;rewrite chunk_values_shift by lia;cbv[Z.to_nat Pos.to_nat Pos.iter Pos.iter_op Nat.add seq map Z.of_nat Pos.of_succ_nat];rewrite ?Z.add_0_r;reflexivity. Qed.
Lemma chunk_values4 : forall A W k row done lo hi,0<=done ->
 chunk_values A W k row done 4 lo hi =
 [full_cell A W k row done lo hi;full_cell A W k row(done+1)lo hi;
 full_cell A W k row(done+2)lo hi;full_cell A W k row(done+3)lo hi].
Proof. intros;rewrite chunk_values_shift by lia;cbv[Z.to_nat Pos.to_nat Pos.iter Pos.iter_op Nat.add seq map Z.of_nat Pos.of_succ_nat];rewrite ?Z.add_0_r;reflexivity. Qed.
Lemma chunk_values8 : forall A W k row done lo hi,0<=done ->
 chunk_values A W k row done 8 lo hi =
 [full_cell A W k row done lo hi;full_cell A W k row(done+1)lo hi;
 full_cell A W k row(done+2)lo hi;full_cell A W k row(done+3)lo hi;
 full_cell A W k row(done+4)lo hi;full_cell A W k row(done+5)lo hi;
 full_cell A W k row(done+6)lo hi;full_cell A W k row(done+7)lo hi].
Proof. intros;rewrite chunk_values_shift by lia;cbv[Z.to_nat Pos.to_nat Pos.iter Pos.iter_op Nat.add seq map Z.of_nat Pos.of_succ_nat];rewrite ?Z.add_0_r;reflexivity. Qed.
Print Assumptions tail_geometry.
Print Assumptions chunk_values1.
Print Assumptions chunk_values2.
Print Assumptions chunk_values4.
Print Assumptions chunk_values8.
