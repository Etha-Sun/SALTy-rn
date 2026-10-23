From Coq Require Import ZArith Lia List.
From FullU8 Require Import U8Logic U8KernelLogic full10_goal.
From OriginalU8Tail Require Import MemoryFacts.
From OriginalU8Prefix Require Import PrefixFacts.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64 ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.
From OriginalU8TailFinal Require Import TailFacts.
Lemma proof_of_test_neon_return_wit_8 : full10_goal.test_neon_return_wit_8.
Proof.
 unfold full10_goal.test_neon_return_wit_8; left; intros.

 assert (Hcases:batch_2=0 \/ batch_2=1 \/ batch_2=2 \/ batch_2=3 \/
   batch_2=4 \/ batch_2=5 \/ batch_2=6 \/ batch_2=7) by lia.
 repeat destruct Hcases as [Hcases|Hcases]; subst batch_2;
 repeat match goal with H:context[Z.land _ _] |- _ => vm_compute in H end; congruence.
Qed.
Print Assumptions proof_of_test_neon_return_wit_8.
