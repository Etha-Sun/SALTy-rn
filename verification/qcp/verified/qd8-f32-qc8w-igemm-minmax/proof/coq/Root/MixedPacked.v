From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
(* A mixed typed allocation is one separating resource, not independent
   arrays invented separately at each read. No byte/float bijection assumed. *)
Definition qd8_block (p k:Z) (ks ws:list Z) (sc bi:list fp32) : Assertion :=
 IntArray.full p 8 ks **
 CharArray.full (p+32) (8*k) ws **
 FloatArray.full (p+32+8*k) 8 sc **
 FloatArray.full (p+64+8*k) 8 bi.
Lemma qd8_extract_ksum : forall p k ks ws sc bi i,
 0<=i<8 ->
 qd8_block p k ks ws sc bi |--
 IntArray.missing_i p i 0 8 ks **
 store_int (p+4*i) (Znth i ks 0) **
 CharArray.full (p+32) (8*k) ws **
 FloatArray.full (p+32+8*k) 8 sc **
 FloatArray.full (p+64+8*k) 8 bi.
Proof.
 intros;unfold qd8_block.
 sep_apply (IntArray.full_split_to_missing_i p i 8 ks 0);[|lia].
 unfold StoreIntAsElement.storeA;rewrite sizeof_int.
 replace (p+i*4) with (p+4*i) by lia;entailer!.
Qed.
Lemma qd8_extract_weight : forall p k ks ws sc bi d i,
 0<k -> 0<=d<k -> 0<=i<8 ->
 qd8_block p k ks ws sc bi |--
 IntArray.full p 8 ks **
 CharArray.missing_i (p+32) (8*d+i) 0 (8*k) ws **
 store_char (p+32+8*d+i) (Znth (8*d+i) ws 0) **
 FloatArray.full (p+32+8*k) 8 sc **
 FloatArray.full (p+64+8*k) 8 bi.
Proof.
 intros;unfold qd8_block.
 sep_apply (CharArray.full_split_to_missing_i (p+32) (8*d+i) (8*k) ws 0);[|lia].
 unfold StoreCharAsElement.storeA;rewrite sizeof_char.
 replace (p+32+(8*d+i)*1) with (p+32+8*d+i) by lia;entailer!.
Qed.
Lemma qd8_extract_scale : forall p k ks ws sc bi i,
 0<=i<8 ->
 qd8_block p k ks ws sc bi |--
 IntArray.full p 8 ks ** CharArray.full (p+32) (8*k) ws **
 FloatArray.missing_i (p+32+8*k) i 0 8 sc **
 store_float (p+32+8*k+4*i) (Znth i sc fp32_zero) **
 FloatArray.full (p+64+8*k) 8 bi.
Proof.
 intros;unfold qd8_block.
 sep_apply (FloatArray.full_split_to_missing_i (p+32+8*k) i 8 sc fp32_zero);[|lia].
 unfold StoreFloatAsElement.storeA;rewrite sizeof_float.
 replace (p+32+8*k+i*4) with (p+32+8*k+4*i) by lia;entailer!.
Qed.
Lemma qd8_extract_bias : forall p k ks ws sc bi i,
 0<=i<8 ->
 qd8_block p k ks ws sc bi |--
 IntArray.full p 8 ks ** CharArray.full (p+32) (8*k) ws **
 FloatArray.full (p+32+8*k) 8 sc **
 FloatArray.missing_i (p+64+8*k) i 0 8 bi **
 store_float (p+64+8*k+4*i) (Znth i bi fp32_zero).
Proof.
 intros;unfold qd8_block.
 sep_apply (FloatArray.full_split_to_missing_i (p+64+8*k) i 8 bi fp32_zero);[|lia].
 unfold StoreFloatAsElement.storeA;rewrite sizeof_float.
 replace (p+64+8*k+i*4) with (p+64+8*k+4*i) by lia;entailer!.
Qed.
Print Assumptions qd8_extract_ksum.
Print Assumptions qd8_extract_weight.
Print Assumptions qd8_extract_scale.
Print Assumptions qd8_extract_bias.
