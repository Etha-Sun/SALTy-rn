From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Packed32Layout Packed32Model U8Logic U8KernelLogic.
From U8PackedKernel Require Import Prelude unit_goal.
From PackedRepair Require Import KernelFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_1 : U8PackedKernel.unit_goal.test_rvv_entail_wit_1.
Proof.
 unfold test_rvv_entail_wit_1;left;intros.
 prop_apply(UCharArray.full_Zlength input_pre(batch_pre+7)A). Intros_p Hlen.
 rewrite Z.sub_diag,u8_mask_prefix.
 change(sublist 0 0 A)with(@nil Z).
 unfold u8_prefix_list at 1;simpl.
 rewrite !UCharArray.seg_empty.
 rewrite sublist_self by lia.
 pose proof(u8_phase_split batch_pre ltac:(lia))as[Hprefix Hrem].
 unfold u8_prefix_n in *. unfold unsigned_last_nbits,u8_bound;entailer!.
 all: change(2^8)%Z with 256%Z;opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_1.
