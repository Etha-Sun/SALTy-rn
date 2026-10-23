From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From VMulc Require Import Model RvvResult.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import neon_init_lemmas TailMemory LoopMemory.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma vmulc_split : forall k r a c, 0<=k -> 0<=r ->
 vmulc_values(k+r) a c = vmulc_values k a c ++
 firstn (Z.to_nat r) (map (fun x=>fp32_mul x c) (skipn(Z.to_nat k)a)).
Proof.
 intros k r a c Hk Hr. unfold vmulc_values. rewrite Z2Nat.inj_add by lia.
 rewrite <- firstn_skipn with (n:=Z.to_nat k) (l:=firstn (Z.to_nat k+Z.to_nat r) (map(fun x=>fp32_mul x c)a)) at 1.
 rewrite firstn_firstn, Nat.min_l by lia. rewrite skipn_firstn_comm.
 replace (Z.to_nat k+Z.to_nat r-Z.to_nat k)%nat with (Z.to_nat r) by lia.
 now rewrite skipn_map.
Qed.
Lemma vmulc_tail_four : forall k r a c d,
 0<=k -> 0<=r<=4 -> k+4<=Zlength a ->
 vmulc_values(k+r) a c = vmulc_values k a c ++ firstn(Z.to_nat r)
 [fp32_mul(Znth 0 (fp32_slice k (Zlength a) a) d)c;
  fp32_mul(Znth 1 (fp32_slice k (Zlength a) a) d)c;
  fp32_mul(Znth 2 (fp32_slice k (Zlength a) a) d)c;
  fp32_mul(Znth 3 (fp32_slice k (Zlength a) a) d)c].
Proof.
 intros k r a c d Hk Hr Ha. rewrite vmulc_split by lia. f_equal.
 rewrite <- (slice_to_skipn k (Zlength a) a eq_refl).
 match goal with |- firstn (Z.to_nat r) ?xs = _ =>
  replace (firstn (Z.to_nat r) xs) with (firstn (Z.to_nat r) (firstn 4 xs)) by (rewrite firstn_firstn, Nat.min_l by lia;reflexivity)
 end.
 rewrite firstn_map.
 change (firstn 4 (fp32_slice k (Zlength a) a)) with (fp32_slice 0 4 (fp32_slice k (Zlength a) a)).
 rewrite (slice_first_four _ d) by (unfold fp32_slice;rewrite Zlength_sublist;lia).
 reflexivity.
Qed.
Lemma vmulc_output_step_four : forall p k n total (a:list fp32) c d,
  0 <= k -> k+4 <= n -> n <= total -> total = Zlength a ->
  FloatArray.full p k (vmulc_values k a c) **
  float_cells4 (p+k*sizeof(FLOAT))
    (fp32_mul (Znth 0 (fp32_slice k total a) d) c)
    (fp32_mul (Znth 1 (fp32_slice k total a) d) c)
    (fp32_mul (Znth 2 (fp32_slice k total a) d) c)
    (fp32_mul (Znth 3 (fp32_slice k total a) d) c) **
  FloatArray.undef_seg (p+k*sizeof(FLOAT)) 4 (n-k)
  |-- FloatArray.full p (k+4) (vmulc_values (k+4) a c) **
      FloatArray.undef_full (p+(k+4)*sizeof(FLOAT)) (n-(k+4)).
Proof.
 intros p k n total a c d Hk Hkn Hnt Ha.
 sep_apply (float_prefix_append4 p k (vmulc_values k a c)
    (fp32_mul (Znth 0 (fp32_slice k total a) d) c)
    (fp32_mul (Znth 1 (fp32_slice k total a) d) c)
    (fp32_mul (Znth 2 (fp32_slice k total a) d) c)
    (fp32_mul (Znth 3 (fp32_slice k total a) d) c) Hk).
 sep_apply (FloatArray.undef_seg_to_undef_full (p+k*sizeof(FLOAT)) 4 (n-k)).
 pose proof (vmulc_tail_four k 4 a c d Hk ltac:(lia) ltac:(lia)) as HM.
 replace (Zlength a) with total in HM by lia. replace (Z.to_nat 4) with 4%nat in HM by reflexivity. cbn [firstn] in HM. rewrite <- HM.
 replace (p+k*sizeof(FLOAT)+4*sizeof(FLOAT)) with (p+(k+4)*sizeof(FLOAT)) by ring.
 replace (n-k-4) with (n-(k+4)) by lia.
 entailer!.
Qed.
