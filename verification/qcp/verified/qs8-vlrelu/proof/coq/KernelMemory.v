From Coq Require Import ZArith Lia List.
From Qs8Lrelu Require Export KernelFrame.
Import Snaive_C_Rules64.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qcv_seed_cast : forall m,
 signed_last_nbits(0-unsigned_last_nbits m 32)16=qcv_seed m.
Proof. intros;unfold qcv_seed;rewrite signed_unsigned_revolutive_less by lia;reflexivity. Qed.
Lemma qcv_output_init : forall p n z pm nm o A,
 CharArray.undef_full p n |-- CharArray.full p 0(qlr_values 0 z pm nm o A) ** CharArray.undef_full p n.
Proof. intros;rewrite qlr_values_zero;unfold CharArray.full,store_array;cbn[store_array_rec];entailer!. Qed.
Lemma qcv_output_append : forall p k r z pm nm o A,
 0<=k -> 0<=r -> k+r<=Zlength A ->
 CharArray.full p k(qlr_values k z pm nm o A) ** CharArray.seg(p+k)0 r(qlr_chunk k r z pm nm o A) |--
 CharArray.full p(k+r)(qlr_values(k+r)z pm nm o A).
Proof.
 intros p k r z pm nm o A Hk Hr Hb.
 sep_apply(CharArray.seg_to_full(p+k)0 r(qlr_chunk k r z pm nm o A)).
 rewrite sizeof_char;replace(p+k+0*1)with(p+k)by lia;rewrite Z.sub_0_r.
 pose proof(CharArray.full_merge_to_full p k(k+r)(qlr_values k z pm nm o A)(qlr_chunk k r z pm nm o A)ltac:(lia))as HH.
 rewrite sizeof_char in HH;replace(k+r-k)with r in HH by lia;replace(p+k*1)with(p+k)in HH by lia.
 rewrite <-qlr_values_append in HH by assumption;rewrite logic_equiv_sepcon_comm;exact HH.
Qed.
Lemma qcv_full_index_valid : forall p n xs i,
 0<=i<n -> CharArray.full p n xs |-- “ 0<=p+i /\ p+i<=18446744073709551615 ”.
Proof.
 intros p n xs i Hi;sep_apply(CharArray.full_split_to_missing_i p i n xs 0 Hi).
 unfold StoreCharAsElement.storeA;rewrite sizeof_char;replace(i*1)with i by lia.
 prop_apply(valid_store_char(p+i)(Znth i xs 0));Intros_p Hv.
 unfold isvalidptr_char in Hv;change addr_max_unsigned with 18446744073709551615 in Hv;entailer!.
Qed.
Lemma qcv_undef_index_valid : forall p n i,
 0<=i<n -> CharArray.undef_full p n |-- “ 0<=p+i /\ p+i<=18446744073709551615 ”.
Proof.
 intros p n i Hi;sep_apply(CharArray.undef_full_split_to_undef_missing_i p i n Hi).
 unfold StoreCharAsElement.undefstoreA;rewrite sizeof_char;replace(i*1)with i by lia.
 unfold undef_store_char;Intros_p Hv;unfold isvalidptr_char in Hv;
 change addr_max_unsigned with 18446744073709551615 in Hv;entailer!.
Qed.
