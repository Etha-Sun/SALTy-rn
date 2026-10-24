(* Full original K domain; these lemmas justify actual8-byte input windows,
   including last partial K group, without increasing source padding. *)
From Coq Require Import ZArith Lia.
From Qd8FullKernel Require Import FullModel.
From Qd8API Require Import ApiModel.
Local Open Scope Z_scope.
Lemma qd8_read_extent_covers:forall K,K<=a_read_extent K.
Proof.
 intros K;unfold a_read_extent.
 pose proof(Z.div_mod(K+7)8 ltac:(lia)).
 pose proof(Z.mod_pos_bound(K+7)8 ltac:(lia)). lia.
Qed.
Lemma qd8_aligned_last_window:forall K d,
 0<=d<K -> Z.rem d 8=0 -> d+8<=a_read_extent K.
Proof.
 intros K d Hd Hrem;pose proof(qd8_read_extent_covers K).
 apply(Z.rem_divide d 8 ltac:(lia))in Hrem.
 destruct Hrem as[n Hn];unfold a_read_extent in *;lia.
Qed.
Lemma qd8_A_window:forall p ab wb K tile d Ps,
 p=ab+d ->0<=d ->d+8<=a_read_extent K ->
 qd8_i8_address_ok 0 p ab wb K tile d Ps.
Proof. intros;unfold qd8_i8_address_ok;left;intuition. Qed.
Lemma qd8_W_window:forall p ab wb K tile d Ps,
 p=wb+tile*panel_bytes K+32+d ->0<=tile<Zlength Ps ->
 0<=d ->d+8<=8*K ->qd8_i8_address_ok 1 p ab wb K tile d Ps.
Proof. intros;unfold qd8_i8_address_ok;right;intuition. Qed.
Print Assumptions qd8_read_extent_covers.
Print Assumptions qd8_aligned_last_window.
Print Assumptions qd8_A_window.
Print Assumptions qd8_W_window.
