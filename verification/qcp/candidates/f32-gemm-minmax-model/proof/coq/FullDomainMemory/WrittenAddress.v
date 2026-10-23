From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullState.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma output_written_nonnegative : forall c mr nc k done A W lo hi,
 1<=mr ->0<done ->output_state c mr nc k done A W lo hi |-- “ 0<=c ”.
Proof.
 intros c mr nc k done A W lo hi Hmr Hd.
 unfold output_state;unfold output_row at 1.
 assert(Hactive:0 <? mr=true)by(apply Z.ltb_lt;lia);rewrite Hactive.
 replace (0*nc)with 0 by ring;replace(0+done)with done by ring.
 sep_apply(FloatArray.seg_split_to_missing_i c 0 0 done (full_row_values A W k 0 done lo hi) fp32_zero ltac:(lia)).
 unfold StoreFloatAsElement.storeA.
 prop_apply(valid_store_float(c+0*sizeof(FLOAT))(Znth(0-0)(full_row_values A W k 0 done lo hi)fp32_zero)).
 Intros_p Hvalid;unfold isvalidptr_float in Hvalid;entailer!.
Qed.
Print Assumptions output_written_nonnegative.
