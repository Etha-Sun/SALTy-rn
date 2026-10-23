From Coq Require Import ZArith Lia List.
From Qu8Cvt Require Export UnsignedProgramFacts.
From QcpRvv32 Require Import RvvStoreModel RvvResultBridge.
From AUXLib Require Import ListLib.
Import ListNotations.
Local Open Scope Z_scope.
Definition cvt_result_lane(k vl:Z)(A:list Z)(z:Z)(scale:fp32)(i:nat):fp32 :=
 cvt_active_mul(Z.of_nat i)vl(cvt_active_float(Z.of_nat i)vl(cvt_active_int(Z.of_nat i)vl
 (cvt_s16(cvt_active_add_u16(Z.of_nat i)vl(cvt_active_int(Z.of_nat i)vl
 (cvt_read_lane(Z.of_nat i)vl k A))(cvt_seed_u16 z)))))scale.
Definition cvt_result32 k vl A z scale := map(cvt_result_lane k vl A z scale)(seq 0 32).
Lemma cvt_result_prefix : forall k vl A z scale,
 0<=vl<=32 -> rvv_take vl(cvt_result32 k vl A z scale)=cvt_chunk k vl A z scale.
Proof.
 intros k vl A z scale Hv. apply nth_ext with(d:=Z_to_fp32 0)(d':=Z_to_fp32 0).
 - unfold rvv_take,cvt_result32. rewrite length_firstn,length_map,length_seq.
   rewrite Nat.min_l by lia.
   pose proof(cvt_chunk_length k vl A z scale ltac:(lia))as Hlen.
   rewrite Zlength_correct in Hlen;lia.
 - intros i Hi. unfold rvv_take,cvt_result32 in *.
   rewrite length_firstn,length_map,length_seq in Hi.
   rewrite nth_firstn by lia. rewrite nth_map_seq_bounded by lia.
   unfold cvt_result_lane. rewrite cvt_unsigned_active_chain by lia.
   rewrite cvt_read_lane_active by lia.
   rewrite <-(Nat2Z.id i) at 2.
   change(cvt_neon_lane(Znth(k+Z.of_nat i)A 0)z scale=
     Znth(Z.of_nat i)(cvt_chunk k vl A z scale)(Z_to_fp32 0)).
   rewrite cvt_chunk_nth by lia. reflexivity.
Qed.
Definition cvt_result_packed k vl A z scale := rvv_pack32
 (cvt_result_lane k vl A z scale 0%nat)
 (cvt_result_lane k vl A z scale 1%nat)
 (cvt_result_lane k vl A z scale 2%nat)
 (cvt_result_lane k vl A z scale 3%nat)
 (cvt_result_lane k vl A z scale 4%nat)
 (cvt_result_lane k vl A z scale 5%nat)
 (cvt_result_lane k vl A z scale 6%nat)
 (cvt_result_lane k vl A z scale 7%nat)
 (cvt_result_lane k vl A z scale 8%nat)
 (cvt_result_lane k vl A z scale 9%nat)
 (cvt_result_lane k vl A z scale 10%nat)
 (cvt_result_lane k vl A z scale 11%nat)
 (cvt_result_lane k vl A z scale 12%nat)
 (cvt_result_lane k vl A z scale 13%nat)
 (cvt_result_lane k vl A z scale 14%nat)
 (cvt_result_lane k vl A z scale 15%nat)
 (cvt_result_lane k vl A z scale 16%nat)
 (cvt_result_lane k vl A z scale 17%nat)
 (cvt_result_lane k vl A z scale 18%nat)
 (cvt_result_lane k vl A z scale 19%nat)
 (cvt_result_lane k vl A z scale 20%nat)
 (cvt_result_lane k vl A z scale 21%nat)
 (cvt_result_lane k vl A z scale 22%nat)
 (cvt_result_lane k vl A z scale 23%nat)
 (cvt_result_lane k vl A z scale 24%nat)
 (cvt_result_lane k vl A z scale 25%nat)
 (cvt_result_lane k vl A z scale 26%nat)
 (cvt_result_lane k vl A z scale 27%nat)
 (cvt_result_lane k vl A z scale 28%nat)
 (cvt_result_lane k vl A z scale 29%nat)
 (cvt_result_lane k vl A z scale 30%nat)
 (cvt_result_lane k vl A z scale 31%nat).
Lemma cvt_result_packed_prefix : forall k vl A z scale,
 0<=vl<=32 -> rvv_take vl(cvt_result_packed k vl A z scale)=cvt_chunk k vl A z scale.
Proof. exact cvt_result_prefix. Qed.
Print Assumptions cvt_result_prefix.
Print Assumptions cvt_result_packed_prefix.
