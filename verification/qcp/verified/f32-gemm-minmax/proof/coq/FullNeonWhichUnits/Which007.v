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
Lemma proof_of_test_neon_which_implies_wit_7 : test_neon_which_implies_wit_7.
Proof. unfold test_neon_which_implies_wit_7;right;intros;subst c2.
eapply derivable1_trans;[|apply(neon_phase_finish_2 c_pre mr_pre nc_pre (kc_pre÷4) (nc_pre-nc) 0 8 A W lo hi);lia].
rewrite chunk_values8 by lia.
replace (c_pre+((row_alias mr_pre 2*nc_pre+(nc_pre-nc)+0+4)*sizeof(FLOAT))) with((c_pre+((row_alias mr_pre 2*nc_pre+(nc_pre-nc))+0)*sizeof(FLOAT))+4*sizeof(FLOAT)) by ring.
pose proof(FloatArray.full_merge_to_full (c_pre+((row_alias mr_pre 2*nc_pre+(nc_pre-nc))+0)*sizeof(FLOAT)) 4 8 [full_cell A W (kc_pre÷4) (row_alias mr_pre 2) ((nc_pre-nc)+(0+0)) lo hi;full_cell A W (kc_pre÷4) (row_alias mr_pre 2) ((nc_pre-nc)+(0+1)) lo hi;full_cell A W (kc_pre÷4) (row_alias mr_pre 2) ((nc_pre-nc)+(0+2)) lo hi;full_cell A W (kc_pre÷4) (row_alias mr_pre 2) ((nc_pre-nc)+(0+3)) lo hi] [full_cell A W (kc_pre÷4) (row_alias mr_pre 2) ((nc_pre-nc)+(4+0)) lo hi;full_cell A W (kc_pre÷4) (row_alias mr_pre 2) ((nc_pre-nc)+(4+1)) lo hi;full_cell A W (kc_pre÷4) (row_alias mr_pre 2) ((nc_pre-nc)+(4+2)) lo hi;full_cell A W (kc_pre÷4) (row_alias mr_pre 2) ((nc_pre-nc)+(4+3)) lo hi] ltac:(lia))as HM;replace(8-4)with 4 in HM by reflexivity;sepcon_assoc_change;sep_apply HM.
rewrite ?Z.add_0_r;repeat rewrite Z.add_assoc;entailer!;match goal with |- FloatArray.full ?p ?n ?xs |-- FloatArray.full ?q ?m ?ys =>replace p with q by ring;replace n with m by lia;let Heq:=fresh in assert(Heq:xs=ys)by(cbn[List.app];repeat first[reflexivity|match goal with |- @eq Z _ _ =>ring end|f_equal]);rewrite Heq;apply derivable1_refl end.
Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_7.
