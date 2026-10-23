From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Layout U8Logic U8KernelLogic full10_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma u8_neon_prefix_residue : forall n remaining,
 0<=remaining<64 -> 0<=n-remaining -> Z.rem (n-remaining) 64=0 ->
 u8_prefix_n n=n-remaining.
Proof.
 intros n r Hr Ho Hd.
 apply Z.rem_divide in Hd; [|lia]. destruct Hd as [k Hk].
 assert (n/64=k). { symmetry; apply Z.div_unique with (r:=r); lia. }
 unfold u8_prefix_n; lia.
Qed.
Lemma proof_of_test_neon_entail_wit_3 : full10_goal.test_neon_entail_wit_3.
Proof.
 unfold full10_goal.test_neon_entail_wit_3; left; intros.
 pose proof (u8_neon_prefix_residue batch_pre batch ltac:(lia) ltac:(lia) PreH8) as Hprefix.
 rewrite Hprefix.
 rewrite (Zsublist_nil A (batch_pre-batch) (batch_pre-batch)) by lia.
 unfold u8_suffix_list. simpl. rewrite app_nil_r. entailer!.
Qed.
Print Assumptions u8_neon_prefix_residue.
Print Assumptions proof_of_test_neon_entail_wit_3.
