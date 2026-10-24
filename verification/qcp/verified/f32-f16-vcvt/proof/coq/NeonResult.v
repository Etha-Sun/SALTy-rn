From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From F32F16 Require Import ProgramModel ProgramFacts Observation.
From QcpRvv32 Require Import RvvResultBridge.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import neon_init_lemmas TailMemory LoopMemory.
Import ListNotations. Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma f16_tail_four : forall k r a d,
 0<=k -> 0<=r<=4 -> k+4<=Zlength a ->
 f16_values(k+r)a=f16_values k a ++ firstn(Z.to_nat r)
 [f16_arm_lane(Znth 0(fp32_slice k(Zlength a)a)d);
  f16_arm_lane(Znth 1(fp32_slice k(Zlength a)a)d);
  f16_arm_lane(Znth 2(fp32_slice k(Zlength a)a)d);
  f16_arm_lane(Znth 3(fp32_slice k(Zlength a)a)d)].
Proof.
 intros k r a d Hk Hr Ha;rewrite f16_split by lia;f_equal.
 rewrite <- (slice_to_skipn k(Zlength a)a eq_refl).
 match goal with |- firstn(Z.to_nat r)?xs=_=>replace(firstn(Z.to_nat r)xs)with(firstn(Z.to_nat r)(firstn 4 xs))by(rewrite firstn_firstn,Nat.min_l by lia;reflexivity)end.
 rewrite firstn_map;change(firstn 4(fp32_slice k(Zlength a)a))with(fp32_slice 0 4(fp32_slice k(Zlength a)a)).
 rewrite(slice_first_four _ d)by(unfold fp32_slice;rewrite Zlength_sublist;lia);reflexivity.
Qed.
Lemma f16_output_append : forall p k r n a chunk,
 0<=k -> 0<=r -> k+r<=n ->
 chunk=f16_values r(sublist k(k+r)a) ->
 UShortArray.full p k(f16_values k a) ** UShortArray.full(p+k*sizeof(USHORT))r chunk |--
 UShortArray.full p(k+r)(f16_values(k+r)a).
Proof.
 intros p k r n a chunk Hk Hr Hkn Hchunk;subst chunk.
 assert(Hbound:0<=k<=k+r)by lia.
 pose proof(UShortArray.full_merge_to_full p k(k+r)(f16_values k a)(f16_values r(sublist k(k+r)a))Hbound)as HM.
 replace(k+r-k)with r in HM by lia;sep_apply HM.
 rewrite f16_values_equal, f16_values_equal, f16_values_equal.
 rewrite <- f16_rvv_append by lia;entailer!.
Qed.
Print Assumptions f16_tail_four.
Print Assumptions f16_output_append.
