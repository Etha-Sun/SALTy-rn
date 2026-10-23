From Coq Require Import ZArith Lia.
From QcpVadd Require Import VaddBits.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma window_extract : forall base i n L d,
 0<=i<n -> FloatArray.full base n L |--
 FloatArray.missing_i base i 0 n L **
 (base+i*4) # Float |-> (Znth i L d).
Proof.
 intros base i n L d Hi.
 pose proof (FloatArray.full_split_to_missing_i base i n L d Hi) as H.
 unfold StoreFloatAsElement.storeA in H. rewrite sizeof_float in H.
 rewrite logic_equiv_sepcon_comm. exact H.
Qed.
Lemma window_restore : forall base i n L d,
 0<=i<n -> FloatArray.missing_i base i 0 n L **
 (base+i*4) # Float |-> (Znth i L d) |-- FloatArray.full base n L.
Proof.
 intros base i n L d Hi.
 pose proof (FloatArray.missing_i_merge_to_full base i n (Znth i L d) L Hi) as H.
 unfold StoreFloatAsElement.storeA in H. rewrite sizeof_float in H.
 rewrite replace_Znth_Znth in H.
 rewrite logic_equiv_sepcon_comm. exact H.
Qed.
Print Assumptions window_extract.
Print Assumptions window_restore.
