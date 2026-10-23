From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From Rndne Require Import Model.
From QcpRvv32 Require Import RvvResultBridge.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import neon_init_lemmas TailMemory LoopMemory.
Import ListNotations.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma rndne_split : forall k r a , 0<=k -> 0<=r ->
 rndne_values(k+r) a  = rndne_values k a  ++
 firstn (Z.to_nat r) (map (fun x=>rndne_neon x ) (skipn(Z.to_nat k)a)).
Proof.
 intros k r a  Hk Hr. unfold rndne_values. rewrite Z2Nat.inj_add by lia.
 rewrite <- firstn_skipn with (n:=Z.to_nat k) (l:=firstn (Z.to_nat k+Z.to_nat r) (map(fun x=>rndne_neon x )a)) at 1.
 rewrite firstn_firstn, Nat.min_l by lia. rewrite skipn_firstn_comm.
 replace (Z.to_nat k+Z.to_nat r-Z.to_nat k)%nat with (Z.to_nat r) by lia.
 now rewrite skipn_map.
Qed.
Lemma rndne_tail_four : forall k r a  d,
 0<=k -> 0<=r<=4 -> k+4<=Zlength a ->
 rndne_values(k+r) a  = rndne_values k a  ++ firstn(Z.to_nat r)
 [rndne_neon(Znth 0 (fp32_slice k (Zlength a) a) d);
  rndne_neon(Znth 1 (fp32_slice k (Zlength a) a) d);
  rndne_neon(Znth 2 (fp32_slice k (Zlength a) a) d);
  rndne_neon(Znth 3 (fp32_slice k (Zlength a) a) d)].
Proof.
 intros k r a  d Hk Hr Ha. rewrite rndne_split by lia. f_equal.
 rewrite <- (slice_to_skipn k (Zlength a) a eq_refl).
 match goal with |- firstn (Z.to_nat r) ?xs = _ =>
  replace (firstn (Z.to_nat r) xs) with (firstn (Z.to_nat r) (firstn 4 xs)) by (rewrite firstn_firstn, Nat.min_l by lia;reflexivity)
 end.
 rewrite firstn_map.
 change (firstn 4 (fp32_slice k (Zlength a) a)) with (fp32_slice 0 4 (fp32_slice k (Zlength a) a)).
 rewrite (slice_first_four _ d) by (unfold fp32_slice;rewrite Zlength_sublist;lia).
 reflexivity.
Qed.
Lemma rndne_output_step_four : forall p k n total (a:list fp32)  d,
  0 <= k -> k+4 <= n -> n <= total -> total = Zlength a ->
  FloatArray.full p k (rndne_values k a ) **
  float_cells4 (p+k*sizeof(FLOAT))
    (rndne_neon (Znth 0 (fp32_slice k total a) d) )
    (rndne_neon (Znth 1 (fp32_slice k total a) d) )
    (rndne_neon (Znth 2 (fp32_slice k total a) d) )
    (rndne_neon (Znth 3 (fp32_slice k total a) d) ) **
  FloatArray.undef_seg (p+k*sizeof(FLOAT)) 4 (n-k)
  |-- FloatArray.full p (k+4) (rndne_values (k+4) a ) **
      FloatArray.undef_full (p+(k+4)*sizeof(FLOAT)) (n-(k+4)).
Proof.
 intros p k n total a  d Hk Hkn Hnt Ha.
 sep_apply (float_prefix_append4 p k (rndne_values k a )
    (rndne_neon (Znth 0 (fp32_slice k total a) d) )
    (rndne_neon (Znth 1 (fp32_slice k total a) d) )
    (rndne_neon (Znth 2 (fp32_slice k total a) d) )
    (rndne_neon (Znth 3 (fp32_slice k total a) d) ) Hk).
 sep_apply (FloatArray.undef_seg_to_undef_full (p+k*sizeof(FLOAT)) 4 (n-k)).
 pose proof (rndne_tail_four k 4 a  d Hk ltac:(lia) ltac:(lia)) as HM.
 replace (Zlength a) with total in HM by lia. replace (Z.to_nat 4) with 4%nat in HM by reflexivity. cbn [firstn] in HM. rewrite <- HM.
 replace (p+k*sizeof(FLOAT)+4*sizeof(FLOAT)) with (p+(k+4)*sizeof(FLOAT)) by ring.
 replace (n-k-4) with (n-(k+4)) by lia.
 entailer!.
Qed.

Print Assumptions rndne_split.
Print Assumptions rndne_tail_four.
Print Assumptions rndne_output_step_four.
