From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From Sqrt Require Export KernelSupport Borrowed KernelFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque sqrt_arm sqrt_rvv sqrt_core.
Lemma sqrt_rvv_prefix_chunk : forall p k r A,
 0<=k ->0<=r ->k+r<=Zlength A ->
 FloatArray.seg p 0 k(sqrt_rvv_values k A) **
 FloatArray.full(p+k*sizeof(FLOAT))r(map sqrt_rvv(sublist k(k+r)A)) |--
 FloatArray.seg p 0(k+r)(sqrt_rvv_values(k+r)A).
Proof.
 intros p k r A Hk Hr HA.
 assert(Hsub:Zlength(sublist k(k+r)A)=r)by(rewrite Zlength_sublist by lia;lia).
 rewrite(sqrt_rvv_values_append k r A Hk Hr HA).
 assert(Hslice:sqrt_rvv_values r(sublist k(k+r)A)=map sqrt_rvv(sublist k(k+r)A)).
 { unfold sqrt_rvv_values;rewrite firstn_all2;[reflexivity|rewrite length_map;rewrite Zlength_correct in Hsub;lia]. }
 rewrite Hslice.
 sep_apply(FloatArray.seg_to_full p 0 k(sqrt_rvv_values k A)).
 replace(p+0*sizeof(FLOAT))with p by lia;replace(k-0)with k by lia.
 pose proof(FloatArray.full_merge_to_full p k(k+r)(sqrt_rvv_values k A)(map sqrt_rvv(sublist k(k+r)A))ltac:(lia))as Hm.
 replace(k+r-k)with r in Hm by lia;sep_apply Hm.
 apply FloatArray.full_to_seg.
Qed.
Lemma sqrt_rvv_output_finish : forall p n A,
 FloatArray.seg p 0 n(sqrt_rvv_values n A) |--
 FloatArray.full p n(sqrt_rvv_values n A).
Proof.
 intros;sep_apply(FloatArray.seg_to_full p 0 n(sqrt_rvv_values n A)).
 replace(p+0*sizeof(FLOAT))with p by lia;replace(n-0)with n by lia;entailer!.
Qed.
Print Assumptions sqrt_rvv_prefix_chunk.
Print Assumptions sqrt_rvv_output_finish.
