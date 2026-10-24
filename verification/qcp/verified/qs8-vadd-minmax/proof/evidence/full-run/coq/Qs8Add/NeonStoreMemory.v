From Coq Require Import ZArith Lia.
From Qs8Add Require Export NeonStoreModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma s8_store_undef8_cells : forall p, CharArray.undef_full p 8 --||-- (p+0) # Char |->_ ** (p+1) # Char |->_ ** (p+2) # Char |->_ ** (p+3) # Char |->_ ** (p+4) # Char |->_ ** (p+5) # Char |->_ ** (p+6) # Char |->_ ** (p+7) # Char |->_.
Proof. intros; unfold CharArray.undef_full,store_undef_array; change (Z.to_nat 8) with (8%nat); cbn [store_undef_array_rec]; unfold StoreCharAsElement.undefstoreA; rewrite ?sizeof_char;split;entailer!. Qed.
Lemma s8_store_full8_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z), CharArray.full p 8 (s8_pack8 x0 x1 x2 x3 x4 x5 x6 x7) --||-- (p+0) # Char |-> x0 ** (p+1) # Char |-> x1 ** (p+2) # Char |-> x2 ** (p+3) # Char |-> x3 ** (p+4) # Char |-> x4 ** (p+5) # Char |-> x5 ** (p+6) # Char |-> x6 ** (p+7) # Char |-> x7.
Proof. intros; unfold CharArray.full,store_array,s8_pack8; cbn [store_array_rec];unfold StoreCharAsElement.storeA; rewrite ?sizeof_char;split;entailer!. Qed.
Lemma s8_store_undef16_cells : forall p, CharArray.undef_full p 16 --||-- (p+0) # Char |->_ ** (p+1) # Char |->_ ** (p+2) # Char |->_ ** (p+3) # Char |->_ ** (p+4) # Char |->_ ** (p+5) # Char |->_ ** (p+6) # Char |->_ ** (p+7) # Char |->_ ** (p+8) # Char |->_ ** (p+9) # Char |->_ ** (p+10) # Char |->_ ** (p+11) # Char |->_ ** (p+12) # Char |->_ ** (p+13) # Char |->_ ** (p+14) # Char |->_ ** (p+15) # Char |->_.
Proof. intros; unfold CharArray.undef_full,store_undef_array; change (Z.to_nat 16) with (16%nat); cbn [store_undef_array_rec]; unfold StoreCharAsElement.undefstoreA; rewrite ?sizeof_char;split;entailer!. Qed.
Lemma s8_store_full16_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z), CharArray.full p 16 (s8_pack16 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15) --||-- (p+0) # Char |-> x0 ** (p+1) # Char |-> x1 ** (p+2) # Char |-> x2 ** (p+3) # Char |-> x3 ** (p+4) # Char |-> x4 ** (p+5) # Char |-> x5 ** (p+6) # Char |-> x6 ** (p+7) # Char |-> x7 ** (p+8) # Char |-> x8 ** (p+9) # Char |-> x9 ** (p+10) # Char |-> x10 ** (p+11) # Char |-> x11 ** (p+12) # Char |-> x12 ** (p+13) # Char |-> x13 ** (p+14) # Char |-> x14 ** (p+15) # Char |-> x15.
Proof. intros; unfold CharArray.full,store_array,s8_pack16; cbn [store_array_rec];unfold StoreCharAsElement.storeA; rewrite ?sizeof_char;split;entailer!. Qed.
