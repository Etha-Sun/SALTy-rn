From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From FullU8 Require Import Packed32Model CodecProof.
Import ListNotations.
Local Open Scope Z_scope.
Lemma vec_byte_bounds : forall W i,0<=vec_byte W i<=255.
Proof. intros;unfold vec_byte;apply word_byte_range. Qed.
Lemma vec_prefix_snoc : forall W i,0<=i<128 ->
 sublist 0 i(vec_bytes W)++[vec_byte W i]=sublist 0(i+1)(vec_bytes W).
Proof.
 intros W i Hi;symmetry.
 rewrite(sublist_split 0(i+1)i(vec_bytes W))by(rewrite ?Zlength_correct,?vec_bytes_length;lia).
 rewrite(@sublist_single Z 0 i(vec_bytes W))by(rewrite Zlength_correct,vec_bytes_length;lia).
 rewrite vec_bytes_index by exact Hi;reflexivity.
Qed.
Print Assumptions vec_byte_bounds.
Print Assumptions vec_prefix_snoc.
