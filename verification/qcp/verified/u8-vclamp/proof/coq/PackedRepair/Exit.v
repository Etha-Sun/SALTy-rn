From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Packed32Layout Packed32Model U8Logic U8KernelLogic.
From U8PackedKernel Require Import Prelude unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_entail_wit_3 : U8PackedKernel.unit_goal.test_rvv_entail_wit_3.
Proof.
 unfold test_rvv_entail_wit_3;left;intros.
 assert(Hprefix:u8_prefix_n batch_pre=batch_pre-batch)by lia.
 rewrite Hprefix.
 rewrite(Zsublist_nil A(batch_pre-batch)(batch_pre-batch))by lia.
 unfold u8_suffix_list;simpl;rewrite app_nil_r;entailer!.
Qed.
Print Assumptions proof_of_test_rvv_entail_wit_3.
