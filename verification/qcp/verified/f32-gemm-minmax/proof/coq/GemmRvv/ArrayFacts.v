From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
From GemmRvv Require Import Model.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma full_head8_split : forall p n W, 8 <= n ->
 FloatArray.full p n W |-- FloatArray.full p 8 (sublist 0 8 W) ** FloatArray.seg p 8 n (sublist 8 n W).
Proof.
 intros p n W Hn.
 change (FloatArray.full p n W |-- FloatArray.seg p 0 8 (sublist 0 8 W) ** FloatArray.seg p 8 n (sublist 8 n W)).
 apply FloatArray.full_split_to_seg;lia.
Qed.
Lemma full_head8_merge : forall p n W, 8 <= n -> Zlength W=n ->
 FloatArray.full p 8 (sublist 0 8 W) ** FloatArray.seg p 8 n (sublist 8 n W) |-- FloatArray.full p n W.
Proof.
 intros p n W Hn Hlen.
 change (FloatArray.seg p 0 8 (sublist 0 8 W) ** FloatArray.seg p 8 n (sublist 8 n W) |-- FloatArray.full p n W).
 pose proof (FloatArray.seg_merge_to_full p 0 8 n (sublist 0 8 W) (sublist 8 n W) ltac:(lia)) as HM.
 sep_apply HM.
 rewrite Z.mul_0_l,Z.add_0_r,Z.sub_0_r.
 rewrite <-(sublist_split 0 n 8 W) by lia.
 rewrite sublist_self by lia.
 entailer!.
Qed.
Print Assumptions full_head8_split.
Print Assumptions full_head8_merge.
Lemma full_block8_split : forall p n d W, 0 <= d -> d+8 <= n ->
 FloatArray.full p n W |--
 FloatArray.seg p 0 d (sublist 0 d W) **
 FloatArray.full (p+d*sizeof(FLOAT)) 8 (sublist d (d+8) W) **
 FloatArray.seg p (d+8) n (sublist (d+8) n W).
Proof.
 intros p n d W Hd Hdn.
 pose proof (FloatArray.full_split_to_seg p d n W ltac:(lia)) as HS1.
 sep_apply HS1.
 pose proof (FloatArray.seg_split_to_seg p d (d+8) n (sublist d n W) ltac:(lia)) as HS2.
 sep_apply HS2.
 replace (d+8-d) with 8 by lia.
 repeat rewrite Zsublist_Zsublist by lia.
 replace (0+d) with d by lia.
 replace (8+d) with (d+8) by lia.
 replace (n-d+d) with n by lia.
 sep_apply (FloatArray.seg_to_full p d (d+8) (sublist d (d+8) W)).
 replace (d+8-d) with 8 by lia.
 entailer!.
Qed.
Lemma full_block8_merge : forall p n d W, 0 <= d -> d+8 <= n -> Zlength W=n ->
 FloatArray.seg p 0 d (sublist 0 d W) **
 FloatArray.full (p+d*sizeof(FLOAT)) 8 (sublist d (d+8) W) **
 FloatArray.seg p (d+8) n (sublist (d+8) n W) |-- FloatArray.full p n W.
Proof.
 intros p n d W Hd Hdn Hlen.
 pose proof (FloatArray.full_to_seg (p+d*sizeof(FLOAT)) 8 (sublist d (d+8) W)) as HF.
 sep_apply HF.
 rewrite <-(FloatArray.seg_shift p d 0 8 (sublist d (d+8) W)).
 replace (d+0) with d by lia.
 pose proof (FloatArray.seg_merge_to_seg p d (d+8) n (sublist d (d+8) W) (sublist (d+8) n W) ltac:(lia)) as HM1.
 sep_apply HM1.
 rewrite <-(sublist_split d n (d+8) W) by lia.
 pose proof (FloatArray.seg_merge_to_full p 0 d n (sublist 0 d W) (sublist d n W) ltac:(lia)) as HM2.
 sep_apply HM2.
 rewrite Z.mul_0_l,Z.add_0_r,Z.sub_0_r.
 rewrite <-(sublist_split 0 n d W) by lia.
 rewrite sublist_self by lia.
 entailer!.
Qed.
Print Assumptions full_block8_split.
Print Assumptions full_block8_merge.
