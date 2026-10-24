From Coq Require Import ZArith List Lia.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
From GemmRvv Require Import Model SLBounds ArrayFacts.
From FullDomainRvv Require Import FullState FullModel RowValues ActiveVector.
From FullDomainMemory Require Import InitialState ChunkState.
From FullDomainRvvStore Require Import StoreValues.
From FullRvvWhich Require Import WhichSupport.
From GemmFullRvvVC15 Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_which_implies_wit_24: test_rvv_which_implies_wit_24.
Proof. unfold test_rvv_which_implies_wit_24;left;intros;repeat rewrite Z.rem_mod_nonneg in * by lia;unfold rvv_len in *;subst w.
pose proof(current_panel nc_pre nc ltac:(lia) ltac:(assumption)) as [Htotal [Hpanel Hbase]].
assert(HK:0<=kc÷4)by(apply Z.quot_pos;lia).
prop_apply(FloatArray.full_Zlength w_pre (panel_count nc_pre*8*(kc÷4+1)) W). Intros.
assert(Hoff:0<=panel_wbase (kc÷4) ((nc_pre-nc)÷8))by(unfold panel_wbase;nia).
assert(Hend:(panel_wbase (kc÷4) ((nc_pre-nc)÷8))+vl<=(panel_count nc_pre*8*(kc÷4+1)))by(unfold panel_wbase;nia).
sep_apply(full_block_split w_pre (panel_count nc_pre*8*(kc÷4+1)) (panel_wbase (kc÷4) ((nc_pre-nc)÷8)) vl W Hoff ltac:(lia) Hend);entailer!.
Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_24.
