From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Export ProbeModel RvvFacts.
Local Open Scope Z_scope.
Lemma rd_map_seq_nth : forall(f:nat->Z)start count i d,(i<count)%nat ->nth i(map f(seq start count))d=f(start+i)%nat.
Proof.
 intros f start count i d Hi;rewrite(@List.nth_indep Z(map f(seq start count))i d(f 0%nat))by(rewrite length_map,length_seq;assumption);rewrite(@List.map_nth nat Z f(seq start count)0%nat i);rewrite seq_nth by assumption;reflexivity.
Qed.
Lemma rd_probe_nth : forall M base n stride zero Init k,0<=k<n ->
 Znth k(rd_probe_values M base n stride zero Init)0=
 rs_s32(Znth k Init 0+rd_get M(base+k)+rd_get M(base+stride+k)+rd_get M zero).
Proof. intros;unfold rd_probe_values,Znth at 1;rewrite rd_map_seq_nth by lia;cbn[Nat.add];rewrite Z2Nat.id by lia;reflexivity. Qed.
Lemma rd_probe_initial : forall M base n stride zero Init,rd_probe_partial M base n stride zero 0 Init=Init.
Proof. intros;unfold rd_probe_partial;apply rd_mix_zero. Qed.
Lemma rd_probe_finish : forall M base n stride zero Init,0<=n ->Zlength Init=n ->rd_probe_partial M base n stride zero n Init=rd_probe_values M base n stride zero Init.
Proof. intros;unfold rd_probe_partial;apply rd_mix_full;try assumption;apply rd_probe_values_length;assumption. Qed.
Lemma rd_probe_suffix : forall M base n stride zero Init k j,0<=k<=j ->j<n ->Zlength Init=n ->
 Znth j(rd_probe_partial M base n stride zero k Init)0=Znth j Init 0.
Proof. intros;unfold rd_probe_partial;apply rd_mix_suffix;try lia;rewrite rd_probe_values_length by lia;lia. Qed.
Lemma rd_probe_store_step : forall M base n stride zero Init k,
 0<=k<n ->Zlength Init=n ->
 -2147483648<=Znth k(rd_probe_partial M base n stride zero k Init)0<=2147483647 ->
 -128<=rd_get M(base+k)<=127 -> -128<=rd_get M(base+stride+k)<=127 ->-128<=rd_get M zero<=127 ->
 replace_Znth k
 (rs_add_s32(Znth k(rd_probe_partial M base n stride zero k Init)0)(rd_get M(base+k)+rd_get M(base+stride+k)+rd_get M zero))
 (rd_probe_partial M base n stride zero k Init)=rd_probe_partial M base n stride zero(k+1)Init.
Proof.
 intros M base n stride zero Init k Hk Hlen Hold Ha Hb Hz.
 rewrite rs_add_s32_wrap by lia.
 assert(E:rs_s32(Znth k(rd_probe_partial M base n stride zero k Init)0+(rd_get M(base+k)+rd_get M(base+stride+k)+rd_get M zero))=Znth k(rd_probe_values M base n stride zero Init)0).
 { rewrite rd_probe_nth by assumption;rewrite rd_probe_suffix by lia;f_equal;ring. }
 rewrite E;unfold rd_probe_partial;apply rd_mix_step;try lia;rewrite rd_probe_values_length by lia;lia.
Qed.
Print Assumptions rd_probe_nth.
Print Assumptions rd_probe_initial.
Print Assumptions rd_probe_finish.
Print Assumptions rd_probe_suffix.
Print Assumptions rd_probe_store_step.
Lemma rd_probe_present_pair : forall M base n stride k,rd_inputs M base 2 n stride ->0<=k<n ->rd_present M(base+k) /\ rd_present M(base+stride+k).
Proof.
 intros M base n stride k H Hk;split.
 - replace(base+k)with(rd_row_address base stride 0 k)by(unfold rd_row_address;ring);apply H;lia.
 - replace(base+stride+k)with(rd_row_address base stride 1 k)by(unfold rd_row_address;ring);apply H;lia.
Qed.
Lemma rd_probe_pointer_normalize : forall M base n stride k,
 (forall q,rd_present M q ->0<=q<=18446744073709551615) ->rd_inputs M base 2 n stride ->0<=k<n ->
 unsigned_last_nbits(unsigned_last_nbits(base+k)64+stride)64=base+stride+k.
Proof.
 intros M base n stride k Haddr Hin Hk;destruct(rd_probe_present_pair M base n stride k Hin Hk)as[Ha Hb];specialize(Haddr(base+k)Ha)as Ra;specialize(Haddr(base+stride+k)Hb)as Rb.
 rewrite(unsigned_last_nbits_eq(base+k)64)by(change(0<=base+k<18446744073709551616);lia).
 rewrite unsigned_last_nbits_eq by(change(0<=base+k+stride<18446744073709551616);lia);ring.
Qed.
Print Assumptions rd_probe_present_pair.
Print Assumptions rd_probe_pointer_normalize.
