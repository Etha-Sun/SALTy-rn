From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullState.
From FullDomainNeon Require Import NeonStoreState.
From FullDomainMemory Require Import InitialState ChunkState.
From FullNeonPhase Require Import NeonPhaseChecked.
From FullNeonWhich Require Import WhichSupport.
From FullDomainNeonVC Require Import neon_full_goal.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_which_implies_wit_27 : test_neon_which_implies_wit_27.
Proof. unfold test_neon_which_implies_wit_27;right;intros;subst c3.
pose proof(tail_geometry nc ltac:(lia)) as Htail;decompose [and] Htail.
eapply derivable1_trans;[|apply(neon_phase_finish_3 c_pre mr_pre nc_pre (kc_pre÷4) (nc_pre-nc) (Z.land nc 4) 2 A W lo hi);lia].
rewrite chunk_values2 by lia.
rewrite ?Z.add_0_r;repeat rewrite Z.add_assoc;entailer!;match goal with |- FloatArray.full ?p ?n ?xs |-- FloatArray.full ?q ?m ?ys =>replace p with q by ring;replace n with m by lia;let Heq:=fresh in assert(Heq:xs=ys)by(cbn[List.app];repeat first[reflexivity|match goal with |- @eq Z _ _ =>ring end|f_equal]);rewrite Heq;apply derivable1_refl end.
Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_27.
