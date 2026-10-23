From Coq Require Import ZArith Lia List.
From Qu8Cvt Require Export ProgramFacts FastFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma cvt_seed_actual : forall z,
 signed_last_nbits(0-unsigned_last_nbits z 32)16=cvt_seed z.
Proof. intros;unfold cvt_seed;rewrite signed_unsigned_revolutive_less by lia;reflexivity. Qed.
Lemma cvt_float_full_append : forall p n r L R,
 0<=n -> 0<=r ->
 FloatArray.full p n L ** FloatArray.full(p+4*n)r R |-- FloatArray.full p(n+r)(L++R).
Proof.
 intros p n r L R Hn Hr.
 pose proof(FloatArray.full_merge_to_full p n(n+r)L R ltac:(lia))as H.
 unfold StoreFloatAsElement.sizeA in H;rewrite sizeof_float in H.
 replace(p+n*4)with(p+4*n)in H by lia.
 replace(n+r-n)with r in H by lia. exact H.
Qed.
(* Pure total-list algebra only: defaults remain explicit. Actual input reads
   are independently guarded by the unchanged n+7 UCharArray C contracts. *)
Lemma cvt_values_append_total : forall k r A z scale,
 0<=k -> 0<=r ->
 cvt_values(k+r)A z scale=cvt_values k A z scale++cvt_chunk k r A z scale.
Proof.
 intros k r A z scale Hk Hr. unfold cvt_values.
 rewrite Z2Nat.inj_add by lia. rewrite seq_app,map_app. f_equal.
 apply List.nth_ext with(d:=Z_to_fp32 0)(d':=Z_to_fp32 0).
 - unfold cvt_chunk;rewrite !map_length,!seq_length;reflexivity.
 - intros i Hi. rewrite map_length,seq_length in Hi.
   rewrite cvt_map_seq_nth by assumption.
   rewrite <-(Nat2Z.id i) at 2.
   change(cvt_neon_lane(nth(Z.to_nat k+i)A 0)z scale=
    Znth(Z.of_nat i)(cvt_chunk k r A z scale)(Z_to_fp32 0)).
   rewrite cvt_chunk_nth by lia. unfold Znth.
   rewrite Z2Nat.inj_add,Nat2Z.id by lia. reflexivity.
Qed.
Lemma cvt_prefix_append : forall p k r A z scale,
 0<=k -> 0<=r ->
 FloatArray.full p k(cvt_values k A z scale) **
 FloatArray.full(p+4*k)r(cvt_chunk k r A z scale) |--
 FloatArray.full p(k+r)(cvt_values(k+r)A z scale).
Proof.
 intros. rewrite cvt_values_append_total by assumption.
 apply cvt_float_full_append;assumption.
Qed.
Lemma cvt_float_full0_cells : forall p,FloatArray.full p 0 [] --||-- emp.
Proof. intros;unfold FloatArray.full,store_array;cbn[store_array_rec];split;entailer!. Qed.
Lemma cvt_float_undef0_cells : forall p,FloatArray.undef_full p 0 --||-- emp.
Proof. intros;unfold FloatArray.undef_full,store_undef_array;change(Z.to_nat 0)with(0%nat);cbn[store_undef_array_rec];split;entailer!. Qed.

Lemma cvt_float_full1_cells : forall p (x0:fp32),FloatArray.full p 1[x0] --||-- (p+4*0) # Float |-> x0.
Proof. intros;unfold FloatArray.full,store_array;cbn[store_array_rec];unfold StoreFloatAsElement.storeA;rewrite ?sizeof_float;split;entailer!. Qed.
Lemma cvt_float_undef1_cells : forall p,FloatArray.undef_full p 1 --||-- (p+4*0) # Float |->_.
Proof. intros;unfold FloatArray.undef_full,store_undef_array;change(Z.to_nat 1)with(1%nat);cbn[store_undef_array_rec];unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;split;entailer!. Qed.
Print Assumptions cvt_float_full1_cells.
Print Assumptions cvt_float_undef1_cells.
Lemma cvt_prefix_cells1 : forall p k A z scale,0<=k ->
 FloatArray.full p k(cvt_values k A z scale) ** (((p+4*k)+4*0) # Float |-> cvt_neon_lane(Znth(k+0)A 0)z scale) |--
 FloatArray.full p(k+1)(cvt_values(k+1)A z scale).
Proof.
 intros. rewrite <-(cvt_float_full1_cells(p+4*k)(cvt_neon_lane(Znth(k+0)A 0)z scale)).
 change(FloatArray.full p k(cvt_values k A z scale) ** FloatArray.full(p+4*k)1(cvt_chunk k 1 A z scale) |-- FloatArray.full p(k+1)(cvt_values(k+1)A z scale)).
 apply cvt_prefix_append;lia.
Qed.
Print Assumptions cvt_prefix_cells1.

Lemma cvt_float_full2_cells : forall p (x0:fp32) (x1:fp32),FloatArray.full p 2[x0;x1] --||-- (p+4*0) # Float |-> x0 ** (p+4*1) # Float |-> x1.
Proof. intros;unfold FloatArray.full,store_array;cbn[store_array_rec];unfold StoreFloatAsElement.storeA;rewrite ?sizeof_float;split;entailer!. Qed.
Lemma cvt_float_undef2_cells : forall p,FloatArray.undef_full p 2 --||-- (p+4*0) # Float |->_ ** (p+4*1) # Float |->_.
Proof. intros;unfold FloatArray.undef_full,store_undef_array;change(Z.to_nat 2)with(2%nat);cbn[store_undef_array_rec];unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;split;entailer!. Qed.
Print Assumptions cvt_float_full2_cells.
Print Assumptions cvt_float_undef2_cells.
Lemma cvt_prefix_cells2 : forall p k A z scale,0<=k ->
 FloatArray.full p k(cvt_values k A z scale) ** (((p+4*k)+4*0) # Float |-> cvt_neon_lane(Znth(k+0)A 0)z scale ** ((p+4*k)+4*1) # Float |-> cvt_neon_lane(Znth(k+1)A 0)z scale) |--
 FloatArray.full p(k+2)(cvt_values(k+2)A z scale).
Proof.
 intros. rewrite <-(cvt_float_full2_cells(p+4*k)(cvt_neon_lane(Znth(k+0)A 0)z scale) (cvt_neon_lane(Znth(k+1)A 0)z scale)).
 change(FloatArray.full p k(cvt_values k A z scale) ** FloatArray.full(p+4*k)2(cvt_chunk k 2 A z scale) |-- FloatArray.full p(k+2)(cvt_values(k+2)A z scale)).
 apply cvt_prefix_append;lia.
Qed.
Print Assumptions cvt_prefix_cells2.

Lemma cvt_float_full3_cells : forall p (x0:fp32) (x1:fp32) (x2:fp32),FloatArray.full p 3[x0;x1;x2] --||-- (p+4*0) # Float |-> x0 ** (p+4*1) # Float |-> x1 ** (p+4*2) # Float |-> x2.
Proof. intros;unfold FloatArray.full,store_array;cbn[store_array_rec];unfold StoreFloatAsElement.storeA;rewrite ?sizeof_float;split;entailer!. Qed.
Lemma cvt_float_undef3_cells : forall p,FloatArray.undef_full p 3 --||-- (p+4*0) # Float |->_ ** (p+4*1) # Float |->_ ** (p+4*2) # Float |->_.
Proof. intros;unfold FloatArray.undef_full,store_undef_array;change(Z.to_nat 3)with(3%nat);cbn[store_undef_array_rec];unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;split;entailer!. Qed.
Print Assumptions cvt_float_full3_cells.
Print Assumptions cvt_float_undef3_cells.
Lemma cvt_prefix_cells3 : forall p k A z scale,0<=k ->
 FloatArray.full p k(cvt_values k A z scale) ** (((p+4*k)+4*0) # Float |-> cvt_neon_lane(Znth(k+0)A 0)z scale ** ((p+4*k)+4*1) # Float |-> cvt_neon_lane(Znth(k+1)A 0)z scale ** ((p+4*k)+4*2) # Float |-> cvt_neon_lane(Znth(k+2)A 0)z scale) |--
 FloatArray.full p(k+3)(cvt_values(k+3)A z scale).
Proof.
 intros. rewrite <-(cvt_float_full3_cells(p+4*k)(cvt_neon_lane(Znth(k+0)A 0)z scale) (cvt_neon_lane(Znth(k+1)A 0)z scale) (cvt_neon_lane(Znth(k+2)A 0)z scale)).
 change(FloatArray.full p k(cvt_values k A z scale) ** FloatArray.full(p+4*k)3(cvt_chunk k 3 A z scale) |-- FloatArray.full p(k+3)(cvt_values(k+3)A z scale)).
 apply cvt_prefix_append;lia.
Qed.
Print Assumptions cvt_prefix_cells3.

Lemma cvt_float_full4_cells : forall p (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32),FloatArray.full p 4[x0;x1;x2;x3] --||-- (p+4*0) # Float |-> x0 ** (p+4*1) # Float |-> x1 ** (p+4*2) # Float |-> x2 ** (p+4*3) # Float |-> x3.
Proof. intros;unfold FloatArray.full,store_array;cbn[store_array_rec];unfold StoreFloatAsElement.storeA;rewrite ?sizeof_float;split;entailer!. Qed.
Lemma cvt_float_undef4_cells : forall p,FloatArray.undef_full p 4 --||-- (p+4*0) # Float |->_ ** (p+4*1) # Float |->_ ** (p+4*2) # Float |->_ ** (p+4*3) # Float |->_.
Proof. intros;unfold FloatArray.undef_full,store_undef_array;change(Z.to_nat 4)with(4%nat);cbn[store_undef_array_rec];unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;split;entailer!. Qed.
Print Assumptions cvt_float_full4_cells.
Print Assumptions cvt_float_undef4_cells.
Lemma cvt_prefix_cells4 : forall p k A z scale,0<=k ->
 FloatArray.full p k(cvt_values k A z scale) ** (((p+4*k)+4*0) # Float |-> cvt_neon_lane(Znth(k+0)A 0)z scale ** ((p+4*k)+4*1) # Float |-> cvt_neon_lane(Znth(k+1)A 0)z scale ** ((p+4*k)+4*2) # Float |-> cvt_neon_lane(Znth(k+2)A 0)z scale ** ((p+4*k)+4*3) # Float |-> cvt_neon_lane(Znth(k+3)A 0)z scale) |--
 FloatArray.full p(k+4)(cvt_values(k+4)A z scale).
Proof.
 intros. rewrite <-(cvt_float_full4_cells(p+4*k)(cvt_neon_lane(Znth(k+0)A 0)z scale) (cvt_neon_lane(Znth(k+1)A 0)z scale) (cvt_neon_lane(Znth(k+2)A 0)z scale) (cvt_neon_lane(Znth(k+3)A 0)z scale)).
 change(FloatArray.full p k(cvt_values k A z scale) ** FloatArray.full(p+4*k)4(cvt_chunk k 4 A z scale) |-- FloatArray.full p(k+4)(cvt_values(k+4)A z scale)).
 apply cvt_prefix_append;lia.
Qed.
Print Assumptions cvt_prefix_cells4.

Lemma cvt_float_full5_cells : forall p (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32),FloatArray.full p 5[x0;x1;x2;x3;x4] --||-- (p+4*0) # Float |-> x0 ** (p+4*1) # Float |-> x1 ** (p+4*2) # Float |-> x2 ** (p+4*3) # Float |-> x3 ** (p+4*4) # Float |-> x4.
Proof. intros;unfold FloatArray.full,store_array;cbn[store_array_rec];unfold StoreFloatAsElement.storeA;rewrite ?sizeof_float;split;entailer!. Qed.
Lemma cvt_float_undef5_cells : forall p,FloatArray.undef_full p 5 --||-- (p+4*0) # Float |->_ ** (p+4*1) # Float |->_ ** (p+4*2) # Float |->_ ** (p+4*3) # Float |->_ ** (p+4*4) # Float |->_.
Proof. intros;unfold FloatArray.undef_full,store_undef_array;change(Z.to_nat 5)with(5%nat);cbn[store_undef_array_rec];unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;split;entailer!. Qed.
Print Assumptions cvt_float_full5_cells.
Print Assumptions cvt_float_undef5_cells.
Lemma cvt_prefix_cells5 : forall p k A z scale,0<=k ->
 FloatArray.full p k(cvt_values k A z scale) ** (((p+4*k)+4*0) # Float |-> cvt_neon_lane(Znth(k+0)A 0)z scale ** ((p+4*k)+4*1) # Float |-> cvt_neon_lane(Znth(k+1)A 0)z scale ** ((p+4*k)+4*2) # Float |-> cvt_neon_lane(Znth(k+2)A 0)z scale ** ((p+4*k)+4*3) # Float |-> cvt_neon_lane(Znth(k+3)A 0)z scale ** ((p+4*k)+4*4) # Float |-> cvt_neon_lane(Znth(k+4)A 0)z scale) |--
 FloatArray.full p(k+5)(cvt_values(k+5)A z scale).
Proof.
 intros. rewrite <-(cvt_float_full5_cells(p+4*k)(cvt_neon_lane(Znth(k+0)A 0)z scale) (cvt_neon_lane(Znth(k+1)A 0)z scale) (cvt_neon_lane(Znth(k+2)A 0)z scale) (cvt_neon_lane(Znth(k+3)A 0)z scale) (cvt_neon_lane(Znth(k+4)A 0)z scale)).
 change(FloatArray.full p k(cvt_values k A z scale) ** FloatArray.full(p+4*k)5(cvt_chunk k 5 A z scale) |-- FloatArray.full p(k+5)(cvt_values(k+5)A z scale)).
 apply cvt_prefix_append;lia.
Qed.
Print Assumptions cvt_prefix_cells5.

Lemma cvt_float_full6_cells : forall p (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32),FloatArray.full p 6[x0;x1;x2;x3;x4;x5] --||-- (p+4*0) # Float |-> x0 ** (p+4*1) # Float |-> x1 ** (p+4*2) # Float |-> x2 ** (p+4*3) # Float |-> x3 ** (p+4*4) # Float |-> x4 ** (p+4*5) # Float |-> x5.
Proof. intros;unfold FloatArray.full,store_array;cbn[store_array_rec];unfold StoreFloatAsElement.storeA;rewrite ?sizeof_float;split;entailer!. Qed.
Lemma cvt_float_undef6_cells : forall p,FloatArray.undef_full p 6 --||-- (p+4*0) # Float |->_ ** (p+4*1) # Float |->_ ** (p+4*2) # Float |->_ ** (p+4*3) # Float |->_ ** (p+4*4) # Float |->_ ** (p+4*5) # Float |->_.
Proof. intros;unfold FloatArray.undef_full,store_undef_array;change(Z.to_nat 6)with(6%nat);cbn[store_undef_array_rec];unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;split;entailer!. Qed.
Print Assumptions cvt_float_full6_cells.
Print Assumptions cvt_float_undef6_cells.
Lemma cvt_prefix_cells6 : forall p k A z scale,0<=k ->
 FloatArray.full p k(cvt_values k A z scale) ** (((p+4*k)+4*0) # Float |-> cvt_neon_lane(Znth(k+0)A 0)z scale ** ((p+4*k)+4*1) # Float |-> cvt_neon_lane(Znth(k+1)A 0)z scale ** ((p+4*k)+4*2) # Float |-> cvt_neon_lane(Znth(k+2)A 0)z scale ** ((p+4*k)+4*3) # Float |-> cvt_neon_lane(Znth(k+3)A 0)z scale ** ((p+4*k)+4*4) # Float |-> cvt_neon_lane(Znth(k+4)A 0)z scale ** ((p+4*k)+4*5) # Float |-> cvt_neon_lane(Znth(k+5)A 0)z scale) |--
 FloatArray.full p(k+6)(cvt_values(k+6)A z scale).
Proof.
 intros. rewrite <-(cvt_float_full6_cells(p+4*k)(cvt_neon_lane(Znth(k+0)A 0)z scale) (cvt_neon_lane(Znth(k+1)A 0)z scale) (cvt_neon_lane(Znth(k+2)A 0)z scale) (cvt_neon_lane(Znth(k+3)A 0)z scale) (cvt_neon_lane(Znth(k+4)A 0)z scale) (cvt_neon_lane(Znth(k+5)A 0)z scale)).
 change(FloatArray.full p k(cvt_values k A z scale) ** FloatArray.full(p+4*k)6(cvt_chunk k 6 A z scale) |-- FloatArray.full p(k+6)(cvt_values(k+6)A z scale)).
 apply cvt_prefix_append;lia.
Qed.
Print Assumptions cvt_prefix_cells6.

Lemma cvt_float_full7_cells : forall p (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32),FloatArray.full p 7[x0;x1;x2;x3;x4;x5;x6] --||-- (p+4*0) # Float |-> x0 ** (p+4*1) # Float |-> x1 ** (p+4*2) # Float |-> x2 ** (p+4*3) # Float |-> x3 ** (p+4*4) # Float |-> x4 ** (p+4*5) # Float |-> x5 ** (p+4*6) # Float |-> x6.
Proof. intros;unfold FloatArray.full,store_array;cbn[store_array_rec];unfold StoreFloatAsElement.storeA;rewrite ?sizeof_float;split;entailer!. Qed.
Lemma cvt_float_undef7_cells : forall p,FloatArray.undef_full p 7 --||-- (p+4*0) # Float |->_ ** (p+4*1) # Float |->_ ** (p+4*2) # Float |->_ ** (p+4*3) # Float |->_ ** (p+4*4) # Float |->_ ** (p+4*5) # Float |->_ ** (p+4*6) # Float |->_.
Proof. intros;unfold FloatArray.undef_full,store_undef_array;change(Z.to_nat 7)with(7%nat);cbn[store_undef_array_rec];unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;split;entailer!. Qed.
Print Assumptions cvt_float_full7_cells.
Print Assumptions cvt_float_undef7_cells.
Lemma cvt_prefix_cells7 : forall p k A z scale,0<=k ->
 FloatArray.full p k(cvt_values k A z scale) ** (((p+4*k)+4*0) # Float |-> cvt_neon_lane(Znth(k+0)A 0)z scale ** ((p+4*k)+4*1) # Float |-> cvt_neon_lane(Znth(k+1)A 0)z scale ** ((p+4*k)+4*2) # Float |-> cvt_neon_lane(Znth(k+2)A 0)z scale ** ((p+4*k)+4*3) # Float |-> cvt_neon_lane(Znth(k+3)A 0)z scale ** ((p+4*k)+4*4) # Float |-> cvt_neon_lane(Znth(k+4)A 0)z scale ** ((p+4*k)+4*5) # Float |-> cvt_neon_lane(Znth(k+5)A 0)z scale ** ((p+4*k)+4*6) # Float |-> cvt_neon_lane(Znth(k+6)A 0)z scale) |--
 FloatArray.full p(k+7)(cvt_values(k+7)A z scale).
Proof.
 intros. rewrite <-(cvt_float_full7_cells(p+4*k)(cvt_neon_lane(Znth(k+0)A 0)z scale) (cvt_neon_lane(Znth(k+1)A 0)z scale) (cvt_neon_lane(Znth(k+2)A 0)z scale) (cvt_neon_lane(Znth(k+3)A 0)z scale) (cvt_neon_lane(Znth(k+4)A 0)z scale) (cvt_neon_lane(Znth(k+5)A 0)z scale) (cvt_neon_lane(Znth(k+6)A 0)z scale)).
 change(FloatArray.full p k(cvt_values k A z scale) ** FloatArray.full(p+4*k)7(cvt_chunk k 7 A z scale) |-- FloatArray.full p(k+7)(cvt_values(k+7)A z scale)).
 apply cvt_prefix_append;lia.
Qed.
Print Assumptions cvt_prefix_cells7.

Lemma cvt_float_full8_cells : forall p (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32),FloatArray.full p 8[x0;x1;x2;x3;x4;x5;x6;x7] --||-- (p+4*0) # Float |-> x0 ** (p+4*1) # Float |-> x1 ** (p+4*2) # Float |-> x2 ** (p+4*3) # Float |-> x3 ** (p+4*4) # Float |-> x4 ** (p+4*5) # Float |-> x5 ** (p+4*6) # Float |-> x6 ** (p+4*7) # Float |-> x7.
Proof. intros;unfold FloatArray.full,store_array;cbn[store_array_rec];unfold StoreFloatAsElement.storeA;rewrite ?sizeof_float;split;entailer!. Qed.
Lemma cvt_float_undef8_cells : forall p,FloatArray.undef_full p 8 --||-- (p+4*0) # Float |->_ ** (p+4*1) # Float |->_ ** (p+4*2) # Float |->_ ** (p+4*3) # Float |->_ ** (p+4*4) # Float |->_ ** (p+4*5) # Float |->_ ** (p+4*6) # Float |->_ ** (p+4*7) # Float |->_.
Proof. intros;unfold FloatArray.undef_full,store_undef_array;change(Z.to_nat 8)with(8%nat);cbn[store_undef_array_rec];unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;split;entailer!. Qed.
Print Assumptions cvt_float_full8_cells.
Print Assumptions cvt_float_undef8_cells.
Lemma cvt_prefix_cells8 : forall p k A z scale,0<=k ->
 FloatArray.full p k(cvt_values k A z scale) ** (((p+4*k)+4*0) # Float |-> cvt_neon_lane(Znth(k+0)A 0)z scale ** ((p+4*k)+4*1) # Float |-> cvt_neon_lane(Znth(k+1)A 0)z scale ** ((p+4*k)+4*2) # Float |-> cvt_neon_lane(Znth(k+2)A 0)z scale ** ((p+4*k)+4*3) # Float |-> cvt_neon_lane(Znth(k+3)A 0)z scale ** ((p+4*k)+4*4) # Float |-> cvt_neon_lane(Znth(k+4)A 0)z scale ** ((p+4*k)+4*5) # Float |-> cvt_neon_lane(Znth(k+5)A 0)z scale ** ((p+4*k)+4*6) # Float |-> cvt_neon_lane(Znth(k+6)A 0)z scale ** ((p+4*k)+4*7) # Float |-> cvt_neon_lane(Znth(k+7)A 0)z scale) |--
 FloatArray.full p(k+8)(cvt_values(k+8)A z scale).
Proof.
 intros. rewrite <-(cvt_float_full8_cells(p+4*k)(cvt_neon_lane(Znth(k+0)A 0)z scale) (cvt_neon_lane(Znth(k+1)A 0)z scale) (cvt_neon_lane(Znth(k+2)A 0)z scale) (cvt_neon_lane(Znth(k+3)A 0)z scale) (cvt_neon_lane(Znth(k+4)A 0)z scale) (cvt_neon_lane(Znth(k+5)A 0)z scale) (cvt_neon_lane(Znth(k+6)A 0)z scale) (cvt_neon_lane(Znth(k+7)A 0)z scale)).
 change(FloatArray.full p k(cvt_values k A z scale) ** FloatArray.full(p+4*k)8(cvt_chunk k 8 A z scale) |-- FloatArray.full p(k+8)(cvt_values(k+8)A z scale)).
 apply cvt_prefix_append;lia.
Qed.
Print Assumptions cvt_prefix_cells8.
Print Assumptions cvt_seed_actual.
Print Assumptions cvt_float_full_append.
Print Assumptions cvt_values_append_total.
Print Assumptions cvt_prefix_append.

Ltac cvt_memory_frame :=
 rewrite ?local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;
   repeat first [assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac cvt_memory_or :=
 first [solve[cvt_memory_frame]
 |lazymatch goal with |- ?P |-- (?Q || ?R) =>
  first[solve[eapply(derivable1_trans P Q(Q||R));[cvt_memory_or|apply derivable1_orp_intros1]]
       |solve[eapply(derivable1_trans P R(Q||R));[cvt_memory_or|apply derivable1_orp_intros2]]]
  end].
