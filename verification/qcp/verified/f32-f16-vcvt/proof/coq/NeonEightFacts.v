From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From F32F16 Require Import ProgramModel ProgramFacts NeonResult.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import neon_init_lemmas LoopMemory TailMemory.
Import ListNotations. Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.

Lemma first_eight_two_defaults : forall (xs:list fp32) d0 d1,
 8<=Zlength xs ->
 firstn 8 xs =
 [Znth 0 xs d0;Znth 1 xs d0;Znth 2 xs d0;Znth 3 xs d0;
  Znth 0 (skipn 4 xs) d1;Znth 1 (skipn 4 xs) d1;
  Znth 2 (skipn 4 xs) d1;Znth 3 (skipn 4 xs) d1].
Proof.
 intros xs d0 d1 Hlen;rewrite Zlength_correct in Hlen.
 destruct xs as[|x0 xs];[simpl in Hlen;lia|].
 destruct xs as[|x1 xs];[simpl in Hlen;lia|].
 destruct xs as[|x2 xs];[simpl in Hlen;lia|].
 destruct xs as[|x3 xs];[simpl in Hlen;lia|].
 destruct xs as[|x4 xs];[simpl in Hlen;lia|].
 destruct xs as[|x5 xs];[simpl in Hlen;lia|].
 destruct xs as[|x6 xs];[simpl in Hlen;lia|].
 destruct xs as[|x7 xs];[simpl in Hlen;lia|].
 reflexivity.
Qed.

Lemma f16_tail_eight : forall k r n (A:list fp32) d0 d1,
 0<=k -> 0<=r<=8 -> k+8<=n -> n=Zlength A ->
 let W:=fp32_slice k n A in
 let S:=fp32_slice 4 (n-k) W in
 f16_values(k+r)A=f16_values k A ++ firstn(Z.to_nat r)
 [f16_arm_lane(Znth 0 W d0);f16_arm_lane(Znth 1 W d0);
  f16_arm_lane(Znth 2 W d0);f16_arm_lane(Znth 3 W d0);
  f16_arm_lane(Znth 0 S d1);f16_arm_lane(Znth 1 S d1);
  f16_arm_lane(Znth 2 S d1);f16_arm_lane(Znth 3 S d1)].
Proof.
 intros k r n A d0 d1 Hk Hr Hkn Hn;cbv zeta.
 rewrite f16_split by lia;f_equal.
 rewrite <- (slice_to_skipn k n A Hn).
 set(W:=fp32_slice k n A).
 assert(Hlen:Zlength W=n-k).
 { unfold W,fp32_slice;rewrite Zlength_sublist;lia. }
 rewrite(slice_to_skipn 4(n-k)W ltac:(lia)).
 replace(firstn(Z.to_nat r)(map f16_arm_lane W))with
 (firstn(Z.to_nat r)(map f16_arm_lane(firstn 8 W))).
 2:{ rewrite <-firstn_map,firstn_firstn,Nat.min_l by lia;reflexivity. }
 rewrite(first_eight_two_defaults W d0 d1 ltac:(lia));reflexivity.
Qed.

Lemma float_input_step_eight : forall p k n (A:list fp32) d0 d1,
 0<=k -> k+8<=n -> n=Zlength A ->
 let W:=fp32_slice k n A in
 let S:=fp32_slice 4 (n-k) W in
 let T:=fp32_slice 4 (n-k-4) S in
 FloatArray.full p k(fp32_slice 0 k A) **
 float_cells4(p+k*sizeof(FLOAT))
   (Znth 0 W d0)(Znth 1 W d0)(Znth 2 W d0)(Znth 3 W d0) **
 float_cells4(p+k*sizeof(FLOAT)+4*sizeof(FLOAT))
   (Znth 0 S d1)(Znth 1 S d1)(Znth 2 S d1)(Znth 3 S d1) **
 FloatArray.seg(p+k*sizeof(FLOAT))8(n-k)T |--
 FloatArray.full p(k+8)(fp32_slice 0(k+8)A) **
 FloatArray.full(p+(k+8)*sizeof(FLOAT))(n-(k+8))(fp32_slice(k+8)n A).
Proof.
 intros p k n A d0 d1 Hk Hkn Hn;cbv zeta.
 rewrite(slice_suffix_four k n A Hk ltac:(lia)).
 replace(n-k-4)with(n-(k+4))by lia.
 rewrite(slice_suffix_four(k+4)n A ltac:(lia)ltac:(lia)).
 replace(k+4+4)with(k+8)by lia.
 sep_apply(float_prefix_append4 p k(fp32_slice 0 k A)
   (Znth 0(fp32_slice k n A)d0)(Znth 1(fp32_slice k n A)d0)
   (Znth 2(fp32_slice k n A)d0)(Znth 3(fp32_slice k n A)d0)Hk).
 rewrite <- (slice_step_four k n A d0 Hk ltac:(lia)Hn).
 replace(p+k*sizeof(FLOAT)+4*sizeof(FLOAT))with(p+(k+4)*sizeof(FLOAT))by ring.
 sep_apply(float_prefix_append4 p(k+4)(fp32_slice 0(k+4)A)
   (Znth 0(fp32_slice(k+4)n A)d1)(Znth 1(fp32_slice(k+4)n A)d1)
   (Znth 2(fp32_slice(k+4)n A)d1)(Znth 3(fp32_slice(k+4)n A)d1)ltac:(lia)).
 rewrite <- (slice_step_four(k+4)n A d1 ltac:(lia)ltac:(lia)Hn).
 replace(k+4+4)with(k+8)by lia.
 sep_apply(FloatArray.seg_to_full(p+k*sizeof(FLOAT))8(n-k)(fp32_slice(k+8)n A)).
 replace(p+k*sizeof(FLOAT)+8*sizeof(FLOAT))with(p+(k+8)*sizeof(FLOAT))by ring.
 replace(n-k-8)with(n-(k+8))by lia;entailer!.
Qed.

Print Assumptions first_eight_two_defaults.
Print Assumptions f16_tail_eight.
Print Assumptions float_input_step_eight.
