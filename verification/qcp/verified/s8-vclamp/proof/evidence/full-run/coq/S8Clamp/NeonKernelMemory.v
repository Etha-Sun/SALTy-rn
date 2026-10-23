From Coq Require Import ZArith Lia List.
From S8Clamp Require Import MemoryModel SignedWindow ByteBridge.
Import Snaive_C_Rules64.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma s8_full_append : forall p n r L R,
 0<=n -> 0<=r ->
 CharArray.full p n L ** CharArray.full (p+n) r R |--
 CharArray.full p (n+r) (L++R).
Proof.
 intros p n r L R Hn Hr.
 pose proof (CharArray.full_merge_to_full p n (n+r) L R ltac:(lia)) as H.
 unfold StoreCharAsElement.sizeA in H;rewrite sizeof_char in H.
 replace (p+n*1) with (p+n) in H by lia.
 replace (n+r-n) with r in H by lia. exact H.
Qed.

Lemma s8_full_index_valid : forall p n L i d,
 0<=i<n -> CharArray.full p n L |--
 (“ -128<=Znth i L d<=127 /\ 0<=p+i<=18446744073709551615 ”) && CharArray.full p n L.
Proof.
 intros p n L i d Hi.
 apply _derivable1_andp_intros;[|apply derivable1_refl].
 sep_apply (s8_window_extract p i n L d Hi).
 prop_apply valid_store_char;Intros.
 unfold isvalidptr_char in *.
 change Byte.min_signed with (-128) in *.
 change Byte.max_signed with 127 in *.
 change addr_max_unsigned with 18446744073709551615 in *.
 entailer!.
Qed.

Lemma s8_undef_index_valid : forall p n i,
 0<=i<n -> CharArray.undef_full p n |--
 (“ 0<=p+i<=18446744073709551615 ”) && CharArray.undef_full p n.
Proof.
 intros p n i Hi.
 apply _derivable1_andp_intros;[|apply derivable1_refl].
 pose proof (CharArray.undef_full_split_to_undef_missing_i p i n Hi) as Hsplit.
 unfold StoreCharAsElement.undefstoreA in Hsplit;rewrite sizeof_char in Hsplit.
 replace (p+i*1) with (p+i) in Hsplit by lia.
 sep_apply Hsplit;prop_apply valid_undef_store_char;Intros.
 unfold isvalidptr_char in *.
 change addr_max_unsigned with 18446744073709551615 in *.
 entailer!.
Qed.
Print Assumptions s8_full_append.
Print Assumptions s8_full_index_valid.
Print Assumptions s8_undef_index_valid.

Lemma s8_undef1_cells : forall p, CharArray.undef_full p 1 --||-- (p+0) # Char |->_.
Proof. intros;unfold CharArray.undef_full,store_undef_array;change (Z.to_nat 1) with (1%nat);cbn [store_undef_array_rec];unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma s8_full1_cells : forall p (x0:Z), CharArray.full p 1 [x0] --||-- (p+0) # Char |-> x0.
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;split;entailer!. Qed.
Print Assumptions s8_undef1_cells.
Print Assumptions s8_full1_cells.

Lemma s8_undef2_cells : forall p, CharArray.undef_full p 2 --||-- (p+0) # Char |->_ ** (p+1) # Char |->_.
Proof. intros;unfold CharArray.undef_full,store_undef_array;change (Z.to_nat 2) with (2%nat);cbn [store_undef_array_rec];unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma s8_full2_cells : forall p (x0:Z) (x1:Z), CharArray.full p 2 [x0;x1] --||-- (p+0) # Char |-> x0 ** (p+1) # Char |-> x1.
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;split;entailer!. Qed.
Print Assumptions s8_undef2_cells.
Print Assumptions s8_full2_cells.

Lemma s8_undef3_cells : forall p, CharArray.undef_full p 3 --||-- (p+0) # Char |->_ ** (p+1) # Char |->_ ** (p+2) # Char |->_.
Proof. intros;unfold CharArray.undef_full,store_undef_array;change (Z.to_nat 3) with (3%nat);cbn [store_undef_array_rec];unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma s8_full3_cells : forall p (x0:Z) (x1:Z) (x2:Z), CharArray.full p 3 [x0;x1;x2] --||-- (p+0) # Char |-> x0 ** (p+1) # Char |-> x1 ** (p+2) # Char |-> x2.
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;split;entailer!. Qed.
Print Assumptions s8_undef3_cells.
Print Assumptions s8_full3_cells.

Lemma s8_undef4_cells : forall p, CharArray.undef_full p 4 --||-- (p+0) # Char |->_ ** (p+1) # Char |->_ ** (p+2) # Char |->_ ** (p+3) # Char |->_.
Proof. intros;unfold CharArray.undef_full,store_undef_array;change (Z.to_nat 4) with (4%nat);cbn [store_undef_array_rec];unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma s8_full4_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z), CharArray.full p 4 [x0;x1;x2;x3] --||-- (p+0) # Char |-> x0 ** (p+1) # Char |-> x1 ** (p+2) # Char |-> x2 ** (p+3) # Char |-> x3.
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;split;entailer!. Qed.
Print Assumptions s8_undef4_cells.
Print Assumptions s8_full4_cells.

Lemma s8_undef5_cells : forall p, CharArray.undef_full p 5 --||-- (p+0) # Char |->_ ** (p+1) # Char |->_ ** (p+2) # Char |->_ ** (p+3) # Char |->_ ** (p+4) # Char |->_.
Proof. intros;unfold CharArray.undef_full,store_undef_array;change (Z.to_nat 5) with (5%nat);cbn [store_undef_array_rec];unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma s8_full5_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z), CharArray.full p 5 [x0;x1;x2;x3;x4] --||-- (p+0) # Char |-> x0 ** (p+1) # Char |-> x1 ** (p+2) # Char |-> x2 ** (p+3) # Char |-> x3 ** (p+4) # Char |-> x4.
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;split;entailer!. Qed.
Print Assumptions s8_undef5_cells.
Print Assumptions s8_full5_cells.

Lemma s8_undef6_cells : forall p, CharArray.undef_full p 6 --||-- (p+0) # Char |->_ ** (p+1) # Char |->_ ** (p+2) # Char |->_ ** (p+3) # Char |->_ ** (p+4) # Char |->_ ** (p+5) # Char |->_.
Proof. intros;unfold CharArray.undef_full,store_undef_array;change (Z.to_nat 6) with (6%nat);cbn [store_undef_array_rec];unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma s8_full6_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z), CharArray.full p 6 [x0;x1;x2;x3;x4;x5] --||-- (p+0) # Char |-> x0 ** (p+1) # Char |-> x1 ** (p+2) # Char |-> x2 ** (p+3) # Char |-> x3 ** (p+4) # Char |-> x4 ** (p+5) # Char |-> x5.
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;split;entailer!. Qed.
Print Assumptions s8_undef6_cells.
Print Assumptions s8_full6_cells.

Lemma s8_undef7_cells : forall p, CharArray.undef_full p 7 --||-- (p+0) # Char |->_ ** (p+1) # Char |->_ ** (p+2) # Char |->_ ** (p+3) # Char |->_ ** (p+4) # Char |->_ ** (p+5) # Char |->_ ** (p+6) # Char |->_.
Proof. intros;unfold CharArray.undef_full,store_undef_array;change (Z.to_nat 7) with (7%nat);cbn [store_undef_array_rec];unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma s8_full7_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z), CharArray.full p 7 [x0;x1;x2;x3;x4;x5;x6] --||-- (p+0) # Char |-> x0 ** (p+1) # Char |-> x1 ** (p+2) # Char |-> x2 ** (p+3) # Char |-> x3 ** (p+4) # Char |-> x4 ** (p+5) # Char |-> x5 ** (p+6) # Char |-> x6.
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;split;entailer!. Qed.
Print Assumptions s8_undef7_cells.
Print Assumptions s8_full7_cells.

Lemma s8_full0_cells : forall p, CharArray.full p 0 [] --||-- emp.
Proof. intros;unfold CharArray.full,store_array;cbn [store_array_rec];split;entailer!. Qed.
Lemma s8_undef0_cells : forall p, CharArray.undef_full p 0 --||-- emp.
Proof. intros;unfold CharArray.undef_full,store_undef_array;change (Z.to_nat 0) with (0%nat);cbn [store_undef_array_rec];split;entailer!. Qed.
Print Assumptions s8_full0_cells.
Print Assumptions s8_undef0_cells.
