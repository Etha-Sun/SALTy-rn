From Coq Require Import ZArith Lia List.
From QcpRvv32 Require Import RvvStoreModel RvvResultBridge.
From AUXLib Require Import ListLib.
From VMulc Require Import Model.
Import ListNotations.
Local Open Scope Z_scope.
Definition vmulc_lane (vl:Z) (a:list fp32) (c:fp32) (i:nat) : fp32 :=
 vmulc_active_mul (Z.of_nat i) vl (rvv_read_value (Z.of_nat i) vl a) c.
Definition vmulc_result32 (vl:Z) (a:list fp32) (c:fp32) : list fp32 :=
 map (vmulc_lane vl a c) (seq 0 32).
Lemma vmulc_result_prefix : forall vl a c,
 0<=vl<=32 -> vl<=Zlength a ->
 rvv_take vl (vmulc_result32 vl a c)=vmulc_values vl a c.
Proof.
 intros vl a c Hv Ha. apply nth_ext with (d:=fp32_zero) (d':=fp32_zero).
 - unfold rvv_take, vmulc_result32, vmulc_values.
   rewrite !length_firstn, !length_map, length_seq, Zlength_correct in *.
   rewrite !Nat.min_l by lia. reflexivity.
 - intros i Hi. unfold rvv_take, vmulc_result32 in *.
   rewrite length_firstn, length_map, length_seq in Hi.
   rewrite nth_firstn by lia. rewrite nth_map_seq_bounded by lia.
   unfold vmulc_lane, vmulc_active_mul, rvv_read_value.
   assert (Ht: (Z.of_nat i <? vl)=true) by (apply Z.ltb_lt;lia).
   rewrite Ht. unfold Znth. rewrite Nat2Z.id.
   unfold vmulc_values. rewrite nth_firstn by lia.
   symmetry. rewrite nth_indep with (d':=fp32_mul fp32_zero c) by (rewrite length_map; rewrite Zlength_correct in Ha;lia).
   exact (map_nth (fun x=>fp32_mul x c) a fp32_zero i).
Qed.
Definition vmulc_packed (vl:Z) (a:list fp32) (c:fp32) : list fp32 :=
 rvv_pack32
 (vmulc_lane vl a c 0%nat)
 (vmulc_lane vl a c 1%nat)
 (vmulc_lane vl a c 2%nat)
 (vmulc_lane vl a c 3%nat)
 (vmulc_lane vl a c 4%nat)
 (vmulc_lane vl a c 5%nat)
 (vmulc_lane vl a c 6%nat)
 (vmulc_lane vl a c 7%nat)
 (vmulc_lane vl a c 8%nat)
 (vmulc_lane vl a c 9%nat)
 (vmulc_lane vl a c 10%nat)
 (vmulc_lane vl a c 11%nat)
 (vmulc_lane vl a c 12%nat)
 (vmulc_lane vl a c 13%nat)
 (vmulc_lane vl a c 14%nat)
 (vmulc_lane vl a c 15%nat)
 (vmulc_lane vl a c 16%nat)
 (vmulc_lane vl a c 17%nat)
 (vmulc_lane vl a c 18%nat)
 (vmulc_lane vl a c 19%nat)
 (vmulc_lane vl a c 20%nat)
 (vmulc_lane vl a c 21%nat)
 (vmulc_lane vl a c 22%nat)
 (vmulc_lane vl a c 23%nat)
 (vmulc_lane vl a c 24%nat)
 (vmulc_lane vl a c 25%nat)
 (vmulc_lane vl a c 26%nat)
 (vmulc_lane vl a c 27%nat)
 (vmulc_lane vl a c 28%nat)
 (vmulc_lane vl a c 29%nat)
 (vmulc_lane vl a c 30%nat)
 (vmulc_lane vl a c 31%nat).
Lemma vmulc_packed_prefix : forall vl a c,
 0<=vl<=32 -> vl<=Zlength a ->
 rvv_take vl (vmulc_packed vl a c)=vmulc_values vl a c.
Proof. exact vmulc_result_prefix. Qed.
Lemma vmulc_append : forall k vl a c, 0<=k -> 0<=vl ->
 vmulc_values (k+vl) a c = vmulc_values k a c ++
 vmulc_values vl (sublist k (k+vl) a) c.
Proof.
 intros k vl a c Hk Hv. unfold vmulc_values, sublist.
 rewrite skipn_firstn_comm, Z2Nat.inj_add by lia.
 replace (Z.to_nat k + Z.to_nat vl - Z.to_nat k)%nat with (Z.to_nat vl) by lia.
 rewrite <- !firstn_map, <- skipn_map.
 rewrite firstn_firstn, Nat.min_id.
 rewrite <- firstn_skipn with (n:=Z.to_nat k) (l:=firstn (Z.to_nat k + Z.to_nat vl) (map (fun x=>fp32_mul x c) a)) at 1.
 rewrite firstn_firstn. rewrite Nat.min_l by lia.
 rewrite skipn_firstn_comm.
 replace (Z.to_nat k + Z.to_nat vl - Z.to_nat k)%nat with (Z.to_nat vl) by lia.
 reflexivity.
Qed.
