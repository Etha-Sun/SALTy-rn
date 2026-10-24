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
Lemma proof_of_test_rvv_which_implies_wit_9: test_rvv_which_implies_wit_9.
Proof. unfold test_rvv_which_implies_wit_9;left;intros;repeat rewrite Z.rem_mod_nonneg in * by lia;unfold rvv_len in *.
pose proof(positive_depth kc k ltac:(lia) ltac:(assumption) ltac:(lia) ltac:(assumption))as[HKpos HD].
pose proof(row_alias_range mr 2 ltac:(lia) ltac:(lia))as Hr.
pose proof(FloatArray.missing_i_merge_to_full a_pre (row_alias mr 2*(kc÷4)+(kc-k)÷4) (4*(kc÷4)) (rvv_at A (row_alias mr 2*(kc÷4)+(kc-k)÷4)) A ltac:(nia))as HS.
unfold StoreFloatAsElement.storeA in HS;sep_apply HS.
unfold rvv_at;fold(Znth (row_alias mr 2*(kc÷4)+(kc-k)÷4) A fp32_zero);rewrite replace_Znth_Znth by nia;entailer!.
Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_9.
