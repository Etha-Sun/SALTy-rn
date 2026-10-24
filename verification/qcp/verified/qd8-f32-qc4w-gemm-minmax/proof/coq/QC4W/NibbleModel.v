From Coq Require Import ZArith List Lia Bool.
From Qd8Phase Require Import IntegerFold.
Import ListNotations.
Local Open Scope Z_scope.

(* Explicit bit operations before any arithmetic simplification. *)
Definition u8 b:=b mod 256.
Definition signed8 u:=if u <? 128 then u else u-256.
Definition signed4 u:=if u <? 8 then u else u-16.
Definition low_bitop b:=signed8 (Z.land (Z.shiftl (u8 b) 4) 255).
Definition high_bitop b:=signed8 (Z.land (u8 b) 240).
Definition low_decoded b:=16*signed4 (u8 b mod 16).
Definition high_decoded b:=16*signed4 (u8 b/16).
Definition nibble_check b:=Z.eqb (low_bitop b) (low_decoded b) &&
 Z.eqb (high_bitop b) (high_decoded b).
Lemma byte_decode_checked : forallb nibble_check (map Z.of_nat (seq 0 256))=true.
Proof. vm_compute;reflexivity. Qed.
Theorem all_byte_nibble_operations : forall b,0<=b<256 ->
 low_bitop b=low_decoded b /\ high_bitop b=high_decoded b.
Proof.
 intros b Hb.
 assert (Hin:In b (map Z.of_nat (seq 0 256))).
 { apply in_map_iff;exists (Z.to_nat b);split;[lia|apply in_seq;lia]. }
 pose proof byte_decode_checked as H.
 rewrite forallb_forall in H;specialize(H b Hin).
 unfold nibble_check in H;apply andb_true_iff in H.
 destruct H as [H1 H2];apply Z.eqb_eq in H1;apply Z.eqb_eq in H2;auto.
Qed.
Theorem arbitrary_signed_byte_nibbles : forall b,
 low_bitop b=low_decoded b /\ high_bitop b=high_decoded b.
Proof.
 intros b;pose proof (all_byte_nibble_operations (u8 b) (Z.mod_pos_bound b 256 ltac:(lia))) as H.
 unfold low_bitop,high_bitop,low_decoded,high_decoded,u8 in *.
 rewrite Z.mod_mod in H by lia;exact H.
Qed.
Definition shifted_accumulator bits := Z.shiftr (signed32 (wrap32 bits)) 4.
Theorem arithmetic_shift_is_floor_division : forall bits,
 shifted_accumulator bits=signed32(wrap32 bits)/16.
Proof. intros;unfold shifted_accumulator;rewrite Z.shiftr_div_pow2 by lia;reflexivity. Qed.
Theorem shifted_accumulator_range : forall bits,
 -134217728<=shifted_accumulator bits<=134217727.
Proof.
 intro bits;rewrite arithmetic_shift_is_floor_division.
 pose proof (signed32_range bits);split.
 - apply Z.div_le_lower_bound;lia.
 - assert (signed32 (wrap32 bits)/16<134217728) by (apply Z.div_lt_upper_bound;lia);lia.
Qed.
Definition rounded_depth K:=2*((K+1)/2).
Theorem rounded_depth_covers : forall K,0<K ->
 K<=rounded_depth K<=K+1 /\ rounded_depth K mod 2=0.
Proof.
 intros;unfold rounded_depth.
 pose proof (Z.div_mod (K+1) 2 ltac:(lia)).
 pose proof (Z.mod_pos_bound (K+1) 2 ltac:(lia));split;[lia|].
 rewrite Z.mul_comm;apply Z.mod_mul;lia.
Qed.
Definition panel_bytes K:=192+8*rounded_depth K.
Theorem panel_decomposition : forall K,
 panel_bytes K=64+16*(rounded_depth K/2)+64+64.
Proof.
 intros;unfold panel_bytes,rounded_depth.
 replace (2*((K+1)/2)) with (((K+1)/2)*2) at 2 by ring.
 rewrite Z.div_mul by lia;ring.
Qed.
Definition packed_weight_offset depth lane:=64+16*(depth/2)+lane.
Theorem packed_weight_index_in_panel : forall K depth lane,
 0<K -> 0<=depth<rounded_depth K -> 0<=lane<16 ->
 64<=packed_weight_offset depth lane<panel_bytes K-128.
Proof.
 intros K depth lane HK Hd Hl;unfold packed_weight_offset,panel_bytes.
 pose proof (rounded_depth_covers K HK) as [_ Hr].
 pose proof (Z.div_mod depth 2 ltac:(lia)).
 pose proof (Z.mod_pos_bound depth 2 ltac:(lia)).
 pose proof (Z.div_mod (rounded_depth K) 2 ltac:(lia)).
 assert (0<=depth/2) by (apply Z.div_pos;lia);nia.
Qed.
Theorem two_depth_steps_preserve_order : forall acc a0 a1 packed rest,
 dot32 acc ((a0,low_bitop packed)::(a1,high_bitop packed)::rest)=
 dot32 (mac32 (mac32 acc a0 (low_bitop packed)) a1 (high_bitop packed)) rest.
Proof. reflexivity. Qed.
Print Assumptions arbitrary_signed_byte_nibbles.
Print Assumptions arithmetic_shift_is_floor_division.
Print Assumptions shifted_accumulator_range.
Print Assumptions rounded_depth_covers.
Print Assumptions panel_decomposition.
Print Assumptions packed_weight_index_in_panel.
Print Assumptions two_depth_steps_preserve_order.

Theorem clear_low_bit_is_round_down : forall x,
 Z.land x (-2)=2*(x/2).
Proof.
 intro x;pose proof (Z.ldiff_ones_r x 1 ltac:(lia)) as H.
 rewrite Z.ldiff_land in H.
 change (Z.land x (-2)=Z.shiftl (Z.shiftr x 1) 1) in H.
 rewrite Z.shiftr_div_pow2,Z.shiftl_mul_pow2 in H by lia.
 cbn in H;rewrite H;ring.
Qed.
Theorem round_up_mask_unbounded : forall K,
 Z.land (K+1) (-2)=rounded_depth K.
Proof. intros;apply clear_low_bit_is_round_down. Qed.
Theorem finite_mask_rounding : forall K,
 0<=K<18446744073709551615 ->
 Z.land (K+1) 18446744073709551614=rounded_depth K.
Proof.
 intros K HK.
 replace 18446744073709551614 with (Z.land (Z.ones 64) (-2)) by (vm_compute;reflexivity).
 rewrite Z.land_assoc,Z.land_ones by lia.
 change (Z.land ((K+1) mod 18446744073709551616) (-2)=rounded_depth K).
 rewrite Z.mod_small by lia;apply round_up_mask_unbounded.
Qed.
Print Assumptions finite_mask_rounding.
