From Coq Require Import ZArith List Lia.
From Dwconv Require Export ProgramFacts.
Import ListNotations.
Local Open Scope Z_scope.

Lemma dw_write_values_sequence : forall (f:nat->fp32) len start p O,
 dw_write_values O (p+4*Z.of_nat start) (map f (seq start len)) =
 fold_left (fun S i=>dw_output_put S (p+4*Z.of_nat i) (f i))
           (seq start len) O.
Proof.
 intros f len;induction len as[|len IH];intros start p O.
 - reflexivity.
 - cbn[seq map dw_write_values fold_left].
   replace(p+4*Z.of_nat start+4)with(p+4*Z.of_nat(S start))by lia.
   apply IH.
Qed.

Lemma dw_channel_state_chunk : forall isa F P D pixel k r lo hi O,
 0<=k -> 0<=r ->
 dw_channel_state isa F P D pixel (k+r) lo hi O =
 dw_write_values (dw_channel_state isa F P D pixel k lo hi O)
 (dw_output_at D pixel+4*k)
 (map (fun i=>dw_value isa F P D pixel (Z.of_nat i) lo hi)
      (seq (Z.to_nat k) (Z.to_nat r))).
Proof.
 intros isa F P D pixel k r lo hi O Hk Hr.
 unfold dw_channel_state.
 rewrite Z2Nat.inj_add by assumption.
 rewrite seq_app,fold_left_app,Nat.add_0_l.
 rewrite <-dw_write_values_sequence,Z2Nat.id by assumption.
 reflexivity.
Qed.

Lemma dw_progress_chunk : forall isa F P D pixel k r lo hi O,
 0<=k -> 0<=r ->
 dw_progress isa F P D pixel (k+r) lo hi O =
 dw_write_values (dw_progress isa F P D pixel k lo hi O)
 (dw_output_at D pixel+4*k)
 (map (fun i=>dw_value isa F P D pixel (Z.of_nat i) lo hi)
      (seq (Z.to_nat k) (Z.to_nat r))).
Proof. intros;unfold dw_progress;now apply dw_channel_state_chunk. Qed.

Lemma dw_take_positive : forall c,0<c ->
 1<=dw_take c<=4 /\ dw_take c<=c.
Proof. unfold dw_take;intros;lia. Qed.

Lemma dw_aligned_after_take : forall channels c,
 0<c -> dw_aligned_cursor channels c ->
 dw_aligned_cursor channels (c-dw_take c).
Proof.
 unfold dw_aligned_cursor,dw_take;intros channels c Hc [Halign|Hz];[|lia].
 destruct(Z_le_dec 4 c)as[H|H].
 - rewrite Z.min_r by lia;left.
   replace(channels-(c-4))with((channels-c)+4)by ring.
   rewrite Z.add_mod by lia;rewrite Halign;reflexivity.
 - rewrite Z.min_l by lia;right;lia.
Qed.

Lemma dw_packed_block_room : forall channels k,
 0<=k -> k<channels -> k mod 4=0 ->
 4*k+16<=16*((channels+3)/4).
Proof.
 intros channels k Hk Hlt Hmod.
 pose proof(Z.div_mod k 4 ltac:(lia)).
 pose proof(Z.div_mod (channels+3) 4 ltac:(lia)).
 pose proof(Z.mod_pos_bound (channels+3) 4 ltac:(lia));lia.
Qed.
Print Assumptions dw_channel_state_chunk.
Print Assumptions dw_progress_chunk.
Print Assumptions dw_aligned_after_take.
Print Assumptions dw_packed_block_room.
