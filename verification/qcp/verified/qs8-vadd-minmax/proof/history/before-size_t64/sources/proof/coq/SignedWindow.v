From Coq Require Import ZArith Lia.
From Qs8Add Require Import MemoryModel.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma s8_window_extract : forall base i n L d,
 0<=i<n -> CharArray.full base n L |--
 CharArray.missing_i base i 0 n L **
 (base+i) # Char |-> (Znth i L d).
Proof.
 intros base i n L d Hi.
 pose proof (CharArray.full_split_to_missing_i base i n L d Hi) as H.
 unfold StoreCharAsElement.storeA in H. rewrite sizeof_char in H.
 replace (base + i * 1) with (base+i) in H by lia. rewrite logic_equiv_sepcon_comm. exact H.
Qed.
Lemma s8_window_restore : forall base i n L d,
 0<=i<n -> CharArray.missing_i base i 0 n L **
 (base+i) # Char |-> (Znth i L d) |-- CharArray.full base n L.
Proof.
 intros base i n L d Hi.
 pose proof (CharArray.missing_i_merge_to_full base i n (Znth i L d) L Hi) as H.
 unfold StoreCharAsElement.storeA in H. rewrite sizeof_char in H.
 rewrite replace_Znth_Znth in H.
 replace (base + i * 1) with (base+i) in H by lia. rewrite logic_equiv_sepcon_comm. exact H.
Qed.
Print Assumptions s8_window_extract.
Print Assumptions s8_window_restore.
