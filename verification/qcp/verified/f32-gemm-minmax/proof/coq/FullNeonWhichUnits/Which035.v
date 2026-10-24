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
Lemma proof_of_test_neon_which_implies_wit_35 : test_neon_which_implies_wit_35.
Proof. unfold test_neon_which_implies_wit_35;right;intros;subst c3.
pose proof(tail_geometry nc ltac:(lia)) as Htail;decompose [and] Htail.
eapply derivable1_trans;[apply(neon_phase_prepare_3 c_pre mr_pre nc_pre (kc_pre÷4) (nc_pre-nc) (Z.land nc 4+Z.land nc 2) 1 A W lo hi);lia|].
rewrite ?Z.add_0_r;entailer!;match goal with |- FloatArray.undef_full ?p ?n |-- FloatArray.undef_full ?q ?m =>replace p with q by ring;replace n with m by lia;apply derivable1_refl end.
Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_35.
