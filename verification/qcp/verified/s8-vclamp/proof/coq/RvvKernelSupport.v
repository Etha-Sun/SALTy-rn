From Coq Require Import ZArith Lia List.
From S8Clamp Require Export RvvFrame RvvKernelFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma s8_rvv_full_index_valid : forall p n xs i,
 0<=i<n -> CharArray.full p n xs |--
 “ 0<=p+i /\ p+i<=18446744073709551615 ”.
Proof.
 intros p n xs i Hi.
 sep_apply (CharArray.full_split_to_missing_i p i n xs 0 Hi).
 unfold StoreCharAsElement.storeA.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 replace(i*1)with i by lia.
 prop_apply (valid_store_char (p+i) (Znth i xs 0)). Intros_p Hv.
 unfold isvalidptr_char in Hv.
 change addr_max_unsigned with 18446744073709551615 in Hv.
 entailer!.
Qed.
Lemma s8_rvv_undef_index_valid : forall p n i,
 0<=i<n -> CharArray.undef_full p n |--
 “ 0<=p+i /\ p+i<=18446744073709551615 ”.
Proof.
 intros p n i Hi.
 sep_apply (CharArray.undef_full_split_to_undef_missing_i p i n Hi).
 unfold StoreCharAsElement.undefstoreA.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 replace(i*1)with i by lia.
 unfold undef_store_char. Intros_p Hv.
 unfold isvalidptr_char in Hv.
 change addr_max_unsigned with 18446744073709551615 in Hv.
 entailer!.
Qed.
Lemma s8_rvv_uintptr_add : forall p b,
 0<=p -> 0<=b -> p+b<18446744073709551616 ->
 unsigned_last_nbits(unsigned_last_nbits p 64+b)64=p+b.
Proof.
 intros. rewrite (unsigned_last_nbits_eq p 64 ltac:(change (0<=p<18446744073709551616);lia)).
 apply unsigned_last_nbits_eq. change (0<=p+b<18446744073709551616);lia.
Qed.
Lemma s8_rvv_output_init : forall p n lo hi A,
 CharArray.undef_full p n |--
 CharArray.full p 0(s8_rvv_progress 0 n lo hi A) ** CharArray.undef_full p n.
Proof.
 intros. unfold s8_rvv_progress. rewrite s8_rvv_prefix_zero.
 unfold CharArray.full,store_array. cbn [store_array_rec]. entailer!.
Qed.
Lemma s8_rvv_progress_merge : forall p k r n lo hi A,
 0<=k -> 0<=r -> k+r<=n -> 0<=n<=Zlength A ->
 CharArray.full p k(s8_rvv_progress k n lo hi A) **
 CharArray.full(p+k)r(map(fun i=>Znth(k+Z.of_nat i)(s8_values n lo hi A)0)(seq 0(Z.to_nat r))) |--
 CharArray.full p(k+r)(s8_rvv_progress(k+r)n lo hi A).
Proof.
 intros. rewrite s8_rvv_progress_append by assumption.
 pose proof (CharArray.full_merge_to_full p k(k+r)
 (s8_rvv_progress k n lo hi A)
 (map(fun i=>Znth(k+Z.of_nat i)(s8_values n lo hi A)0)(seq 0(Z.to_nat r))) ltac:(lia)) as HH.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HH.
 replace(k+r-k)with r in HH by lia. replace(k*1)with k in HH by lia. exact HH.
Qed.
Lemma s8_rvv_bulk_output_merge : forall p k r n lo hi A,
 0<=k -> 0<=r<=128 -> k+r<=s8_bulk_count n -> 0<=n<=Zlength A ->
 CharArray.full p k(s8_rvv_progress k n lo hi A) **
 CharArray.full(p+k)r(s8_rvv_prefix r(map(fun i=>s8_rvv_min_lane
 (s8_rvv_max_lane(s8_read_lane(Z.of_nat i)r k A)lo(Z.of_nat i)r)
 hi(Z.of_nat i)r)(seq 0 128))) |--
 CharArray.full p(k+r)(s8_rvv_progress(k+r)n lo hi A).
Proof.
 intros. rewrite(s8_rvv_bulk_seq k r n lo hi A)by assumption.
 apply s8_rvv_progress_merge;try lia.
 pose proof(s8_bulk_count_bounds n ltac:(lia));lia.
Qed.
Lemma s8_rvv_tail_output_merge : forall p k r n lo hi A,
 s8_bulk_count n<=k -> 0<=r<=128 -> k+r<=n -> 0<=n<=Zlength A ->
 CharArray.full p k(s8_rvv_progress k n lo hi A) **
 CharArray.full(p+k)r(s8_rvv_prefix r(map(fun i=>s8_rvv_max_lane
 (s8_rvv_min_lane(s8_read_lane(Z.of_nat i)r k A)hi(Z.of_nat i)r)
 lo(Z.of_nat i)r)(seq 0 128))) |--
 CharArray.full p(k+r)(s8_rvv_progress(k+r)n lo hi A).
Proof.
 intros. rewrite(s8_rvv_tail_seq k r n lo hi A)by assumption.
 apply s8_rvv_progress_merge;try lia.
 pose proof(s8_bulk_count_bounds n ltac:(lia));lia.
Qed.
Print Assumptions s8_rvv_full_index_valid.
Print Assumptions s8_rvv_undef_index_valid.
Print Assumptions s8_rvv_uintptr_add.
Print Assumptions s8_rvv_output_init.
Print Assumptions s8_rvv_progress_merge.
Print Assumptions s8_rvv_bulk_output_merge.
Print Assumptions s8_rvv_tail_output_merge.
