From Coq Require Import ZArith Lia.
From Qu8Rsum Require Import MemoryModel.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma byte_window_extract : forall base i n L d,
 0<=i<n -> UCharArray.full base n L |--
 UCharArray.missing_i base i 0 n L **
 (base+i) # UChar |-> (Znth i L d).
Proof.
 intros base i n L d Hi.
 pose proof (UCharArray.full_split_to_missing_i base i n L d Hi) as H.
 unfold StoreUCharAsElement.storeA in H. rewrite sizeof_uchar in H.
 replace (base + i * 1) with (base+i) in H by lia. rewrite logic_equiv_sepcon_comm. exact H.
Qed.
Lemma byte_window_restore : forall base i n L d,
 0<=i<n -> UCharArray.missing_i base i 0 n L **
 (base+i) # UChar |-> (Znth i L d) |-- UCharArray.full base n L.
Proof.
 intros base i n L d Hi.
 pose proof (UCharArray.missing_i_merge_to_full base i n (Znth i L d) L Hi) as H.
 unfold StoreUCharAsElement.storeA in H. rewrite sizeof_uchar in H.
 rewrite replace_Znth_Znth in H.
 replace (base + i * 1) with (base+i) in H by lia. rewrite logic_equiv_sepcon_comm. exact H.
Qed.
Print Assumptions byte_window_extract.
Print Assumptions byte_window_restore.
