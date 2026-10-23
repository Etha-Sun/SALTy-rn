From Coq Require Import ZArith Lia List.
From QcpRvv32 Require Import RvvStoreModel RvvResultBridge.
From AUXLib Require Import ListLib.
From VLRelu Require Import Model RvvModel.
Import ListNotations.
Local Open Scope Z_scope.
Lemma rvv_signed_select : forall x c,
 (if Z.eqb (if Z.ltb (rvv_signed_bits x) 0 then 1 else 0) 0 then x else fp32_mul x c) = vlrelu_scalar x c.
Proof.
 intros x c. pose proof (bits_of_float_value_range x (bits_of_fp32 x) eq_refl) as Hrange.
 change (0 <= bits_of_fp32 x <= 4294967295) in Hrange.
 unfold rvv_signed_bits, vlrelu_scalar.
 destruct (Z.ltb_spec (bits_of_fp32 x) 2147483648);
 destruct (Z.ltb_spec 2147483647 (bits_of_fp32 x));
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y) end;
 cbn; try reflexivity; lia.
Qed.
Definition vlrelu_lane (vl:Z) (a:list fp32) (c:fp32) (i:nat) : fp32 :=
 rvv_merge (Z.of_nat i) vl (rvv_read_value (Z.of_nat i) vl a)
 (vlrelu_active_mul (Z.of_nat i) vl (rvv_read_value (Z.of_nat i) vl a) c)
 (rvv_mask (Z.of_nat i) vl (rvv_signed_bits (rvv_read_value (Z.of_nat i) vl a)) 0).
Definition vlrelu_result32 (vl:Z) (a:list fp32) (c:fp32) : list fp32 :=
 map (vlrelu_lane vl a c) (seq 0 32).
Lemma vlrelu_result_prefix : forall vl a c,
 0<=vl<=32 -> vl<=Zlength a ->
 rvv_take vl (vlrelu_result32 vl a c)=vlrelu_values vl a c.
Proof.
 intros vl a c Hv Ha. apply nth_ext with (d:=fp32_zero) (d':=fp32_zero).
 - unfold rvv_take, vlrelu_result32, vlrelu_values.
   rewrite !length_firstn, !length_map, length_seq, Zlength_correct in *.
   rewrite !Nat.min_l by lia. reflexivity.
 - intros i Hi. unfold rvv_take, vlrelu_result32 in *.
   rewrite length_firstn, length_map, length_seq in Hi.
   rewrite nth_firstn by lia. rewrite nth_map_seq_bounded by lia.
   unfold vlrelu_lane, rvv_merge, rvv_mask, vlrelu_active_mul, rvv_read_value.
   assert (Ht: (Z.of_nat i <? vl)=true) by (apply Z.ltb_lt;lia).
   rewrite Ht. rewrite rvv_signed_select. unfold Znth. rewrite Nat2Z.id.
   unfold vlrelu_values. rewrite nth_firstn by lia.
   symmetry. rewrite nth_indep with (d':=vlrelu_scalar fp32_zero c) by (rewrite length_map; rewrite Zlength_correct in Ha;lia).
   exact (map_nth (fun x=>vlrelu_scalar x c) a fp32_zero i).
Qed.
Definition vlrelu_packed (vl:Z) (a:list fp32) (c:fp32) : list fp32 :=
 rvv_pack32
 (vlrelu_lane vl a c 0%nat)
 (vlrelu_lane vl a c 1%nat)
 (vlrelu_lane vl a c 2%nat)
 (vlrelu_lane vl a c 3%nat)
 (vlrelu_lane vl a c 4%nat)
 (vlrelu_lane vl a c 5%nat)
 (vlrelu_lane vl a c 6%nat)
 (vlrelu_lane vl a c 7%nat)
 (vlrelu_lane vl a c 8%nat)
 (vlrelu_lane vl a c 9%nat)
 (vlrelu_lane vl a c 10%nat)
 (vlrelu_lane vl a c 11%nat)
 (vlrelu_lane vl a c 12%nat)
 (vlrelu_lane vl a c 13%nat)
 (vlrelu_lane vl a c 14%nat)
 (vlrelu_lane vl a c 15%nat)
 (vlrelu_lane vl a c 16%nat)
 (vlrelu_lane vl a c 17%nat)
 (vlrelu_lane vl a c 18%nat)
 (vlrelu_lane vl a c 19%nat)
 (vlrelu_lane vl a c 20%nat)
 (vlrelu_lane vl a c 21%nat)
 (vlrelu_lane vl a c 22%nat)
 (vlrelu_lane vl a c 23%nat)
 (vlrelu_lane vl a c 24%nat)
 (vlrelu_lane vl a c 25%nat)
 (vlrelu_lane vl a c 26%nat)
 (vlrelu_lane vl a c 27%nat)
 (vlrelu_lane vl a c 28%nat)
 (vlrelu_lane vl a c 29%nat)
 (vlrelu_lane vl a c 30%nat)
 (vlrelu_lane vl a c 31%nat).
Lemma vlrelu_packed_prefix : forall vl a c,
 0<=vl<=32 -> vl<=Zlength a ->
 rvv_take vl (vlrelu_packed vl a c)=vlrelu_values vl a c.
Proof. exact vlrelu_result_prefix. Qed.
Lemma vlrelu_append : forall k vl a c, 0<=k -> 0<=vl ->
 vlrelu_values (k+vl) a c = vlrelu_values k a c ++
 vlrelu_values vl (sublist k (k+vl) a) c.
Proof.
 intros k vl a c Hk Hv. unfold vlrelu_values, sublist.
 rewrite skipn_firstn_comm, Z2Nat.inj_add by lia.
 replace (Z.to_nat k + Z.to_nat vl - Z.to_nat k)%nat with (Z.to_nat vl) by lia.
 rewrite <- !firstn_map, <- skipn_map.
 rewrite firstn_firstn, Nat.min_id.
 rewrite <- firstn_skipn with (n:=Z.to_nat k) (l:=firstn (Z.to_nat k + Z.to_nat vl) (map (fun x=>vlrelu_scalar x c) a)) at 1.
 rewrite firstn_firstn. rewrite Nat.min_l by lia.
 rewrite skipn_firstn_comm.
 replace (Z.to_nat k + Z.to_nat vl - Z.to_nat k)%nat with (Z.to_nat vl) by lia.
 reflexivity.
Qed.
