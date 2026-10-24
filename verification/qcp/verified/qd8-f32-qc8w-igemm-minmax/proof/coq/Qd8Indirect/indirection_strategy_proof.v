From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From Qd8Indirect Require Import IndirectionModel indirection_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma indirection_strategy1_correctness:indirection_strategy1.
Proof.
 unfold indirection_strategy1;pre_process_default.
 sep_apply (PtrArray.full_split_to_missing_i p i n xs 0);[|lia].
 unfold StorePtrAsElement.storeA,zget;try rewrite sizeof_ptr.
 rewrite logic_equiv_sepcon_comm.
 apply derivable1_sepcon_mono;[apply derivable1_refl|].
 Intros_r v. rewrite <-derivable1_wand_sepcon_adjoint.
 entailer!. subst. entailer!.
Qed.
Lemma indirection_strategy2_correctness:indirection_strategy2.
Proof.
 unfold indirection_strategy2;pre_process_default.
 sep_apply (CharArray.full_split_to_missing_i p i n xs 0);[|lia].
 unfold StoreCharAsElement.storeA,zget.
 rewrite logic_equiv_sepcon_comm.
 apply derivable1_sepcon_mono;[apply derivable1_refl|].
 Intros_r v. rewrite <-derivable1_wand_sepcon_adjoint.
 entailer!. subst. entailer!.
Qed.
Lemma indirection_strategy3_correctness:indirection_strategy3.
Proof.
 unfold indirection_strategy3;pre_process_default;subst q.
 sep_apply (CharArray.full_split_to_missing_i p i n xs 0);[|lia].
 unfold StoreCharAsElement.storeA,zget.
 entailer!.
 Intros_r v. rewrite <-derivable1_wand_sepcon_adjoint.
 entailer!. subst. entailer!.
Qed.
Module Checked <: indirection_Strategy_Correct.
Definition indirection_strategy1_correctness:indirection_strategy1:=indirection_strategy1_correctness.
Definition indirection_strategy2_correctness:indirection_strategy2:=indirection_strategy2_correctness.
Definition indirection_strategy3_correctness:indirection_strategy3:=indirection_strategy3_correctness.
End Checked.
