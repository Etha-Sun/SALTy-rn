From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Layout U8Logic U8KernelLogic full10_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_1 : full10_goal.test_neon_entail_wit_1.
Proof.
 unfold full10_goal.test_neon_entail_wit_1; left; intros.
 prop_apply (UCharArray.full_Zlength input_pre (batch_pre+7) A). Intros_p Hlen.
 rewrite Z.sub_diag. change (sublist 0 0 A) with (@nil Z).
 unfold u8_prefix_list at 1. simpl.
 rewrite !UCharArray.seg_empty.
 rewrite sublist_self by lia.
 pose proof (u8_phase_split batch_pre ltac:(lia)) as [Hprefix Hrem].
 unfold u8_prefix_n in *. unfold unsigned_last_nbits,u8_bound. entailer!.
 all: change (2^8)%Z with 256%Z; opaque_leaves; sepcon_assoc_change; fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_1.
