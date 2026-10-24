From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
From Sqrt Require Import Pack.
From QcpRvv32 Require Import RvvStoreModel.
Import Snaive_C_Rules64 ListNotations.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma sqrt_undef_head : forall p lo hi, lo<hi ->
 FloatArray.undef_seg p lo hi |-- undef_store_float(p+lo*sizeof(FLOAT)) ** FloatArray.undef_seg p (lo+1) hi.
Proof.
 intros p lo hi Hb.
 sep_apply_l_atomic(FloatArray.undef_seg_split_to_undef_missing_i p lo lo hi ltac:(lia)).
 sep_apply_l_atomic(FloatArray.undef_missing_i_to_undef_seg_head p lo hi Hb).
 unfold StoreFloatAsElement.undefstoreA;entailer!.
Qed.
Lemma sqrt_undef_head_full : forall p n, 0<n ->
 FloatArray.undef_full p n |-- undef_store_float(p+0*sizeof(FLOAT)) ** FloatArray.undef_seg p 1 n.
Proof.
 intros p n Hb;sep_apply(FloatArray.undef_full_to_undef_seg p n).
 exact(sqrt_undef_head p 0 n Hb).
Qed.
Lemma sqrt_cells4_full : forall p x0 x1 x2 x3,
 (p+0*sizeof(FLOAT)) # Float|->x0 ** (p+1*sizeof(FLOAT)) # Float|->x1 **
 (p+2*sizeof(FLOAT)) # Float|->x2 ** (p+3*sizeof(FLOAT)) # Float|->x3 |--
 FloatArray.full p 4(sqrt_pack4 x0 x1 x2 x3).
Proof.
 intros;unfold FloatArray.full,store_array,sqrt_pack4.
 simpl store_array_rec;unfold StoreFloatAsElement.storeA;entailer!.
Qed.
Lemma sqrt_cells2_full : forall p x0 x1,
 (p+0*sizeof(FLOAT)) # Float|->x0 ** (p+1*sizeof(FLOAT)) # Float|->x1 |--
 FloatArray.full p 2(sqrt_pack2 x0 x1).
Proof. intros;unfold FloatArray.full,store_array,sqrt_pack2.
 simpl store_array_rec;unfold StoreFloatAsElement.storeA;entailer!. Qed.
Lemma sqrt_cells1_full : forall p x0,
 (p+0*sizeof(FLOAT)) # Float|->x0 |-- FloatArray.full p 1(sqrt_pack1 x0).
Proof. intros;unfold FloatArray.full,store_array,sqrt_pack1.
 simpl store_array_rec;unfold StoreFloatAsElement.storeA;entailer!. Qed.
