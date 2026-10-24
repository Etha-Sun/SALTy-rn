From Coq Require Import ZArith Lia.
From Qu8Add Require Export NeonStoreModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma u8_store_undef8_cells : forall p, UCharArray.undef_full p 8 --||-- (p+0) # UChar |->_ ** (p+1) # UChar |->_ ** (p+2) # UChar |->_ ** (p+3) # UChar |->_ ** (p+4) # UChar |->_ ** (p+5) # UChar |->_ ** (p+6) # UChar |->_ ** (p+7) # UChar |->_.
Proof. intros; unfold UCharArray.undef_full,store_undef_array; change (Z.to_nat 8) with (8%nat); cbn [store_undef_array_rec]; unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar;split;entailer!. Qed.
Lemma u8_store_full8_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z), UCharArray.full p 8 (u8_pack8 x0 x1 x2 x3 x4 x5 x6 x7) --||-- (p+0) # UChar |-> x0 ** (p+1) # UChar |-> x1 ** (p+2) # UChar |-> x2 ** (p+3) # UChar |-> x3 ** (p+4) # UChar |-> x4 ** (p+5) # UChar |-> x5 ** (p+6) # UChar |-> x6 ** (p+7) # UChar |-> x7.
Proof. intros; unfold UCharArray.full,store_array,u8_pack8; cbn [store_array_rec];unfold StoreUCharAsElement.storeA; rewrite ?sizeof_uchar;split;entailer!. Qed.
Lemma u8_store_undef16_cells : forall p, UCharArray.undef_full p 16 --||-- (p+0) # UChar |->_ ** (p+1) # UChar |->_ ** (p+2) # UChar |->_ ** (p+3) # UChar |->_ ** (p+4) # UChar |->_ ** (p+5) # UChar |->_ ** (p+6) # UChar |->_ ** (p+7) # UChar |->_ ** (p+8) # UChar |->_ ** (p+9) # UChar |->_ ** (p+10) # UChar |->_ ** (p+11) # UChar |->_ ** (p+12) # UChar |->_ ** (p+13) # UChar |->_ ** (p+14) # UChar |->_ ** (p+15) # UChar |->_.
Proof. intros; unfold UCharArray.undef_full,store_undef_array; change (Z.to_nat 16) with (16%nat); cbn [store_undef_array_rec]; unfold StoreUCharAsElement.undefstoreA; rewrite ?sizeof_uchar;split;entailer!. Qed.
Lemma u8_store_full16_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z), UCharArray.full p 16 (u8_pack16 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15) --||-- (p+0) # UChar |-> x0 ** (p+1) # UChar |-> x1 ** (p+2) # UChar |-> x2 ** (p+3) # UChar |-> x3 ** (p+4) # UChar |-> x4 ** (p+5) # UChar |-> x5 ** (p+6) # UChar |-> x6 ** (p+7) # UChar |-> x7 ** (p+8) # UChar |-> x8 ** (p+9) # UChar |-> x9 ** (p+10) # UChar |-> x10 ** (p+11) # UChar |-> x11 ** (p+12) # UChar |-> x12 ** (p+13) # UChar |-> x13 ** (p+14) # UChar |-> x14 ** (p+15) # UChar |-> x15.
Proof. intros; unfold UCharArray.full,store_array,u8_pack16; cbn [store_array_rec];unfold StoreUCharAsElement.storeA; rewrite ?sizeof_uchar;split;entailer!. Qed.
