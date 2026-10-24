From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From Sqrt Require Export KernelSupport Borrowed KernelFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque sqrt_arm sqrt_rvv sqrt_core.
Lemma sqrt_arm_window4 : forall k r A,
 0<=k ->0<=r<=4 ->k+4<=Zlength A ->
 sqrt_arm_values r(sublist k(k+r)A)=
 firstn(Z.to_nat r)(sqrt_pack4(sqrt_arm(sqrt_lane(k+0)A))
 (sqrt_arm(sqrt_lane(k+1)A))(sqrt_arm(sqrt_lane(k+2)A))(sqrt_arm(sqrt_lane(k+3)A))).
Proof.
 intros k r A Hk Hr Hend.
 assert(Hsub:Zlength(sublist k(k+r)A)=r)by(rewrite Zlength_sublist by lia;lia).
 assert(HsubN:length(sublist k(k+r)A)=Z.to_nat r)by(rewrite Zlength_correct in Hsub;lia).
 unfold sqrt_arm_values;rewrite firstn_all2 by(rewrite length_map;lia).
 apply(list_eq_nth fp32 _ _ fp32_zero).
 - rewrite length_map,length_firstn;cbn[sqrt_pack4 length];rewrite Nat.min_l by lia;lia.
 - intros i Hi;rewrite length_map in Hi.
   rewrite(map_nth_len fp32 fp32 sqrt_arm(sublist k(k+r)A)i fp32_zero fp32_zero)by lia.
   rewrite nth_firstn by lia.
   assert(Hi4:(i<4)%nat)by lia.
   replace(nth i(sublist k(k+r)A)fp32_zero)with(Znth(Z.of_nat i)(sublist k(k+r)A)fp32_zero)by(unfold Znth;rewrite Nat2Z.id;reflexivity).
   rewrite Znth_sublist by lia.
   do 4(destruct i as[|i];[cbn[sqrt_pack4 nth Z.of_nat];f_equal;unfold sqrt_lane;f_equal;lia|]). lia.
Qed.
Lemma sqrt_prefix_chunk : forall p k r P Q,
 0<=k ->0<=r ->
 FloatArray.seg p 0 k P ** FloatArray.full(p+k*sizeof(FLOAT))r Q |--
 FloatArray.seg p 0(k+r)(P++Q).
Proof.
 intros p k r P Q Hk Hr.
 sep_apply(FloatArray.seg_to_full p 0 k P).
 replace(p+0*sizeof(FLOAT))with p by lia;replace(k-0)with k by lia.
 pose proof(FloatArray.full_merge_to_full p k(k+r)P Q ltac:(lia))as Hm.
 replace(k+r-k)with r in Hm by lia;sep_apply Hm.
 apply FloatArray.full_to_seg.
Qed.
Lemma sqrt_batch_div4 : forall b,0<=b ->b%4=0 ->b=4*(b ÷ 4).
Proof. intros;pose proof(Z.quot_rem b 4 ltac:(lia));lia. Qed.
Lemma sqrt_batch_step : forall b,16<=b ->b=4*(b ÷ 4)->
 (b-16) ÷ 4=b ÷ 4-4 /\ (b-16)%4=0.
Proof.
 intros b Hb Hdiv;replace(b-16)with((b ÷ 4-4)*4)by lia.
 rewrite Z.quot_mul,Z.rem_mul by lia;auto.
Qed.
Print Assumptions sqrt_arm_window4.
Print Assumptions sqrt_prefix_chunk.
Print Assumptions sqrt_batch_div4.
Print Assumptions sqrt_batch_step.
Lemma sqrt_output_finish : forall p k r A Q,
 0<=k ->0<=r<=4 ->k+4<=Zlength A ->
 Q=firstn(Z.to_nat r)(sqrt_pack4(sqrt_arm(sqrt_lane(k+0)A))
 (sqrt_arm(sqrt_lane(k+1)A))(sqrt_arm(sqrt_lane(k+2)A))(sqrt_arm(sqrt_lane(k+3)A))) ->
 FloatArray.seg p 0 k(sqrt_arm_values k A) ** FloatArray.full(p+k*sizeof(FLOAT))r Q |--
 FloatArray.full p(k+r)(sqrt_arm_values(k+r)A).
Proof.
 intros p k r A Q Hk Hr HA HQ;subst Q.
 rewrite <-(sqrt_arm_window4 k r A Hk Hr HA).
 sep_apply(sqrt_prefix_chunk p k r(sqrt_arm_values k A)(sqrt_arm_values r(sublist k(k+r)A))Hk ltac:(lia)).
 rewrite <-(sqrt_arm_values_append k r A Hk ltac:(lia)ltac:(lia)).
 pose proof(FloatArray.seg_to_full p 0(k+r)(sqrt_arm_values(k+r)A))as Hm.
 replace(p+0*sizeof(FLOAT))with p in Hm by lia.
 replace(k+r-0)with(k+r)in Hm by lia;exact Hm.
Qed.
Print Assumptions sqrt_output_finish.
