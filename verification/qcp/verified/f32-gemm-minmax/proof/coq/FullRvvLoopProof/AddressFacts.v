From Coq Require Import ZArith Lia.
From GemmFullRvvVC15 Require Import unit_goal.
From FullDomainRvv Require Import FullState.
From SimpleC.SL Require Import SeparationLogic.
From LeaderAutomation Require Import FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma full_nonnegative : forall p n xs,0<n ->FloatArray.full p n xs |-- “ 0<=p ”.
Proof.
 intros p n xs Hn.
 sep_apply (FloatArray.full_split_to_missing_i p 0 n xs fp32_zero);[|lia].
 unfold StoreFloatAsElement.storeA.
 prop_apply (valid_store_float (p+0*sizeof(FLOAT)) (Znth 0 xs fp32_zero)).
 Intros_p Hvalid.
 unfold isvalidptr_float in Hvalid.
 rewrite sizeof_float in Hvalid.
 entailer!.
Qed.
Lemma output_initial_nonnegative : forall c mr nc k A W lo hi,
 1<=mr ->0<nc ->output_state c mr nc k 0 A W lo hi |-- “ 0<=c ”.
Proof.
 intros c mr nc k A W lo hi Hmr Hnc.
 unfold output_state,output_row.
 assert(Hactive:0 <? mr=true)by(apply Z.ltb_lt;lia);rewrite Hactive.
 replace (0*nc+0)with 0 by ring.
 replace ((0+1)*nc)with nc by ring.
 sep_apply (FloatArray.undef_seg_split_to_undef_missing_i c 0 0 nc);[|lia].
 unfold StoreFloatAsElement.undefstoreA,undef_store_float,isvalidptr_float.
 rewrite sizeof_float.
 entailer!.
Qed.
Print Assumptions full_nonnegative.
Print Assumptions output_initial_nonnegative.
