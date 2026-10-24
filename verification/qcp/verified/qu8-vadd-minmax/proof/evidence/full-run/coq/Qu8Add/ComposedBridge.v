From Coq Require Import ZArith Lia.
From Qu8Add Require Export ComposedModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qu_full1_cells : forall p (x0:Z), UCharArray.full p 1(qu_pack1 x0) --||-- (p+0) # UChar |-> x0.
Proof. intros;unfold UCharArray.full,store_array,qu_pack1;cbn[store_array_rec];unfold StoreUCharAsElement.storeA;rewrite ?sizeof_uchar;split;entailer!. Qed.
Lemma qu_undef1_cells : forall p,UCharArray.undef_full p 1 --||-- (p+0) # UChar |->_.
Proof. intros;unfold UCharArray.undef_full,store_undef_array;change(Z.to_nat 1)with(1%nat);cbn[store_undef_array_rec];unfold StoreUCharAsElement.undefstoreA;rewrite ?sizeof_uchar;split;entailer!. Qed.
Lemma qu_full2_cells : forall p (x0:Z) (x1:Z), UCharArray.full p 2(qu_pack2 x0 x1) --||-- (p+0) # UChar |-> x0 ** (p+1) # UChar |-> x1.
Proof. intros;unfold UCharArray.full,store_array,qu_pack2;cbn[store_array_rec];unfold StoreUCharAsElement.storeA;rewrite ?sizeof_uchar;split;entailer!. Qed.
Lemma qu_undef2_cells : forall p,UCharArray.undef_full p 2 --||-- (p+0) # UChar |->_ ** (p+1) # UChar |->_.
Proof. intros;unfold UCharArray.undef_full,store_undef_array;change(Z.to_nat 2)with(2%nat);cbn[store_undef_array_rec];unfold StoreUCharAsElement.undefstoreA;rewrite ?sizeof_uchar;split;entailer!. Qed.
Lemma qu_full4_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z), UCharArray.full p 4(qu_pack4 x0 x1 x2 x3) --||-- (p+0) # UChar |-> x0 ** (p+1) # UChar |-> x1 ** (p+2) # UChar |-> x2 ** (p+3) # UChar |-> x3.
Proof. intros;unfold UCharArray.full,store_array,qu_pack4;cbn[store_array_rec];unfold StoreUCharAsElement.storeA;rewrite ?sizeof_uchar;split;entailer!. Qed.
Lemma qu_undef4_cells : forall p,UCharArray.undef_full p 4 --||-- (p+0) # UChar |->_ ** (p+1) # UChar |->_ ** (p+2) # UChar |->_ ** (p+3) # UChar |->_.
Proof. intros;unfold UCharArray.undef_full,store_undef_array;change(Z.to_nat 4)with(4%nat);cbn[store_undef_array_rec];unfold StoreUCharAsElement.undefstoreA;rewrite ?sizeof_uchar;split;entailer!. Qed.
