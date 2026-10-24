From Coq Require Import ZArith Lia.
From F32F16 Require Export PackModel VectorSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma f16_store_undef1_cells : forall p,UShortArray.undef_full p 1 --||-- (p+0) # UShort |->_.
Proof. intros;unfold UShortArray.undef_full,store_undef_array;change(Z.to_nat 1)with(1%nat);cbn[store_undef_array_rec];unfold StoreUShortAsElement.undefstoreA;rewrite ?sizeof_ushort;split;entailer!. Qed.
Lemma f16_store_full1_cells : forall p (x0:Z), UShortArray.full p 1 (f16_pack1 x0) --||-- (p+0) # UShort |-> x0.
Proof. intros;unfold UShortArray.full,store_array,f16_pack1;cbn[store_array_rec];unfold StoreUShortAsElement.storeA;rewrite ?sizeof_ushort;split;entailer!. Qed.
Lemma f16_store_undef2_cells : forall p,UShortArray.undef_full p 2 --||-- (p+0) # UShort |->_ ** (p+2) # UShort |->_.
Proof. intros;unfold UShortArray.undef_full,store_undef_array;change(Z.to_nat 2)with(2%nat);cbn[store_undef_array_rec];unfold StoreUShortAsElement.undefstoreA;rewrite ?sizeof_ushort;split;entailer!. Qed.
Lemma f16_store_full2_cells : forall p (x0:Z) (x1:Z), UShortArray.full p 2 (f16_pack2 x0 x1) --||-- (p+0) # UShort |-> x0 ** (p+2) # UShort |-> x1.
Proof. intros;unfold UShortArray.full,store_array,f16_pack2;cbn[store_array_rec];unfold StoreUShortAsElement.storeA;rewrite ?sizeof_ushort;split;entailer!. Qed.
Lemma f16_store_undef4_cells : forall p,UShortArray.undef_full p 4 --||-- (p+0) # UShort |->_ ** (p+2) # UShort |->_ ** (p+4) # UShort |->_ ** (p+6) # UShort |->_.
Proof. intros;unfold UShortArray.undef_full,store_undef_array;change(Z.to_nat 4)with(4%nat);cbn[store_undef_array_rec];unfold StoreUShortAsElement.undefstoreA;rewrite ?sizeof_ushort;split;entailer!. Qed.
Lemma f16_store_full4_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z), UShortArray.full p 4 (f16_pack4 x0 x1 x2 x3) --||-- (p+0) # UShort |-> x0 ** (p+2) # UShort |-> x1 ** (p+4) # UShort |-> x2 ** (p+6) # UShort |-> x3.
Proof. intros;unfold UShortArray.full,store_array,f16_pack4;cbn[store_array_rec];unfold StoreUShortAsElement.storeA;rewrite ?sizeof_ushort;split;entailer!. Qed.
Lemma f16_store_undef8_cells : forall p,UShortArray.undef_full p 8 --||-- (p+0) # UShort |->_ ** (p+2) # UShort |->_ ** (p+4) # UShort |->_ ** (p+6) # UShort |->_ ** (p+8) # UShort |->_ ** (p+10) # UShort |->_ ** (p+12) # UShort |->_ ** (p+14) # UShort |->_.
Proof. intros;unfold UShortArray.undef_full,store_undef_array;change(Z.to_nat 8)with(8%nat);cbn[store_undef_array_rec];unfold StoreUShortAsElement.undefstoreA;rewrite ?sizeof_ushort;split;entailer!. Qed.
Lemma f16_store_full8_cells : forall p (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z), UShortArray.full p 8 (f16_pack8 x0 x1 x2 x3 x4 x5 x6 x7) --||-- (p+0) # UShort |-> x0 ** (p+2) # UShort |-> x1 ** (p+4) # UShort |-> x2 ** (p+6) # UShort |-> x3 ** (p+8) # UShort |-> x4 ** (p+10) # UShort |-> x5 ** (p+12) # UShort |-> x6 ** (p+14) # UShort |-> x7.
Proof. intros;unfold UShortArray.full,store_array,f16_pack8;cbn[store_array_rec];unfold StoreUShortAsElement.storeA;rewrite ?sizeof_ushort;split;entailer!. Qed.
Ltac f16_store_arrays_finish :=
 try left;intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 rewrite ?f16_store_undef1_cells,?f16_store_undef2_cells,?f16_store_undef4_cells,?f16_store_undef8_cells;
 rewrite ?f16_store_full1_cells,?f16_store_full2_cells,?f16_store_full4_cells,?f16_store_full8_cells;
 f16_vector_finish.
Print Assumptions f16_store_undef8_cells.
Print Assumptions f16_store_full8_cells.
