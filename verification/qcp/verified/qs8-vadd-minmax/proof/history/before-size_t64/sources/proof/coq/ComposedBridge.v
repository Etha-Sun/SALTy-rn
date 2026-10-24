From Coq Require Import ZArith Lia.
From Qs8Add Require Export ComposedModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qa_full1_cells : forall p (x0:Z), CharArray.full p 1(qa_pack1 x0) --||-- (p+0) # Char |-> x0.
Proof. intros;unfold CharArray.full,store_array,qa_pack1;cbn[store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma qa_undef1_cells : forall p,CharArray.undef_full p 1 --||-- (p+0) # Char |->_.
Proof. intros;unfold CharArray.undef_full,store_undef_array;change(Z.to_nat 1)with(1%nat);cbn[store_undef_array_rec];unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma qa_full2_cells : forall p (x0:Z) (x1:Z), CharArray.full p 2(qa_pack2 x0 x1) --||-- (p+0) # Char |-> x0 ** (p+1) # Char |-> x1.
Proof. intros;unfold CharArray.full,store_array,qa_pack2;cbn[store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma qa_undef2_cells : forall p,CharArray.undef_full p 2 --||-- (p+0) # Char |->_ ** (p+1) # Char |->_.
Proof. intros;unfold CharArray.undef_full,store_undef_array;change(Z.to_nat 2)with(2%nat);cbn[store_undef_array_rec];unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma qa_full4_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z), CharArray.full p 4(qa_pack4 x0 x1 x2 x3) --||-- (p+0) # Char |-> x0 ** (p+1) # Char |-> x1 ** (p+2) # Char |-> x2 ** (p+3) # Char |-> x3.
Proof. intros;unfold CharArray.full,store_array,qa_pack4;cbn[store_array_rec];unfold StoreCharAsElement.storeA;rewrite ?sizeof_char;split;entailer!. Qed.
Lemma qa_undef4_cells : forall p,CharArray.undef_full p 4 --||-- (p+0) # Char |->_ ** (p+1) # Char |->_ ** (p+2) # Char |->_ ** (p+3) # Char |->_.
Proof. intros;unfold CharArray.undef_full,store_undef_array;change(Z.to_nat 4)with(4%nat);cbn[store_undef_array_rec];unfold StoreCharAsElement.undefstoreA;rewrite ?sizeof_char;split;entailer!. Qed.
