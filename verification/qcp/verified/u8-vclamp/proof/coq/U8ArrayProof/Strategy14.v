From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
From FullU8 Require Import U8Logic U8KernelLogic arrays_strategy_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma arrays_strategy14_correctness : arrays_strategy14.
Proof. pre_process_default; entailer!.
 do 4 (let a := fresh "a" in destruct l as [|a l]; [repeat rewrite Zlength_cons in *; rewrite Zlength_nil in *; lia|]).
 destruct l as [|last l]; [|pose proof (Zlength_nonneg l); repeat rewrite Zlength_cons in *; lia].
 unfold UCharArray.full,store_array; simpl; unfold StoreUCharAsElement.storeA; rewrite ?sizeof_uchar; entailer!.
Qed.
Print Assumptions arrays_strategy14_correctness.
