From Coq Require Import ZArith Lia.
From FullNeonLoopProof Require Import AddressFacts.
From FullDomainRvv Require Import FullState.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma output_prefix_nonnegative : forall c mr nc k done A W lo hi,
 1<=mr ->0<done ->output_state c mr nc k done A W lo hi |-- “ 0<=c ”.
Proof.
 intros c mr nc k done A W lo hi Hmr Hd.
 unfold output_state,output_row.
 assert(Hactive:0 <? mr=true)by(apply Z.ltb_lt;lia);rewrite Hactive.
 rewrite Z.mul_0_l,Z.add_0_l.
 sep_apply(FloatArray.seg_to_full c 0 done(full_row_values A W k 0 done lo hi)).
 replace(c+0*sizeof(FLOAT))with c by ring.
 rewrite Z.sub_0_r.
 sep_apply(full_nonnegative c done(full_row_values A W k 0 done lo hi)Hd).
 entailer!.
Qed.
Print Assumptions output_prefix_nonnegative.
