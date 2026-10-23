From Coq Require Import ZArith Lia List.
From QcpRvv32 Require Import RvvStoreModel.
From FMin Require Import ProgramModel RvvListSupport.
From AUXLib Require Import ListLib.
Import ListNotations.
Local Open Scope Z_scope.

Definition mm_result_lane (vl:Z) (a b:list fp32) (i:nat) : fp32 :=
  mm_repaired_active (Z.of_nat i) vl
    (rvv_read_value (Z.of_nat i) vl a) (rvv_read_value (Z.of_nat i) vl b).
Definition mm_result32 (vl:Z) (a b:list fp32) : list fp32 :=
  map (mm_result_lane vl a b) (seq 0 32).

Lemma nth_map_seq_bounded {T} : forall (f:nat -> T) count i d,
  (i < count)%nat -> nth i (map f (seq 0 count)) d = f i.
Proof.
 intros f count i d Hi.
 rewrite nth_indep with (d' := f 0%nat) by (rewrite length_map, length_seq; lia).
 rewrite map_nth. rewrite seq_nth by lia. f_equal; lia.
Qed.

Lemma mm_result_prefix : forall vl (a b:list fp32),
  0 <= vl <= 32 -> vl <= Zlength a -> vl <= Zlength b ->
  rvv_take vl (mm_result32 vl a b) = mm_rvv_values vl a b.
Proof.
 intros vl a b Hvl Ha Hb.
 apply nth_ext with (d:=fp32_zero) (d':=fp32_zero).
 - unfold rvv_take, mm_result32. rewrite length_firstn, length_map, length_seq.
   rewrite Nat.min_l by lia.
   pose proof (mm_rvv_values_length vl a b ltac:(lia) Ha Hb) as Hlen.
   rewrite Zlength_correct in Hlen. lia.
 - intros i Hi. unfold rvv_take, mm_result32 in *.
   rewrite length_firstn, length_map, length_seq in Hi.
   rewrite nth_firstn by lia. rewrite nth_map_seq_bounded by lia.
   unfold mm_result_lane.
   rewrite mm_repaired_active_lane by lia.
   unfold rvv_read_value.
   assert (Hlt : (Z.of_nat i <? vl) = true) by (apply Z.ltb_lt; lia).
   rewrite Hlt.
   pose proof (mm_rvv_values_nth vl (Z.of_nat i) a b fp32_zero fp32_zero fp32_zero ltac:(lia) Ha Hb) as Hnth.
   unfold Znth in Hnth. rewrite Nat2Z.id in Hnth. unfold Znth; rewrite Nat2Z.id. symmetry; exact Hnth.
Qed.

Print Assumptions nth_map_seq_bounded.
Print Assumptions mm_result_prefix.

Definition mm_result_packed (vl:Z) (a b:list fp32) : list fp32 :=
  rvv_pack32
    (mm_result_lane vl a b 0%nat)
    (mm_result_lane vl a b 1%nat)
    (mm_result_lane vl a b 2%nat)
    (mm_result_lane vl a b 3%nat)
    (mm_result_lane vl a b 4%nat)
    (mm_result_lane vl a b 5%nat)
    (mm_result_lane vl a b 6%nat)
    (mm_result_lane vl a b 7%nat)
    (mm_result_lane vl a b 8%nat)
    (mm_result_lane vl a b 9%nat)
    (mm_result_lane vl a b 10%nat)
    (mm_result_lane vl a b 11%nat)
    (mm_result_lane vl a b 12%nat)
    (mm_result_lane vl a b 13%nat)
    (mm_result_lane vl a b 14%nat)
    (mm_result_lane vl a b 15%nat)
    (mm_result_lane vl a b 16%nat)
    (mm_result_lane vl a b 17%nat)
    (mm_result_lane vl a b 18%nat)
    (mm_result_lane vl a b 19%nat)
    (mm_result_lane vl a b 20%nat)
    (mm_result_lane vl a b 21%nat)
    (mm_result_lane vl a b 22%nat)
    (mm_result_lane vl a b 23%nat)
    (mm_result_lane vl a b 24%nat)
    (mm_result_lane vl a b 25%nat)
    (mm_result_lane vl a b 26%nat)
    (mm_result_lane vl a b 27%nat)
    (mm_result_lane vl a b 28%nat)
    (mm_result_lane vl a b 29%nat)
    (mm_result_lane vl a b 30%nat)
    (mm_result_lane vl a b 31%nat).

Lemma mm_packed_result_prefix : forall vl (a b:list fp32),
  0 <= vl <= 32 -> vl <= Zlength a -> vl <= Zlength b ->
  rvv_take vl (mm_result_packed vl a b) = mm_rvv_values vl a b.
Proof. exact mm_result_prefix. Qed.
Print Assumptions mm_packed_result_prefix.
