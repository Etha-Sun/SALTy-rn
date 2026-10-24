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
Lemma proof_of_test_neon_which_implies_wit_4 : test_neon_which_implies_wit_4.
Proof. unfold test_neon_which_implies_wit_4;right;intros;subst c1.
eapply derivable1_trans;[apply(neon_phase_prepare_1 c_pre mr_pre nc_pre (kc_pre÷4) (nc_pre-nc) 0 8 A W lo hi);lia|].
sep_apply(FloatArray.undef_full_split_to_undef_full (c_pre+(row_alias mr_pre 1*nc_pre+(nc_pre-nc+0))*sizeof(FLOAT)) 4 8 ltac:(lia)).
rewrite ?Z.add_0_r;entailer!;match goal with |- FloatArray.undef_full ?p ?n |-- FloatArray.undef_full ?q ?m =>replace p with q by ring;replace n with m by lia;apply derivable1_refl end.
Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_4.
