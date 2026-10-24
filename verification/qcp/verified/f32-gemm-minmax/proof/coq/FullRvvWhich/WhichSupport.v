From Coq Require Import ZArith List Lia.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
From GemmRvv Require Import Model SLBounds ArrayFacts.
From FullDomainRvv Require Import FullState FullModel RowValues ActiveVector.
From FullDomainMemory Require Import InitialState ChunkState.
From FullDomainRvvStore Require Import StoreValues.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma current_panel : forall total remain,0<remain<=total ->(total-remain) mod 8=0 ->
 0<total /\ 0<=(total-remain)÷8<panel_count total /\8*((total-remain)÷8)=total-remain.
Proof.
 intros total remain H Hmod. rewrite Z.quot_div_nonneg by lia.
 pose proof(Z.div_mod(total-remain)8 ltac:(lia)).
 pose proof(Z.div_mod(total+7)8 ltac:(lia)).
 pose proof(Z.mod_pos_bound(total+7)8 ltac:(lia)).
 pose proof(Z.div_pos(total-remain)8 ltac:(lia)ltac:(lia)).
 unfold panel_count;repeat split;nia.
Qed.
Lemma positive_depth : forall kc k,0<kc ->kc mod 4=0 ->0<k<=kc ->k mod 4=0 ->
 0<kc÷4 /\0<=(kc-k)÷4<kc÷4.
Proof.
 intros kc k Hkc Hcm Hk Hkm. rewrite !Z.quot_div_nonneg by lia.
 pose proof(Z.div_mod kc 4 ltac:(lia));pose proof(Z.div_mod k 4 ltac:(lia)).
 assert((kc-k) mod 4=0)by(rewrite Zminus_mod by lia;rewrite Hcm,Hkm;reflexivity).
 pose proof(Z.div_mod(kc-k)4 ltac:(lia));pose proof(Z.div_pos(kc-k)4 ltac:(lia)ltac:(lia));nia.
Qed.
Lemma full_block_split : forall p n d width W,0<=d ->0<=width ->d+width<=n ->
 FloatArray.full p n W |--
 FloatArray.seg p 0 d(sublist 0 d W) **
 FloatArray.full(p+d*sizeof(FLOAT))width(sublist d(d+width)W) **
 FloatArray.seg p(d+width)n(sublist(d+width)n W).
Proof.
 intros p n d width W Hd Hw Hdn.
 sep_apply(FloatArray.full_split_to_seg p d n W ltac:(lia)).
 sep_apply(FloatArray.seg_split_to_seg p d(d+width)n(sublist d n W)ltac:(lia)).
 replace(d+width-d)with width by lia.
 repeat rewrite Zsublist_Zsublist by lia.
 replace(0+d)with d by lia;replace(width+d)with(d+width)by lia;replace(n-d+d)with n by lia.
 sep_apply(FloatArray.seg_to_full p d(d+width)(sublist d(d+width)W)).
 replace(d+width-d)with width by lia;entailer!.
Qed.
Lemma full_block_merge : forall p n d width W,0<=d ->0<=width ->d+width<=n ->Zlength W=n ->
 FloatArray.seg p 0 d(sublist 0 d W) **
 FloatArray.full(p+d*sizeof(FLOAT))width(sublist d(d+width)W) **
 FloatArray.seg p(d+width)n(sublist(d+width)n W) |--FloatArray.full p n W.
Proof.
 intros p n d width W Hd Hw Hdn Hlen.
 sep_apply(FloatArray.full_to_seg(p+d*sizeof(FLOAT))width(sublist d(d+width)W)).
 rewrite <-(FloatArray.seg_shift p d 0 width(sublist d(d+width)W));replace(d+0)with d by lia.
 sep_apply(FloatArray.seg_merge_to_seg p d(d+width)n(sublist d(d+width)W)(sublist(d+width)n W)ltac:(lia)).
 rewrite <-(sublist_split d n(d+width)W)by lia.
 sep_apply(FloatArray.seg_merge_to_full p 0 d n(sublist 0 d W)(sublist d n W)ltac:(lia)).
 rewrite Z.mul_0_l,Z.add_0_r,Z.sub_0_r.
 rewrite <-(sublist_split 0 n d W)by lia;rewrite sublist_self by lia;entailer!.
Qed.
Print Assumptions current_panel.
Print Assumptions positive_depth.
Print Assumptions full_block_split.
Print Assumptions full_block_merge.

Lemma output_panel_zero : forall c mr nc k b A W lo hi,
 output_panel c mr nc k b 0 A W lo hi = output_state c mr nc k(processed_cols nc b)A W lo hi.
Proof. reflexivity. Qed.
Lemma output_panel_four : forall c mr nc k b A W lo hi,
 output_panel c mr nc k b 4 A W lo hi = output_state c mr nc k(processed_cols nc(b+1))A W lo hi.
Proof. reflexivity. Qed.
Print Assumptions output_panel_zero.
Print Assumptions output_panel_four.
