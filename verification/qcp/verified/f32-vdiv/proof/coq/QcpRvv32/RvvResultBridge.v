From Coq Require Import ZArith Lia List.
From QcpRvv32 Require Import RvvStoreModel.
Require Import VaddSegments.
From AUXLib Require Import ListLib.
Import ListNotations.
Local Open Scope Z_scope.

Definition rvv_result_lane (vl:Z) (a b:list fp32) (i:nat) : fp32 :=
  vadd_active_div (Z.of_nat i) vl
    (rvv_read_value (Z.of_nat i) vl a) (rvv_read_value (Z.of_nat i) vl b).
Definition rvv_result32 (vl:Z) (a b:list fp32) : list fp32 :=
  map (rvv_result_lane vl a b) (seq 0 32).

Lemma nth_map_seq_bounded {T} : forall (f:nat -> T) count i d,
  (i < count)%nat -> nth i (map f (seq 0 count)) d = f i.
Proof.
 intros f count i d Hi.
 rewrite nth_indep with (d' := f 0%nat) by (rewrite length_map, length_seq; lia).
 rewrite map_nth. rewrite seq_nth by lia. f_equal; lia.
Qed.

Lemma rvv_result_prefix : forall vl (a b:list fp32),
  0 <= vl <= 32 -> vl <= Zlength a -> vl <= Zlength b ->
  rvv_take vl (rvv_result32 vl a b) = vadd_values vl a b.
Proof.
 intros vl a b Hvl Ha Hb.
 apply nth_ext with (d:=fp32_zero) (d':=fp32_zero).
 - unfold rvv_take, rvv_result32. rewrite length_firstn, length_map, length_seq.
   rewrite Nat.min_l by lia.
   pose proof (vadd_values_length vl a b ltac:(lia) Ha Hb) as Hlen.
   rewrite Zlength_correct in Hlen. lia.
 - intros i Hi. unfold rvv_take, rvv_result32 in *.
   rewrite length_firstn, length_map, length_seq in Hi.
   rewrite nth_firstn by lia. rewrite nth_map_seq_bounded by lia.
   unfold rvv_result_lane, vadd_active_div, rvv_read_value.
   assert (Hlt : (Z.of_nat i <? vl) = true) by (apply Z.ltb_lt; lia).
   rewrite Hlt.
   pose proof (vadd_values_nth vl (Z.of_nat i) a b fp32_zero fp32_zero fp32_zero ltac:(lia) Ha Hb) as Hnth.
   unfold Znth in Hnth. rewrite Nat2Z.id in Hnth. unfold Znth; rewrite Nat2Z.id. symmetry; exact Hnth.
Qed.

Print Assumptions nth_map_seq_bounded.
Print Assumptions rvv_result_prefix.

Definition rvv_result_packed (vl:Z) (a b:list fp32) : list fp32 :=
  rvv_pack32
    (rvv_result_lane vl a b 0%nat)
    (rvv_result_lane vl a b 1%nat)
    (rvv_result_lane vl a b 2%nat)
    (rvv_result_lane vl a b 3%nat)
    (rvv_result_lane vl a b 4%nat)
    (rvv_result_lane vl a b 5%nat)
    (rvv_result_lane vl a b 6%nat)
    (rvv_result_lane vl a b 7%nat)
    (rvv_result_lane vl a b 8%nat)
    (rvv_result_lane vl a b 9%nat)
    (rvv_result_lane vl a b 10%nat)
    (rvv_result_lane vl a b 11%nat)
    (rvv_result_lane vl a b 12%nat)
    (rvv_result_lane vl a b 13%nat)
    (rvv_result_lane vl a b 14%nat)
    (rvv_result_lane vl a b 15%nat)
    (rvv_result_lane vl a b 16%nat)
    (rvv_result_lane vl a b 17%nat)
    (rvv_result_lane vl a b 18%nat)
    (rvv_result_lane vl a b 19%nat)
    (rvv_result_lane vl a b 20%nat)
    (rvv_result_lane vl a b 21%nat)
    (rvv_result_lane vl a b 22%nat)
    (rvv_result_lane vl a b 23%nat)
    (rvv_result_lane vl a b 24%nat)
    (rvv_result_lane vl a b 25%nat)
    (rvv_result_lane vl a b 26%nat)
    (rvv_result_lane vl a b 27%nat)
    (rvv_result_lane vl a b 28%nat)
    (rvv_result_lane vl a b 29%nat)
    (rvv_result_lane vl a b 30%nat)
    (rvv_result_lane vl a b 31%nat).

Lemma rvv_packed_result_prefix : forall vl (a b:list fp32),
  0 <= vl <= 32 -> vl <= Zlength a -> vl <= Zlength b ->
  rvv_take vl (rvv_result_packed vl a b) = vadd_values vl a b.
Proof. exact rvv_result_prefix. Qed.
Print Assumptions rvv_packed_result_prefix.
